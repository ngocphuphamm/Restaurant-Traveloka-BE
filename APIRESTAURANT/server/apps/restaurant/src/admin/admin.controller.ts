import { Controller, Get, Param } from '@nestjs/common';
import { AdminService } from './admin.service';
@Controller('admin')
export class AdminController {
    constructor(private readonly adminService: AdminService) {}

    @Get('dashboard/:idRestaurant')
    async getDashBoard(@Param('idRestaurant') idRestaurant: string) : Promise<any>
    {
        return this.adminService.getDashBoard(idRestaurant)
    }
}
