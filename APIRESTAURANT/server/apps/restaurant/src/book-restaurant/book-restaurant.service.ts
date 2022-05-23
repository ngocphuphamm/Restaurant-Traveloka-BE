import { Injectable, Res } from '@nestjs/common';
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

  ) { }

  async getQtyBookRestaurant(time: string) {
    const enityMnager = getManager();
    const LengthBook = await enityMnager.query(`
      SELECT COUNT(*) as sl
      FROM BookRestaurant
      `);
    return [];
  }
  async findAll() {
    return this.restaurantRepository.find();
  }

  async addBookRestaurant(createBookDto: CreateBookDto) {

    let statusBook;
    createBookDto.bookingSession === true ? statusBook = 1 : statusBook = 0
    const enityMnager = getManager();

    const dateBook = await enityMnager.query(`
                                                  select COUNT(idBookRestaurant) as soluong
                                                  from dbo.[BookRestaurant]
                                                  WHERE dateBook = '${createBookDto.dateBook}' AND bookingSession= '${statusBook}'
                                                `)
    let qtyBook;
    await dateBook.forEach((el) => {
      qtyBook = el.soluong
    })
    if (qtyBook < 2) {
      const LengthBook = await enityMnager.query(`
    SELECT COUNT(*) as sl
    FROM BookRestaurant
    `);
      let getLengthBook;
      for (let i = 0; i < LengthBook.length; i++) {
        getLengthBook = Number(LengthBook[i].sl);
      }
      const idBookRestaurant = `BR${getLengthBook + 1}`;
      await getConnection()
        .createQueryBuilder()
        .insert()
        .into(BookRestaurant)
        .values([
          {
            idBookRestaurant: idBookRestaurant, idRestaurant: createBookDto.idRestaurant, nameBook: createBookDto.nameBook,
            phoneBook: createBookDto.phoneBook, dateBook: createBookDto.dateBook, bookingSession: createBookDto.bookingSession, createdAt: createBookDto.createdAt, status: false
          },

        ])
        .execute();
        return {
          success: true,
          msg: "Thanh Cong"
        }
    }
    else{
      return {
          success: false,
          msg : "Số Lượng Đặt Đã Đầy"
      }
    }
   
  }
}
