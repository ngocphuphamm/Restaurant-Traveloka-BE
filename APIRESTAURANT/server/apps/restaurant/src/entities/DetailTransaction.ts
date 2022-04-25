import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToOne,
} from "typeorm";
import { Transaction } from "./Transaction";
import { DetailMenu } from "./DetailMenu";

<<<<<<< HEAD
@Index("PK__DetailTr__A0DB88153B6DCD44", ["idTransaction"], { unique: true })
=======
@Index("PK__DetailTr__A0DB88153ADACBA4", ["idTransaction"], { unique: true })
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
@Entity("DetailTransaction", { schema: "dbo" })
export class DetailTransaction {
  @Column("nvarchar", { primary: true, name: "idTransaction", length: 255 })
  idTransaction: string;

  @Column("int", { name: "qty", nullable: true })
  qty: number | null;

  @Column("float", { name: "intoMoney", nullable: true, precision: 53 })
  intoMoney: number | null;

  @OneToOne(() => Transaction, (transaction) => transaction.detailTransaction)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction2: Transaction;

  @OneToOne(() => Transaction, (transaction) => transaction.detailTransaction2)
  @JoinColumn([
    { name: "idTransaction", referencedColumnName: "idTransaction" },
  ])
  idTransaction3: Transaction;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailTransactions)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu: DetailMenu;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailTransactions2)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu2: DetailMenu;
}
