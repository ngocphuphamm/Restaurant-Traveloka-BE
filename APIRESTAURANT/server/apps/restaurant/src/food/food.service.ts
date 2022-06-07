
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { getManager, Repository } from 'typeorm';
import { Food } from '../entities/Food';
import {cleanAccents} from '../function/function';
import { Menu } from '../entities/Menu';
@Injectable()
export class FoodService {
    constructor(
        @InjectRepository(Food)
        private foodRepository: Repository<Food>,
        @InjectRepository(Menu)
        private menuRepository: Repository<Menu>
    )   {}

    
    async findAll(): Promise<Food[]> {
        console.log("Da vao ");
      return this.foodRepository.find();
    }

    async searchFood(name : string ) : Promise<Food []> {

            
            if(name)
            { 
                const listFood = await  this.foodRepository.find({});
                 const listfilter = await listFood.filter((el)=>{
                    return  cleanAccents(el['nameFood']).toLowerCase().indexOf(cleanAccents(name).toLowerCase()) === 0 
                 })
                return listfilter;
            }
            else
            { 
                return [];
            }
       

       
    }


    async getAllFoodAtRestaurant(id : string) : Promise<Food []>{

        
        if(id)
        {
            const menu = await this.menuRepository.findOne({"idRestaurant" : id});
            const idMenu = await menu['idMenu'];
            const enityMnager = getManager();
            const someQuery = await enityMnager.query(`
                        SELECT F.*,LM.urlImage,DT.idRestaurant,R.nameRestaurant,DT.idMenu
                        FROM DetailMenu DT JOIN FOOD F
                        ON DT.idFood = F.idFood 
                        JOIN ListImagesFood LM
                        ON LM.idFood = F.idFood JOIN Restaurant R 
                        ON R.idRestaurant = DT.idRestaurant
                        WHERE idMenu = N'${idMenu}'
            `);
            return someQuery;
        }   
        return []; 
      
    }
}
