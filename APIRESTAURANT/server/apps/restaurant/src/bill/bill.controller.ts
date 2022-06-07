import { Body, Controller, Get, Post, Req, Res } from '@nestjs/common';

import { BillService } from './bill.service';
import { DetailTransactionService } from './detailBill.service';
import { BillDto } from './dto/bill.dto';
import { Response } from 'express';
import { CreatePaymentDto } from './dto/createdPaymentDto';
@Controller('bill')
export class BillController {

    constructor(private readonly billService : BillService , private readonly DetailBillService : DetailTransactionService ) {}
    @Post()
    async postBill(@Body() createBillDto: BillDto)  {
       
        return await this.billService.insertBillRestaurant(createBillDto);
     
    }

    @Post('paymentStripe')
    paymentStripe(@Body()  createPaymentDto: CreatePaymentDto)
    {
        return this.billService.paymentStripe(createPaymentDto);
    }
}

