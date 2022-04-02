import { Column, Entity, Index, OneToMany } from "typeorm";
import { DetailOrder } from "./DetailOrder";
import { Transaction } from "./Transaction";

@Index("PK__Order__C8AAF6FFB9474155", ["idOrder"], { unique: true })
@Entity("Order", { schema: "dbo" })
export class Order {
  @Column("nvarchar", { primary: true, name: "idOrder", length: 255 })
  idOrder: string;

  @Column("float", { name: "sumMoney", precision: 53 })
  sumMoney: number;

  @Column("int", { name: "sumQty" })
  sumQty: number;

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.idOrder2)
  detailOrders: DetailOrder[];

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.idOrder3)
  detailOrders2: DetailOrder[];

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.idOrder4)
  detailOrders3: DetailOrder[];

  @OneToMany(() => Transaction, (transaction) => transaction.idOrder)
  transactions: Transaction[];

  @OneToMany(() => Transaction, (transaction) => transaction.idOrder2)
  transactions2: Transaction[];

  @OneToMany(() => Transaction, (transaction) => transaction.idOrder3)
  transactions3: Transaction[];
}
