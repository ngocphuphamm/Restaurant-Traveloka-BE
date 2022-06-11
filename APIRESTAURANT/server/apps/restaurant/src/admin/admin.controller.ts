import { Controller, Get, Param, Post, Res, UploadedFile, UploadedFiles, UseInterceptors, Body } from '@nestjs/common';
import { FileInterceptor, FilesInterceptor } from '@nestjs/platform-express/multer';
import { editFileName, imageFileFilter } from '../function/function';
import { AdminService } from './admin.service';
import { diskStorage } from 'multer';
import { RestaurantDto } from './dto/dtoRestaurant';
import { RestaurantDtoEdit } from './dto/dtoRestaurantEdit';
@Controller('admin')
export class AdminController {
    constructor(private readonly adminService: AdminService) { }

    @Get('dashboard/:idRestaurant')
    async getDashBoard(@Param('idRestaurant') idRestaurant: string): Promise<any> {
        return this.adminService.getDashBoard(idRestaurant)
    }

    @Get('getRestaurantAdmin/:idStaff')
    async getRestaurantAdmin(@Param('idStaff') idStaff: string): Promise<any> {
        return this.adminService.getRestaurantAdmin(idStaff)
    }


    @Post('editImageRestaurant/:idImage')
    @UseInterceptors(
        FileInterceptor('image'),
    )
    async editImageRestaurant(@UploadedFile() file,@Param('idImage') idImage: string): Promise<any> {
        return this.adminService.updateImageRestaurant(idImage,file)
    }

    @Post('restaurant/createRestaurant')
    @UseInterceptors(
        FilesInterceptor('image', 20, {
            storage: diskStorage({
                destination: './files',
                filename: editFileName,
            }),
            fileFilter: imageFileFilter,
        }),
    )
    async createRestaurant(@UploadedFiles() listImageRestaurant,@Body() restaurantDto : RestaurantDto
    ) : Promise<any> {
        return this.adminService.createRestaurant(listImageRestaurant,restaurantDto) 

    }

    @Post('restaurant/editRestaurant/:idRestaurant')
    async editRestaurant(@Param('idRestaurant') idRestaurant : string ,@Body() restaurantDto : RestaurantDtoEdit
    ) : Promise<any> {
        return this.adminService.editRestaurant(idRestaurant,restaurantDto) 

    }

    @Get('/getImage/:idImage')
    async getImage(@Param('idImage') idImage : string)
    {
        return this.adminService.getImage(idImage)
    }

}
