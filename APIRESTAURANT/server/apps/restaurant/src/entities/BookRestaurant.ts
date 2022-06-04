import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { Restaurant } from "./Restaurant";

@Index("PK__BookRest__3CB708B1BE660F80", ["idBookRestaurant", "idRestaurant"], {
  unique: true,
})
@Entity("BookRestaurant", { schema: "dbo" })
export class BookRestaurant {
  @Column("varchar", { primary: true, name: "idBookRestaurant", length: 255 })
  idBookRestaurant: string;

  @Column("varchar", { primary: true, name: "idRestaurant", length: 255 })
  idRestaurant: string;

  @Column("nvarchar", { name: "idCustomer", nullable: true, length: 255 })
  idCustomer: string | null;

  @Column("nvarchar", { name: "nameBook", length: 255 })
  nameBook: string;

  @Column("int", { name: "phoneBook" })
  phoneBook: number;

  @Column("bit", { name: "bookingSession" })
  bookingSession: boolean;

  @Column("date", { name: "dateBook" })
  dateBook: Date;

  @Column("datetime", {
    name: "createdAt",
    nullable: true,
    default: () => "getdate()",
  })
  createdAt: Date | null;

  @Column("bit", { name: "status" })
  status: boolean;

  @ManyToOne(() => Restaurant, (restaurant) => restaurant.bookRestaurants)
  @JoinColumn([{ name: "idRestaurant", referencedColumnName: "idRestaurant" }])
  idRestaurant2: Restaurant;
}
