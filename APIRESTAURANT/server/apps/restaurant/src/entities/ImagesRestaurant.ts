import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";

@Index("PK__ImagesRe__71CCA00EEBE48854", ["idImagesRestaurant"], {
  unique: true,
})
@Entity("ImagesRestaurant", { schema: "dbo" })
export class ImagesRestaurant {
  @Column("varchar", { primary: true, name: "idImagesRestaurant", length: 255 })
  idImagesRestaurant: string;

  @Column("ntext", { name: "urlRestaurant" })
  urlRestaurant: string;

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

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.imagesRestaurants)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant: Restaurant;
}
