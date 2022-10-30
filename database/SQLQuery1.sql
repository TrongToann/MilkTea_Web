create database Project1 
use Project1

CREATE TABLE tblRole(
	role varchar(3) Primary key ,
	name nvarchar(20) 
) 

CREATE TABLE tblAccount(
	rID nvarchar(10) PRIMARY KEY NOT NULL,
	userID varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	fullName nvarchar(255) NOT NULL , 
	role varchar(3) FOREIGN KEY REFERENCES tblRole(role) ,  
 	status decimal(2)
)

create table tblCategory(
	cateID decimal(2) PRIMARY KEY,
	name nvarchar(10) 
)

create table tblProduct (
	ID decimal(5) PRIMARY KEY, 
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL, 
	[quantity] decimal(3) ,
	cateID decimal(2) FOREIGN KEY REFERENCES tblCategory(cateID) ,
	status decimal(2) 
)

create table tblOrder(
	orderID varchar(5) PRIMARY KEY , 
	rID nvarchar(10) NOT NULL FOREIGN KEY REFERENCES tblAccount(rID) , 
	total decimal(10) 
)

CREATE TABLE tblOrderDetail ( 
	detailID varchar(5) PRIMARY KEY , 
	orderID varchar(5) FOREIGN KEY REFERENCES tblOrder(orderID) , 
	productID decimal(5) FOREIGN KEY REFERENCES tblProduct(ID) , 
	price [money] NULL ,
	quantity decimal(3) 
)

INSERT INTO tblCategory VALUES (1,'Tea')
INSERT INTO tblCategory VALUES (2,'Smoothy')
INSERT INTO tblCategory VALUES (3,'MilkTea')
INSERT INTO tblCategory VALUES (4,'Others')


INSERT INTO tblProduct VALUES (1,N'Peach Tea','https://hipbcoffee.com:8443/storage/public/29-tra-dao-1601000356.jpg',25000,N'Peach Tea','...',50,1,1) 
INSERT INTO tblProduct VALUES (2,N'Chia Seeds Lemon Honey Tea','https://hipbcoffee.com:8443/storage/public/30-tra-chanh-mat-ong-hat-chia-1601000272.jpg',40000,N'Chia Seeds Lemon Honey Tea','...',50,1,1) 
INSERT INTO tblProduct VALUES (3,N'Strawberry Tea','https://hipbcoffee.com:8443/storage/public/32-tra-olong-dao-dau-tay-1601000245.png',35000,N'Strawberry Tea','...',50,1,1) 
INSERT INTO tblProduct VALUES (4,N'Lychee Tea','https://hipbcoffee.com:8443/storage/public/31-tra-vai-1601000326.jpg',35000,N'Lychee Tea','...',50,1,1) 
INSERT INTO tblProduct VALUES (5,N'Lemon Tea','https://hipbcoffee.com:8443/storage/public/13-be-green-1601000120.jpg',35000,N'Lemon Tea','...',50,1,1) 
INSERT INTO tblProduct VALUES (6,N'Morning Sunshine','https://hipbcoffee.com:8443/storage/public/15-morning-sunshine-1601000086.jpg',25000,N'Morning Sunshine','...',50,1,1) 
INSERT INTO tblProduct VALUES (7,N'Mango Tea','https://hipbcoffee.com:8443/storage/public/12-c-1601000098.jpg',35000,N'Mango Tea','...',50,1,1) 

INSERT INTO tblProduct VALUES (8,N'Smoothy Detox','https://hipbcoffee.com:8443/storage/public/14-abc-1601000140.jpg',50000,N'Smoothy Detox','...',50,2,1) 
INSERT INTO tblProduct VALUES (9,N'Red Beans With Coconut Milk','https://hipbcoffee.com:8443/storage/public/26-dau-do-cot-dua-1586321544.jpg',50000,N'Red Beans With Coconut Milk','...',50,2,1)
INSERT INTO tblProduct VALUES (10,N'Oreo Cookies','https://hipbcoffee.com:8443/storage/public/25-oreo-cookies-1586321484.jpg',50000,N'Oreo Cookies','...',50,2,1)
INSERT INTO tblProduct VALUES (11,N'Smoothy Blueberry','https://hipbcoffee.com:8443/storage/public/22-blueberry-smoothies-1586321453.jpg',50000,N'Smoothy Blueberry','...',50,2,1)
INSERT INTO tblProduct VALUES (12,N'Smoothy Mango','https://hipbcoffee.com:8443/storage/public/23-mango-smoothies-1586321417.jpg',50000,N'Smoothy Mango','...',50,2,1)

