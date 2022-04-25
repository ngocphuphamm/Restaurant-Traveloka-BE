import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  OneToOne,
} from "typeorm";
import { DetailTransaction } from "./DetailTransaction";
import { StatisticalTables } from "./StatisticalTables";
import { Payment } from "./Payment";

<<<<<<< HEAD
@Index("PK__Transact__A0DB8815D540A0D0", ["idTransaction"], { unique: true })
=======
@Index("PK__Transact__A0DB88159A77E53C", ["idTransaction"], { unique: true })
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
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

  @OneToOne(
    () => DetailTransaction,
    (detailTransaction) => detailTransaction.idTransaction2
  )
  detailTransaction: DetailTransaction;

  @OneToOne(
    () => DetailTransaction,
    (detailTransaction) => detailTransaction.idTransaction3
  )
  detailTransaction2: DetailTransaction;

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

  @ManyToOne(() => Payment, (payment) => payment.transactions)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment: Payment;

  @ManyToOne(() => Payment, (payment) => payment.transactions2)
  @JoinColumn([{ name: "idPayment", referencedColumnName: "idPayment" }])
  idPayment2: Payment;
}
