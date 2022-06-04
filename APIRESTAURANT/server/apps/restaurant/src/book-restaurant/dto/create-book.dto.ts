export class CreateBookDto {
    idRestaurant: string;
    idCustomer : string ; 
    nameBook: string;
    phoneBook: number;
    dateBook : Date;
    bookingSession: boolean;
    createdAt : Date;
    status: boolean;
}