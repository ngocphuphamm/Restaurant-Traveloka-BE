import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Restaurant } from '../entities/Restaurant';


@Injectable()
export class AppService {
  constructor(
    @InjectRepository(Restaurant)
    private restaurantRepository: Repository<Restaurant>,
  ){}

  async findAll(): Promise<Restaurant[]> {
      console.log("da vao");
    return this.restaurantRepository.find();
  }
  getData(): { message: string } {
    return { message: 'Welcome to restaurant!' };
  }

}
