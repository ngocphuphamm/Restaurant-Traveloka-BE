import { Controller, Get, Param, Res } from '@nestjs/common';
import { HomeService } from './home.service';

@Controller('')
export class HomeController {
    constructor(private readonly homeService: HomeService) {}

    @Get()
    getData() {
      return this.homeService.getData();
    }
    @Get(':imgpath')
    seeUploadedFile(@Param('imgpath') image, @Res() res) {
        return res.sendFile(image, { root: './files' });
    }
}
