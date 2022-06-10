
import { IsNotEmpty } from 'class-validator';

export class RestaurantDto {
    @IsNotEmpty()
    nameRestaurant : string ;
    @IsNotEmpty()
    addressRestaurant : string ;
    @IsNotEmpty()
    descriptionRestaurant : string;
    @IsNotEmpty()
    idStaff : string ;
    @IsNotEmpty()
    priceService : number;

    
}