import { Controller, Get, Param } from '@nestjs/common';
import { getManager } from 'typeorm';
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

    @Get('getAllFood/:id')
   async getAllFoodAtRestaurant(@Param('id')id : string) : Promise<Food []> 
    {
        return this.foodService.getAllFoodAtRestaurant(id);
    }
    @Get('getFood/:idFood')
    async getFood(@Param('idFood') idFood : string)
    {
        return this.foodService.getFood(idFood)
    }
}
