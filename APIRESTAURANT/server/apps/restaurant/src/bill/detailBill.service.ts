
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { getConnection, getManager, Repository } from 'typeorm';
import { DetailMenu } from '../entities/DetailMenu';

import { DetailTransaction } from '../entities/DetailTransaction';
import { Food } from '../entities/Food';
import { Transaction } from '../entities/Transaction';
import { DetailTransactionDTO } from './dto/dtoDetailTransaction';
@Injectable()
export class DetailTransactionService {
    connection: any;
    constructor(
        @InjectRepository(DetailTransaction)
        private detailRepository: Repository<DetailTransaction>
    ) { }

    async getDetailService(): Promise<any> {
        return console.log("hello");
    }


    async insertDetailBill(dataBill: any): Promise<any> {


        for (let i = 0; i < dataBill.length; i++) {

            const entityMnager = getManager();
            const someQuery = await entityMnager.query(`
                        SELECT COUNT(idTransaction) as soLuongHoaDon
                        From  dbo.[DetailTransaction] `)
            let getLengthBill;
            for (let i = 0; i < someQuery.length; i++) {
                getLengthBill = Number(someQuery[i].soLuongHoaDon);
            }
      
            const idDetailTransaction = `DTS${getLengthBill + 1}`;
            const detailTransaction = new DetailTransaction()
            detailTransaction.idTransaction =  dataBill[i].idTransaction;
            detailTransaction.idDetailTransaction = idDetailTransaction;
            detailTransaction.qty = dataBill[i].qty;
            detailTransaction.intoMoney = dataBill[i].intoMoney;
            const detailMenu = new DetailMenu();
            detailMenu.idFood = dataBill[i].idFood;
            detailMenu.idRestaurant = dataBill[i].idRestaurant;
            detailMenu.idMenu = dataBill[i].idMenu;
            
          
            await entityMnager.query(`
            INSERT INTO DetailTransaction(idTransaction,qty,intoMoney,idFood,idMenu,idRestaurant,idDetailTransaction)
            VALUES 
                (N'${detailTransaction.idTransaction}',${detailTransaction.qty},${detailTransaction.intoMoney},
                  N'${detailMenu.idFood}',N'${detailMenu.idMenu}',N'${detailMenu.idRestaurant}',N'${detailTransaction.idDetailTransaction }')`);
           
        }
        return {
            success: true,
            msg : "Thanh Cong"
        }

    }

}
