
import { IsNotEmpty } from 'class-validator';

export class RestaurantDtoEdit {
    @IsNotEmpty()
    nameRestaurant : string ;
    @IsNotEmpty()
    addressRestaurant : string ;
    @IsNotEmpty()
    descriptionRestaurant : string;
    @IsNotEmpty()
    priceService : number;

    
}