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

@Index("PK__Menu__34D3BB8A61D9AF7D", ["idMenu", "idRestaurant"], {
  unique: true,
})
@Entity("Menu", { schema: "dbo" })
export class Menu {
  @Column("varchar", { primary: true, name: "idMenu", length: 200 })
  idMenu: string;

  @Column("nvarchar", { name: "nameMenu", length: 255 })
  nameMenu: string;

  @Column("datetime", { name: "startTime", nullable: true })
  startTime: Date | null;

  @Column("datetime", { name: "endTime", nullable: true })
  endTime: Date | null;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @OneToMany(() => DetailMenu, (detailMenu) => detailMenu.menu)
  detailMenus: DetailMenu[];

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.menus)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;
}
