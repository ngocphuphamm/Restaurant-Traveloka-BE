import { Food } from './../entities/Food';




import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { DetailMenu } from '../entities/DetailMenu';


import { ImagesRestaurant } from '../entities/ImagesRestaurant';
import { ListImagesFood } from '../entities/ListImagesFood';
import { Menu } from '../entities/Menu';

import { Payment } from '../entities/Payment';
import { Restaurant } from '../entities/Restaurant';
import { StatisticalTables } from '../entities/StatisticalTables';
import { Transaction } from '../entities/Transaction';

import { FoodModule } from '../food/food.module';
import { MenusModule } from '../menus/menus.module';
import { BookRestaurantModule } from '../book-restaurant/book-restaurant.module';

import { DetailTransaction } from '../entities/DetailTransaction';
import { BillModule } from '../bill/bill.module';

import { AdminModule } from '../admin/admin.module';



@Module({
  exports : [AppService],
  imports: [
     TypeOrmModule.forRoot({
      type: 'mssql',
      host: process.env.HOST,
      port: 1433,
      username: 'sa',
      password: process.env.PASSWORD,
      database: process.env.DATABASE,
      entities: [BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction,DetailTransaction,],

    }),
    TypeOrmModule.forFeature([BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction,DetailTransaction]),
    FoodModule,
    MenusModule,
    BookRestaurantModule,
    BillModule,
    AdminModule
  ],
  controllers: [AppController],
  providers: [AppService],

})
export class AppModule {}
