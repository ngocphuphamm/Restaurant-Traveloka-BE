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
import { DetailOrder } from "./DetailOrder";

@Index("PK__DetailMe__DA94101258CD9280", ["idFood", "idMenu", "idRestaurant"], {
  unique: true,
})
@Entity("DetailMenu", { schema: "dbo" })
export class DetailMenu {
  @Column("varchar", { primary: true, name: "idFood", length: 255 })
  idFood: string;

  @Column("varchar", { primary: true, name: "idMenu", length: 200 })
  idMenu: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("datetime", { name: "createdAt", nullable: true })
  createdAt: Date | null;

  @Column("datetime", { name: "updatedAt", nullable: true })
  updatedAt: Date | null;

  @ManyToOne(() => Food, (food) => food.detailMenus)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood2: Food;

  @ManyToOne(() => Menu, (menu) => menu.detailMenus)
  @JoinColumn([
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  menu: Menu;

  @ManyToOne(() => Menu, (menu) => menu.detailMenus2)
  @JoinColumn([
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  menu2: Menu;

  @ManyToOne(() => Menu, (menu) => menu.detailMenus3)
  @JoinColumn([
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  menu3: Menu;

  @ManyToOne(() => Food, (food) => food.detailMenus2)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood3: Food;

  @ManyToOne(() => Food, (food) => food.detailMenus3)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood4: Food;

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.detailMenu)
  detailOrders: DetailOrder[];

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.detailMenu2)
  detailOrders2: DetailOrder[];

  @OneToMany(() => DetailOrder, (detailOrder) => detailOrder.detailMenu3)
  detailOrders3: DetailOrder[];
}
