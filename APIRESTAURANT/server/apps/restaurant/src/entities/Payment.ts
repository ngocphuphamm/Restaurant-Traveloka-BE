import { Column, Entity, Index, OneToMany } from "typeorm";
import { Transaction } from "./Transaction";

<<<<<<< HEAD
@Index("PK__Payment__F22D4A4586D2D445", ["idPayment"], { unique: true })
=======
@Index("PK__Payment__F22D4A45C57681E3", ["idPayment"], { unique: true })
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
@Entity("Payment", { schema: "dbo" })
export class Payment {
  @Column("nvarchar", { primary: true, name: "idPayment", length: 255 })
  idPayment: string;

  @Column("nvarchar", { name: "namePayment", nullable: true, length: 255 })
  namePayment: string | null;

  @OneToMany(() => Transaction, (transaction) => transaction.idPayment)
  transactions: Transaction[];

  @OneToMany(() => Transaction, (transaction) => transaction.idPayment2)
  transactions2: Transaction[];
}
