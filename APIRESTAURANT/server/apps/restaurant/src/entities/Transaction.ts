import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { DetailTransaction } from "./DetailTransaction";
import { StatisticalTables } from "./StatisticalTables";
import { Payment } from "./Payment";

@Index("PK__Transact__A0DB8815F7A03EF5", ["idTransaction"], { unique: true })
@Entity("Transaction", { schema: "dbo" })
export class Transaction {
  @Column("nvarchar", { primary: true, name: "idTransaction", length: 255 })
  idTransaction: string;

  @Column("nvarchar", { name: "idCustomer", nullable: true, length: 255 })
  idCustomer: string | null;

  @Column("nvarchar", { name: "nameBook", length: 255 })
  nameBook: string;

  @Column("nvarchar", { name: "addressBook", length: 255 })
  addressBook: string;
  
  @Column("nvarchar", { name: "emailBook", length: 255 })
  emailBook: string;
  @Column("int", { name: "phoneBook" })
  phoneBook: number;

  @Column("int", { name: "status" })
  status: number;

  @Column("float", { name: "shipping", precision: 53 })
  shipping: number;

  @Column("int", { name: "sumQty" })
  sumQty: number;

  @Column("float", { name: "totalMoney", precision: 53 })
  totalMoney: number;

  @Column("datetime", {
    name: "createdAt",
    nullable: true,
    default: () => "getdate()",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updatedAt",
    nullable: true,
    default: () => "getdate()",
  })
  updatedAt: Date | null;

  @OneToMany(
    () => DetailTransaction,
    (detailTransaction) => detailTransaction.idTransaction
  )
  detailTransactions: DetailTransaction[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idTransaction2
  )
  statisticalTables: StatisticalTables[];

  @ManyToOne(() => Payment, (payment) => payment.transactions)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment: Payment;
}
