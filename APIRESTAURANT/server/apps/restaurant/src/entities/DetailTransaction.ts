import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Transaction } from "./Transaction";
import { DetailMenu } from "./DetailMenu";

@Index("PK__DetailTr__C58DC58481E30BFB", ["idDetailTransaction"], {
  unique: true,
})
@Entity("DetailTransaction", { schema: "dbo" })
export class DetailTransaction {
  @Column("nvarchar", {
    primary: true,
    name: "idDetailTransaction",
    length: 255,
  })
  idDetailTransaction: string;

  @Column("int", { name: "qty", nullable: true })
  qty: number | null;

  @Column("float", { name: "intoMoney", nullable: true, precision: 53 })
  intoMoney: number | null;

  @ManyToOne(() => Transaction, (transaction) => transaction.detailTransactions)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction: Transaction;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailTransactions)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu: DetailMenu;
}
