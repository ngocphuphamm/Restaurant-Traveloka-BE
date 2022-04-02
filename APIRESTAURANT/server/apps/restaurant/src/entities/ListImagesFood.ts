import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Food } from "./Food";

@Index("PK__ListImag__42CA0DFCD647E63D", ["idImagesFood", "idFood"], {
  unique: true,
})
@Entity("ListImagesFood", { schema: "dbo" })
export class ListImagesFood {
  @Column("nvarchar", { primary: true, name: "idImagesFood", length: 255 })
  idImagesFood: string;

  @Column("varchar", { primary: true, name: "idFood", length: 255 })
  idFood: string;

  @Column("nvarchar", { name: "urlImage", length: 255 })
  urlImage: string;

  @Column("datetime", { name: "createdAt", nullable: true })
  createdAt: Date | null;

  @Column("datetime", { name: "updatedAt", nullable: true })
  updatedAt: Date | null;

  @ManyToOne(() => Food, (food) => food.listImagesFoods)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood2: Food;

  @ManyToOne(() => Food, (food) => food.listImagesFoods2)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood3: Food;

  @ManyToOne(() => Food, (food) => food.listImagesFoods3)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood4: Food;
}