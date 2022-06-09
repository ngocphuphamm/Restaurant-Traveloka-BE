import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { getConnection, getManager, Repository } from 'typeorm';
import { Restaurant } from '../entities/Restaurant';
import { Transaction } from '../entities/Transaction';

@Injectable()
export class AdminService {
    connection: any;
    constructor(
        @InjectRepository(Transaction)
        private transactionRepository: Repository<Transaction>,
        @InjectRepository(Restaurant)
        private restaurantRepository: Repository<Restaurant>,
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
}
