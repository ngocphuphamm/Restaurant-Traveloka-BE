import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Food } from "./Food";

<<<<<<< HEAD
@Index("PK__ListImag__42CA0DFCDB2F2C52", ["idImagesFood", "idFood"], {
=======
@Index("PK__ListImag__42CA0DFCF170EB00", ["idImagesFood", "idFood"], {
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
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

  @ManyToOne(() => Food, (food) => food.listImagesFoods)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood2: Food;

  @ManyToOne(() => Food, (food) => food.listImagesFoods2)
  @JoinColumn([{ name: "idFood", referencedColumnName: "idFood" }])
  idFood3: Food;
}
