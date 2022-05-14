import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { Food } from "./Food";
import { Menu } from "./Menu";
import { DetailTransaction } from "./DetailTransaction";

@Index("PK__DetailMe__DA941012F6735E63", ["idFood", "idMenu", "idRestaurant"], {
  unique: true,
})
@Entity("DetailMenu", { schema: "dbo" })
export class DetailMenu {
  @Column("varchar", { primary: true, name: "idFood", length: 255 })
  idFood: string;

  @Column("varchar", { primary: true, name: "idMenu", length: 200 })
  idMenu: string;

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

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @ManyToOne(() => Food, (food) => food.detailMenus)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood2: Food;

  @ManyToOne(() => Menu, (menu) => menu.detailMenus)
  @JoinColumn([
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  menu: Menu;

  @OneToMany(
    () => DetailTransaction,
    (detailTransaction) => detailTransaction.detailMenu
  )
  detailTransactions: DetailTransaction[];
}
