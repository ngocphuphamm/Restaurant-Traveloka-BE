import { Column, Entity, Index, OneToMany } from "typeorm";
import { Comment } from "./Comment";

@Index("PK__Customer__D0587686663181D0", ["idCustomer"], { unique: true })
@Entity("Customer", { schema: "dbo" })
export class Customer {
  @Column("nvarchar", { primary: true, name: "idCustomer", length: 255 })
  idCustomer: string;

  @OneToMany(() => Comment, (comment) => comment.idCustomer2)
  comments: Comment[];
}
