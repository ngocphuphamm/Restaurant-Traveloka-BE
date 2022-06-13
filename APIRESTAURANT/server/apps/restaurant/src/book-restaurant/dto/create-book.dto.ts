export class CreateBookDto {
    idRestaurant: string;
    idCustomer : string ; 
    nameBook: string;
    phoneBook: number;
    dateBook : Date;
    bookingSession: number;
    createdAt : Date;
    status: boolean;
}