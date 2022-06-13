import { IsNotEmpty } from 'class-validator';

export class BookNumberDto {
    @IsNotEmpty()
    idRestaurant : string ;
    @IsNotEmpty()
    bookingSession : number;
    @IsNotEmpty()
    dateBook : Date;
}