/*
Created		3/31/2022
Modified		4/12/2022
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/
create database restaurant
go

use restaurant
go

Create table [Restaurant]
(
	[idRestaurant] Varchar(255) NOT NULL,
	[nameRestaurant] Nvarchar(150) NOT NULL,
	[addressRestaurant] NVARCHAR(255) NOT NULL,
	[startTIme] DATETIME NULL,
	[endTime] DATETIME NULL,
	[priceService] Float NOT NULL,
	[likes] Integer NULL,
	[dislikes] Integer NULL,
	[descriptionRestaurant] Ntext NOT NULL,
	[idStaff] Nvarchar(255) NOT NULL,
	Primary Key  ([idRestaurant])
) 
go

Create table [ImagesRestaurant]
(
	[idImagesRestaurant] Varchar(255) NOT NULL,
	[urlRestaurant] NTEXT NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[updatedAt] datetime DEFAULT(getdate()) NULL,
	[idRestaurant] Varchar(255) NOT NULL,
	Primary Key  ([idImagesRestaurant])
) 
go

Create table [Menu]
(
	[idMenu] Varchar(200) NOT NULL,
	[nameMenu] Nvarchar(255) NOT NULL,
	[startTime] Datetime NULL,
	[endTime] Datetime NULL,
	[idRestaurant] Varchar(255) NOT NULL,
	Primary Key  ([idMenu],[idRestaurant])
) 
go

Create table [Food]
(
	[idFood] Varchar(255) NOT NULL,
	[nameFood] Nvarchar(255) NOT NULL,
	[priceFood] Float NOT NULL,
	[qty] Integer Null,
	[qtyBook] Integer Null,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[updatedAt] datetime DEFAULT(getdate()) NULL,
	Primary Key  ([idFood])
) 
go

Create table [DetailMenu]
(
	[idFood] Varchar(255) NOT NULL,
	[idMenu] Varchar(200) NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[updatedAt] datetime DEFAULT(getdate()) NULL,
	[idRestaurant] Varchar(255) NOT NULL,
	Primary Key  ([idFood],[idMenu],[idRestaurant])
) 
go

Create table [ListImagesFood]
(
	[idImagesFood] Nvarchar(255) NOT NULL,
	[idFood] Varchar(255) NOT NULL,
	[urlImage] Nvarchar(255) NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[updatedAt] datetime DEFAULT(getdate()) NULL,
	Primary Key  ([idImagesFood],[idFood])
) 
go

Create table [BookRestaurant]
(
	[idBookRestaurant] Varchar(255) NOT NULL,
	[idRestaurant] Varchar(255) NOT NULL,
	[idCustomer] nvarchar(255)  NULL,
	[nameBook] Nvarchar(255) NOT NULL,
	[phoneBook] Integer NOT NULL,
	[bookingSession]  BIT NOT NULL,
	[dateBook] Date NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[status] Bit NOT NULL,
	Primary Key  ([idBookRestaurant],[idRestaurant])
) 
go

Create table [Transaction]
(
	[idTransaction] Nvarchar(255) NOT NULL,
	[idCustomer] Nvarchar(255) NULL,
	[nameBook] Nvarchar(255) NOT NULL,
	[addressBook] Nvarchar(255) NOT NULL,
	[phoneBook] Integer NOT NULL,
	[status] Integer NOT NULL,
	[shipping] Float NOT NULL,
	[sumQty] Integer NOT NULL,
	[totalMoney] Float NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[updatedAt] datetime DEFAULT(getdate()) NULL,
	[idPayment] Nvarchar(255) NOT NULL,
	Primary Key  ([idTransaction])
) 
go

Create table [Payment]
(
	[idPayment] Nvarchar(255) NOT NULL,
	[namePayment] Nvarchar(255) NULL,
	Primary Key  ([idPayment])
) 
go



Create table [StatisticalTables]
(
	[idStatistical] Nvarchar(255) NOT NULL,
	[idTransaction] Nvarchar(255) NOT NULL,
	[Number] Integer NOT NULL,
	[sumQty] Integer NOT NULL,
	[sumMoney] Float NOT NULL,
	[createdAt] datetime DEFAULT(getdate()) NULL,
	[profit] Float NOT NULL,
	[bonusMoney] Float NOT NULL,
	[targetMonth] Float NOT NULL,
	[revenureBefore] Float NULL,
	Primary Key  ([idStatistical],[idTransaction])
) 
go

Create table [DetailTransaction]
(
	[idDetailTransaction] NVARCHAR(255) NOT NULL,
	[idTransaction] Nvarchar(255) NOT NULL,
	[qty] Integer NULL,
	[intoMoney] Float NULL,
	[idFood] Varchar(255) NULL,
	[idMenu] Varchar(200) NULL,
	[idRestaurant] Varchar(255) NULL,
	Primary Key  ([idDetailTransaction])
) 
go




Alter table [BookRestaurant] add  foreign key([idRestaurant]) references [Restaurant] ([idRestaurant]) 
go
Alter table [ImagesRestaurant] add  foreign key([idRestaurant]) references [Restaurant] ([idRestaurant]) 
go
Alter table [Menu] add  foreign key([idRestaurant]) references [Restaurant] ([idRestaurant]) 
go
Alter table [DetailMenu] add  foreign key([idMenu],[idRestaurant]) references [Menu] ([idMenu],[idRestaurant]) 
go
Alter table [DetailMenu] add  foreign key([idFood]) references [Food] ([idFood]) 
go
Alter table [ListImagesFood] add  foreign key([idFood]) references [Food] ([idFood]) 
go
Alter table [DetailTransaction] add  foreign key([idFood],[idMenu],[idRestaurant]) references [DetailMenu] ([idFood],[idMenu],[idRestaurant]) 
go
Alter table [StatisticalTables] add  foreign key([idTransaction]) references [Transaction] ([idTransaction]) 
go
Alter table [DetailTransaction] add  foreign key([idTransaction]) references [Transaction] ([idTransaction]) 
go
Alter table [Transaction] add  foreign key([idPayment]) references [Payment] ([idPayment]) 
go

ALTER TABLE [Transaction] add emailBook NVARCHAR(255)


Set quoted_identifier on
go


Set quoted_identifier off
go

INSERT PAYMENT (idPayment,namePayment)
VALUES 
	('PM01','MoMo'),
	('PM02','Stripe'),
	('PM03','Money')


	/* insert RESTAURANT 
			1.STARTTIME , ENDTIME COP Y HỆT NHƯ TRÊN 
			2.CÁC DỮ LIỆU NHÀ HÀNG COP TRÊN MẠNG NHƯ TRÊN*/ 
INSERT INTO Restaurant 
	(idRestaurant,idStaff,nameRestaurant,addressRestaurant,startTime,endTime,priceService,likes,dislikes,descriptionRestaurant)
