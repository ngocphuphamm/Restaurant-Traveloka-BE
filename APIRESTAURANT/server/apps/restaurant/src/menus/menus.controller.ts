import { Controller, Get, Param } from '@nestjs/common';
import { getManager } from 'typeorm';
import { AppService } from '../app/app.service';
import { FoodService } from '../food/food.service';
import { DetailService } from './detailmenu.service';
import { MenusService } from './menus.service';

@Controller('menus')
export class MenusController {
    constructor(
        private readonly menusService: MenusService,
        private appService: AppService,
        private foodService: FoodService,
        private detailService: DetailService
    ) { }

    @Get(':id')
    async getMenu(@Param('id') id: string) {
        const menu = await this.menusService.getMenu(id);
        // name and address restaurant
        const idRestaurant = menu['idRestaurant'];
        const restaurant = await this.appService.getInfoCarry(idRestaurant);
        const nameRestaurant = restaurant['nameRestaurant'];
        const addressRestaurant = restaurant['addressRestaurant'];

        const enityMnager = getManager();
        const someQuery = await enityMnager.query(`
                    SELECT F.*,LM.urlImage
                    FROM DetailMenu DT JOIN FOOD F
                    ON DT.idFood = F.idFood 
                    JOIN ListImagesFood LM
                    ON LM.idFood = F.idFood
                    WHERE idMenu = '${id}'
        `);
        console.log(someQuery);
        const returnRestaurant = {
            "idRestaurant": idRestaurant,
            "nameRestaurant": nameRestaurant,
            "addressRestaurant": addressRestaurant,
            "Food": someQuery
        }
        return returnRestaurant;
    }
}
