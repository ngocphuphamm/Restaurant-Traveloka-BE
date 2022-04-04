import { Test, TestingModule } from '@nestjs/testing';
import { BookFoodService } from './book-food.service';

describe('BookFoodService', () => {
  let service: BookFoodService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [BookFoodService],
    }).compile();

    service = module.get<BookFoodService>(BookFoodService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
