import { Column, Entity, Index, OneToMany } from "typeorm";
import { Restaurant } from "./Restaurant";
import { StatisticalTables } from "./StatisticalTables";

@Index("PK__Staff__98C886A955457881", ["idStaff"], { unique: true })
@Entity("Staff", { schema: "dbo" })
export class Staff {
  @Column("nvarchar", { primary: true, name: "idStaff", length: 255 })
  idStaff: string;

  @Column("varchar", { name: "account", length: 255 })
  account: string;

  @Column("varchar", { name: "password", length: 255 })
  password: string;

  @OneToMany(() => Restaurant, (restaurant) => restaurant.idStaff)
  restaurants: Restaurant[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idStaff
  )
  statisticalTables: StatisticalTables[];
}
