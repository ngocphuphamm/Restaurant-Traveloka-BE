import { Test, TestingModule } from '@nestjs/testing';
import { BookRestaurantController } from './book-restaurant.controller';

describe('BookRestaurantController', () => {
  let controller: BookRestaurantController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [BookRestaurantController],
    }).compile();

    controller = module.get<BookRestaurantController>(BookRestaurantController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
