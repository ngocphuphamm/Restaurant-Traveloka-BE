import { BookRestaurantService } from './book-restaurant.service';
import { Body, Controller, Post } from '@nestjs/common';
import { CreateBookDto } from './dto/create-book.dto';

@Controller('bookrestaurant')
export class BookRestaurantController {
    constructor(private readonly BookRestaurantService : BookRestaurantService) {}

    @Post()
    async postBookRestaurant(@Body()createBookDto : CreateBookDto)
    { 
        return this.BookRestaurantService.addBookRestaurant(createBookDto);
      
    }
}
