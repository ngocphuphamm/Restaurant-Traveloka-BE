import { Column, Entity, Index, OneToMany } from "typeorm";
import { BookRestaurant } from "./BookRestaurant";
import { ImagesRestaurant } from "./ImagesRestaurant";
import { Menu } from "./Menu";

@Index("PK__Restaura__6B94F09E27174142", ["idRestaurant"], { unique: true })
@Entity("Restaurant", { schema: "dbo" })
export class Restaurant {
  static update() {
      throw new Error('Method not implemented.');
  }
  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { name: "nameRestaurant", length: 150 })
  nameRestaurant: string;

  @Column("nvarchar", { name: "addressRestaurant", length: 255 })
  addressRestaurant: string;

  @Column("datetime", { name: "startTIme", nullable: true })
  startTIme: Date | null;

  @Column("datetime", { name: "endTime", nullable: true })
  endTime: Date | null;

  @Column("float", { name: "priceService", precision: 53 })
  priceService: number;

  @Column("int", { name: "likes", nullable: true })
  likes: number | null;

  @Column("int", { name: "dislikes", nullable: true })
  dislikes: number | null;

  @Column("ntext", { name: "descriptionRestaurant" })
  descriptionRestaurant: string;

  @Column("nvarchar", { name: "idStaff", length: 255 })
  idStaff: string;

  @OneToMany(
    () => BookRestaurant,
    (bookRestaurant) => bookRestaurant.idRestaurant2
  )
  bookRestaurants: BookRestaurant[];

  @OneToMany(
    () => ImagesRestaurant,
    (imagesRestaurant) => imagesRestaurant.idRestaurant
  )
  imagesRestaurants: ImagesRestaurant[];

  @OneToMany(() => Menu, (menu) => menu.idRestaurant2)
  menus: Menu[];
}
