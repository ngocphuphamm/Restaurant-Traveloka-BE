import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import {  getConnection, getManager, Repository } from 'typeorm';
import { ImagesRestaurant } from '../entities/ImagesRestaurant';
import { Restaurant } from '../entities/Restaurant';
import { Transaction } from '../entities/Transaction';
import { RestaurantDto } from './dto/dtoRestaurant';
import { RestaurantDtoEdit } from './dto/dtoRestaurantEdit';
import { customObjectImage} from './dto/interFace';
const shortid = require('shortid');
@Injectable()
export class AdminService {
    connection: any;
    constructor(
        @InjectRepository(Transaction)
        private transactionRepository: Repository<Transaction>,
        @InjectRepository(Restaurant)
        private restaurantRepository: Repository<Restaurant>,
        @InjectRepository(ImagesRestaurant)
        private imagesRestaurantRepository: Repository<ImagesRestaurant>,
    ) { }

    async getDashBoard(idRestaurant): Promise<any> {
        try {
            const entityMnager = getManager();
            const barchart = await entityMnager.query(`
            SELECT    CONVERT(VARCHAR,TS.createdAt,3) AS Date,SUM(TS.totalMoney) AS totalMoney
            from dbo.[Transaction] TS JOIN DetailTransaction DT 
            ON TS.idTransaction = DT.idTransaction
            where   DT.idRestaurant = '${idRestaurant}' AND MONTH(TS.createdAt)  = MONTH(GETDATE()) 
            GROUP BY  CONVERT(VARCHAR,TS.createdAt,3)
            ORDER BY  CONVERT(VARCHAR,TS.createdAt,3)
                       `)
            const countFood = await entityMnager.query(` SELECT COUNT(idFood) as countFood, R.nameRestaurant
            FROM DetailMenu DT JOIN Restaurant R ON R.idRestaurant = DT.idRestaurant
            WHERE DT.idRestaurant = '${idRestaurant}'
            GROUP BY R.nameRestaurant`);
            const countBill = await entityMnager.query(`  SELECT COUNT(DISTINCT TS.idTransaction) AS countBill
            FROM DetailTransaction DT JOIN [Transaction] TS
            ON TS.idTransaction = DT.idTransaction
            WHERE DT.idRestaurant = '${idRestaurant}'  AND MONTH(TS.createdAt)  = MONTH(GETDATE()) `);
            
            const sumMoney = await entityMnager.query(` SELECT SUM(DISTINCT totalMoney) AS sumMoney
            FROM DetailTransaction DT JOIN [Transaction] TS
            ON TS.idTransaction = DT.idTransaction
            WHERE DT.idRestaurant = '${idRestaurant}'   AND MONTH(TS.createdAt)  = MONTH(GETDATE())`)
            if(countBill[0].countBill > 0 )
            {
                return {
                    success : true,
                    barchart,
                    sumFood: countFood[0].countFood,
                    nameRestaurant : countFood[0].nameRestaurant,
                    sumBill : countBill[0].countBill,
                    sumMoney : sumMoney[0].sumMoney,
    
                }
            }
            else
            {
                return {
                    success : false,
                    msg : "NOT DATA STATISTICAL",
                    sumFood: countFood[0].countFood,
    
                }
            }
            
        }
        catch (err) {
            return {
                success: false,
                msg: "FAILED ID RESTAURANT"
            }
        }

    }

    async getRestaurantAdmin(idStaff)
    {
        return await this.restaurantRepository.find({where :{idStaff : idStaff},relations:['imagesRestaurants']});

    }
    async createRestaurant( listImageRestaurant,restaurantDto : RestaurantDto)
    {
        try
        {
            const enityMnager = getManager();
            const countRestaurant =  await enityMnager.query(`
            SELECT COUNT(*) as sl
            FROM Restaurant
            `);
            let getLengthRestaurant;
            for (let i = 0; i < countRestaurant.length; i++) {
                getLengthRestaurant = Number(countRestaurant[i].sl);
            }
            const idRestaurant = `R${getLengthRestaurant + 1}`;
            await getConnection()
            .createQueryBuilder()
            .insert()
            .into(Restaurant)
            .values([
              {
                idRestaurant: idRestaurant, 
                nameRestaurant : restaurantDto.nameRestaurant,
                addressRestaurant : restaurantDto.addressRestaurant,
                descriptionRestaurant : restaurantDto.descriptionRestaurant,
                idStaff  : restaurantDto.idStaff,
                priceService : restaurantDto.priceService,
                startTIme : '2019-03-02 06:00:00.000',
                endTime : '2020-03-02 22:00:00.000',
                likes : 0 ,
                dislikes : 0,
    
    
              },
    
            ])
            .execute();
           await listImageRestaurant.forEach(async (el)=>{
            const entityMnager = getManager();
            await entityMnager.query(`
                                    INSERT INTO ImagesRestaurant (idImagesRestaurant,urlRestaurant,idRestaurant)
                                    VALUES ('IM${shortid.generate()}',N'${process.env.HOSTIMAGE}/${el.filename}','${idRestaurant}')
                       `)
            })
            const entityMnager = getManager();
            await entityMnager.query(`
                                    INSERT INTO Menu (idMenu,idRestaurant,nameMenu)
                                    VALUES ('MN${shortid.generate()}','${idRestaurant}',N'Menu Nhà Hàng ${restaurantDto.nameRestaurant}')
                       `)
            
            return {
                success: true,
                msg : "SUCCESS CREATED",
                idRestaurant
            }
        }
        catch(err)
        {
            console.log(err)
            return {
                success: false,
                msg : "FAILED CREATED"
            }
        }
       

    }

    async editRestaurant(idRestaurant,restaurantDto : RestaurantDtoEdit)
    {
        try
        {
             await this.restaurantRepository.update(idRestaurant,restaurantDto)
            return {
                success : true, 
                msg : "SUCCESS EDIT"
            }    
        }
        catch(err)
        {
            console.log(err);
            return {
                success: false,
                msg : "FAILED"
            }
        }
        
    }
    async getImage(idImage: string)
    {
        try{
            const image = await this.imagesRestaurantRepository.findOne({
                idImagesRestaurant : idImage
            })
            return({ 
                success: true,
                image
            })
        }
        catch(err)
        {
            console.log(err);
            return ({
                success: false,
                msg : "FAILED NOT FIND IMAGE"
            })
        }
    }
    async updateImageRestaurant(idImage: string,fileImage) : Promise<any> {
       try{
    
            const urlRestaurant = `${process.env.HOSTIMAGE}/${fileImage.filename}`;
            const entityMnager = getManager();
            await entityMnager.query(`
                                   UPDATE ImagesRestaurant
                                   set urlRestaurant = N'${urlRestaurant}'
                                   WHERE idImagesRestaurant = N'${idImage}'
                       `)
            return (
                {
                    success: true, 
                    msg : "SUCCESS EDIT IMAGE"
                }
            )
       }
       catch (err){
            console.log(err)
       }
    }
}
