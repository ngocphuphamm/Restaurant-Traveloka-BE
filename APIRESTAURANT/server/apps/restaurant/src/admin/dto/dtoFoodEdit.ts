
import { IsNotEmpty } from 'class-validator';

export class FoodDtoEdit {
    @IsNotEmpty()
    nameFood : string ;
    @IsNotEmpty()
    priceFood : number ;
   
}