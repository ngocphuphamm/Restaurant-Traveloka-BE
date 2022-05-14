import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { BookRestaurant } from "./BookRestaurant";
import { Comment } from "./Comment";
import { ImagesRestaurant } from "./ImagesRestaurant";
import { Menu } from "./Menu";
import { Staff } from "./Staff";

@Index("PK__Restaura__6B94F09ED1C2F6DF", ["idRestaurant"], { unique: true })
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

  @Column("int", { name: "likes", nullable: true })
  likes: number | null;

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
    (imagesRestaurant) => imagesRestaurant.idRestaurant
  )
  imagesRestaurants: ImagesRestaurant[];

  @OneToMany(() => Menu, (menu) => menu.idRestaurant2)
  menus: Menu[];

  @ManyToOne(() => Staff, (staff) => staff.restaurants)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff: Staff;
}
