import { Module } from '@nestjs/common';
import { MenusService } from './menus.service';
import { MenusController } from './menus.controller';

import { TypeOrmModule } from '@nestjs/typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { DetailMenu } from '../entities/DetailMenu';

import { Food } from '../entities/Food';
import { ImagesRestaurant } from '../entities/ImagesRestaurant';
import { ListImagesFood } from '../entities/ListImagesFood';
import { Menu } from '../entities/Menu';
import { Payment } from '../entities/Payment';
import { Restaurant } from '../entities/Restaurant';

import { StatisticalTables } from '../entities/StatisticalTables';
import { Transaction } from '../entities/Transaction';
import { AppService } from '../app/app.service';
import { FoodService } from '../food/food.service';
import { DetailService } from './detailmenu.service';
@Module({
  exports:[MenusService],
  providers: [MenusService,AppService,FoodService,DetailService],
  controllers: [MenusController],
  imports : [TypeOrmModule.forFeature([BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction]),]
})
export class MenusModule {}
