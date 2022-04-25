import { Column, Entity, Index, OneToMany } from "typeorm";
import { DetailMenu } from "./DetailMenu";
import { ListImagesFood } from "./ListImagesFood";

@Index("PK__Food__69D92BAA7E4FE7E8", ["idFood"], { unique: true })
@Entity("Food", { schema: "dbo" })
export class Food {
  @Column("varchar", { primary: true, name: "idFood", length: 255 })
  idFood: string;

  @Column("nvarchar", { name: "nameFood", length: 255 })
  nameFood: string;

  @Column("float", { name: "priceFood", precision: 53 })
  priceFood: number;

  @Column("int", { name: "qty", nullable: true })
  qty: number | null;

  @Column("int", { name: "qtyBook", nullable: true })
  qtyBook: number | null;

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

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.idFood2)
  detailMenus: DetailMenu[];

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.idFood3)
  detailMenus2: DetailMenu[];

  @OneToMany(() => ListImagesFood, (listImagesFood) => listImagesFood.idFood2)
  listImagesFoods: ListImagesFood[];

  @OneToMany(() => ListImagesFood, (listImagesFood) => listImagesFood.idFood3)
  listImagesFoods2: ListImagesFood[];
}