INSERT INTO tblProduct VALUES (13,N'Matcha','https://hipbcoffee.com:8443/storage/public/18-matcha-1586321309.jpg',30000,N'Matcha','...',50,4,1)
INSERT INTO tblProduct VALUES (14,N'Chocolate','https://hipbcoffee.com:8443/storage/public/17-chocolate-1586321137.jpg',30000,N'Chocolate','...',50,4,1)
INSERT INTO tblProduct VALUES (15,N'Espresso','https://hipbcoffee.com:8443/storage/public/11-espresso-1586320743.jpg',30000,N'Espresso','...',50,4,1)
INSERT INTO tblProduct VALUES (16,N'Coffee With Coconuts','https://hipbcoffee.com:8443/storage/public/4-ca-phe-sua-dua-1586320521.jpg',40000,N'Coffee With Coconuts','...',50,4,1)
INSERT INTO tblProduct VALUES (17,N'Soothy Drinks','https://hipbcoffee.com:8443/storage/public/21-kumquat-salty-plum-1586321348.jpg',30000,N'Soothy Drinks','...',50,4,1)
INSERT INTO tblProduct VALUES (18,N'White Coffee','https://hipbcoffee.com:8443/storage/public/1-ca-phe-sua-1586320543.jpg',30000,N'White Coffee','...',50,4,1)
INSERT INTO tblProduct VALUES (19,N'Special Vietnamess White Coffee','https://hipbcoffee.com:8443/storage/public/2-bac-xiu-1586320468.jpg',30000,N'Special Vietnamess White Coffee','...',50,4,1)
INSERT INTO tblProduct VALUES (20,N'Black Coffee','https://hipbcoffee.com:8443/storage/public/3-ca-phe-den-1586320560.jpg',30000,N'Black Coffee','...',50,4,1)

INSERT INTO tblProduct VALUES (21,N'MilkTea Caramel','https://hipbcoffee.com:8443/storage/public/9-ice-blended-coffee-1586320971.jpg',30000,N'MilkTea Caramel','...',50,3,1)
INSERT INTO tblProduct VALUES (22,N'Traditional Milktea','https://hipbcoffee.com:8443/storage/public/28-tra-sua-gao-han-quoc-1601000231.jpg',30000,N'Traditional Milk','...',50,3,1)

INSERT INTO tblRole VALUES ('AD','Admin') 
INSERT INTO tblRole VALUES ('US','User') 
INSERT INTO tblRole VALUES ('SEL','Seller') 

INSERT INTO tblAccount VALUES ('A01','admin','1',N'Tôi Là AdMin', 'AD',1)
INSERT INTO tblAccount VALUES ('A02','admin123','1',N'Tôi Là AdMin 2', 'AD',1)
INSERT INTO tblAccount VALUES ('A03','admin456','1',N'Tôi Là AdMin 3', 'AD',1)
INSERT INTO tblAccount VALUES ('A04','admin789','1',N'Tôi Là AdMin 4', 'AD',1)


INSERT INTO tblAccount VALUES ('S01','seller1','1',N'Dang Hoang Viet', 'SEL',1)
INSERT INTO tblAccount VALUES ('S02','seller2','1',N'Hoang Anh Khoa', 'SEL',1)
INSERT INTO tblAccount VALUES ('S03','seller3','1',N'Đoan Gia Bao', 'SEL',1)
INSERT INTO tblAccount VALUES ('S04','seller4','1',N'Nguyen Quoc Huy Chuong', 'SEL',1)


INSERT INTO tblAccount VALUES ('U01','user1','1',N'Trang Quoc Đat', 'US',1)
INSERT INTO tblAccount VALUES ('U02','user2','1',N'Tran Nguyen Đat Phu', 'US',1)
INSERT INTO tblAccount VALUES ('U03','user3','1',N'Phung Nguyên Han', 'US',1)
INSERT INTO tblAccount VALUES ('U04','user4','1',N'Tran Nhat Minh', 'US',1)
INSERT INTO tblAccount VALUES ('U05','user5','1',N'Truong Nhat Tuyen', 'US',1)

INSERT INTO tblOrderDetail(detailID,orderID,productID,price,quantity) VALUES ('D01','Or001','1','23000',5)
INSERT INTO tblOrderDetail(detailID,orderID,productID,price,quantity) VALUES ('D02','Or002','1','23000',5)
INSERT INTO tblOrderDetail(detailID,orderID,productID,price,quantity) VALUES ('D03','Or003','1','23000',5)

SELECT * FROM tblProduct
SELECT * FROM tblCategory
SELECT * FROM tblRole
SELECT * FROM tblAccount
SELECT * FROM tblOrder 
SELECT * FROM tblOrderDetail
SELECT top 1 * FROM tblProduct 
order by id desc
