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
      console.log("Da vao ");
    return this.restaurantRepository.find({relations:['imagesRestaurants']});
  }

  async search(name:string) : Promise<any[]>  {
  
    if(name)
    {
        const listRestaurant = await  this.restaurantRepository.find({});
        const filterRestaurant = listRestaurant.filter((el)=>{
            return el['nameRestaurant'].toLowerCase().indexOf(name.toLowerCase())===-1
        })
        return  filterRestaurant;
    }
    else
    {
      return [];
    }
   
  }
  getData(): { message: string } {
    return { message: 'Welcome to restaurant!' };
  }

}
