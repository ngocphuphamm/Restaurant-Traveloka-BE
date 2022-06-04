import { Module } from '@nestjs/common';
import { BillService } from './bill.service';
import { BillController } from './bill.controller';
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
import { DetailTransactionService } from './detailBill.service';
@Module({
  exports:[DetailTransactionService],
  providers: [BillService,DetailTransactionService],
  controllers: [BillController],
  imports : [  TypeOrmModule.forFeature([BookRestaurant,DetailMenu,Food,ImagesRestaurant,ListImagesFood,Menu,Payment,Restaurant,StatisticalTables,Transaction,DetailTransaction]),]

})
export class BillModule {}
