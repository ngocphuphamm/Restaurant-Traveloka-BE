import { BookRestaurantService } from './book-restaurant.service';
import { Body, Controller, Get, Post } from '@nestjs/common';
import { CreateBookDto } from './dto/create-book.dto';
import { BookNumberDto } from './dto/book-NumberSlot';

@Controller('bookrestaurant')
export class BookRestaurantController {
    constructor(private readonly BookRestaurantService : BookRestaurantService) {}

    @Get('list')
    async getALlBill()
    {
        return this.BookRestaurantService.findAll()
    }
    @Post()
    async postBookRestaurant(@Body()createBookDto : CreateBookDto)
    { 
        return this.BookRestaurantService.addBookRestaurant(createBookDto);
      
    }
    @Get('getBook')
    async getBookRestaurant(@Body() req)
    {
       return this.BookRestaurantService.getQtyBookRestaurant(req.body)
    }

    @Post('getNumberSlotBook')
    async getNumberSlotBook(@Body()bookNumber : BookNumberDto)
    {
       return this.BookRestaurantService.getNumberSlot(bookNumber)
    }
}
