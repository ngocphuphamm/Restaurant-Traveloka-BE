import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Transaction } from "./Transaction";
import { Staff } from "./Staff";

@Index("PK__Statisti__28D39C8B4094F381", ["idStatistical", "idTransaction"], {
  unique: true,
})
@Entity("StatisticalTables", { schema: "dbo" })
export class StatisticalTables {
  @Column("nvarchar", { primary: true, name: "idStatistical", length: 255 })
  idStatistical: string;

  @Column("nvarchar", { primary: true, name: "idTransaction", length: 255 })
  idTransaction: string;

  @Column("int", { name: "Number" })
  number: number;

  @Column("int", { name: "sumQty" })
  sumQty: number;

  @Column("float", { name: "sumMoney", precision: 53 })
  sumMoney: number;

  @Column("datetime", {
    name: "createdAt",
    nullable: true,
    default: () => "getdate()",
  })
  createdAt: Date | null;

  @Column("float", { name: "profit", precision: 53 })
  profit: number;

  @Column("float", { name: "bonusMoney", precision: 53 })
  bonusMoney: number;

  @Column("float", { name: "targetMonth", precision: 53 })
  targetMonth: number;

  @Column("float", { name: "revenureBefore", nullable: true, precision: 53 })
  revenureBefore: number | null;

  @ManyToOne(() => Transaction, (transaction) => transaction.statisticalTables)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction2: Transaction;

  @ManyToOne(() => Staff, (staff) => staff.statisticalTables)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff: Staff;
}
