import { Test, TestingModule } from '@nestjs/testing';
import { BookRestaurantService } from './book-restaurant.service';

describe('BookRestaurantService', () => {
  let service: BookRestaurantService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [BookRestaurantService],
    }).compile();

    service = module.get<BookRestaurantService>(BookRestaurantService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
