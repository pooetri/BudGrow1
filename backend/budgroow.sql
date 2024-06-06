-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 10:41 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `budgroow`
--

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `analyticsID` int(11) NOT NULL,
  `productCategory` varchar(255) NOT NULL,
  `totalSpent` decimal(10,2) NOT NULL,
  `totalQuantity` decimal(10,2) NOT NULL,
  `bought_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` varchar(6) NOT NULL CHECK (`categoryID` regexp '^CT[0-9]{3}$'),
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
('CT001', 'Fruits'),
('CT002', 'fruit'),
('CT003', 'dairy'),
('CT004', 'bread'),
('CT005', 'poultry'),
('CT006', 'meat'),
('CT007', 'seafood'),
('CT008', 'frozen food');

-- --------------------------------------------------------

--
-- Table structure for table `compareproduct`
--

CREATE TABLE `compareproduct` (
  `groceryID` varchar(6) NOT NULL,
  `storeProductID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groceryitem`
--

CREATE TABLE `groceryitem` (
  `groceryID` varchar(6) NOT NULL CHECK (`groceryID` regexp '^PR[0-9]{3}$'),
  `groceryName` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `groceryPrice` decimal(10,2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `categoryID` varchar(6) DEFAULT NULL,
  `imageURL` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groceryitem`
--

INSERT INTO `groceryitem` (`groceryID`, `groceryName`, `brand`, `weight`, `groceryPrice`, `notes`, `categoryID`, `imageURL`) VALUES
('PR001', 'Apple', 'BrandA', '400', '7000.00', 'Fresh apples', 'CT001', 'https://drive.google.com/file/d/1KH71nDniQIMLOJECGsTvQkWKdie4JHSl/view?usp=drive_link'),
('PR002', 'Banana', 'BrandB', '400', '5000.00', 'Organic bananas', 'CT002', 'https://drive.google.com/file/d/1P0fKIA6VOuCqsiKIYt-hIS81OS7z1WlF/view?usp=drive_link'),
('PR003', 'Milk', 'DairyFarm', '1L', '22000.00', 'Whole milk', 'CT003', 'https://drive.google.com/file/d/1Dk7OmD11uYSSXFC29P_Jnzfv3m3dljQ_/view?usp=drive_link'),
('PR004', 'Bread', 'BakeryBest', '500', '19000.00', 'Whole grain bread', 'CT004', 'https://drive.google.com/file/d/1lSR9jEpCx1Xwf6LIKgvwhaAJtgJHphlQ/view?usp=drive_link'),
('PR005', 'Chicken Breast', 'PoultryFresh', '700', '24000.00', 'Boneless chicken breast', 'CT005', 'https://drive.google.com/file/d/1CUnjkwk7rftr-3S4Oc9rMRObhpObitBk/view?usp=drive_link'),
('PR006', 'Beef Steak', 'MeatLovers', '150', '70000.00', 'Ribeye steak', 'CT006', ''),
('PR007', 'Salmon', 'SeaCatch', '1kg', '48000.00', 'Fresh salmon fillet', 'CT007', ''),
('PR008', 'Frozen Peas', 'FreezeIt', '1000', '35000.00', 'Green peas', 'CT008', ''),
('PR009', 'Cheese', 'DairyDelight', '200', '40000.00', 'Cheddar cheese', 'CT003', ''),
('PR010', 'Shrimp', 'SeaFresh', '700', '50000.00', 'Jumbo shrimp', 'CT007', '');

-- --------------------------------------------------------

--
-- Table structure for table `grocerylist`
--

CREATE TABLE `grocerylist` (
  `itemListID` int(11) NOT NULL,
  `userID` varchar(6) DEFAULT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `groceryID` varchar(6) DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `isBought` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `storeID` varchar(6) NOT NULL CHECK (`storeID` regexp '^ST[0-9]{3}$'),
  `storeName` varchar(255) NOT NULL,
  `storeLocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`storeID`, `storeName`, `storeLocation`) VALUES
('ST001', 'Supermarket Segar', 'Jl Raya A1'),
('ST002', 'Hypermart', 'Jl Raya A2'),
('ST003', 'Carrefour', 'Jl Raya B1'),
('ST004', 'Lotte Mart', 'Jl Raya B2'),
('ST005', 'Giant', 'Jl Raya C1');

-- --------------------------------------------------------

--
-- Table structure for table `storeproduct`
--

CREATE TABLE `storeproduct` (
  `storeProductID` varchar(6) NOT NULL CHECK (`storeProductID` regexp '^SP[0-9]{3}$'),
  `storeProductName` varchar(255) NOT NULL,
  `storePrice` decimal(10,2) NOT NULL,
  `storeID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `storeproduct`
--

INSERT INTO `storeproduct` (`storeProductID`, `storeProductName`, `storePrice`, `storeID`) VALUES
('SP001', 'Fried Chicken', '25000.00', 'ST001'),
('SP001', 'Fried Chicken', '24000.00', 'ST002'),
('SP001', 'Fried Chicken', '26000.00', 'ST003'),
('SP001', 'Fried Chicken', '25000.00', 'ST004'),
('SP001', 'Fried Chicken', '24000.00', 'ST005'),
('SP002', 'Pizza', '50000.00', 'ST001'),
('SP002', 'Pizza', '51000.00', 'ST002'),
('SP002', 'Pizza', '53000.00', 'ST003'),
('SP002', 'Pizza', '52000.00', 'ST004'),
('SP002', 'Pizza', '51000.00', 'ST005'),
('SP003', 'Duck Breast', '48000.00', 'ST001'),
('SP003', 'Duck Breast', '47000.00', 'ST002'),
('SP003', 'Duck Breast', '45000.00', 'ST003'),
('SP003', 'Duck Breast', '46000.00', 'ST004'),
('SP003', 'Duck Breast', '45000.00', 'ST005'),
('SP004', 'Burger', '23000.00', 'ST001'),
('SP004', 'Burger', '21000.00', 'ST002'),
('SP004', 'Burger', '20000.00', 'ST003'),
('SP004', 'Burger', '21000.00', 'ST004'),
('SP004', 'Burger', '22000.00', 'ST005'),
('SP005', 'Butter', '41000.00', 'ST001'),
('SP005', 'Butter', '42000.00', 'ST002'),
('SP005', 'Butter', '41000.00', 'ST003'),
('SP005', 'Butter', '40000.00', 'ST004'),
('SP005', 'Butter', '43000.00', 'ST005'),
('SP006', 'Chicken Breast', '36000.00', 'ST001'),
('SP006', 'Chicken Breast', '36000.00', 'ST002'),
('SP006', 'Chicken Breast', '38000.00', 'ST003'),
('SP006', 'Chicken Breast', '37000.00', 'ST004'),
('SP006', 'Chicken Breast', '35000.00', 'ST005'),
('SP007', 'Steak', '80000.00', 'ST001'),
('SP007', 'Steak', '90000.00', 'ST002'),
('SP007', 'Steak', '83000.00', 'ST003'),
('SP007', 'Steak', '85000.00', 'ST004'),
('SP007', 'Steak', '88000.00', 'ST005'),
('SP008', 'Salad', '26000.00', 'ST001'),
('SP008', 'Salad', '28000.00', 'ST002'),
('SP008', 'Salad', '25000.00', 'ST003'),
('SP008', 'Salad', '27000.00', 'ST004'),
('SP008', 'Salad', '26000.00', 'ST005'),
('SP009', 'Ice Cream', '33000.00', 'ST001'),
('SP009', 'Ice Cream', '31000.00', 'ST002'),
('SP009', 'Ice Cream', '31000.00', 'ST003'),
('SP009', 'Ice Cream', '30000.00', 'ST004'),
('SP009', 'Ice Cream', '32000.00', 'ST005'),
('SP010', 'Chocolate Cake', '52000.00', 'ST001'),
('SP010', 'Chocolate Cake', '50000.00', 'ST002'),
('SP010', 'Chocolate Cake', '53000.00', 'ST003'),
('SP010', 'Chocolate Cake', '52000.00', 'ST004'),
('SP010', 'Chocolate Cake', '51000.00', 'ST005'),
('SP011', 'Fresh Milk', '22000.00', 'ST001'),
('SP011', 'Fresh Milk', '21000.00', 'ST002'),
('SP011', 'Fresh Milk', '23000.00', 'ST003'),
('SP011', 'Fresh Milk', '20000.00', 'ST004'),
('SP011', 'Fresh Milk', '21000.00', 'ST005'),
('SP012', 'Crab', '68000.00', 'ST001'),
('SP012', 'Crab', '71000.00', 'ST002'),
('SP012', 'Crab', '69000.00', 'ST003'),
('SP012', 'Crab', '70000.00', 'ST004'),
('SP012', 'Crab', '69000.00', 'ST005'),
('SP013', 'Squid', '26000.00', 'ST001'),
('SP013', 'Squid', '27000.00', 'ST002'),
('SP013', 'Squid', '25000.00', 'ST003'),
('SP013', 'Squid', '28000.00', 'ST004'),
('SP013', 'Squid', '27000.00', 'ST005'),
('SP014', 'Salmon', '59000.00', 'ST001'),
('SP014', 'Salmon', '57000.00', 'ST002'),
('SP014', 'Salmon', '56000.00', 'ST003'),
('SP014', 'Salmon', '58000.00', 'ST004'),
('SP014', 'Salmon', '55000.00', 'ST005'),
('SP015', 'Baguette', '33000.00', 'ST001'),
('SP015', 'Baguette', '30000.00', 'ST002'),
('SP015', 'Baguette', '32000.00', 'ST003'),
('SP015', 'Baguette', '31000.00', 'ST004'),
('SP015', 'Baguette', '34000.00', 'ST005'),
('SP016', 'Yogurt', '16000.00', 'ST001'),
('SP016', 'Yogurt', '18000.00', 'ST002'),
('SP016', 'Yogurt', '15000.00', 'ST003'),
('SP016', 'Yogurt', '17000.00', 'ST004'),
('SP016', 'Yogurt', '16500.00', 'ST005'),
('SP017', 'Cheese', '13000.00', 'ST001'),
('SP017', 'Cheese', '11000.00', 'ST002'),
('SP017', 'Cheese', '12000.00', 'ST003'),
('SP017', 'Cheese', '10000.00', 'ST004'),
('SP017', 'Cheese', '14000.00', 'ST005'),
('SP018', 'Chicken Wings', '18000.00', 'ST001'),
('SP018', 'Chicken Wings', '20000.00', 'ST002'),
('SP018', 'Chicken Wings', '21000.00', 'ST003'),
('SP018', 'Chicken Wings', '19000.00', 'ST004'),
('SP018', 'Chicken Wings', '20500.00', 'ST005'),
('SP019', 'Beef Ribs', '115000.00', 'ST001'),
('SP019', 'Beef Ribs', '120000.00', 'ST002'),
('SP019', 'Beef Ribs', '113000.00', 'ST003'),
('SP019', 'Beef Ribs', '118000.00', 'ST004'),
('SP019', 'Beef Ribs', '110000.00', 'ST005'),
('SP020', 'Wheat Bread', '23500.00', 'ST001'),
('SP020', 'Wheat Bread', '22000.00', 'ST002'),
('SP020', 'Wheat Bread', '24000.00', 'ST003'),
('SP020', 'Wheat Bread', '22000.00', 'ST004'),
('SP020', 'Wheat Bread', '23000.00', 'ST005'),
('SP021', 'Apple', '12000.00', 'ST001'),
('SP021', 'Apple', '11000.00', 'ST002'),
('SP021', 'Apple', '10000.00', 'ST003'),
('SP021', 'Apple', '11000.00', 'ST004'),
('SP021', 'Apple', '13000.00', 'ST005'),
('SP022', 'Banana', '5000.00', 'ST001'),
('SP022', 'Banana', '7000.00', 'ST002'),
('SP022', 'Banana', '8000.00', 'ST004'),
('SP022', 'Banana', '6500.00', 'ST005'),
('SP023', 'Orange', '11000.00', 'ST001'),
('SP023', 'Orange', '12000.00', 'ST002'),
('SP023', 'Orange', '13000.00', 'ST003'),
('SP023', 'Orange', '12000.00', 'ST004'),
('SP023', 'Orange', '10000.00', 'ST005'),
('SP024', 'Grapes', '23000.00', 'ST001'),
('SP024', 'Grapes', '20000.00', 'ST002'),
('SP024', 'Grapes', '22000.00', 'ST003'),
('SP024', 'Grapes', '21000.00', 'ST004'),
('SP024', 'Grapes', '22500.00', 'ST005'),
('SP025', 'Strawberries', '35000.00', 'ST001'),
('SP025', 'Strawberries', '34000.00', 'ST002'),
('SP025', 'Strawberries', '33000.00', 'ST003'),
('SP025', 'Strawberries', '30000.00', 'ST004'),
('SP025', 'Strawberries', '31000.00', 'ST005'),
('SP026', 'Carrots', '15000.00', 'ST001'),
('SP026', 'Carrots', '18000.00', 'ST002'),
('SP026', 'Carrots', '16000.00', 'ST003'),
('SP026', 'Carrots', '16500.00', 'ST004'),
('SP026', 'Carrots', '17000.00', 'ST005'),
('SP027', 'Brocolli', '22500.00', 'ST001'),
('SP027', 'Brocolli', '23000.00', 'ST002'),
('SP027', 'Brocolli', '21000.00', 'ST003'),
('SP027', 'Brocolli', '20000.00', 'ST004'),
('SP027', 'Brocolli', '22000.00', 'ST005'),
('SP028', 'Lettuce', '12000.00', 'ST001'),
('SP028', 'Lettuce', '10000.00', 'ST002'),
('SP028', 'Lettuce', '13000.00', 'ST003'),
('SP028', 'Lettuce', '11000.00', 'ST004'),
('SP028', 'Lettuce', '11500.00', 'ST005'),
('SP029', 'Tomatoes', '22500.00', 'ST001'),
('SP029', 'Tomatoes', '23500.00', 'ST002'),
('SP029', 'Tomatoes', '21000.00', 'ST003'),
('SP029', 'Tomatoes', '22000.00', 'ST004'),
('SP029', 'Tomatoes', '20500.00', 'ST005'),
('SP030', 'Potatoes', '18000.00', 'ST001'),
('SP030', 'Potatoes', '16000.00', 'ST002'),
('SP030', 'Potatoes', '15000.00', 'ST003'),
('SP030', 'Potatoes', '17000.00', 'ST004'),
('SP030', 'Potatoes', '16500.00', 'ST005');

-- --------------------------------------------------------

--
-- Table structure for table `transactionanalytics`
--

CREATE TABLE `transactionanalytics` (
  `inputID` varchar(6) NOT NULL CHECK (`inputID` regexp '^IN[0-9]{3}$'),
  `itemListID` int(11) DEFAULT NULL,
  `analyticsID` int(11) DEFAULT NULL,
  `inputDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(6) NOT NULL CHECK (`userID` regexp '^UR[0-9]{3}$'),
  `userName` varchar(255) NOT NULL,
  `userLocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`analyticsID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `compareproduct`
--
ALTER TABLE `compareproduct`
  ADD PRIMARY KEY (`groceryID`,`storeProductID`),
  ADD KEY `storeProductID` (`storeProductID`);

--
-- Indexes for table `groceryitem`
--
ALTER TABLE `groceryitem`
  ADD PRIMARY KEY (`groceryID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `grocerylist`
--
ALTER TABLE `grocerylist`
  ADD PRIMARY KEY (`itemListID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `groceryID` (`groceryID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`storeID`);

--
-- Indexes for table `storeproduct`
--
ALTER TABLE `storeproduct`
  ADD PRIMARY KEY (`storeProductID`,`storeID`),
  ADD KEY `storeID` (`storeID`);

--
-- Indexes for table `transactionanalytics`
--
ALTER TABLE `transactionanalytics`
  ADD PRIMARY KEY (`inputID`),
  ADD KEY `itemListID` (`itemListID`),
  ADD KEY `analyticsID` (`analyticsID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `analyticsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grocerylist`
--
ALTER TABLE `grocerylist`
  MODIFY `itemListID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compareproduct`
--
ALTER TABLE `compareproduct`
  ADD CONSTRAINT `compareproduct_ibfk_1` FOREIGN KEY (`groceryID`) REFERENCES `groceryitem` (`groceryID`),
  ADD CONSTRAINT `compareproduct_ibfk_2` FOREIGN KEY (`storeProductID`) REFERENCES `storeproduct` (`storeProductID`);

--
-- Constraints for table `groceryitem`
--
ALTER TABLE `groceryitem`
  ADD CONSTRAINT `groceryitem_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Constraints for table `grocerylist`
--
ALTER TABLE `grocerylist`
  ADD CONSTRAINT `grocerylist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `grocerylist_ibfk_2` FOREIGN KEY (`groceryID`) REFERENCES `groceryitem` (`groceryID`);

--
-- Constraints for table `storeproduct`
--
ALTER TABLE `storeproduct`
  ADD CONSTRAINT `storeproduct_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`);

--
-- Constraints for table `transactionanalytics`
--
ALTER TABLE `transactionanalytics`
  ADD CONSTRAINT `transactionanalytics_ibfk_1` FOREIGN KEY (`itemListID`) REFERENCES `grocerylist` (`itemListID`),
  ADD CONSTRAINT `transactionanalytics_ibfk_2` FOREIGN KEY (`analyticsID`) REFERENCES `analytics` (`analyticsID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
