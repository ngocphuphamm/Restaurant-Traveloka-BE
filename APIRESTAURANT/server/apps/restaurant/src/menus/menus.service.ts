import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { Menu } from '../entities/Menu';
import { InjectRepository } from '@nestjs/typeorm';
import { DetailMenu } from '../entities/DetailMenu';

@Injectable()
export class MenusService {
    constructor(
        @InjectRepository(Menu)
        private  menusRepository: Repository<Menu>,
    )   {}
    
        async getMenu(id : string): Promise<any> {
            
            return this.menusRepository.findOne({idMenu : id});
        
        }

        async getDetailMenu(id:string) : Promise<any> {
            // return this.detailRepository.findOne({idMenu:id});
        }

}
