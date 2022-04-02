import { Column, Entity, Index, OneToMany } from "typeorm";
import { BookRestaurant } from "./BookRestaurant";
import { Comment } from "./Comment";
import { ImagesRestaurant } from "./ImagesRestaurant";
import { Menu } from "./Menu";

@Index("PK__Restaura__6B94F09E9C471ED0", ["idRestaurant"], { unique: true })
@Entity("Restaurant", { schema: "dbo" })
export class Restaurant {
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

  @Column("int", { name: "like", nullable: true })
  like: number | null;

  @Column("int", { name: "dislikes", nullable: true })
  dislikes: number | null;

  @Column("ntext", { name: "descriptionRestaurant" })
  descriptionRestaurant: string;

  @OneToMany(
    () => BookRestaurant,
    (bookRestaurant) => bookRestaurant.idRestaurant2
  )
  bookRestaurants: BookRestaurant[];

  @OneToMany(() => Comment, (comment) => comment.idRestaurant2)
  comments: Comment[];

  @OneToMany(
    () => ImagesRestaurant,
    (imagesRestaurant) => imagesRestaurant.idRestaurant2
  )
  imagesRestaurants: ImagesRestaurant[];

  @OneToMany(() => Menu, (menu) => menu.idRestaurant2)
  menus: Menu[];
}
