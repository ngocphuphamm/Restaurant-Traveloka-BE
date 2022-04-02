import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { DetailMenu } from "./DetailMenu";
import { Restaurant } from "./Restaurant";

@Index("PK__Menu__34D3BB8A8C7C8BED", ["idMenu", "idRestaurant"], {
  unique: true,
})
@Entity("Menu", { schema: "dbo" })
export class Menu {
  @Column("varchar", { primary: true, name: "idMenu", length: 200 })
  idMenu: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { name: "nameMenu", length: 255 })
  nameMenu: string;

  @Column("datetime", { name: "startTime", nullable: true })
  startTime: Date | null;

  @Column("datetime", { name: "endTime", nullable: true })
  endTime: Date | null;

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.menu)
  detailMenus: DetailMenu[];

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.menu2)
  detailMenus2: DetailMenu[];

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.menu3)
  detailMenus3: DetailMenu[];

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.menus)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;
}
