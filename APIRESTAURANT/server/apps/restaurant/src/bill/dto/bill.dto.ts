import { DetailTransactionDTO } from "./dtoDetailTransaction";

export class BillDto {
    nameBook : string ; 
    addressBook : string; 
    phoneBook : number; 
    status  : number ; 
    shipping : number ;  
    sumQty  : number ;  
    totalMoney : number ; 
    idPayment  : string ; 
    idCustomer : string ; 
    detailTransaction : Array<DetailTransactionDTO>;
    
}