import { Module } from '@nestjs/common';
import { AdminService } from './admin.service';
import { AdminController } from './admin.controller';
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
import { DetailTransaction } from '../entities/DetailTransaction';
import { MulterModule } from '@nestjs/platform-express';
@Module({
  providers: [AdminService],
  controllers: [AdminController],
  imports : [  TypeOrmModule.forFeature([BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction,DetailTransaction]),
  MulterModule.register({
    dest: './files',
  })],
  exports : [AdminService]
})
export class AdminModule {}
