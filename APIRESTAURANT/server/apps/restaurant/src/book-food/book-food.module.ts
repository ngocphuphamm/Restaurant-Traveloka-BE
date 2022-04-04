import { Module } from '@nestjs/common';
import { BookFoodService } from './book-food.service';
import { BookFoodController } from './book-food.controller';

@Module({
  providers: [BookFoodService],
  controllers: [BookFoodController],
})
export class BookFoodModule {}
