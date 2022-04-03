import { Controller, Get, Param } from '@nestjs/common';
import { Food } from '../entities/Food';
import { FoodService } from './food.service';

@Controller('food')
export class FoodController {
    constructor(private readonly foodService: FoodService){}
        
    @Get()
    getData() : Promise<Food []> {
      return this.foodService.findAll();
    } 

    @Get('search/:name')
    searchFood(@Param('name')name : string) : Promise<Food[]> {
       
          return this.foodService.searchFood(name);
     
       
    }
}
