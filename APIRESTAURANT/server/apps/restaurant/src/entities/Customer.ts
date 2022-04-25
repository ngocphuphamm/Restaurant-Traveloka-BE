import { Column, Entity, Index, OneToMany } from "typeorm";
import { Comment } from "./Comment";

<<<<<<< HEAD
@Index("PK__Customer__D058768675049AEB", ["idCustomer"], { unique: true })
=======
@Index("PK__Customer__D05876867573EF49", ["idCustomer"], { unique: true })
>>>>>>> 03ff1f6a5ab88d9ab820c6f404b0e7996de8792a
@Entity("Customer", { schema: "dbo" })
export class Customer {
  @Column("nvarchar", { primary: true, name: "idCustomer", length: 255 })
  idCustomer: string;

  @OneToMany(() => Comment, (comment) => comment.idCustomer2)
  comments: Comment[];

  @OneToMany(() => Comment, (comment) => comment.idCustomer3)
  comments2: Comment[];
}
