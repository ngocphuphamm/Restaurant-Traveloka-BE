import { Food } from './../entities/Food';




import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { Comment } from '../entities/Comment';
import { Customer } from '../entities/Customer';
import { DetailMenu } from '../entities/DetailMenu';


import { ImagesRestaurant } from '../entities/ImagesRestaurant';
import { ListImagesFood } from '../entities/ListImagesFood';
import { Menu } from '../entities/Menu';

import { Payment } from '../entities/Payment';
import { Restaurant } from '../entities/Restaurant';
import { Staff } from '../entities/Staff';
import { StatisticalTables } from '../entities/StatisticalTables';
import { Transaction } from '../entities/Transaction';

import { FoodModule } from '../food/food.module';
import { MenusModule } from '../menus/menus.module';
import { BookRestaurantModule } from '../book-restaurant/book-restaurant.module';

import { DetailTransaction } from '../entities/DetailTransaction';
import { BillModule } from '../bill/bill.module';





@Module({
  exports : [AppService],
  imports: [
     TypeOrmModule.forRoot({
      type: 'mssql',
      host: 'localhost',
      port: 1433,
      username: 'sa',
      password: 'Qq12345678',
      database: 'restaurantt',
      entities: [BookRestaurant,Comment,Customer,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,Staff,StatisticalTables,Transaction,DetailTransaction],

    }),
    TypeOrmModule.forFeature([BookRestaurant,Comment,Customer,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,Staff,StatisticalTables,Transaction,DetailTransaction]),
    FoodModule,
    MenusModule,
    BookRestaurantModule,
    BillModule
  ],
  controllers: [AppController],
  providers: [AppService],

})
export class AppModule {}
