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

    async searchFood(name : string ) : Promise<Food []> {
            if(name)
            { 
                const listFood = await  this.foodRepository.find({});
                const filterFood = listFood.filter((el)=>{
                    return el['nameFood'].toLowerCase().indexOf(name.toLowerCase())==-1
                })
                return  filterFood;
            }
            else
            { 
                return [];
            }
       

       
    }
}
