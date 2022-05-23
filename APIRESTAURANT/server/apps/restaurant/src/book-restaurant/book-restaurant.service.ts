import { Injectable,Res} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { getConnection, getManager, Repository } from 'typeorm';
import { BookRestaurant } from '../entities/BookRestaurant';
import { CreateBookDto } from './dto/create-book.dto';
import { Response } from 'express';
@Injectable()
export class BookRestaurantService {
    constructor(
        @InjectRepository(BookRestaurant)
        private restaurantRepository: Repository<BookRestaurant>,

      ){}

    async findAll()
    {
        return this.restaurantRepository.find();
    }

    async addBookRestaurant(createBookDto : CreateBookDto) 
      { 
        const enityMnager = getManager();
        const LengthBook = await enityMnager.query(`
        SELECT COUNT(*) as sl
        FROM BookRestaurant
        `);
        let getLengthBook ;
        for (let i =  0 ; i < LengthBook.length; i++)
        {
            getLengthBook = Number(LengthBook[i].sl);
        }
        const idBookRestaurant = `BR${getLengthBook+1}`;
        await getConnection()
            .createQueryBuilder()
            .insert()
            .into(BookRestaurant)
            .values([
                { idBookRestaurant : idBookRestaurant , idRestaurant :createBookDto.idRestaurant,nameBook : createBookDto.nameBook,
                                    phoneBook : createBookDto.phoneBook ,  dateBook:createBookDto.dateBook,bookingSession : createBookDto.bookingSession ,createdAt : createBookDto.createdAt,status : false }, 
          
             ])
            .execute();
          return {
            success : true, 
            msg : "Thanh Cong"
          }
      }
}
