import { Module } from '@nestjs/common';
import { MenusService } from './menus.service';
import { MenusController } from './menus.controller';

import { TypeOrmModule } from '@nestjs/typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { Customer } from '../entities/Customer';
import { DetailMenu } from '../entities/DetailMenu';
import { DetailOrder } from '../entities/DetailOrder';
import { Food } from '../entities/Food';
import { ImagesRestaurant } from '../entities/ImagesRestaurant';
import { ListImagesFood } from '../entities/ListImagesFood';
import { Menu } from '../entities/Menu';
import { Order } from '../entities/Order';
import { Payment } from '../entities/Payment';
import { Restaurant } from '../entities/Restaurant';
import { Staff } from '../entities/Staff';
import { StatisticalTables } from '../entities/StatisticalTables';
import { Transaction } from '../entities/Transaction';
import { AppModule } from '../app/app.module';
import { AppService } from '../app/app.service';
import { FoodService } from '../food/food.service';
import { FoodModule } from '../food/food.module';
import { DetailService } from './detailmenu.service';
@Module({
  exports:[MenusService],
  providers: [MenusService,AppService,FoodService,DetailService],
  controllers: [MenusController],
  imports : [TypeOrmModule.forFeature([BookRestaurant,Customer,DetailMenu,DetailOrder,Food,ImagesRestaurant,ListImagesFood,Menu,Order,Payment,Restaurant,Staff,StatisticalTables,Transaction]),]
})
export class MenusModule {}
