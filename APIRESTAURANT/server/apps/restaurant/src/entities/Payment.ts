import { Column, Entity, Index, OneToMany } from "typeorm";
import { Transaction } from "./Transaction";

@Index("PK__Payment__F22D4A4584100255", ["idPayment"], { unique: true })
@Entity("Payment", { schema: "dbo" })
export class Payment {
  @Column("nvarchar", { primary: true, name: "idPayment", length: 255 })
  idPayment: string;

  @Column("nvarchar", { name: "namePayment", nullable: true, length: 255 })
  namePayment: string | null;

  @OneToMany(() => Transaction, (transaction) => transaction.idPayment)
  transactions: Transaction[];
}
