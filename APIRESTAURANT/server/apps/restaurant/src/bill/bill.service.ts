import { Injectable, Res } from '@nestjs/common';
import { Repository } from 'typeorm/repository/Repository';
import { Transaction } from '../entities/Transaction';
import { InjectRepository } from '@nestjs/typeorm';
import { DetailService } from '../menus/detailmenu.service';

import { DetailTransactionService } from './detailBill.service';
import { BillDto } from './dto/bill.dto';
import { DetailTransaction } from '../entities/DetailTransaction';
import { getConnection, getManager } from 'typeorm';
@Injectable()
export class BillService {
    constructor(
        @InjectRepository(Transaction)
        private TransactionRepository: Repository<Transaction>,
        private  readonly detailBillService  : DetailTransactionService
    )   {

    }
    async insertBillRestaurant(dtoBill: BillDto)
    {
        const entityMnager = getManager();
        const someQuery  = await entityMnager.query(`
                SELECT COUNT(idTransaction) as soLuongHoaDon
                From  dbo.[Transaction] `)
       let getLengthBill ;
        for (let i =  0 ; i < someQuery.length; i++)
        {
            getLengthBill = Number(someQuery[i].soLuongHoaDon);
        }
        const idTransaction = `TS${getLengthBill+1}`;
        const idPayment = `N'${dtoBill['idPayment']}'`
        await  getConnection()
        .createQueryBuilder()
        .insert()
        .into(Transaction)
        .values([
            {idTransaction : idTransaction ,nameBook : dtoBill['nameBook'],addressBook : dtoBill['addressBook'], emailBook : dtoBill['emailBook'],
                             phoneBook : dtoBill['phoneBook'],status : dtoBill['status'],shipping : dtoBill['shipping'],
                            sumQty : dtoBill['sumQty'],totalMoney : dtoBill['totalMoney'],idPayment : (()=>idPayment),idCustomer : dtoBill['idCustomer']}
      
         ])
         .execute();

        // for loop  ASSIGN variable 
        for (let i =  0 ; i < dtoBill['detailTransaction'].length; i++)
        {
            dtoBill['detailTransaction'][i].idTransaction = idTransaction;
        }
   
         await this.detailBillService.insertDetailBill(dtoBill['detailTransaction']);
        return {
            success : true,
            msg : "Thanh COng"
        } ;
    }
}
