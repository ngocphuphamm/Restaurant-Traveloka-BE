import { Controller, Get, Param } from '@nestjs/common';

import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getData() {
    return this.appService.findAll();
  }

  @Get('search/:name')
  search(@Param('name')name : string)
  { 
    return this.appService.searchRestaurant(name);
  }

  @Get(':id')
  getRestaurant(@Param('id')id : string)
  { 
    return this.appService.getRestaurant(id);
  }
}
