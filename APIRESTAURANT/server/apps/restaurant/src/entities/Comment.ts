import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";
import { Customer } from "./Customer";

@Index(
  "PK__Comment__699207DF4CBF20FC",
  ["idRestaurant", "idCustomer", "idComment"],
  { unique: true }
)
@Entity("Comment", { schema: "dbo" })
export class Comment {
  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { primary: true, name: "idCustomer", length: 255 })
  idCustomer: string;

  @Column("nvarchar", { primary: true, name: "idComment", length: 255 })
  idComment: string;

  @Column("ntext", { name: "comment" })
  comment: string;

  @Column("datetime", { name: "createdAt" })
  createdAt: Date;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.comments)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.comments2)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant3: Restaurant;

  @ManyToOne(() => Customer, (customer) => customer.comments)
  @JoinColumn([{ name: "idCustomer", referencedColumnName: "idCustomer" }])
  idCustomer2: Customer;

  @ManyToOne(() => Customer, (customer) => customer.comments2)
  @JoinColumn([{ name: "idCustomer", referencedColumnName: "idCustomer" }])
  idCustomer3: Customer;
}
