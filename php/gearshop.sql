CREATE DATABASE  IF NOT EXISTS `gearshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gearshop`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: gearshop
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','admin@gmail.com','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brandId` int NOT NULL AUTO_INCREMENT,
  `brandName` varchar(15) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (2,'Asus'),(3,'Logitech'),(7,'Kingston'),(8,'Acer'),(9,'Msi'),(10,'CoolerMaster'),(11,'Western Digital'),(12,'Gigabyte'),(13,'Zotac'),(14,'Xigmatech'),(15,'Samsung'),(16,'AMD'),(17,'Intel'),(18,'AOC'),(19,'GSkill'),(20,'INWIN');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` varchar(3) NOT NULL,
  `categoryName` varchar(25) NOT NULL,
  `CateImage` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CPU','CPU','images/icon/components.webp'),('CSE','CASE','images/icon/computer-case.png'),('MNB','Mainboard','images/icon/mainboard.png'),('MNT','Monitor','images/icon/monitor.png'),('PSU','PSU','images/icon/power-supply.png'),('RAM','RAM','images/icon/ram.png'),('STR','Storage','images/icon/ssd.png'),('VGA','VGA','images/icon/vga-card.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `stt` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(255) NOT NULL,
  `productId` int NOT NULL,
  `unitprice` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`stt`),
  KEY `FK_Orders_Orderdetails` (`orderId`),
  KEY `FK_Product_Orderdetails` (`productId`),
  CONSTRAINT `FK_Orders_Orderdetails` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `FK_Product_Orderdetails` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` varchar(255) NOT NULL,
  `cus_name` varchar(50) NOT NULL,
  `cus_phone` varchar(50) NOT NULL,
  `cus_email` varchar(50) DEFAULT NULL,
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipAddress` varchar(255) NOT NULL,
  `shipProvince` varchar(255) NOT NULL,
  `shipDistrict` varchar(255) NOT NULL,
  `shipWard` varchar(255) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categoryId` varchar(3) NOT NULL,
  `brandId` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `instock` tinyint NOT NULL,
  `description` text,
  `properties` text,
  `image` varchar(200) DEFAULT NULL,
  `hot` tinyint DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_Cate_Product` (`categoryId`),
  KEY `FK_Brand_Product` (`brandId`),
  CONSTRAINT `FK_Brand_Product` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`),
  CONSTRAINT `FK_Cate_Product` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (18,'AMD Ryzen 5 3400G','CPU',16,5,4390000,1,'\r\nAMD Ryzen 5 3400G được mở khóa ép xung ở mức 4.2GHz, cao hơn 8% so với 2400G có mức xung 3.9GHz. Với 4 nhân 8 luồng, ở xung nhịp cơ bản 3.7GHz nó dễ dàng xử lý các tác vụ văn phòng cùng gaming esports nhẹ nhàng.\r\nĐồ họa tích hợp đi kèm mạnh mẽ, xử lý tốt các game esports tại thời điểm hiện tại 2021\r\nAPU tích hợp đi kèm là VGA Radeon™ RX Vega 11 Graphics là một chip đồ họa đủ mạnh mẽ để thoải mái chơi các game Esport như Liên minh huyền thoại với mức FPS khá cao trên 100 FPS với hệ thống có 8GB Ram đi kèm. Lưu ý là hệ thống này chỉ phát huy mạnh mẽ khi Ram của máy bạn từ 8GB cho đến 16GB Ram là đẹp nhất. Thời buổi bão giá VGA mà bạn muốn xây dựng một hệ thống mới đủ sức chơi những game esports như Liên minh huyền thoại, CS:GO hay GTA V ở mức thiết lập hợp lý thì giải pháp này cũng là một ý tưởng không tồi trong lúc chờ giá VGA hạ nhiệt.','\r\n6MB / 4.2GHz / 4 nhân 8 luồng / AM4\r\n','ryzen_5_3400g.webp',0),(19,'AMD Ryzen 5 3600','CPU',16,5,5290000,1,'\r\nBộ CPU AMD Ryzen 5 3600 của AMD đóng vai trò là đòn đánh trực diện vào vị trí cao cấp của Intel là Core i5-9600K. Sở hữu thông số ấn tượng, 6 nhân, 12 luồng xử lý, bộ nhớ đệm lên tới 32MB, và điều đặc biệt nhất là tốc độ xử lý tối đa khi hoạt động ở chế độ đơn nhân lên tới 4.2GHz, điều mà trước đây chưa bộ CPU Ryzen nào làm được.\r\nAMD Ryzen 5 3600 nâng cấp Hiệu năng trong công việc\r\nĐối với các ứng dụng chuyên dụng trong công việc như render, biên tập video, hình ảnh thì CPU AMD Ryzen 5 3600 là một trong những dòng sản phẩm CPU - Bộ vi xử lý tốt nhất khi mang đến lại tốc độ xử lý rất đáng kinh ngạc, vượt mặt đối thủ trong tầm giá của mình là Core i5-9600K ở các ứng dụng như Blender, V-Ray, Premiere.\r\n\r\nTuy nhiên, ở một vài ứng dụng như Photoshop thì việc sở hữu xung nhịp cao là một lợi thế của Intel tuy nhiên khác biệt là không thực sự đáng kể.','2MB / 4.2GHz / 6 nhân 12 luồng / AM4\r\n\r\n','ryzen_5_3600_gearvn__f01ed63d2d9f4dabb176d1e6a46426ce_grande_da09d179734d4afa96385f08142ad7e3_large.webp',0),(20,'AMD Ryzen 7 3700x','CPU',16,5,8590000,1,'\r\n\r\nCPU Ryzen 7 3700X chạy trên nền tảng socket AM4 - là một trong những mã CPU được nhiều người mong đợi nhất trong list cpu Ryezn 3000 Series. Cùng có 8 nhân/16 luồng như Ryzen 7 3800X, nhưng được AMD xem là “viên kẹo ngọt” trong loạt Ryzen 3000 Series mới được giới thiệu lần này. Sự khác biệt của chiếc CPU này so với 7 3800X là mức TDP của sản phẩm chỉ có 65W và có bộ nhớ đệm 36Mb, xung nhịp cơ bản 3.6Ghz và có thể đạt max Turbo ở 4.4Ghz.','\r\n36MB /3.6GHz /8 nhân 16 luồng\r\n','ryzen_7_gen3_gearvn_e57dcfb17d714ba290fda9c2bb970916_large.webp',1),(21,'Intel Core i5 10500','CPU',17,5,5990000,1,'CPU Intel Core i5-10500 đã khiến thị trường dòng chip tầm trung \"nóng\" hơn rất nhiều. Với 6 nhân 12 luồng, xung nhịp 2.9GHz và turbo boost lên 4.5GHz, quả là là sự chọn tuyệt vời cho việc chơi game cho tới stream game, vượt xa người tiền nhiệm i5-9400F khi không thể hoàn thành tốt việc stream game.\r\n\r\n','12MB / 4.5GHz / 6 Nhân 12 Luồng / LGA 1200\r\n\r\n','intel-core-i5_bcd8923197104f5a926e894d53a2aaed_large.webp',1),(22,'CPU Intel Xeon Gold 6126','CPU',17,5,47000000,1,'Vi xử lý Intel Xeon Gold 6126 là một sản phẩm chuyên dụng cho máy chủ server nằm trong bộ CPU vừa được Intel phát hành vào cuối năm 2017 vừa qua là Intel Xeon Scalable. Sản phẩm này được Intel nhắm tới phân khúc thị trường doanh nghiệp lớn.','\r\n9.25MB / 2.60 Ghz / 12 nhân 24 luồng / LGA 3647\r\n','gearvn-cpu-intel-xeon-gold-6126_ddd24722b3d44bb3bebca4a993055a2a_large.webp',0),(23,'CPU Intel Xeon Platinum 8280','CPU',17,2,285000000,1,'\r\nHãng sản xuất\r\n\r\nIntel\r\n\r\nChủng loại\r\n\r\nXeon® Platinum 8280\r\n\r\nDòng CPU\r\n\r\nXeon\r\n\r\nTốc độ\r\n\r\n2.70 GHz turbo up 4.00 GHz\r\n\r\nBus Ram hỗ trợ\r\n\r\nDDR4-2933\r\n\r\nNhân CPU\r\n\r\n28\r\n\r\nLuồng CPU\r\n\r\n56\r\n\r\nBộ nhớ đệm\r\n\r\n38.5 MB\r\n\r\nTập lệnh\r\n\r\nIntel® SSE4.2, Intel® AVX, Intel® AVX2, Intel® AVX-512\r\n\r\nDây truyền công nghệ\r\n\r\n14 nm\r\n\r\nTDP\r\n\r\n205 W','\r\n38.5 MB / 2.7GHz turbo / 28 nhân 56 luồng / LGA 3647\r\n\r\n','el-xeon-platinum-8280-38-5-mb-2-7ghz-turbo-28-nhan-56-luong-lga-3647-1_6119ab8d51c9468da201e35192de0105_large.webp',0),(24,'Ryzen Threadripper PRO 3955WX','CPU',16,3,29990000,1,'AMD Ryzen Threadripper Pro 3000 là dòng CPU dành cho máy trạm mạnh mẽ nhất hiện nay. Dòng AMD Ryzen Threadripper Pro có mọi thứ cơ bản mà dòng Threadripper trước đó đã có và nâng tầm tất cả lên một đẳng cấp khác bằng cách mở khóa hệ số nhân, hỗ trợ ép xung cho máy trạm, nâng cấp dung lượng bộ nhớ cao hơn và khả năng kết nối thiết bị ngoại vi.\r\n\r\nBứt phá mọi giới hạn với AMD, dòng Ryzen Threadripper Pro trực tiếp đọ sức với dòng Xeon-W của Intel trong phân khúc máy trạm với dòng sản phẩm của AMD cung cấp gấp đôi số lõi / luồng, gấp đôi số làn PCIe và hỗ trợ bộ nhớ 8 kênh.\r\n\r\nMáy trạm chuyên nghiệp đầu tiên hỗ trợ PCIe Gen 4\r\n128 làn PCIe Gen4 với băng thông nhanh gấp 2,5 lần so với thế hệ trước\r\nBăng thông bộ nhớ hỗ trợ 8 kênh ECC RDIMM, LRDIMM và UDIMM DDR4-3200\r\nHỗ trợ RAM lên đến 2TB','Socket sWRX80 / 64MB / 4.3Ghz / 16 nhân 32 luồng\r\n','21728329_threadripper_pro_wof_3d_left_25b0a119dba046b48a288c8a0355b829_large.webp',0),(25,'Intel Core i7 11700K','CPU',17,5,10490000,1,'CPU Intel Core i7-11700K là bộ vi xử lý mới nhất từ nhà Intel thuộc dòng Rocket Lake. Sở hữu những thông số ấn tượng cùng khả năng ép xung, i7-11700K xứng đáng là một trong những chiếc CPU Gen 11 tốt nhất.\r\n\r\nThông số kỹ thuật ấn tượng\r\nCPU Intel Core i7-11700K được sản xuất dựa trên tiến trình 14nm đem lại cho bộ vi xử lý sức mạnh ấn tượng. Với 8 nhân 16 luồng đi kèm với tần số cơ bản là 3.60 GHz và turbo boost lên đến 5.0 GHz, i7-11700K đem lại tốc độ xử lý tác vụ vô cùng nhanh và khả năng hoạt động đa nhiệm mượt mà khi học tập, làm việc và giải trí.\r\n\r\n','16MB / 5.0 GHZ / 8 nhân 16 luồng / LGA 1200\r\n\r\n\r\n','11700k_e04bff802a8e408d80c2ae4df539e7a4_large.webp',0),(26,'ASUS ROG STRIX Z690-A GAMING','MNB',2,3,8990000,1,'Đánh giá chi tiết bo mạch chủ ASUS ROG STRIX Z690-A GAMING WIFI DDR4\r\nBo mạch chủ ASUS ROG STRIX Z690-A GAMING WIFI DDR4 cung cấp nhiều đầu kết nối các thiết bị ngoại vi với hệ thống tạo nên một dàn PC Gaming hoàn chỉnh. Sản phẩm này được Asus đầu tư nghiên cứu và phát triển nhằm đem đến người dùng những trải nghiệm trọn vẹn nhất. \r\n\r\n','4 x DIMM, Tối đa 128GB, DDR4 / 1 x DisplayPort ** / 1 x cổng HDMI ® *** / 1 x khe cắm PCIe 5.0 / 4.0 / 3.0 x16 *\r\n\r\n','rog-strix-z690-a-gaming-wifi-d4-01_30d50276fe2a4bffb36b41f76034cf14_large.webp',1),(27,'ASUS ROG STRIX Z690-F GAMING','MNB',2,3,9490000,1,'\r\nIntel® Socket LGA1700 for 12th Gen Intel® Core™, Pentium® Gold and Celeron® Processors\r\nSupports Intel® Turbo Boost Technology 2.0 and Intel® Turbo Boost Max Technology 3.0**\r\n\r\n  \r\n* Refer to www.asus.com for CPU support list.\r\n\r\n  \r\n** Intel® Turbo Boost Max Technology 3.0 support depends on the CPU types.\r\n* Supported memory types, data rate(Speed), and number of DRAM module vary depending on the CPU and memory configuration, for more information refer to www.asus.com for memory support list.\r\n','\r\nWIFI DDR5 / 4 x DIMM, Max. 128GB, DDR5 / 1 x DisplayPort** / 1 x HDMI®***\r\n\r\n\r\n','rog-strix-z690-a-gaming-wifi-d4-01_30d50276fe2a4bffb36b41f76034cf14_large.webp',0),(28,'GIGABYTE B460M AORUS PRO','MNB',12,3,2390000,1,'\r\nSupport for 10th Generation Intel Core™ i9 processors/Intel Core™ i7 processors/Intel Core™ i5 processors/Intel Core™ i3 processors/Intel Pentium processors/Intel Celeron processors in the LGA1200 package\r\n\r\nL3 cache varies with CPU\r\n\r\n(Please refer to \"CPU Support List\" for more information.)\r\n	\r\nIntel Core™ i9/i7 processors:\r\nSupport for DDR4 2933/2666/2400/2133 MHz memory modules\r\n\r\nIntel Core™ i5/i3/Pentium/Celeron processors:\r\nSupport for DDR4 2666/2400/2133 MHz memory modules\r\n','\r\n4 x DDR4 DIMM sockets supporting up to 128 GB / 1 x DVI-D port / 1 x DisplayPort / 1 x HDMI port\r\n','b460m-aorus-pro-rev-1-1_f0851ae9f9e94ecc93a620ca3cb5223d_large.webp',0),(29,'Màn hình ACER VG240Y S 24\" IPS 165Hz','MNT',8,10,5390000,1,'Thiết kế chuẩn gaming\r\nACER VG240Y S 24\" IPS 165Hz FreeSync là một trong những dòng sản phẩm màn hình chuyên game tràn viền tối ưu không gian. Tấm nền IPS với độ phủ màu lên đến 99% sRGB mang lại hình ảnh mãn nhãn, sắc nét ở mọi góc nhìn, đưa game thủ hòa mình vào thế giới game sống động như thật.\r\nMàn hình ACER VG240Y S 24\" IPS 165Hz FreeSync chuyên game với tốc độ làm mới lên đến 165Hz (overclock) và thời gian phản hồi 0.5ms cực nhanh được thiết kế dành riêng cho game thủ chuyên nghiệp cùng công nghệ AMD® Freesync™ chống xé hình ảnh, loại bỏ hiện tượng bóng mờ mang lại trải nghiệm chơi game mượt và mượt.\r\nCông nghệ Black Boost làm sáng vùng tối trong game mà không gây cháy sáng giúp nhìn thấy nhiều chi tiết hơn. Công nghệ khử nhấp nháy Flicker-less và công nghệ Bluelight Shield lọc tối đa 80% ánh sáng xanh gây hại giúp người dùng hạn chế mỏi mắt, tăng cường trải nghiệm thoải mái khi đắm chìm trong các tựa game đường trường. Công nghệ Low dimming bảo vệ mắt trong môi trường tối.','165Hz / 23.8” (16:9) / 2ms (G to G) 0.5 ms (G to G, Min.) / Normal mode: 1920x1080@144Hz /\r\nOverclocking mode: 1920x1080@165Hz\r\n\r\n\r\n\r\n','acer_vg240y_s_gearvn_b293d08de7c544aea993eb956f482afe_large.webp',1),(30,'Màn hình cong AOC CQ27G2 27\" VA 2K 144Hz FreeSync','MNT',18,3,6300000,1,'\r\nMàn hình cong AOC CQ27G2 là giải pháp hoàn hảo cho những người muốn thưởng thức trò chơi của họ ở độ phân giải QHD. Tấm nền VA 27 inch cong hiển thị hình ảnh có chất lượng tuyệt vời với tốc độ làm mới 144Hz, thời gian phản hồi 1 ms và trải nghiệm FreeSync Premium mượt mà.\r\n','Kích thước màn hình:	27 inch /\r\nĐộ phân giải:	QHD (2560x1440) / \r\nTỉ lệ:	16:9 /\r\nHiển thị màu sắc: 	120% sRGB và 89% Adobe RGB /\r\nTấm nền:	VA / \r\nĐộ tương phản:	3000:1 /\r\nTần số quét:	144Hz\r\n\r\n','aoc_cq27g2_gearvn_59a0d1454449451ca8fcd3a57b884995_large.webp',0),(31,'Màn hình cong GIGABYTE M32QC 32\" VA 2K 170Hz','MNT',12,2,8490000,1,'Màn hình máy tính thường không được đánh giá cao mặc dù đóng một vai trò quan trọng như một kép phụ trong dàn PC Gaming. Nhưng chính kép phụ ấy là nhân tố tạo nên một bộ máy chơi game hoàn chỉnh và cao cấp cũng như mang lại hiệu suất tốt nhất cho người dùng.. Màn hình cong GIGABYTE M32QC đáp ứng đầy đủ các nhu cầu cần thiết cho những gamer chuyên nghiệp. Bạn sẽ không phải tốn quá nhiều tiền nhưng vẫn có được một trải nghiệm chơi game mượt mà trên màn hình GIGABYTE.\r\n\r\n','Độ tương phản	3000: 1 / \r\nGóc nhìn	178 ° (ngang) / 178 ° (dọc) /\r\nMàu sắc hiển thị	8 bit /\r\nThời gian phản hồi	1ms (MPRT) /\r\nTốc độ làm mới	165Hz / OC 170Hz\r\n\r\n','gigabyte_m32qc_gearvn_284c85cb1f6d4cee92925f8b910e5631_large.webp',0),(32,'Nguồn ASUS Rog Thor 1200P - 80 Plus Platinum','PSU',2,3,9990000,1,'\r\n\r\n','\r\n\r\n','rog-thor-1200p_box_psu_5700a08d814447068ea62b231604557d_large.webp',1),(33,'Nguồn ASUS ROG Strix 850G White Edition - 80 Plus Gold','PSU',2,3,5190000,1,'\r\n\r\n','\r\n\r\n','rog-strix-850g-white-01_612cbbdbdef243bbbd6fb3f8c29f86f7_large.webp',0),(34,'Nguồn CoolerMaster V850 SFX - 80 Plus Gold','PSU',10,2,3990000,1,'\r\n\r\n','\r\n\r\n','gearvn-nguon-cooler-master-v850-sfx-gold-850w-01s_5f9e3c0f9635431da04caf7596c75a0e_large.webp',0),(35,'Nguồn Gigabyte Aorus GP-AP850GM - 80 Plus Gold','PSU',12,2,3650000,1,'\r\n\r\n','\r\n\r\n','psu_aorus_850w_gearvn_large.webp',0),(36,'RAM DDR5 G.Skill Trident Z5 RGB 2x16GB 6000mhz Black','RAM',19,5,13990000,1,'\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','\r\n\r\n\r\nLoại bộ nhớ\r\n\r\nDDR5/\r\n\r\nDung lượng\r\n\r\n32GB (16GBx2)/\r\n\r\nBộ đa kênh\r\n\r\nDual Channel Kit/\r\n\r\nTốc độ kiểm chứng\r\n\r\n6000MHz/\r\n\r\nĐộ trễ kiểm chứng\r\n\r\n36-36-36-96 /\r\n\r\nĐiện áp kiểm chứng\r\n\r\n1.35V\r\n\r\n\r\n\r\n\r\n','z51_fde6aa163b894e65a948515bcddbeb06_da925e8d6d674c2aaf5b6dc01485477c.webp',1),(37,'SSD Samsung 870 QVO 4TB 2.5 Inch SATA III','STR',15,1,10990000,1,'\r\n\r\n','Kích thước	2.5\", 6,8mm/\r\nChuần giao tiếp	Sata III 6Gbit/s/\r\nDung lượng	4 TB/\r\nTốc độ đọc:	560 MB/s/\r\nTốc độ ghi:	530 MB/s/\r\nNAND Flash:	Samsung 92-Layer 3D MLC V-NAND 4 bit/\r\nTBW	1440 TB\r\n\r\n','gearvn.webp',1),(38,'SSD Gigabyte Aorus 7000s 2TB M.2 PCIe Gen4 NVMe','STR',12,2,11490000,1,'\r\n\r\n','Kết nối	PCI-Express 4.0 x4, NVMe 1.4/\r\nDung lượng	2TB/\r\nKích thước chuẩn	80.5 x 11.25 x 23.5 mm/\r\nForm factor	M.2 2280/\r\nTốc độ đọc	Up to 7000 MB/s/\r\nTốc độ ghi	Up to 6850 MB/s/\r\n\r\n','02_da699556a0a6496d90a1cc59a911b068_large.webp',0),(39,'SSD AORUS AIC NVMe SSD 1TB RGB','STR',2,3,5550000,1,'\r\n\r\n','Tốc độ đọc:	Up to 3480 MB/s/\r\nTốc độ ghi: 	Up to 2100 MB/s/\r\nRandom Read IOPS:	up to 360K/\r\nRandom Write IOPS: 	up to 510K/\r\nNhiệt độ (Hoạt động)	0°C to 70°C\r\n\r\n','aorus_rgb_aic_nvme_ssd_512gb__gearvn02_37a2856e2b054a5092044c2c2cc00f3b_large.webp',0),(40,'Gigabyte AORUS GeForce RTX 3090 Ti XTREME WATERFORCE 24G','VGA',12,3,84990000,1,'Card màn hình Gigabyte AORUS GeForce RTX 3090 Ti XTREME WATERFORCE 24G là một trong những sản phẩm tốt nhất đến từ hãng Gigabyte. Làm mát hiệu quả với bộ tản nhiệt 3 quạt, giao diện bộ nhớ 24GB, tấm lưng kim loại chắc chắn hứa hẹn mang đến card màn hình “xịn sò” giải quyết mọi nỗi lo về đồ họa của người dùng. \r\n\r\n','Memory Clock	21000 MHz/\r\nCore Clock	1935 MHz (Reference Card: 1860 MHz)/\r\nNhân CUDA 	10752/\r\nDung lượng bộ nhớ	24 GB/\r\nLoại bộ nhớ	GDDR6X/\r\nBus bộ nhớ	384 bit\r\n','gearvn-gigabyte-aorus-geforce-rtx-3090ti-xtreme-waterforce-24g-1_d0618bc4ecb04df2829fb07e5f29cc82_large.webp',0),(41,'Asus Rog Strix LC GeForce RTX 3090 Ti OC edition 24G','VGA',2,3,70990000,1,'Một chiếc card màn hình sở hữu cho mình thiết vô cùng bắt bắt, đi kèm với đó bộ phận tản nhiệt nước hướng đến hiệu quả sử dụng đạt mức tối đa. Là bản nâng cấp từ phiên bản trước, Asus Rog Strix LC GeForce RTX 3090 Ti OC edition sẽ mang đến nguồn sức mạnh mới và là linh kiện trang trí vô cùng bắt mắt cho dàn PC Gaming của chúng ta !\r\n\r\nThiết kế làm mát tối ưu\r\nĐi kèm với chiếc card là bộ phận tản nhiệt nước mạnh mẽ và hiệu quả. Một tấm làm lạnh được tiếp xúc trực tiếp với GPU và VRAM GDDR6X của Asus Rog Strix LC GeForce RTX 3090 Ti OC edition giúp truyền nhiệt nhanh nhất đến cho khu vực làm mát. Phần nhiệt lượng trong còn được phát tán thông qua chiếc quạt tản nhiệt bên phần VGA hoạt động vô cùng yên tĩnh và hiệu quả. Tô điểm thêm đó là 2 chiếc quạt ARGB 120mm bên khu vực tản nhiệt, tạo nên điểm nhấn cho chiếc case máy tính.\r\n\r\n','Bộ nhớ Video	24 GB GDDR6X/\r\nEngine Clock	Chế độ OC: 1980 MHz (Xung nhịp tăng cường)/\r\nChế độ chơi game: 1950 MHz (Xung nhịp tăng cường)/\r\nLõi CUDA	10752/\r\nTốc độ bộ nhớ	21 Gb / giây/\r\nGiao thức bộ nhớ	384-bit\r\n\r\n','33333_71dced9f2b414ec7acfeaa9bde3ea111_large.webp',0),(42,'ASUS ROG Strix GeForce RTX 3090 Gaming White OC edition 24G','VGA',2,4,66990000,1,'\r\n\r\n','Engine đồ họa	NVIDIA® GeForce RTX™3090/\r\nBộ nhớ trong	24GB/\r\nKiểu bộ nhớ	GDDR6X/\r\nBus	384-Bit/\r\nCuda Cores	10496\r\n\r\n','h732__12__bae8536de3fb4607a8aaabec01cb6a65_large.webp',0),(43,'MSI GeForce RTX 3080 Suprim X 12G (LHR)','VGA',9,1,34990000,1,'\r\n\r\n','CORES\r\n\r\n8960 Units/\r\nCORE CLOCKS\r\n\r\nExtreme Mode: 1905 MHz (MSI Center)\r\nBoost: 1890 MHz (GAMING & SILENT Mode)/\r\nMEMORY SPEED\r\n\r\n19 Gbps/\r\nMEMORY\r\n\r\n12GB GDDR6X/\r\nMEMORY BUS\r\n\r\n384-bit\r\n\r\n','msi-geforce-rtx-3080-suprim-x-12g-lhr_ba2ea795584f4a5ca658960533ad846d_large.webp',0),(44,'Case INWIN WINBOT','CSE',20,2,8990000,1,'\r\n\r\n','\r\n\r\n','inwin-winbot-8_da8c7f71169d46aeb9d990db87b3e787_large.webp',0),(45,'Case INWIN X-Frame 2.0','CSE',20,2,35000000,1,'\r\n\r\n','\r\n\r\n','06_45d43a177a8c4c5d877afb08c290086c_large.webp',0),(46,'Case NZXT H710i CRFT Cyberpunk Limited Edition','CSE',2,3,9990000,1,'\r\n\r\n','\r\n\r\n','1638828597-crfth710i-cyberpunkmain3systempng-clear-background_c86029f4352a4901a2435a13121da05b_large.webp',0),(47,'Case Cougar Gemini X','CSE',20,3,19990000,1,'\r\n\r\n','\r\n\r\n','gearvn-case-cougar-gemini-x-808_ecf55e99f86d419d82ee459a0da521b2_large.webp',0),(48,'Case Corsair OBSIDIAN 1000D ( SUPER-TOWER )','CSE',10,2,12990000,1,'\r\n\r\n','\r\n\r\n','gearvn-case-corsair-obsidian-1000d_09f9e49270e0413eb4929986f77cfd23_large.webp',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-10 21:41:44
