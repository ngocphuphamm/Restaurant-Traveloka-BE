import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Food } from '../entities/Food';


@Injectable()
export class FoodService {
    constructor(
        @InjectRepository(Food)
        private foodRepository: Repository<Food>,
    )   {}

    
    async findAll(): Promise<Food[]> {
        console.log("Da vao ");
      return this.foodRepository.find();
    }
}
