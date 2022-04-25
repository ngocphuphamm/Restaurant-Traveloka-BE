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

<<<<<<< HEAD
@Index("PK__Restaura__6B94F09E3A59A5C5", ["idRestaurant"], { unique: true })
=======
@Index("PK__Restaura__6B94F09E3BB69972", ["idRestaurant"], { unique: true })
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
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

  @OneToMany(
    () => BookRestaurant,
    (bookRestaurant) => bookRestaurant.idRestaurant3
  )
  bookRestaurants2: BookRestaurant[];

  @OneToMany(() => Comment, (comment) => comment.idRestaurant2)
  comments: Comment[];

  @OneToMany(() => Comment, (comment) => comment.idRestaurant3)
  comments2: Comment[];

  @OneToMany(
    () => ImagesRestaurant,
    (imagesRestaurant) => imagesRestaurant.idRestaurant
  )
  imagesRestaurants: ImagesRestaurant[];

  @OneToMany(
    () => ImagesRestaurant,
    (imagesRestaurant) => imagesRestaurant.idRestaurant2
  )
  imagesRestaurants2: ImagesRestaurant[];

  @OneToMany(() => Menu, (menu) => menu.idRestaurant2)
  menus: Menu[];

<<<<<<< HEAD
  @OneToMany(() => Menu, (menu) => menu.idRestaurant3)
  menus2: Menu[];

  @ManyToOne(() => Staff, (staff) => staff.restaurants)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff: Staff;

  @ManyToOne(() => Staff, (staff) => staff.restaurants2)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff2: Staff;
=======
  @ManyToOne(() => Staff, (staff) => staff.restaurants)
  @JoinColumn([{ name: "idStaff", referencedColumnName: "idStaff" }])
  idStaff: Staff;
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
}
