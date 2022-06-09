import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { getConnection, getManager, Repository } from 'typeorm';
import { Transaction } from '../entities/Transaction';

@Injectable()
export class AdminService {
    connection: any;
    constructor(
        @InjectRepository(Transaction)
        private transactionRepository: Repository<Transaction>
    ) { }

    async getDashBoard(idRestaurant): Promise<any> {
        try {
            const entityMnager = getManager();
            const someQuery = await entityMnager.query(`
            SELECT    CONVERT(VARCHAR,TS.createdAt,3) AS Date,SUM(TS.totalMoney) AS totalMoney
            from dbo.[Transaction] TS JOIN DetailTransaction DT 
            ON TS.idTransaction = DT.idTransaction
            where   DT.idRestaurant = '${idRestaurant}' AND MONTH(TS.createdAt)  = MONTH(GETDATE()) 
            GROUP BY  CONVERT(VARCHAR,TS.createdAt,3)
            ORDER BY  CONVERT(VARCHAR,TS.createdAt,3)
                       `)
            return {
                success : true,
                data  : someQuery
            }
        }
        catch (err) {
            return {
                success: false,
                msg: "FAILED ID RESTAURANT"
            }
        }

    }
}
