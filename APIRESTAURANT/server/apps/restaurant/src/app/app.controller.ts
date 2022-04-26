import { Controller, Get, Param, Query } from '@nestjs/common';
import { FoodService } from '../food/food.service';

import { AppService } from './app.service';
//
@Controller('restaurant')
export class AppController {
  constructor(private readonly appService: AppService,private foodService: FoodService) {}

  @Get()
  getData() {
    return this.appService.findAll();
  }

  @Get('search')
  search(@Query('q') name : string)
  { 
    return this.appService.searchRestaurant(name);
  }

  @Get(':id')
  getRestaurant(@Param('id')id : string)
  { 
    return this.appService.getRestaurant(id);
  }

  

}
