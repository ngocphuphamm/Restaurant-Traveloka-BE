import { Module } from '@nestjs/common';
import { BookRestaurantService } from './book-restaurant.service';
import { BookRestaurantController } from './book-restaurant.controller';

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
//
@Module({
  providers: [BookRestaurantService],
  controllers: [BookRestaurantController],
  imports : [  TypeOrmModule.forFeature([BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction]),]
})
export class BookRestaurantModule {}
