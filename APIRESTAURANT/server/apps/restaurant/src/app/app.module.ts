

import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { Comment } from '../entities/Comment';
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
  imports: [
   
    TypeOrmModule.forRoot({
      type: 'mssql',
      host: 'localhost',
      port: 1433,
      username: 'sa',
      password: 'ngocphu@123',
      database: 'restaurant',
      entities: [BookRestaurant,Comment,Customer,DetailMenu,DetailOrder,Food,ImagesRestaurant,ListImagesFood,Menu,Order,Payment,Restaurant,Staff,StatisticalTables,Transaction],
     
    }),
    TypeOrmModule.forFeature([BookRestaurant,Comment,Customer,DetailMenu,DetailOrder,Food,ImagesRestaurant,ListImagesFood,Menu,Order,Payment,Restaurant,Staff,StatisticalTables,Transaction]),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}