import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { DetailMenu } from "./DetailMenu";
import { Order } from "./Order";

@Index(
  "PK__DetailOr__F503B7FEB8F95E10",
  ["idOrder", "idFood", "idMenu", "idRestaurant"],
  { unique: true }
)
@Entity("DetailOrder", { schema: "dbo" })
export class DetailOrder {
  @Column("nvarchar", { primary: true, name: "idOrder", length: 255 })
  idOrder: string;

  @Column("int", { name: "number" })
  number: number;

  @Column("int", { name: "qty" })
  qty: number;

  @Column("float", { name: "intoMoney", precision: 53 })
  intoMoney: number;

  @Column("varchar", { primary: true, name: "idFood", length: 255 })
  idFood: string;

  @Column("varchar", { primary: true, name: "idMenu", length: 200 })
  idMenu: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailOrders)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu: DetailMenu;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailOrders2)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu2: DetailMenu;

  @ManyToOne(() => DetailMenu, (detailMenu) => detailMenu.detailOrders3)
  @JoinColumn([
    { name: "idFood", referencedColumnName: "idFood" },
    { name: "idMenu", referencedColumnName: "idMenu" },
    { name: "idRestaurant", referencedColumnName: "idRestaurant" },
  ])
  detailMenu3: DetailMenu;

  @ManyToOne(() => Order, (order) => order.detailOrders)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder2: Order;

  @ManyToOne(() => Order, (order) => order.detailOrders2)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder3: Order;

  @ManyToOne(() => Order, (order) => order.detailOrders3)
  @JoinColumn([{ name: "idOrder", referencedColumnName: "idOrder" }])
  idOrder4: Order;
}
