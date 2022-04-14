import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";

@Index("PK__ImagesRe__71CCA00E111B1700", ["idImagesRestaurant"], {
  unique: true,
})
@Entity("ImagesRestaurant", { schema: "dbo" })
export class ImagesRestaurant {
  @Column("varchar", { primary: true, name: "idImagesRestaurant", length: 255 })
  idImagesRestaurant: string;

  @Column("ntext", { name: "urlRestaurant" })
  urlRestaurant: string;

  @Column("datetime", { name: "createdAt", nullable: true })
  createdAt: Date | null;

  @Column("datetime", { name: "updatedAt", nullable: true })
  updatedAt: Date | null;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.imagesRestaurants)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant: Restaurant;
}
