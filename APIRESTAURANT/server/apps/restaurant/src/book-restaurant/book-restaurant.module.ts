import { Module } from '@nestjs/common';
import { BookRestaurantService } from './book-restaurant.service';
import { BookRestaurantController } from './book-restaurant.controller';

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
@Module({
  providers: [BookRestaurantService],
  controllers: [BookRestaurantController],
  imports : [  TypeOrmModule.forFeature([BookRestaurant,Customer,DetailMenu,DetailOrder,Food,ImagesRestaurant,ListImagesFood,Menu,Order,Payment,Restaurant,Staff,StatisticalTables,Transaction]),]
})
export class BookRestaurantModule {}
