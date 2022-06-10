import { Module } from '@nestjs/common';
import { HomeService } from './home.service';
import { HomeController } from './home.controller';
import { MulterModule } from '@nestjs/platform-express';

@Module({
  providers: [HomeService],
  controllers: [HomeController],
  imports: [  MulterModule.register({
    dest: './files',
  })]
})
export class HomeModule {}
