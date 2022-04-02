import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Staff } from "./Staff";
import { Transaction } from "./Transaction";

@Index(
  "PK__Statisti__804B540D3C948670",
  ["idStatistical", "idTransaction", "idStaff"],
  { unique: true }
)
@Entity("StatisticalTables", { schema: "dbo" })
export class StatisticalTables {
  @Column("nvarchar", { primary: true, name: "idStatistical", length: 255 })
  idStatistical: string;

  @Column("nvarchar", { primary: true, name: "idTransaction", length: 255 })
  idTransaction: string;

  @Column("nvarchar", { primary: true, name: "idStaff", length: 255 })
  idStaff: string;

  @Column("int", { name: "Number" })
  number: number;

  @Column("int", { name: "sumQty" })
  sumQty: number;

  @Column("float", { name: "sumMoney", precision: 53 })
  sumMoney: number;

  @Column("datetime", { name: "createdAt" })
  createdAt: Date;

  @Column("float", { name: "profit", precision: 53 })
  profit: number;

  @Column("float", { name: "bonusMoney", precision: 53 })
  bonusMoney: number;

  @Column("float", { name: "targetMonth", precision: 53 })
  targetMonth: number;

  @Column("float", { name: "revenureBefore", nullable: true, precision: 53 })
  revenureBefore: number | null;

  @ManyToOne(() => Staff, (staff) => staff.statisticalTables)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff2: Staff;

  @ManyToOne(() => Staff, (staff) => staff.statisticalTables2)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff3: Staff;

  @ManyToOne(() => Staff, (staff) => staff.statisticalTables3)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff4: Staff;

  @ManyToOne(() => Transaction, (transaction) => transaction.statisticalTables)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction2: Transaction;

  @ManyToOne(() => Transaction, (transaction) => transaction.statisticalTables2)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction3: Transaction;

  @ManyToOne(() => Transaction, (transaction) => transaction.statisticalTables3)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction4: Transaction;
}