VALUES
	('R01','175495F4-84EE-4358-99FB-D9A51ED9E718', N'Food Funny', N'2/23 Nguyễn Thị Minh Khai,P15,Quận 1', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 600, 2, 0, N'Thưởng thức tiệc buffet 5 sao tại một trong những địa điểm sang trọng nhất tại Sài Gòn Ăn uống cực kỳ thoải mái khi bạn có rất nhiều lựa chọn thực phẩm khác nhau, thích hợp cho mọi nhu cầu ăn uống của mọi thành viên trong nhóm Thỏa mãn cơn thèm hải sản của bạn với buffet bữa tối hải sản, cho phép bạn thưởng thức không giới hạn tôm hùm, cua, các món BBQ, và nhiều hơn thế nữa Kết hợp bữa ăn của bạn với đồ uống không giới hạn, bao gồm nước ngọt, trà, cà phê, cũng như rượu vang và rượu vang sủi'),
	('R02', '175495F4-84EE-4358-99FB-D9A51ED9E718', N'Lotte Food', N'21 Ngô Quyền , P2,Quận 10', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 300, 5, 0, N'Thưởng thức bữa sáng, bữa trưa, và bữa tối thịnh soạn tại Lotte Food Tận hưởng trải nghiệm ẩm thực ấn tượng được tạo nên bởi các đầu bếp chuyên nghiệp Thưởng thức các món ăn được chế biến chuyên nghiệp với vị trí nhà hàng nhìn ra bãi biển tuyệt đẹp Chọn món ăn yêu thích của bạn từ thực đơn phong phú các món ăn Âu Á'),
	('R03', '175495F4-84EE-4358-99FB-D9A51ED9E718',N'Salling Club', N'72-74 Trần Phú, Lộc Thọ, Thành phố Nha Trang, Khánh Hòa', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 400, 3, 0, N'Nếu bạn đang tìm một chỗ ăn ngon và "good vibes," thì Sailing Club rất đáng để trải nghiệm đấy. Với thực đơn phong phú các món ăn Âu Á, nhà hàng kết hợp các món ăn được chế biến chuyên nghiệp với vị trí nhà hàng nhìn ra bãi biển tuyệt đẹp để tạo nên một trải nghiệm ẩm thực vô cùng ấn tượng.'),
	('R04', '175495F4-84EE-4358-99FB-D9A51ED9E718',N'Shiri Phú Quốc', N'40 Trần Quốc Toản , P10 , Quận 2 , Phú Quốc', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 300, 2, 1, N'Thưởng thức bữa tối lãng mạn tại một trong những nhà hàng nổi tiếng tại Phú QuốcVừa nhâm nhi một ly cocktail vừa ngắm nhìn biển Phú Quốc xinh đẹpThưởng thức thực đơn đa dạng gồm nhiều món Âu và Á kết hợpCó những giây phút vui vẻ bên gia đình và bạn bè'),
	('R05', '175495F4-84EE-4358-99FB-D9A51ED9E718',N'BAO ngon Restaurant', N'65 Nguyễn Thị Minh Khai, Tân Lập, Thành phố Nha Trang, Khánh Hòa', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 100, 8, 0, N'Kiểm tra một điểm đến hải sản khi bạn ở Nha Trang. Thưởng thức nhiều món hải sản với công thức nấu ăn đặc biệt của nhà hàng. Chọn hải sản yêu thích của bạn, từ cua lột, tôm, đến mực. Thưởng thức bữa ăn trong một khu vực rộng rãi, hoàn hảo cho các buổi họp mặt gia đình và bạn bè.'),
    ('R06', '175495F4-84EE-4358-99FB-D9A51ED9E718',N'Switch Restaurant', N'Tầng 2, 68 Ngô Đức Kế, P. Bến Nghé, Q. 1', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 250, 3, 0, N'Switch Restaurant mở ra một không gian hơi hướng châu Âu cổ điển và đầy lãng mạn với gam màu đỏ đặc trưng, bên cạnh những món Âu hấp dẫn cùng rượu vang hảo hạng. '),
    ('R07','175495F4-84EE-4358-99FB-D9A51ED9E718' ,N'On-Yasai Shabu Shabu - Aeon Mall Tân Phú', N'F38, Tầng 1, Aeon Mall Tân Phú Celadon, 30 Bờ Bao Tân Thắng, P. Sơn Ký, Q. Tân Phú', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 500, 5, 1, N'nhà hàng On-Yasai Shabu Shabu không chỉ mang tới bữa tiệc buffet lẩu Nhật thơm ngon, mà còn dành cho thực khách những trải nghiệm về văn hóa qua không gian đậm chất Nhật Bản của mình. Một không gian hiện đại, sức chứa 50 khách, nổi bật với sự đan xen màu sắc: giữa sắc vàng tươi sáng của đồ gỗ với chút đen “huyền bí” của trần nhà, đệm ghế da... Đó còn là một không gian với cách sắp xếp và bài trí khéo léo, tạo ra những khoảng riêng đầy thú vị trong không gian chung, rất phù hợp với những bữa ăn gia đình thân mật hay giao lưu nhóm bạn bè, đồng nghiệp. '),
    ('R08','175495F4-84EE-4358-99FB-D9A51ED9E718' ,N'Lobster Bay - Nhà Hàng Hải Sản Kiểu Mỹ - Kỳ Đồng', N'Số 10B, Đường Kỳ Đồng, P. 09, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 800, 4, 0, N' Lấy cảm hứng từ phong cách ẩm thực của các nước Âu Mỹ, Lobster Bay đã nghiên cứu và sáng tạo ra một loại sốt “Cajun” độc đáo theo khẩu vị phù hợp của người Việt Nam. Sốt làm cho các món hải sản trở nên thăng hoa và hấp dẫn hơn hết với sự kết hợp từ 15 loại gia vị nồng nàn đầy màu sắc với công thức phối chế riêng của những đầu bếp trứ danh mang đến vị sốt “Cajun” đặc trưng thơm béo cay nhẹ, đượm vị đủ để làm thực khách thích thú khi thưởng thức chung với các loại hải sản tươi ngon.'),
    ('R09','175495F4-84EE-4358-99FB-D9A51ED9E718' , N'La Maison Wine Dining - Nam Kỳ Khởi Nghĩa', N'57 Nguyễn Du, Bến Nghé, Quận 1, Hồ Chí Minh', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 400, 2, 1, N'Ẩm thực Pháp mang trong mình sự đẳng cấp thể hiện ở phong cách ăn uống trang nhã và đầy lịch thiệp. Đối với người Pháp, ăn uống là một nghệ thuật mà chỉ cần bước vào một gian bếp hay nhà hàng là bạn đã trở thành một người nghệ sĩ. Và cũng chính ẩm thực Pháp là cái nôi của “Haute Cuisine”. Không ở đâu xa, mà ngay tại Sài Gòn, bạn có thể ghé thăm nhà hàng La Maison Wine Dining, một không gian ẩm thực đúng chất Pháp với kiến trúc nên thơ, trữ tình cùng những món ăn đầy tinh tế.'),
    ('R10' ,'175495F4-84EE-4358-99FB-D9A51ED9E718' , N'Chang Kang Kung – Hấp Thủy Nhiệt Hong Kong - Vạn Hạnh Mall', N'Tầng 6, Vạn Hạnh Mall, Số 11 Sư Vạn Hạnh, P. 12, Q. 10', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 200, 2, 0, N'Chang Kang Kung Vạn Hạnh Mall sở hữu cho mình phong cách hiện đại gắn liền với sự tối giản, không nên sử dụng quá nhiều màu sắc mà thay vào đó là những bản màu đơn sắc. Tuy đơn giản nhưng phải đảm bảo được thẩm mỹ và công năng nhằm đảm bảo sự hài lòng cho thực khách. Hệ thống chiếu sáng sử dụng những ánh sáng trung tính - màu vàng để nhà hàng trở nên sang trọng hơn và ấm cúng với không gian yên bình. Nhà hàng phù hợp với nhiều mục đích đi ăn của thực khách từ ăn gia đình đến đặt tiệc, tụ họp, gặp mặt, liên hoan, họp nhóm,…'),
    ('R11','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Kobe Teppanyaki - Tú Xương', N'13A Tú Xương, P. 7, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 700, 5, 1, N'Đón khách vào không gian của tòa biệt thự sang trọng cổ kính mang lối kiến trúc Á Đông ấn tượng, Kobe Teppanyaki Tú Xương khoác lên sắc trắng tinh khôi ẩn hiện dàng dưới những bóng cây cổ thụ khiến khách đi đường không khỏi tò mò. Nhà hàng với sức chứa 100 khách chia thành 10 phòng VIP riêng biệt, mỗi phòng VIP lại có đội ngũ đầu bếp chính và phụ bếp phục vụ riêng, Kobe Teppanyaki chắc sẽ đáp ứng hoàn hảo bất cứ nhu cầu nào của thực khách; dù cho đó là một bữa tối ấm cúng bên gia đình, gặp gỡ bạn bè, hay một không gian sang trọng mà vẫn thân tình để tiếp khách.'),
    ('R12','AF53197B-EFAA-4353-80CE-6869504C4223' , N'El Gaucho Argentinian Steakhouse - Hai Bà Trưng', N'74/1 Hai Bà Trưng, P. Bến Nghé, Q.1', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 300, 6, 0, N'Tọa lạc tại vị trí trung tâm quận 1, nằm đối diện khách sạn Park Hyatt, El Gaucho sở hữu không gian 3 tầng ấn tượng với các cửa sổ lớn từ sàn đến trần. Không gian và nội thất được thiết kế sang trọng, pha lẫn nét cổ điển và phá cách, có thể phục vụ cùng lúc khoảng 200 khách. Tầng trệt gồm khu vực bếp và quầy bar mở, không chỉ là nơi chào đón thực khách, mà còn thể hiện “nhịp đập” của nhà hàng. Các tầng còn lại gồm hệ thống các phòng ăn riêng tư, yên tĩnh rất thích hợp để tiếp khách, tổ chức tiệc kỷ niệm, họp mặt gia đình, bạn bè, hẹ hò cặp đôi...'),
    ('R13','AF53197B-EFAA-4353-80CE-6869504C4223' , N'The LOG - GEM Center', N' GEM Center, Rooftop, 8 Nguyễn Bỉnh Khiêm, P. Đa Kao, Q. 1', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 400, 4, 1, N'Lấy cảm hứng từ hình ảnh “căn nhà gỗ”, The LOG với không gian ẩm thực độc nhất vô nhị ở Sài Gòn là nơi mà bạn không thể bỏ qua nếu muốn có cho mình những buổi gặp mặt thú vị hoặc những sự kiện sang trọng. Đặc biệt khi tới đây, bữa tiệc Alacarte đa dạng của nhà hàng sẽ làm bạn đắm say ngay từ lần đầu tiên thưởng thức.'),
    ('R14','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Hoa Viên Sơn Thủy – Long Thạnh Mỹ', N'Số 16 Đường số 1, Khu Phố Giãn Dân, P. Long Thạnh Mỹ, Q. 9', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 400, 4, 3, N'Nằm nép mình ngay mặt đường, Hoa Viên Sơn Thủy gây ấn tượng bởi một không gian thoáng đãng, trải dài trên diện tích rộng. Giữa thành phố náo nhiệt, một khoảng mát mắt hiện ra với nhiều tầng không gian cuốn hút và chính sự khác biệt này đã khiến nhà hàng nhanh chóng chiếm được cảm tình của đông đảo thực khách. Nếu bạn muốn tìm một địa chỉ để liên hoan, gặp mặt bạn bè hay để đổi gió cho bữa ăn gia đình quen thuộc thì hẳn đây là một nhà hàng không thể bỏ qua.'),
    ('R15','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Cơm Niêu Sài Gòn – Tú Xương', N'27 Tú Xương, P. 7, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 400, 2, 1, N'Cuộc sống với bao bộn bề, tấp nập, đôi khi bất chợt nhớ một hương vị quen thuộc nơi quê nhà thuở nhỏ, một chén cá kho mẹ nấu, hay nồi cơm đủ lửa chín tới của bà, chỉ cần có thế, nỗi lòng người con xa quê dường như dịu lại. Thấu hiểu được điều đó, nhà hàng Cơm Niêu Sài Gòn Tú Xương ra đời, mang đến cho thực khách những hương vị quen thuộc của tuổi thơ có bà, có mẹ. Là một trong những nhà hàng món Việt ngon nhất tại Sài Gòn, Cơm Niêu Sài Gòn đưa bạn trở về mái nhà ấm êm, bên mâm cơm nóng sum vầy, đoàn tụ.'),
    ('R16','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Ẩm Thực Quê Nhà – Phạm Ngọc Thạch', N'28 Phạm Ngọc Thạch, P. 6, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 300, 5, 0, N'Ở một Sài thành phố thị hiện đại, xa hoa hào nhoáng thì có lẽ “nét chấm phá”, Ẩm Thực Quê Nhà đi ngược lại tất cả những điều ấy. Nhưng người Sài thành “lạ” lắm, người ta cứ thích tìm về những chốn bình yên như thế, cứ thế Quê Nhà như là một điểm hẹn lý tưởng của người Sài Gòn, của người con xa quê đến để kiếm tìm chút hương vị của quê nhà, hương vị đến từ những nét kiến trúc không gian làng quê mộc mạc, hương vị đến từ những món ăn “chuẩn” mẹ nấu ngày xưa.'),
    ('R17','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Quán Út Cà Mau - Điện Biên Phủ', N'215 Điện Biên Phủ, P. 6, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 300, 3, 0, N'Nhiều người trong chúng ta chắc hẳn đều biết đến bài vọng cổ “Tình anh bán chiếu” nổi tiếng qua giọng hát của nghệ sĩ Út Trà Ôn. Thế nhưng, bên cạnh chiếu Cà Mau đã đi vào thơ ca, Cà Mau còn nổi tiếng về sự trù phú của các loài tôm cua ghẹ. Đặc biệt, cua biển Cà Mau nổi tiếng khắp trong nước và quốc tế. Có một nhà hàng mà mới chỉ nghe tên thôi cũng đủ hình dung được hương vị mặn mòi của hương vị đặc sản ấy, đó là quán Út Cà Mau Điện Biên Phủ.'),
    ('R18','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Green Garden Fine Wine & Dining – Kha Vạn Cân', N'Số 439 Kha Vạn Cân, P. Hiệp Bình Chánh, H. Thủ Đức', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 800, 2, 0, N'Green Garden Fine Wine & Dining là sự tổng hòa giữa tất cả những yếu tố dù là chi tiết nhất liên quan tới món ăn, phong cách phục vụ hay không khí bữa tiệc, âm nhạc, ánh sáng... để tạo nên một không khí sang trọng nhưng không kém phần lãng mạn và ấm cúng.'),
    ('R19','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Biển Dương 1 - Nguyễn Tri Phương', N' Số 101-103-105 Nguyễn Tri Phương, P. 7, Q. 5', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 1000, 2, 1, N'Thưởng thức món ngon từ hải sản trong không gian rộng rãi, thoáng đãng được sum vầy, tụ họp bên người thân, bạn bè thì không còn gì sánh bằng. Nhà hàng Biển Dương 1 chắc chắn sẽ là một lựa chọn tuyệt vời cho những bữa tiệc càng thêm thăng hoa. Để giúp bạn có nhiều lựa chọn thú vị hơn nữa, PasGo gợi ý cho bạn Top nhà hàng hải sản ngon ở Quận 5. Đừng quên đặt bàn qua PasGo – Mạng lưới nhà hàng ngon để giữ chỗ và nhận kèm ưu đãi hấp dẫn!'),
    ('R20','AF53197B-EFAA-4353-80CE-6869504C4223' , N'Sargon Rooftop - Cao Thắng', N' Số 2/42 Cao Thắng, P. 5, Q. 3', '2019-03-02 06:00:00.000', '2020-03-02 22:00:00.000', 500, 5, 0, N'Nếu bạn đang tìm kiếm một nơi thật tươi mới để nạp lại năng lượng sau mỗi ngày dài làm việc căng thẳng thì Sargon Rooftop số 2/42 Cao Thắng, quận 3 chính là một gợi ý hoàn hảo không thể bỏ qua. Sargon Rooftop là nhà hàng - cafe rooftop có thể ngắm toàn cảnh thành phố từ trên cao. Bạn sẽ cảm thấy thoải mái với không gian ở đây – thoáng mát, view đẹp ngắm hoàng hôn, chỗ ngồi lịch sự và rộng rãi.')


	/* insert menu 
			1.starttime ,endtime cop y hệt như trên 
			2.idMenu , idRestaurant  có mối quan hệ 1 nhà hàng đó có thể có nhiều menu */
INSERT INTO Menu
	(idMenu,idRestaurant,nameMenu,startTime,endTime)
VALUES
	('MN01', 'R01', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN02', 'R01', N'vegetarian menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN03', 'R02', N'Main course menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN04', 'R02', N'Dessert menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN05', 'R03', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN06', 'R03', N' Dessert menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN07', 'R04', N'Premium Food Menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN08', 'R05', N'main course menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
    ('MN09', 'R06', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN10', 'R06', N'Main course menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN11', 'R07', N'Hot pot menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN12', 'R08', N'Premium Food Menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
    ('MN13', 'R08', N'Sauce Menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN14', 'R09', N'main course menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN15', 'R10', N'scrumptious combos', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN16', 'R10', N'awesome combos', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN17', 'R10', N'Mocktail menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN18', 'R10', N'Wine menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN19', 'R11', N'Premium Food Menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN20', 'R12', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN21', 'R12', N'Drink menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),   
	('MN22', 'R13', N'Set menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN23', 'R13', N'Kids menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN24', 'R13', N'desserts menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN25', 'R14', N'special menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN26', 'R14', N'appetizer menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN27', 'R15', N'traditional dishes menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN28', 'R15', N'green-fresh fruit menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN29', 'R16', N'special menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN30', 'R16', N'snacks menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN31', 'R17', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN32', 'R18', N'Special menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN33', 'R19', N'Eatery menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN34', 'R20', N'main course menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN35', 'R20', N'sweet Womens Day Menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000'),
	('MN36', 'R20', N'Dessert menu', '2020-03-02 06:00:00.000', '2030-03-02 22:00:00.000')
					
	/* 
	5.BAO ngon Restaurant: https://www.traveloka.com/en-vn/activities/vietnam/product/bao-ngon-restaurant-in-nha-trang-6936616846199?funnel_source=Merchandising.AA.Category-FOOD_AND_DRINK-web-VN-LandingPage&funnel_id=S_1_3f42723f57c3fdcfb3cf2a6b2ef514e52e370ce3_15_2866fe9695b5031ad311fbb4617d055f300a3b0d&internal_source=true
	Bao Thịt Viên Phô Mai sốt Trung Hoa,Salad,  Cơm Cua Thượng Hạng, Bao Tôm Áp Chảo Thịt Viên Phô Mai 



     6.Switch Restaurant:https://pasgo.vn/nha-hang/switch-restaurant-ngo-duc-ke-4156
King Prawn Salad, Zuppa di Pesce Soup, Tagliolini Cartoccio, Ribeyes Steak, T-bone Steak, Scallop, Foie Gras Royal, Pan Sear Salmon
	vodka, pasion liquor, whiskey, cherry brandy cocktail, Blue Curacao
	
	
	7.On-Yasai Shabu Shabu - Aeon Mall Tân Phú: https://pasgo.vn/nha-hang/on-yasai-shabu-shabu--aeon-mall-tan-phu-2007
	Lẩu Sukiyaki, Lẩu Kiwami, Lẩu Tứ Xuyên, Lẩu Nấm Thảo Mộc, Lẩu Tom Yum, Thịt bò & Các loại hải sản
	
	
	8.Lobster Bay - Nhà Hàng Hải Sản Kiểu Mỹ - Kỳ Đồng: https://pasgo.vn/nha-hang/nha-hang-lobster-bay-ky-dong-2129
	Tôm tích (bề bề) cháy tỏi, Tôm mũ ni rang muối HongKong, Tôm hùm Alaska rang muối HongKong, Cua Cà Mau , Cá hồi nướng ,Bạch tuộc Mực lá nướng sa tết, Miến cua Cà Mau, Pizza tôm hùm Alaska, Bào ngư
	sốt ớt Singapore,sốt nấm, sốt muối ớt,  sốt dầu hào, sốt bơ tỏi
	9.La Maison Wine Dining - Nam Kỳ Khởi Nghĩa: https://pasgo.vn/nha-hang/nha-hang-la-maison-wine-dining-nam-ky-khoi-nghia-2640
	Heo Tây Ban Nha, Bò Úc, Gan ngỗng, Ức vịt, Cá Tuyết, Hàu sữa Pháp
	
	10. Chang Kang Kung – Hấp Thủy Nhiệt Hong Kong - Vạn Hạnh Mall: https://pasgo.vn/nha-hang/chang-kang-kung---hap-thuy-nhiet-hong-kong-van-hanh-mall-2825
	Bắp bò Mỹ, Tôm nhảy, Hải sản viên hỗn hợp, Cá giòn hấp gừng, 
	Cá hồi Nauy, Mực nút, Nghêu Gò công, Nấm Đông Cô nhân tôm
	Trà đào, Trà việt quất, Trà nho   
	 Mojito Bầu trời xanh, Mojito Chanh dây, Mojito chanh mật ong
	11. Kobe Teppanyaki - Tú Xương: https://pasgo.vn/nha-hang/nha-hang-kobe-teppanyaki-13a-tu-xuong-1139
	Kobe Sashimi tổng hợp đặc biệt, Bò Kobe thượng hạng, Sò huyết Nhật và gạo cous cous với tartar cá, Hàu nướng sốt Miso, Bào ngư Nhật, Pizza Nhật…
	12. El Gaucho Argentinian Steakhouse - Hai Bà Trưng: https://pasgo.vn/nha-hang/el-gaucho-argentinian-steakhouse-hai-ba-trung-4127
	Beefsteak Platinum, USDA Prime, Australia Black Angus
	whiskey sour, Buenos mojito, Lychee martini, Beer
	
	13.The LOG - GEM Center: https://pasgo.vn/nha-hang/the-log-gem-center-1588
	Súp kem bó xôi càng tôm hùm, Pa-te Gan ngỗng xốt xoài, Cá hồi áp chảo xốt kem Wasabi, Nạc lưng nướng xốt rau củ, Bánh Mousse hạnh nhân 
	Súp bí đỏ hải sản, Gà chiên cốm, Mỳ ý bò hầm, Cơm chiên tỏi với gà nướng
	Bánh Mousse Sô-cô-la chuối Caramel, Kem phô mai Hạt Hồ Trăn, Đậu hũ nóng, Trái cây
	14. Hoa Viên Sơn Thủy – Long Thạnh Mỹ: https://pasgo.vn/nha-hang/hoa-vien-son-thuy-long-thanh-my-1929
	Hàu nướng phô mai, Đậu hũ Busean, San hô Bách Hoa, Gỏi Sơn Thủy, Gà tre hầm hồng sâm
	Khoai tây chiên, Xôi chiên phồng, Sụn gà rang muối HôngKông, Mực tam tơ
	
	15. Cơm Niêu Sài Gòn – Tú Xương: https://pasgo.vn/nha-hang/com-nieu-sai-gon-tu-xuong-1604
	Cơm Niêu, Cơm đập, Cơm chiên, Cá hô um dưa cải chua, Gỏi cá hô
	Dưa lưới, Bưởi, Cam xoàn, Dưa hấu, thơm
	
	16. Ẩm Thực Quê Nhà – Phạm Ngọc Thạch: https://pasgo.vn/nha-hang/nha-hang-am-thuc-que-nha-pham-ngoc-thach-437
	Heo tộc nướng da giòn, Giò heo muối chiên, Gà ta hấp niêu quê nhà, Vịt trời, Gà đông tảo
	Đậu hũ chiên sả ớt, Sụn gà rang muối, Bò xóc đá, Răng mực cháy tỏi
	17. Quán Út Cà Mau - Điện Biên Phủ: https://pasgo.vn/nha-hang/quan-ut-ca-mau-dien-bien-phu-717
	Cua sốt trứng muối, Miến cua tay cầm, Lẩu cua, Cua bát quái, Lẩu dê
	
	18.Green Garden Fine Wine & Dining – Kha Vạn Cân: https://pasgo.vn/nha-hang/nha-hang-green-garden-fine-wine-dining-kha-van-can-4561
	Súp đuôi bò hành tây phô mai kiểu Pháp; Sò điệp áp chảo với rau củ nướng và sốt cà chua; Xà lách hải sản trộn sốt balsamic; Thăn nõn bò Úc đút lò với rau củ sốt kem tỏi; Cá hồi đút lò dùng kèm khoai tây nghiền hạt sen sốt kem; Bào ngư hầm cùng nấm,
	
	19.Biển Dương 1 - Nguyễn Tri Phương: https://pasgo.vn/nha-hang/nha-hang-bien-duong-1-nguyen-tri-phuong-4567
	Lẩu cá tầm nhúng mẻ , Miến cua tay cầm, Cá mú hấp Hong Kong
	
	20. Sargon Rooftop - Cao Thắng: https://pasgo.vn/nha-hang/nha-hang-sargon-rooftop-cao-thang-4548
	Ức gà Panko, Tôm sốt trứng muối, Ức vịt sốt cam, Cá chẽm sốt rau mùi
	Còi sò điệp nhật áp chảo sốt thì là, Soup Vẹm Xanh Newzeland, Mỳ ý tôm hùm, Bánh trứng nướng kèm dâu tây
	Bánh trứng nướng trà xanh, Bánh Panna chanh dây, Bánh Waffle, Riramisu
	
	
	*/
	/* insert food
			1.createdAt ,updatedAt cop như trên 
			2. giá tiền số lượng tùy để */
INSERT INTO Food
	(idFood,nameFood,priceFood,qty,qtyBook,createdAt,updatedAt)
VALUES
	('F01', N'Cá Nướng', 200,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F02', N'Canh chua chay', 320,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F03', N'Lẩu Cá', 230 ,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F04', N'Bánh chuối nướng',10,5, 230, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F05', N'Cơm Chiên Cá Mặn', 300,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F06', N'Mực Chiên Giòn', 250,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F07', N'Cua Rang Me', 221,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F08', N'Đá xay', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F09', N'Kem', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F10', N'Soda ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
/*5*/
	('F11', N'Bao Thịt Viên Phô Mai sốt Trung Hoa', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F12', N'Salad', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F13', N' Cơm Cua Thượng Hạng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
    ('F14', N'Bao Tôm Áp Chảo Thịt Viên Phô Mai ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
    /*6*/
	('F15', N'King Prawn Salad', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F16', N'Zuppa di Pesce Soup', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F17', N'Scallop', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F18', N'Foie Gras Royal', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F19', N'Pan Sear Salmon', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	 /*7*/ 
	('F20', N'Lẩu Sukiyaki', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F21', N'Lẩu Kiwami', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F22', N'Lẩu Tứ Xuyên', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F23', N'Lẩu Tom Yum', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*8*/
	('F24', N'Tôm tích (bề bề)cháy tỏi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F25', N'Cua Cà Mau', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F26', N'Cá hồi nướng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F27', N'Bạch tuộc Mực lá nướng sa tết', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F28', N'Miến cua Cà Mau', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F29', N'Bào ngư', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F30', N'sốt ớt Singapore', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F31', N'sốt nấm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F32', N'sốt dầu hào', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F33', N'sốt bơ tỏi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*9*/
	('F34', N'Heo Tây Ban Nha', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F35', N'Bò Úc', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F36', N'Gan ngỗng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F37', N'Ức vịt', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F38', N'Cá Tuyết', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F39', N'Hàu sữa Pháp', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*10*/
	('F40', N'Bắp bò Mỹ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F41', N'Tôm nhảy', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F42', N'Hải sản viên hỗn hợp', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F43', N'Cá giòn hấp gừng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F44', N'Cá hồi Nauy', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F45', N'Mực nút', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F46', N'Nghêu Gò công', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F47', N'Nấm Đông Cô nhân tôm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F48', N'Trà đào', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F49', N'Trà việt quất', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F50', N'Trà nho', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F51', N'Mojito Bầu trời xanh', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F52', N'Mojito Chanh dây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F53', N'Yamana Chardonnay', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F54', N'Osadia Sauvignon Blanc', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F55', N'Los Vascos Sauvignon Blanc ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*11*/
	('F56', N'Kobe Sashimi tổng hợp đặc biệt', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F57', N'Sò huyết Nhật', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F58', N'Hàu nướng sốt Miso', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F59', N'Bào ngư Nhật', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F60', N'Pizza Nhật', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*12*/
	('F61', N'Beefsteak Platinum', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F62', N'USDA Prime', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F63', N'Australia Black Angus', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F64', N'whiskey sour', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F65', N'Buenos mojito', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F66', N'Lychee martini', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F67', N'Beer', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*13*/
	('F68', N'Súp kem bó xôi càng tôm hùm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F69', N'Pa-te Gan ngỗng xốt xoài', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F70', N'Cá hồi áp chảo xốt kem Wasabi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F71', N'Nạc lưng nướng xốt rau củ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F72', N'Bánh Mousse hạnh nhân ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F73', N'Súp bí đỏ hải sản', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F74', N'Gà chiên cốm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F75', N'Mỳ ý bò hầm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F76', N'Cơm chiên tỏi với gà nướng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F77', N'Bánh Mousse Sô-cô-la chuối Caramel', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F78', N'Kem phô mai', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F79', N'Đậu hũ nóng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F80', N'Trái cây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*14*/
	('F81', N'Hàu nướng phô mai', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F82', N'Đậu hũ Busean', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F83', N'San hô Bách Hoa', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F84', N'Gỏi Sơn Thủy', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F85', N'Gà tre hầm hồng sâm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F86', N'Khoai tây chiên', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F87', N'Xôi chiên phồng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F88', N'Sụn gà rang muối HôngKông', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F89', N'Mực tam tơ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*15*/
	
	('F90', N'Cơm Niêu', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F91', N'Cơm đập', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F92', N'Cơm chiên', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F93', N'Cá hô um dưa cải chua', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F94', N'Gỏi cá hô', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F95', N'Dưa lưới', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F96', N'Bưởi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F97', N'Cam xoàn', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F98', N'Dưa hấu', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*16*/	
	('F99', N'Heo tộc nướng da giòn', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F100', N'Giò heo muối chiên', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F101', N'Gà ta hấp niêu quê nhà', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F102', N'Vịt trời', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F103', N'Gà đông tảo', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F104', N'Đậu hũ chiên sả ớt', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F105', N'Sụn gà rang muối', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F106', N'Bò xóc đá', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F107', N'Răng mực cháy tỏi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*17*/ 	
	('F108', N'Cua sốt trứng muối', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F109', N'Miến cua tay cầm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F110', N'Lẩu cua', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F111', N'Cua bát quái', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F112', N'Lẩu dê', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*18*/
	('F113', N'Súp măng tây kiểu Pháp', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F114', N'Sò điệp áp chảo với rau củ nướng và sốt cà chua', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F115', N'Xà lách hải sản trộn sốt balsamic', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F116', N'Bí ngòi nhồi Thịt cua', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F117', N'cà rốt nghiền và sốt trứng muối', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F118', N'Bào ngư hầm cùng nấm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*19 */
	('F119', N'Lẩu cá tầm nhúng mẻ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F120', N'Miến cua tay cầm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F121', N'Cá mú hấp Hong Kong', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F122', N'Tôm muối', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
    /*20 */
	('F123', N'Ức gà Panko', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F124', N'Tôm sốt trứng muối', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F125', N'Ức vịt sốt cam', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F126', N'Cá chẽm sốt rau mùi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('F127', N'Còi sò điệp nhật áp chảo sốt thì là', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F128', N'Soup Vẹm Newzeland', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F129', N'Mỳ ý tôm hùm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('F130', N'Bánh trứng nướng kèm dâu tây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	  ('F131', N'Bánh cake trà xanh', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),	
	  ('F132', N'Bánh Panna chanh dây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F133', N'Bánh Waffle', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
   	  ('F134', N'Riramisu', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F135', N'Mực rim', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),	
	  ('F136', N'Gỏi cuốn', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F137', N'Đậu phụ nhồi Itali', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F138', N'Buta Kim Chi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F139', N'Tôm Sú nướng sốt mè', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),	

	  ('F140', N'Cơm chiên rau củ chay', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F141', N'Xôi dừa', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F142', N'Chả đậu xanh', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F143', N'Lẩu nấm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),	
	  ('F144', N'Cháo nấm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
      ('F145', N'Marukamee Uddon', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F146', N'Pizza kiểu Nhật', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F147', N'Cơm chiên dứa và hải sản', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),	
	  ('F148', N'Gỏi miến hải sản', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F149', N'Sườn hấp kê', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	  ('F150', N'Bánh trôi tàu', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F151', N'Chè hương cốm lá dứa', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F152', N'Chè trái cây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	  ('F153', N'Bánh cuộn tinh than tre', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F154', N'Bánh bông lan chanh dây', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
     
      ('F155', N'Bánh mì phomai bít tết', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F156', N'Pizza kiểu Newyork', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F157', N'Hàu Seattle', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F158', N'Súp nghêu', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F159', N'Sườn nướng', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
     
      ('F160', N'Bánh nếp bí đỏ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F161', N'Sương sáo mật ong', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F162', N'Tào phớ', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F163', N'Chè bưởi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F164', N'Bánh đậu đỏ hấp', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
     
      ('F165', N'Hokkaido Sachi Sushi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F166', N'Shinsen Sushi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F167', N'Cua biển hấp sả', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F168', N'Mắm nhum', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F169', N'Chả tré rơm', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

      ('F170', N'Bún tôm Châu Trúc', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F171', N'Cua Huỳnh đế', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F172', N'Bánh xèo tôm nhảy', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

      ('F173', N'Cơm chiên hải sản', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F174', N'Bê chao bản gang', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F175', N'Bò nướng bánh hỏi', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F176', N'Cơm cháy kho quẹt', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

      ('F177', N'Gan ngỗng áp chảo', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F178', N'Cá ngừ áp chảo với muối biển đen', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('F179', N'Sườn cừu đút lò', 50,10,5, '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000')

	/* listImagesFood các hình anh tùy chọn phù hợp với tên món ăn là được 
	 	mỗi food là 1 ảnh */ 
INSERT INTO ListImagesFood
	(idImagesFood,idFood,urlImage,createdAt,updatedAt)
VALUES
	('IF01', 'F01', 'https://trivietphat.net/wp-content/uploads/2021/08/gia-vi-uop-ca-nuong-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF02', 'F02', 'https://imgs.vietnamnet.vn/Images/2017/10/06/10/20171006100109-canh-chua.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF03', 'F03', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/0000-phuong-mon%20ngon&%20con%20thuc/9.%20lau%20ca/A1.Lau-ca-thom-ngon-bo-duong.png', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF04', 'F04', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF05', 'F05', 'https://photo.famicook.com/image/com-chien-ca-man-ga-xe-i337-640w.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF06', 'F06', 'https://cdn.cet.edu.vn/wp-content/uploads/2018/09/muc-chien-xu.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF07', 'F07', 'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/cua-bien-rang-me-chua-ngot-thumbnail.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF08', 'F08', 'https://cdn.tgdd.vn/Products/Images/3226/76520/bhx/nuoc-tang-luc-sting-huong-dau-330ml-201909031559004919.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF09', 'F09', 'https://cdn.tgdd.vn/Products/Images/2443/76444/bhx/nuoc-ngot-7-up-vi-chanh-chai-390ml-09112018113228.JPG', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF10', 'F10', 'http://cdn.tgdd.vn/Files/2017/10/25/1035746/soda-la-gi-co-phai-la-nuoc-khoang-co-gas-khong-cac-thuc-uong-ngon-tu-soda-202202151112488476.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF11', 'F11', 'https://file.hstatic.net/1000115147/article/xiu-mai-pho-mai_ea34942062fa438dbff24c3689d97920_9943e49b56e74e168f9807bf348b2c76_large.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF12', 'F12', 'https://totsfamily.com/wp-content/uploads/2017/03/IMG_4223.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF13', 'F13', 'https://hatoyama.vn/wp-content/uploads/2020/05/sushi-Maki-com-cuon-cua-trung-tom-12-8-1200.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF14', 'F14', 'https://afamilycdn.com/k:thumb_w/600/Qalypm8xccccccccccccW2vZ1VroR/Image/2014/06/Xiu-mai-0-f2d23/thit-vien-rim-xi-dau-dam-da-ngon-com.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF15', 'F15', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF16', 'F16', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-4.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF17', 'F17', 'http://www.thegioidongy.com/wp-content/uploads/2015/01/sohuyet2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF18', 'F18', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF19', 'F19', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	('IF20', 'F20', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/1-gyu-kaku-tan-phu/on-yasaitanphu/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF21', 'F21', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/1-gyu-kaku-tan-phu/on-yasaitanphu/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF22', 'F22', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/1-gyu-kaku-tan-phu/on-yasaitanphu/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF23', 'F23', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/1-gyu-kaku-tan-phu/on-yasaitanphu/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-4.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF24', 'F24', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/lobster-bay-lan-3/ky-dong/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF25', 'F25', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-4-normal-1255621320428.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF26', 'F26', 'http://nhahanghuongsen.com.vn/wp-content/uploads/2015/05/mon-ca-hoi-nuong-chanh.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF27', 'F27', 'https://bep360.net/wp-content/uploads/2021/07/cach-lam-bach-tuoc-nuong-sa-te-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF28', 'F28', 'https://tse2.mm.bing.net/th?id=OIP.1x54B9bM7dfVXRsWGF9kMQHaE7&pid=Api&P=0&w=265&h=176', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF29', 'F29', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-5-normal-1255621620429.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF30', 'F30', 'https://tse4.mm.bing.net/th?id=OIP.C-awKWRJPs2PlmbKNQ8ySAHaGn&pid=Api&P=0&w=208&h=186', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF31', 'F31', 'https://tse3.mm.bing.net/th?id=OIP.-G7YEuKDkdsqwu6fh5mSxAHaHa&pid=Api&P=0&w=168&h=168', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF32', 'F32', 'https://tse4.mm.bing.net/th?id=OIP.V7lef-j3y9Ju53L_ecUAiAHaEK&pid=Api&P=0&w=361&h=203', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF33', 'F33', 'https://tse2.mm.bing.net/th?id=OIP.SUnDZX0bID85BVf2Ie9npwHaEK&pid=Api&P=0&w=298&h=167', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF34', 'F34', 'https://tse4.mm.bing.net/th?id=OIP.AmeeZGuZPdeif5Zkz58XlgHaFj&pid=Api&P=0&w=238&h=178', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF35', 'F35', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-la-maison-wine-grill-bar-nam-ky-khoi-nghia-12-normal-355391127250.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF36', 'F36', 'https://tse4.mm.bing.net/th?id=OIP.WB72N_QFUUbnlJSVEoEEiAHaE8&pid=Api&P=0&w=248&h=165', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF37', 'F37', 'https://tse4.mm.bing.net/th?id=OIP.vqliTgWAu5VdBdiQmMFdPAHaFP&pid=Api&P=0&w=265&h=188', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF38', 'F38', 'https://tse3.mm.bing.net/th?id=OIP.QYBGz8D19MjHAksHg7H0sQHaE7&pid=Api&P=0&w=273&h=182', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF39', 'F39', 'https://file.hstatic.net/1000030244/file/hau__61__90584267758d44d8b451b55a7c163b1e_grande.png', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF40', 'F40', 'https://tse2.mm.bing.net/th?id=OIP.Dg017QTkJgzvA3WhfgEglgHaFa&pid=Api&P=0&w=249&h=182', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF41', 'F41', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/tinh/nh-chang-kang-kung-van-hanh-mall-hcm/Newfolder/nha-hang-chang-kang-kung-3up.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF42', 'F42', 'https://tse3.mm.bing.net/th?id=OIP.kmtykxplx-8-Ly5Xceh7MQHaFN&pid=Api&P=0&w=279&h=196', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF43', 'F43', 'https://i.pinimg.com/originals/9c/e4/8c/9ce48c5ad441c30c1f1736635cd6b7fb.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF44', 'F44', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/tinh/nh-chang-kang-kung-van-hanh-mall-hcm/nha-hang-chang-kang-kung-van-hanh-mall-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF45', 'F45', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/tinh/nh-chang-kang-kung-van-hanh-mall-hcm/nha-hang-chang-kang-kung-van-hanh-mall-7.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF46', 'F46', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/tinh/nh-chang-kang-kung-van-hanh-mall-hcm/nha-hang-chang-kang-kung-van-hanh-mall-11.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF47', 'F47', 'https://tse2.mm.bing.net/th?id=OIP.mdEG-V2RE3MT5LhnU18KsQHaEL&pid=Api&P=0&w=343&h=193', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF48', 'F48', 'https://tse4.mm.bing.net/th?id=OIP.2eKh0qFqZc3x1K3x04qW7wHaHa&pid=Api&P=0&w=199&h=199', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF49', 'F49', 'https://tse1.mm.bing.net/th?id=OIP.vf_Nyzxgg1HUm_BPxm1QYwHaE7&pid=Api&P=0&w=249&h=166', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF50', 'F50', 'https://tse2.mm.bing.net/th?id=OIP.RGUBCYOfZsdv0RKnr4ur4AHaHa&pid=Api&P=0&w=171&h=171', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF51', 'F51', 'https://tse1.mm.bing.net/th?id=OIP.B-Dp764Xl-Wv-KcpQD_UewHaHa&pid=Api&P=0&w=175&h=175', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF52', 'F52', 'https://tse3.mm.bing.net/th?id=OIP.MxnWfgHV6kQyHTza06J9sAHaE8&pid=Api&P=0&w=258&h=172', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF53', 'F53', 'https://api.selcdn.ru/v1/SEL_78424/inwine-products/wine-preview-19075.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF54', 'F54', 'https://cdn.awsli.com.br/800x800/552/552087/produto/50082057/af4fa21066.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF55', 'F55', 'https://drizly-products2.imgix.net/ci_1491.png?auto=format%2Ccompress&fm=jpg&q=20', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF56', 'F56', 'https://tse4.mm.bing.net/th?id=OIP.oQuG9An7_bHrCjdTcTRo6AHaFj&pid=Api&P=0&w=233&h=175', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF57', 'F57', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/kobelytutrong/nha-hang-kobe-teppanyaki-ly-tu-trong-11.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF58', 'F58', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/kobelytutrong/nha-hang-kobe-teppanyaki-ly-tu-trong-13.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF59', 'F59', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/kobelytutrong/nha-hang-kobe-teppanyaki-ly-tu-trong-21.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF60', 'F60', 'https://tse3.mm.bing.net/th?id=OIP._EHgNCcbWkchtkIv56IfQAHaFk&pid=Api&P=0&w=256&h=192', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	('IF61', 'F61', 'https://tse4.mm.bing.net/th?id=OIP.MKB_B7uI8-u37WoWR3ug3AHaFj&pid=Api&P=0&w=231&h=173', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF62', 'F62', 'https://tse1.mm.bing.net/th?id=OIP.nEoo8C1R_E7tRaqOqIfLwwHaJ4&pid=Api&P=0&w=130&h=174', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF63', 'F63', 'https://tse2.mm.bing.net/th?id=OIP.YOohPdcxKIYQWnGR5Yw1ZwHaHa&pid=Api&P=0&w=173&h=173', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF64', 'F64', 'https://tse3.mm.bing.net/th?id=OIP.JvjAyjYVwjuB_HJo1_mmWgHaIa&pid=Api&P=0&w=148&h=168', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF65', 'F65', 'https://tse1.mm.bing.net/th?id=OIP.ZX7uNSXEoziMjNnblgkoOAHaJE&pid=Api&P=0&w=155&h=190', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF66', 'F66', 'https://tse4.mm.bing.net/th?id=OIP.K0X_GaiSV19WyaOqo5TRKQHaHa&pid=Api&P=0&w=168&h=168', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF67', 'F67', 'https://tse3.mm.bing.net/th?id=OIP.HL4pQhHF_Enl6UpbIv9-RgHaFU&pid=Api&P=0&w=239&h=171', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF68', 'F68', 'https://tse4.mm.bing.net/th?id=OIP.do-Ph1FtNusSAkoHe6AwHQHaE8&pid=Api&P=0&w=279&h=186', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF69', 'F69', 'https://tse1.mm.bing.net/th?id=OIP.s7jGT1ArkndXNE77YiSGmQHaEq&pid=Api&P=0&w=333&h=209', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF70', 'F70', 'https://tse4.mm.bing.net/th?id=OIP.V5FZWbsb8uadxVNJsLlkOgAAAA&pid=Api&P=0&w=288&h=192', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF71', 'F71', 'https://tse1.mm.bing.net/th?id=OIP.ZPFS-EDqHg4aFOjeydorvwHaEK&pid=Api&P=0&w=325&h=182', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF72', 'F72', 'https://tse1.mm.bing.net/th?id=OIP.HqY-qh4cQhfklJ64IZw3kgHaHa&pid=Api&P=0&w=170&h=170', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF73', 'F73', 'https://tse2.mm.bing.net/th?id=OIP.jH3P99h8AbjBDOIe1oo-1AHaEx&pid=Api&P=0&w=278&h=179', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF74', 'F74', 'https://tse1.mm.bing.net/th?id=OIP.9C9pfXucc6A6__jjMRbajgHaE8&pid=Api&P=0&w=288&h=192', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF75', 'F75', 'https://tse1.mm.bing.net/th?id=OIP.eKM-Sl3WUcvKZccPbNO4cQHaE7&pid=Api&P=0&w=279&h=186', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF76', 'F76', 'https://namkyretro.com/wp-content/uploads/2021/05/BNXQ2020_00508-Ga-Nuong-Mat-Ong-Voi-Xoi-Chien-1_2-con-300.000-d-2048x1365.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF77', 'F77', 'https://tse1.mm.bing.net/th?id=OIP.a7HVPqhtswOCavsAdYEDJwHaEK&pid=Api&P=0&w=310&h=174', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF78', 'F78', 'https://tse3.mm.bing.net/th?id=OIP.708qWH4kkwQn_C5VUTSneQHaE8&pid=Api&P=0&w=291&h=194', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF79', 'F79', 'https://tse3.mm.bing.net/th?id=OIP.9ag1JTvHS4niYX3bARRiNgHaEK&pid=Api&P=0&w=316&h=178', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF80', 'F80', 'https://tse2.mm.bing.net/th?id=OIP.9hv8bTMEVRZQUim26OcqSAHaEK&pid=Api&P=0&w=333&h=187', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF81', 'F81', 'https://tse1.mm.bing.net/th?id=OIP.q6_QYtVu1aDdwWrM9uv66wHaEc&pid=Api&P=0&w=273&h=163', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF82', 'F82', 'https://tse2.mm.bing.net/th?id=OIP.AH-0-v51ihFNzo1rQV9dbwHaE8&pid=Api&P=0&w=246&h=164', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF83', 'F83', 'https://tse1.mm.bing.net/th?id=OIP.AyslXlIacRTOTM7SyHMnCwHaE8&pid=Api&P=0&w=245&h=164', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF84', 'F84', 'https://tse1.mm.bing.net/th?id=OIP.jtRmXMDhDqsOgNVAHWryTQHaE8&pid=Api&P=0&w=262&h=174', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF85', 'F85', 'https://tse1.mm.bing.net/th?id=OIP.LM8uQ9sXC5OAUSN-OhrdxQHaFY&pid=Api&P=0&w=253&h=184', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF86', 'F86', 'https://tse4.mm.bing.net/th?id=OIP.442okt4gQjqOIR3gT1rhZwHaHa&pid=Api&P=0&w=200&h=200', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF87', 'F87', 'https://tse2.mm.bing.net/th?id=OIP._b250fhDevoq2AVhTRmRNwHaEM&pid=Api&P=0&w=311&h=176', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF88', 'F88', 'https://tse4.mm.bing.net/th?id=OIP.7ZMSI6_V2sHvzKqK9JqoEAHaFn&pid=Api&P=0&w=236&h=179', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF89', 'F89', 'https://tse4.mm.bing.net/th?id=OIP.0kTDe0w7_8gFkFDkGmA6kgHaFq&pid=Api&P=0&w=247&h=188', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF90', 'F90', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-1-normal-125414213171.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF91', 'F91', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-2-normal-125414313172.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF92', 'F92', 'https://tse3.mm.bing.net/th?id=OIP.3xDnNocM-IfieBvRbh1GnQHaE7&pid=Api&P=0&w=303&h=201', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF93', 'F93', 'https://tse1.mm.bing.net/th?id=OIP.tw-oHt_GL76QVxHmfPuiLwHaD4&pid=Api&P=0&w=359&h=188', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF94', 'F94', 'https://tse1.mm.bing.net/th?id=OIP.FEpFhl_-hJZKBcYJCQs8hAHaE8&pid=Api&P=0&w=262&h=175', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF95', 'F95', 'https://tse3.mm.bing.net/th?id=OIP.3_G0DoL6DhKTBU5QeFTexAHaFf&pid=Api&P=0&w=234&h=173', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF96', 'F96', 'https://tse1.explicit.bing.net/th?id=OIP.YaH5a_q5Mm1obZob82EI8gHaEq&pid=Api&P=0&w=287&h=180', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF97', 'F97', 'https://tse2.mm.bing.net/th?id=OIP.mMOaaX2SCNfpom8VhuMXwgHaHa&pid=Api&P=0&w=163&h=163', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF98', 'F98', 'https://tse1.mm.bing.net/th?id=OIP.zMc7_YWkzLHWnxLJu2xtkgHaFj&pid=Api&P=0&w=242&h=182', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	/*16*/
	('IF99', 'F99', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/linhpt/que-nha-pham-ngoc-thach/nha-hang-que-nha-pham-ngoc-thach-11.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF0100', 'F100', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/linhpt/que-nha-pham-ngoc-thach/nha-hang-que-nha-pham-ngoc-thach-12.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF101', 'F101', 'https://www.huongnghiepaau.com/wp-content/uploads/2019/01/lau-ga-hap-hem-dac-san-hoc-mon.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF102', 'F102', 'https://tse2.explicit.bing.net/th?id=OIP.uVtAL6tbQZpelax1YfzNxQHaD4&pid=Api&P=0&w=360&h=189', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF103', 'F103', 'https://tse4.mm.bing.net/th?id=OIP.hUes9BzDz3AsFksu3VnQeQHaEo&pid=Api&P=0&w=266&h=166', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	('IF104', 'F104', 'https://vanduchay.com/wp-content/uploads/2021/06/108-DauHuChienSaOt-3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF105', 'F105', 'https://tse4.mm.bing.net/th?id=OIP.nR4YwzZ9PqAg2li-2XNgQAHaE8&pid=Api&P=0&w=320&h=213', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF106', 'F106', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/linhpt/que-nha-pham-ngoc-thach/nha-hang-que-nha-pham-ngoc-thach-10.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF107', 'F107', 'https://tse3.mm.bing.net/th?id=OIP.1ClFPEL0FAh7_I_L19gOuQHaE0&pid=Api&P=0&w=263&h=171', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF108', 'F108', 'https://pasgo.vn/Upload/anh-chi-tiet/quan-ut-ca-mau-dien-bien-phu-2-normal-12063613257.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF109', 'F109', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/utcamau/quan-an-ut-ca-mau-dien-bien-phu-mon-an-moi-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF110', 'F110', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/utcamau/quan-an-ut-ca-mau-dien-bien-phu-mon-an-moi-5.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF111', 'F111', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/utcamau/quan-an-ut-ca-mau-dien-bien-phu-mon-an-moi-8.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF112', 'F112', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/utcamau/Ut-ca-mau14.JPG', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	('IF113', 'F113', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/greengarden/nha-hang-green-garden-fine-wine-dining-kha-can-van-8.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF114', 'F114', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/greengarden/nha-hang-green-garden-fine-wine-dining-kha-can-van-7.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF115', 'F115', 'https://tse4.mm.bing.net/th?id=OIP.UnukQpH_MXc8gXjcoCm6qQHaEK&pid=Api&P=0&w=308&h=173', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF116', 'F116', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/greengarden/nha-hang-green-garden-fine-wine-dining-kha-can-van-5.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF117', 'F117', 'https://media.cooky.vn/recipe/g4/39748/s800x500/cooky-recipe-cover-r39748.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF118', 'F118', 'https://tse2.mm.bing.net/th?id=OIP.2HyQ89tvJhCJZs0KcLolSQHaE7&pid=Api&P=0&w=291&h=193', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF119', 'F119', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-1-normal-2169835652132.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF120', 'F120', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-5-normal-2169836152136.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF121', 'F121', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-4-normal-2169835952135.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF122', 'F122', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/bienduong1/nha-hang-bien-duong-1-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

	('IF123', 'F123', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/sargonrooftop/nha-hang-sargon-rooftop-cao-thang-14.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF124', 'F124', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/sargonrooftop/nha-hang-sargon-rooftop-cao-thang-13.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF125', 'F125', 'https://tse2.mm.bing.net/th?id=OIP.OC8G54SuwYiFo0cEZqhUWgHaE7&pid=Api&P=0&w=278&h=185', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF126', 'F126', 'https://tse4.mm.bing.net/th?id=OIP.SCxbFwfx3q7UyJMcjvxM3AHaE8&pid=Api&P=0&w=287&h=191', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF127', 'F127', 'https://tse1.mm.bing.net/th?id=OIP.5cDtpUC9KdFDu7YDLYgB3wHaE7&pid=Api&P=0&w=276&h=184', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF128', 'F128', 'https://tse4.explicit.bing.net/th?id=OIP.2fhVWXgSZEu1-FBagVlODgHaHa&pid=Api&P=0&w=195&h=195', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF129', 'F129', 'https://tse3.mm.bing.net/th?id=OIP.eJ0Lere71Bxy2kuRWbIAnQHaHa&pid=Api&P=0&w=179&h=179', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF130', 'F130', 'https://tse4.mm.bing.net/th?id=OIP.z_VW3V8PF8hCRkgsJmOmQgHaEK&pid=Api&P=0&w=297&h=167', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	
	('IF131', 'F131', 'https://tse4.mm.bing.net/th?id=OIP.oFb0_LlFMQFOZq_yrm0qSAHaFj&pid=Api&P=0&w=281&h=211', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF132', 'F132', 'https://tse2.mm.bing.net/th?id=OIP.lXuYNKJCPfF3bZ8aow5BrQHaFj&pid=Api&P=0&w=217&h=162', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF133', 'F133', 'https://tse3.mm.bing.net/th?id=OIP.h4rDeh9hBs8MhCEFSviikgHaEc&pid=Api&P=0&w=274&h=164', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
	('IF134', 'F134', 'https://tse4.mm.bing.net/th?id=OIP.-dEA1OFnTeuWUSC5pK9hxwHaD9&pid=Api&P=0&w=348&h=186', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

      ('IF135', 'F135', 'https://www.tuannguyentravel.com/data/images/images2/quy-nhon/cac-mon-an-ngon-o-quy-nhon.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF136', 'F136', 'https://tincuaban.com/wp-content/uploads/2020/07/GOI-CUON-CACH-PHA-3-LOAI-NUOC-CHAM-Goi.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF137', 'F137', 'https://i.pinimg.com/originals/13/34/98/1334983c5a30722730aa01aa8973f137.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF138', 'F138', 'https://tse4.mm.bing.net/th?id=OIP.agLsP6OEF6kOFeicTfCgawHaFj&pid=Api&P=0&w=254&h=190', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF139', 'F139', 'http://haisancoto.com/uploads/images/cac-mon-ngon-tu-tom-su.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      
      ('IF140', 'F140', 'https://imgs.vietnamnet.vn/Images/2017/10/06/09/20171006095950-com-chien-rau-cu-chay.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF141', 'F141', 'https://imgs.vietnamnet.vn/Images/2017/10/06/10/20171006100008-xoi-dua.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF142', 'F142', 'https://imgs.vietnamnet.vn/Images/2017/10/06/10/20171006100022-cha-dau-xanh.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF143', 'F143', 'https://imgs.vietnamnet.vn/Images/2017/10/06/10/20171006100038-lau-nam.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF144', 'F144', 'https://imgs.vietnamnet.vn/Images/2017/10/06/10/20171006100053-chao-nam.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
     
      ('IF145', 'F145', 'https://images.foody.vn/res/g88/873488/prof/s576x330/foody-upload-api-foody-mobile-1-jpg-190102151656.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF146', 'F146', 'https://images.foody.vn/res/g88/870903/prof/s576x330/foody-upload-api-foody-mobile-1-jpg-181225171401.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF147', 'F147', 'https://toplist.vn/images/800px/thaiexpress-lotte-center-295680.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF148', 'F148', 'https://toplist.vn/images/800px/thaiexpress-lotte-center-295681.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
      ('IF149', 'F149', 'https://i1.wp.com/kenhhomestay.com/wp-content/uploads/2019/06/Mon-ngon-moi-ngay-3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
     
('IF150', 'F150', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF151', 'F151', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF152', 'F152', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-4.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF153', 'F153', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-5.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF154', 'F154', 'https://massageishealthy.com/wp-content/uploads/2017/12/nhung-mon-trang-mieng-ngon-nhat-viet-nam-6.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF155', 'F155', 'https://cdn.alongwalker.co/vn/wp-content/uploads/2022/04/25075437/image-top-cac-mon-an-noi-tieng-nhat-nuoc-my-165082287798247.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF156', 'F156', 'https://cdn.alongwalker.co/vn/wp-content/uploads/2022/04/25075438/image-top-cac-mon-an-noi-tieng-nhat-nuoc-my-165082287851314.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF157', 'F157', 'https://cdn.alongwalker.co/vn/wp-content/uploads/2022/04/25075439/image-top-cac-mon-an-noi-tieng-nhat-nuoc-my-165082287926255.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF158', 'F158', 'https://cdn.alongwalker.co/vn/wp-content/uploads/2022/04/25075440/image-top-cac-mon-an-noi-tieng-nhat-nuoc-my-165082288085346.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF159', 'F159', 'https://cdn.alongwalker.co/vn/wp-content/uploads/2022/04/25075440/image-top-cac-mon-an-noi-tieng-nhat-nuoc-my-165082288018618.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF160', 'F160', 'https://massageishealthy.com/wp-content/uploads/2017/12/nhung-mon-trang-mieng-ngon-nhat-viet-nam-7.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF161', 'F161', 'https://massageishealthy.com/wp-content/uploads/2017/12/nhung-mon-trang-mieng-ngon-nhat-viet-nam-8.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF162', 'F162', 'https://massageishealthy.com/wp-content/uploads/2017/12/nhung-mon-trang-mieng-ngon-nhat-viet-nam-9.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF163', 'F163', 'https://massageishealthy.com/wp-content/uploads/2017/12/nhung-mon-trang-mieng-ngon-nhat-viet-nam-10.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF164', 'F164', 'https://massageishealthy.com/wp-content/uploads/2017/12/h11-1.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF165', 'F165', 'https://statics.vincom.com.vn/xu-huong/nha-hang-sushi/Hokkaido-Sachi-Sushi-nha-hang-sushi.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF166', 'F166', 'https://statics.vincom.com.vn/xu-huong/nha-hang-sushi/Shinsen-Sushi-nha-hang-sushi.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF167', 'F167', 'https://massageishealthy.com/wp-content/uploads/2019/07/cac-mon-ngon-tu-cua-bien-lam-mon-gi-ngon-2.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF168', 'F168', 'https://owa.bestprice.vn/images/articles/uploads/15-mon-an-o-quy-nhon-du-khach-nhat-dinh-phai-thu-5ea65c00ae920.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF169', 'F169', 'https://owa.bestprice.vn/images/articles/uploads/15-mon-an-o-quy-nhon-du-khach-nhat-dinh-phai-thu-5ea65b4fb4517.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF170', 'F170', 'https://owa.bestprice.vn/images/articles/uploads/15-mon-an-o-quy-nhon-du-khach-nhat-dinh-phai-thu-5ea65bd22c2c3.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF171', 'F171', 'https://owa.bestprice.vn/images/articles/uploads/15-mon-an-o-quy-nhon-du-khach-nhat-dinh-phai-thu-5ea65bd22c381.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF172', 'F172', 'https://owa.bestprice.vn/images/articles/uploads/15-mon-an-o-quy-nhon-du-khach-nhat-dinh-phai-thu-5ea65c00aea17.jpg', '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF173', 'F173', 'https://chuphinhmenu.com/wp-content/uploads/2019/05/chup-hinh-mon-an-menu-nha-hang-quan-2-2019.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF174', 'F174', 'https://pasgo.vn/Upload/anh-chi-tiet/hem-quan-hoang-cau-6-normal-1296060627922.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF175', 'F175', 'https://pasgo.vn/Upload/anh-chi-tiet/hem-quan-hoang-cau-10-normal-1296061927926.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF176', 'F176', 'https://pasgo.vn/Upload/anh-chi-tiet/hem-quan-hoang-cau-9-normal-1296061227925.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),

('IF177', 'F177', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-little-door-ton-that-thiep-2-normal-1919783833778.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF178', 'F178', 'https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-little-door-ton-that-thiep-4-normal-1919784033780.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000'),
('IF179', 'F179', 'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/the-little-door/nha-hang-the-little-door-ton-that-thiep-1.jpg' , '2020-03-02 00:00:00.000', '2021-12-02 00:00:00.000')


	/* images restaurant 1 nhà hàng la 1 hình */ 
INSERT INTO ImagesRestaurant
	(idImagesRestaurant,idRestaurant,urlRestaurant,createdAt,updatedAt)
VALUES
	('IM01', 'R01', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000716793078/Brunch%2520and%2520Beverage%2520at%2520East%2520West%2520Brewing%2520Co.-39a95156-2c3f-4074-9ef1-da01ead93e61.jpeg?_src=imagekit&tr=c-at_max,h-512,q-60,w-720', '2020-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM02', 'R01', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000716793078/Brunch%2520and%2520Beverage%2520at%2520East%2520West%2520Brewing%2520Co.-8aab183d-5993-4e2e-b577-c465dbc60cee.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2020-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM03', 'R01', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000716793078/Brunch%2520and%2520Beverage%2520at%2520East%2520West%2520Brewing%2520Co.-94fb463d-652a-4bba-a9b0-e8b2da45cb15.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2020-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM04', 'R01', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000716793078/Brunch%2520and%2520Beverage%2520at%2520East%2520West%2520Brewing%2520Co.-b25006ac-3cbe-4861-a643-3054583c4b3c.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2020-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM05', 'R02', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001621918605/Route%252066%2520Cafe%2527%2520Da%2520Lat-94b79f7d-6c58-412c-afc7-53c75400d017.jpeg?_src=imagekit&tr=c-at_max,h-512,q-60,w-720', '2020-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM06', 'R02', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001621918605/Route%252066%2520Cafe%2527%2520Da%2520Lat-28c444a8-e71c-4f25-a4fd-0d11579fd7d2.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM07', 'R02', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001621918605/Route%252066%2520Cafe%2527%2520Da%2520Lat-9e1bc8cd-4fe0-4672-b8dc-daf2b2b2cb20.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM08', 'R02', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2001621918605/Route%252066%2520Cafe%2527%2520Da%2520Lat-c8ee0cb7-f099-42af-95ce-4a690e8676cf.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
	('IM09', 'R03', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/3941547116401/International%2520Buffet%2520Vouchers%2520at%2520LOTTE%2520Hotel%2520Saigon-13dc2307-5db8-4f16-9bde-bdcf29634e28.jpeg?_src=imagekit&tr=c-at_max,h-1280,q-60,w-720', '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
      
('IM10', 'R03', 'https://tse1.mm.bing.net/th?id=OIP.KyyDp5GfZnJtNZO4iqMx6gHaE8&pid=Api&P=0&w=255&h=170' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM11', 'R03', 'https://tse4.mm.bing.net/th?id=OIP.MNtSvcoLRYJD62CXKf-J4QHaE8&pid=Api&P=0&w=255&h=170' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM12', 'R03', 'https://tse4.mm.bing.net/th?id=OIP.jE3jyD0m_pzjetHr0qy3gwHaE6&pid=Api&P=0&w=256&h=170' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM13', 'R04', 'https://tse1.mm.bing.net/th?id=OIP.AuiOZmNDa8UNxm_rAKdRHwHaE8&pid=Api&P=0&w=255&h=170' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM14', 'R04', 'https://tse4.mm.bing.net/th?id=OIP.xnxN_R35nON7G_F8DTvR0wHaFj&pid=Api&P=0&w=277&h=207' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM15', 'R04', 'https://tse2.mm.bing.net/th?id=OIP.RhIB8jPjX1akuxfpdikinwHaE8&pid=Api&P=0&w=255&h=170' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM16', 'R04', 'https://tse1.mm.bing.net/th?id=OIP.CmpswwfOBaqZNE9TLfM7LQHaD8&pid=Api&P=0&w=390&h=208' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM17', 'R05', ' https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/6936616846199/BAO%2520ngon%2520Restaurant%2520in%2520Nha%2520Trang%2520-721fb0d6-54e0-4028-8f26-670daa3a98e8.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-1280,q-60,w-720' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM18', 'R05', ' https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/6936616846199/BAO%2520ngon%2520Restaurant%2520in%2520Nha%2520Trang%2520-b4fdd3a8-8119-44c2-a4c3-c3e8023eef34.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-1280,q-60,w-720' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM19', 'R05', ' https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/6936616846199/BAO%2520ngon%2520Restaurant%2520in%2520Nha%2520Trang%2520-5b08f79f-5f0f-4a9f-bc4a-a214e75f39c1.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-1280,q-60,w-720' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM20', 'R05', ' https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/6936616846199/BAO%2520ngon%2520Restaurant%2520in%2520Nha%2520Trang%2520-9539a8ef-9426-4db5-9e59-16f2bcbc50b9.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-1280,q-60,w-720' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM21', 'R06', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-switch-ngo-duc-ke-14-normal-2166325748102.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM22', 'R06', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-switch-ngo-duc-ke-12-normal-2166325848103.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM23', 'R06', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-9.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM24', 'R06', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/nguyenhuong/melodie/nha-hang-la-melodie-ngo-duc-ke-10.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM25', 'R07', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-9-normal-2152227118806.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM26', 'R07', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-11-normal-2152227418808.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM27', 'R07', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-10-normal-2152227318807.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM28', 'R07', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-on-yasai-shabu-shabu-aeon-mall-tan-phu-12-normal-2152227518809.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM29', 'R08', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-ky-dong-12-normal-674305820436.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM30', 'R08', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-10-normal-1255625920434.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM31', 'R08', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-11-normal-1255626120435.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM32', 'R08', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-lobster-bay-hai-san-kieu-my-ky-dong-9-normal-1255625720433.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM33', 'R09', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-la-maison-wine-grill-bar-nam-ky-khoi-nghia-1-normal-355384327239.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM34', 'R09', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-la-maison-wine-grill-bar-nam-ky-khoi-nghia-3-normal-355385727241.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM35', 'R09', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-la-maison-wine-grill-bar-nam-ky-khoi-nghia-4-normal-355387027242.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM36', 'R09', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-la-maison-wine-grill-bar-nam-ky-khoi-nghia-8-normal-355388327246.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM37', 'R10', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-chang-kang-kung-van-hanh-mall-12-normal-491556929723.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM38', 'R10', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-chang-kang-kung-van-hanh-mall-9-100-491555629720.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM39', 'R10', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-chang-kang-kung-van-hanh-mall-10-normal-491555829721.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM40', 'R10', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-chang-kang-kung-van-hanh-mall-11-normal-491556529722.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM41', 'R11', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-kobe-teppanyaki-13a-tu-xuong-9-normal-121725410864.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM42', 'R11', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-kobe-teppanyaki-13a-tu-xuong-10-normal-121725510865.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM43', 'R11', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-kobe-teppanyaki-13a-tu-xuong-12-normal-121725710867.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM44', 'R11', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-kobe-teppanyaki-13a-tu-xuong-11-normal-121725610866.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM45', 'R12', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-el-gaucho-steakhouse-hai-ba-trung-7-normal-1695438547682.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM46', 'R12', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-el-gaucho-steakhouse-hai-ba-trung-9-normal-1695439247684.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM47', 'R12', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-el-gaucho-steakhouse-hai-ba-trung-11-normal-1695439947687.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM48', 'R12', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-el-gaucho-steakhouse-hai-ba-trung-12-normal-1695440147688.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM49', 'R13', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-log-gem-center-1-normal-1985567412963.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM50', 'R13', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-log-gem-center-2-normal-1985757112964.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM51', 'R13', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-log-gem-center-6-normal-1985568112968.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM52', 'R13', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-the-log-gem-center-4-normal-1985567712966.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM53', 'R14', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/hoaviensonthuy/nha-hang-hoa-vien-son-thuy-long-thanh-my-khong-gian-1.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM54', 'R14', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/hoaviensonthuy/nha-hang-hoa-vien-son-thuy-long-thanh-my-khong-gian-5.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM55', 'R14', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/hoaviensonthuy/nha-hang-hoa-vien-son-thuy-long-thanh-my-khong-gian-11.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM56', 'R14', ' https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/vuvu/hoaviensonthuy/nha-hang-hoa-vien-son-thuy-long-thanh-my-khong-gian-4.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM57', 'R15', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-12-normal-125415413182.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM58', 'R15', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-11-normal-125415313181.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM59', 'R15', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-9-normal-125415113179.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM60', 'R15', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-com-nieu-sai-gon-tu-xuong-slide-2-normal-125414313172.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM61', 'R16', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-que-nha-pham-ngoc-thach-slide-9-normal-12114248936.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM62', 'R16', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-que-nha-pham-ngoc-thach-slide-10-normal-12116208937.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM63', 'R16', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-que-nha-pham-ngoc-thach-slide-11-normal-12092148939.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM64', 'R16', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-que-nha-pham-ngoc-thach-slide-12-normal-12081698940.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM65', 'R17', ' https://pasgo.vn/Upload/anh-chi-tiet/quan-ut-ca-mau-dien-bien-phu-12-normal-12063699355.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM66', 'R17', ' https://pasgo.vn/Upload/anh-chi-tiet/quan-ut-ca-mau-dien-bien-phu-9-normal-12115889352.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM67', 'R17', ' https://pasgo.vn/Upload/anh-chi-tiet/quan-ut-ca-mau-dien-bien-phu-10-normal-12058559353.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM68', 'R17', ' https://pasgo.vn/Upload/anh-chi-tiet/quan-ut-ca-mau-dien-bien-phu-11-normal-12068069354.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM69', 'R18', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-green-garden-fine-wine-dining-kha-can-van-8-normal-2165522752061.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM70', 'R18', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-green-garden-fine-wine-dining-kha-can-van-9-normal-2165522852062.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM71', 'R18', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-green-garden-fine-wine-dining-kha-can-van-10-normal-2165522952063.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM72', 'R18', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-green-garden-fine-wine-dining-kha-can-van-11-normal-2165523052064.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM73', 'R19', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-7-normal-2169836452138.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM74', 'R19', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-11-normal-2169836852142.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM75', 'R19', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-12-normal-2169836952143.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM76', 'R19', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-bien-duong-1-10-normal-2169836752141.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM77', 'R20', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-sargon-rooftop-cao-thang-3-normal-2154004251885.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'),
('IM78', 'R20', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-sargon-rooftop-cao-thang-2-normal-2151201151884.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM79', 'R20', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-sargon-rooftop-cao-thang-1-normal-2150264151883.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000'), 
('IM80', 'R20', ' https://pasgo.vn/Upload/anh-chi-tiet/nha-hang-sargon-rooftop-cao-thang-9-normal-2150264951891.jpg' , '2021-03-02 22:00:00.000', '2021-03-02 22:00:00.000')

/*Restaurant: 4 images*/
/*  bỏ các thức ăn vào các loai menu **/
INSERT INTO DetailMenu(idFood,idMenu,createdAt,updatedAt,idRestaurant)
VALUES
('F01','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F135','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F136','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F137','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F138','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F139','MN01','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),

('F02','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F140','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F141','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F142','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F143','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),
('F144','MN02','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R01'),

('F03','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F145','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F146','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F147','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F148','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F149','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),

('F04','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F150','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F151','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F152','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F153','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F154','MN04','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),

('F05','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),

('F155','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F156','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F157','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F158','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),
('F159','MN03','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R02'),

('F06','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F160','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F161','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F162','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F163','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F164','MN06','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),

('F07','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),
('F165','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),
('F166','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),
('F167','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),
('F168','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),
('F169','MN07','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R04'),


('F08','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F09','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F10','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F170','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F171','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),
('F172','MN05','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R03'),

('F11','MN08','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R05'),
('F12','MN08','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R05'),
('F13','MN08','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R05'),
('F14','MN08','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R05'),

('F15','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F16','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F173','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F174','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F175','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F176','MN09','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),

('F17','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F18','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F19','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F177','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F178','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),
('F179','MN10','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R06'),

('F20','MN11','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R07'),
('F21','MN11','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R07'),
('F22','MN11','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R07'),
('F23','MN11','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R07'),

('F24','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F25','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F26','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F27','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F28','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F29','MN12','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),

('F30','MN13','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F31','MN13','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F32','MN13','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),
('F33','MN13','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R08'),

('F34','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),
('F35','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),
('F36','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),
('F37','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),
('F38','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),
('F39','MN14','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R09'),

('F40','MN15','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F41','MN15','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F42','MN15','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F43','MN15','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),

('F44','MN16','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F45','MN16','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F46','MN16','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F47','MN16','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),

('F48','MN17','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F49','MN17','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F50','MN17','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F51','MN17','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F52','MN17','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),

('F53','MN18','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F54','MN18','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),
('F55','MN18','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R10'),

('F56','MN19','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R11'),
('F57','MN19','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R11'),
('F58','MN19','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R11'),
('F59','MN19','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R11'),
('F60','MN19','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R11'),

('F61','MN20','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),
('F62','MN20','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),
('F63','MN20','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),

('F64','MN21','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),
('F65','MN21','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),
('F66','MN21','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),
('F67','MN21','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R12'),

('F68','MN22','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F69','MN22','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F70','MN22','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F71','MN22','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F72','MN22','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),

('F73','MN23','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F74','MN23','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F75','MN23','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F76','MN23','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),

('F77','MN24','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F78','MN24','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F79','MN24','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),
('F80','MN24','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R13'),

('F81','MN25','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F82','MN25','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F83','MN25','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F84','MN25','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F85','MN25','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),

('F86','MN26','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F87','MN26','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F88','MN26','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),
('F89','MN26','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R14'),

('F90','MN27','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F91','MN27','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F92','MN27','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F93','MN27','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F94','MN27','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),

('F95','MN28','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F96','MN28','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F97','MN28','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),
('F98','MN28','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R15'),

('F99','MN29','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F100','MN29','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F101','MN29','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F102','MN29','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F103','MN29','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),

('F104','MN30','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F105','MN30','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F106','MN30','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),
('F107','MN30','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R16'),

('F108','MN31','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R17'),
('F109','MN31','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R17'),
('F110','MN31','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R17'),
('F111','MN31','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R17'),
('F112','MN31','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R17'),

('F113','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),
('F114','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),
('F115','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),
('F116','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),
('F117','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),
('F118','MN32','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R18'),

('F119','MN33','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R19'),
('F120','MN33','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R19'),
('F121','MN33','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R19'),
('F122','MN33','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R19'),

('F123','MN34','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F124','MN34','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F125','MN34','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F126','MN34','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),

('F127','MN35','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F128','MN35','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F129','MN35','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F130','MN35','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),

('F131','MN36','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F132','MN36','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F133','MN36','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20'),
('F134','MN36','2020-03-02 06:00:00.000','2030-03-02 22:00:00.000','R20')


