
import { IsNotEmpty } from 'class-validator';

export class FoodDto {
    @IsNotEmpty()
    nameFood : string ;
    @IsNotEmpty()
    priceFood : string ;
}