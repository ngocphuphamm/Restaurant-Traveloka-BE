import { Column, Entity, Index, OneToMany } from "typeorm";
import { StatisticalTables } from "./StatisticalTables";

@Index("PK__Staff__98C886A911CCD48B", ["idStaff"], { unique: true })
@Entity("Staff", { schema: "dbo" })
export class Staff {
  @Column("nvarchar", { primary: true, name: "idStaff", length: 255 })
  idStaff: string;

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idStaff2
  )
  statisticalTables: StatisticalTables[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idStaff3
  )
  statisticalTables2: StatisticalTables[];

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idStaff4
  )
  statisticalTables3: StatisticalTables[];
}
