import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";

@Index("PK__BookRest__3CB708B1657F9300", ["idBookRestaurant", "idRestaurant"], {
  unique: true,
})
@Entity("BookRestaurant", { schema: "dbo" })
export class BookRestaurant {
  @Column("varchar", { primary: true, name: "idBookRestaurant", length: 255 })
  idBookRestaurant: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { name: "nameBook", length: 255 })
  nameBook: string;

  @Column("int", { name: "phoneBook" })
  phoneBook: number;

  @Column("datetime", { name: "timeBook" })
  timeBook: Date;

  @Column("datetime", {
    name: "createdAt",
    nullable: true,
    default: () => "getdate()",
  })
  createdAt: Date | null;

  @Column("bit", { name: "status" })
  status: boolean;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.bookRestaurants)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.bookRestaurants2)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant3: Restaurant;
}
