import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { StatisticalTables } from "./StatisticalTables";
import { Payment } from "./Payment";
import { Order } from "./Order";

@Index("PK__Transact__A0DB88157499C884", ["idTransaction"], { unique: true })
@Entity("Transaction", { schema: "dbo" })
export class Transaction {
  @Column("nvarchar", { primary: true, name: "idTransaction", length: 255 })
  idTransaction: string;

  @Column("nvarchar", { name: "nameBook", length: 255 })
  nameBook: string;

  @Column("nvarchar", { name: "addressBook", length: 255 })
  addressBook: string;

  @Column("int", { name: "phoneBook" })
  phoneBook: number;

  @Column("int", { name: "status" })
  status: number;

  @Column("float", { name: "totalMoney", precision: 53 })
  totalMoney: number;

  @Column("datetime", { name: "createdAt", nullable: true })
  createdAt: Date | null;

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idTransaction2
  )
  statisticalTables: StatisticalTables[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idTransaction3
  )
  statisticalTables2: StatisticalTables[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idTransaction4
  )
  statisticalTables3: StatisticalTables[];

  @ManyToOne(() => Payment, (payment) => payment.transactions)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment: Payment;

  @ManyToOne(() => Payment, (payment) => payment.transactions2)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment2: Payment;

  @ManyToOne(() => Payment, (payment) => payment.transactions3)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment3: Payment;

  @ManyToOne(() => Order, (order) => order.transactions)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder: Order;

  @ManyToOne(() => Order, (order) => order.transactions2)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder2: Order;

  @ManyToOne(() => Order, (order) => order.transactions3)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder3: Order;
}
