import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";

@Index(
  "PK__ImagesRe__8775EF07D5E0559C",
  ["idImagesRestaurant", "idRestaurant"],
  { unique: true }
)
@Entity("ImagesRestaurant", { schema: "dbo" })
export class ImagesRestaurant {
  @Column("varchar", { primary: true, name: "idImagesRestaurant", length: 255 })
  idImagesRestaurant: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { name: "urlRestaurant", length: 255 })
  urlRestaurant: string;

  @Column("datetime", { name: "createdAt", nullable: true })
  createdAt: Date | null;

  @Column("datetime", { name: "updateAt", nullable: true })
  updateAt: Date | null;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.imagesRestaurants)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;
}
