import { Column, Entity, Index, OneToMany } from "typeorm";
import { StatisticalTables } from "./StatisticalTables";

@Index("PK__Staff__98C886A9531BD94F", ["idStaff"], { unique: true })
@Entity("Staff", { schema: "dbo" })
export class Staff {
  @Column("nvarchar", { primary: true, name: "idStaff", length: 255 })
  idStaff: string;

  @OneToMany(
    () => StatisticalTables,
    (statisticalTables) => statisticalTables.idStaff
  )
  statisticalTables: StatisticalTables[];
}
