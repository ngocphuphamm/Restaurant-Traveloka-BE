import { Controller, Get, Param, Post, Res, UploadedFile, UploadedFiles, UseInterceptors, Body } from '@nestjs/common';
import { FileInterceptor, FilesInterceptor } from '@nestjs/platform-express/multer';
import { editFileName, imageFileFilter } from '../function/function';
import { AdminService } from './admin.service';
import { diskStorage } from 'multer';
import { RestaurantDto } from './dto/dtoRestaurant';
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


    @Post('uploadimage')
    @UseInterceptors(
        FileInterceptor('image'),
    )
    async uploadedFile(@UploadedFile() file) {
        const response = {
            originalname: file.originalname,
            filename: file.filename,
        };
        return response;
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
    async uploadMultipleFiles(@UploadedFiles() listImageRestaurant 
    ,@Body() restaurantDto : RestaurantDto
    ) : Promise<any> {
        return this.adminService.createRestaurant(listImageRestaurant,restaurantDto) 
 
        // const response = [];
        // files.forEach(file => {
        //     const fileReponse = {
        //         originalname: file.originalname,
        //         filename: file.filename,
        //     };
        //     response.push(fileReponse);
        // });
        // return response;

    }
   
}
