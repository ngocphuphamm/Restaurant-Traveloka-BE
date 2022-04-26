import { Injectable, MethodNotAllowedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Menu } from '../entities/Menu';
import { Restaurant } from '../entities/Restaurant';
import { cleanAccents } from '../function/function';

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
          const nameRestaurant = cleanAccents(el['nameRestaurant']).toLowerCase().replace(/\s+/g,'');
          const queryRestaurant = cleanAccents(name).toLowerCase().replace(/\s+/g,'');
          return nameRestaurant.indexOf(queryRestaurant) ===0;

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


  async getInfoCarry(id : string){
      const restaurant =  await this.restaurantRepository.findOne({idRestaurant:id}) ; 
      const nameRestaurant = restaurant['nameRestaurant'];
      const addressRestaurant = restaurant['addressRestaurant'];
      return { 
        "nameRestaurant" : nameRestaurant,
        "addressRestaurant" : addressRestaurant
      }
  }


  //{{baseUrl}}//

  getData(): { message: string } {
    return { message: 'Welcome to restaurant!' };
  }



}
