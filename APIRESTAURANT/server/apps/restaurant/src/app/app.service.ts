import { Injectable, MethodNotAllowedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Menu } from '../entities/Menu';
import { Restaurant } from '../entities/Restaurant';


@Injectable()
export class AppService {
  constructor(
    @InjectRepository(Restaurant)
    private restaurantRepository: Repository<Restaurant>,
    
  ){}

  //  //{{baseUrl}}/api/ 
  async findAll(): Promise<Restaurant[]> {
      console.log("Da vao ");
    return this.restaurantRepository.find({relations:['imagesRestaurants']});
  }

  //{{baseUrl}}/api/:name  
  async searchRestaurant(name:string) : Promise<Restaurant [] >  {
  
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

  //{{baseUrl}}/api/:id

  async getRestaurant(id : string) : Promise<Restaurant>{

      return await this.restaurantRepository.findOne(({idRestaurant : id}),{relations:['menus','imagesRestaurants']});
  }

  //{{baseUrl}}//

  getData(): { message: string } {
    return { message: 'Welcome to restaurant!' };
  }




}
