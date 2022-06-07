import { Injectable, Res } from '@nestjs/common';
import { Repository } from 'typeorm/repository/Repository';
import { Transaction } from '../entities/Transaction';
import { InjectRepository } from '@nestjs/typeorm';
import { DetailService } from '../menus/detailmenu.service';
import Stripe from 'stripe';
import { DetailTransactionService } from './detailBill.service';
import { BillDto } from './dto/bill.dto';
import { DetailTransaction } from '../entities/DetailTransaction';
import { getConnection, getManager } from 'typeorm';
import { CreatePaymentDto } from './dto/createdPaymentDto';
@Injectable()
export class BillService {
    private stripe: Stripe;

    constructor(
        @InjectRepository(Transaction)
        private TransactionRepository: Repository<Transaction>,
        private  readonly detailBillService  : DetailTransactionService
    )   {
        this.stripe = new Stripe(`${process.env.STRIPE_SECRET_KEY}`, {
            apiVersion: '2020-08-27',
          });
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
            transactionId  : idTransaction,
            msg : "SUCCESS"
        } ;
    }

    calculateAmount(amount: any) {
        const toUsd = amount / 23;
        const total = parseInt(toUsd.toFixed(2).replace('.', ''));
        return total;
      }
    async paymentStripe(createPaymentDto: CreatePaymentDto)
    {
        const paymentIntent = await this.stripe.paymentIntents.create({
            amount: this.calculateAmount(createPaymentDto.amount),
            // customer: createPaymentDto.customerId,
            automatic_payment_methods: {
              enabled: true,
            },
            currency: `${process.env.STRIPE_CURRENCY}`,
          });
          return paymentIntent.client_secret;
    }
}
