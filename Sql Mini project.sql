Create Database CompanyDB;

Use CompanyDB;

-- Q2: CREATE TABLES

Create table Departments
(
Dept_ID Int Primary Key Not Null,
Dept_Name Varchar(50) Not Null,
Location Varchar(50) Not Null
);

Create table Employees
(
EmpID int Primary Key Not Null,
Emp_Name Varchar(50) Not Null,
Gender Enum ('M','F') Not Null,
DOB Date,
HireDate Date,
Salary decimal(10,2) check (Salary >0),
DeptID int Not Null,
ManagerID Int
);

Create table Customers
(
Customer_ID Int Primary Key Not NUll,
Customer_Name Varchar(50) Not Null,
City Varchar(50) Default 'Coimbatore',
Email Varchar(80) unique Not Null,
Phone int Not Null,
JoinDate date Not Null
);

Create table products
(
Product_ID Int Primary Key Not Null,
Product_Name Varchar(50) Not Null,
Category Varchar(50) Not Null,
UnitPrice Decimal(10,2) Not Null,
Stock int Not Null
);

Create table Projects
(
Project_ID Int Primary Key,
Project_Name Varchar(50),
Dept_ID Int,
Budget Decimal(10,2),
Start_Date date
);

Create table Orders
(
Order_ID Int Primary key Not Null,
Customer_ID Int  Not Null,
EmpID Int Not Null,
Project_ID Int Not Null,
OrderDate Date,
Status_Verify Varchar(20) check (Status_Verify in ('Completed','Pending','Cancelled'))
);

Create table OrderDetails
(
OrderDetail_Id Int Primary Key Not Null,
Order_ID Int Not Null,
Product_ID Int Not Null,
Quantity Int Not Null,
UnitPrice Decimal(10,2)
);

Alter Table Orders
Add constraint FK_Orders_EmpID
foreign key (EmpID)
References Employees(EmpID);

Alter Table Orders
Add Constraint FK_Orders_Customer_ID
foreign key (Customer_ID)
references Customers(Customer_ID),
Add Constraint FK_Orders_Project_ID
foreign key (Project_ID)
references Projects(Project_ID);

-- Q3: INSERT DATA

Insert Into Departments
(Dept_ID, Dept_Name, Location)
Values
(101, 'Department1', 'Chennai'),
(102, 'Department2', 'Coimbatore'),
(103, 'Department3', 'Bangalore'),
(104, 'Department4', 'Hyderabad'),
(105, 'Department5', 'Mumbai'),
(106, 'Department6', 'Delhi'),
(107, 'Department7', 'Pune'),
(108, 'Department8', 'Kochi'),
(109, 'Department9', 'Madurai'),
(110, 'Department10', 'Trichy');

Insert Into Departments
(Dept_ID, Dept_Name, Location)
Values
(111, 'Department11', 'Kochi'),
(112, 'Department12', 'Salem'),
(113, 'Department13', 'Madurai'),
(114, 'Department14', 'Chennai'),
(115, 'Department15', 'Coimbatore'),
(116, 'Department16', 'Bangalore'),
(117, 'Department17', 'Trichy'),
(118, 'Department18', 'Kochi'),
(119, 'Department19', 'Salem'),
(120, 'Department20', 'Madurai');

Insert Into Employees
(EmpID, Emp_Name, Gender, DOB, HireDate, Salary, DeptID, ManagerID)
Values
(1, 'Employee1', 'M', '1991-01-15', '2021-06-10', 41500, 101, NULL),
(2, 'Employee2', 'F', '1992-01-15', '2022-06-10', 43000, 102, NULL),
(3, 'Employee3', 'M', '1993-01-15', '2023-06-10', 44500, 103, NULL),
(4, 'Employee4', 'F', '1994-01-15', '2024-06-10', 46000, 104, NULL),
(5, 'Employee5', 'M', '1995-01-15', '2020-06-10', 47500, 105, NULL),
(6, 'Employee6', 'F', '1996-01-15', '2021-06-10', 49000, 106, 1),
(7, 'Employee7', 'M', '1997-01-15', '2022-06-10', 50500, 107, 2),
(8, 'Employee8', 'F', '1998-01-15', '2023-06-10', 52000, 108, 3),
(9, 'Employee9', 'M', '1999-01-15', '2024-06-10', 53500, 109, 4),
(10, 'Employee10', 'F', '1990-01-15', '2020-06-10', 55000, 110, 5),
(11, 'Employee11', 'M', '1991-01-15', '2021-06-10', 56500, 101, 1),
(12, 'Employee12', 'F', '1992-01-15', '2022-06-10', 58000, 102, 2),
(13, 'Employee13', 'M', '1993-01-15', '2023-06-10', 59500, 103, 3),
(14, 'Employee14', 'F', '1994-01-15', '2024-06-10', 61000, 104, 4),
(15, 'Employee15', 'M', '1995-01-15', '2020-06-10', 62500, 105, 5),
(16, 'Employee16', 'F', '1996-01-15', '2021-06-10', 64000, 106, 1),
(17, 'Employee17', 'M', '1997-01-15', '2022-06-10', 65500, 107, 2),
(18, 'Employee18', 'F', '1998-01-15', '2023-06-10', 67000, 108, 3),
(19, 'Employee19', 'M', '1999-01-15', '2024-06-10', 68500, 109, 4),
(20, 'Employee20', 'F', '1990-01-15', '2020-06-10', 70000, 110, 5),
(21, 'Employee21', 'M', '1991-01-15', '2021-06-10', 71500, 101, 1),
(22, 'Employee22', 'F', '1992-01-15', '2022-06-10', 73000, 102, 2),
(23, 'Employee23', 'M', '1993-01-15', '2023-06-10', 74500, 103, 3),
(24, 'Employee24', 'F', '1994-01-15', '2024-06-10', 76000, 104, 4),
(25, 'Employee25', 'M', '1995-01-15', '2020-06-10', 77500, 105, 5),
(26, 'Employee26', 'F', '1996-01-15', '2021-06-10', 79000, 106, 1),
(27, 'Employee27', 'M', '1997-01-15', '2022-06-10', 80500, 107, 2),
(28, 'Employee28', 'F', '1998-01-15', '2023-06-10', 82000, 108, 3),
(29, 'Employee29', 'M', '1999-01-15', '2024-06-10', 83500, 109, 4),
(30, 'Employee30', 'F', '1990-01-15', '2020-06-10', 85000, 110, 5),
(31, 'Employee31', 'M', '1991-01-15', '2021-06-10', 86500, 101, 1),
(32, 'Employee32', 'F', '1992-01-15', '2022-06-10', 88000, 102, 2),
(33, 'Employee33', 'M', '1993-01-15', '2023-06-10', 89500, 103, 3),
(34, 'Employee34', 'F', '1994-01-15', '2024-06-10', 91000, 104, 4),
(35, 'Employee35', 'M', '1995-01-15', '2020-06-10', 92500, 105, 5),
(36, 'Employee36', 'F', '1996-01-15', '2021-06-10', 94000, 106, 1),
(37, 'Employee37', 'M', '1997-01-15', '2022-06-10', 95500, 107, 2),
(38, 'Employee38', 'F', '1998-01-15', '2023-06-10', 97000, 108, 3),
(39, 'Employee39', 'M', '1999-01-15', '2024-06-10', 98500, 109, 4),
(40, 'Employee40', 'F', '1990-01-15', '2020-06-10', 100000, 110, 5),
(41, 'Employee41', 'M', '1991-01-15', '2021-06-10', 101500, 101, 1),
(42, 'Employee42', 'F', '1992-01-15', '2022-06-10', 103000, 102, 2),
(43, 'Employee43', 'M', '1993-01-15', '2023-06-10', 104500, 103, 3),
(44, 'Employee44', 'F', '1994-01-15', '2024-06-10', 106000, 104, 4),
(45, 'Employee45', 'M', '1995-01-15', '2020-06-10', 107500, 105, 5),
(46, 'Employee46', 'F', '1996-01-15', '2021-06-10', 109000, 106, 1),
(47, 'Employee47', 'M', '1997-01-15', '2022-06-10', 110500, 107, 2),
(48, 'Employee48', 'F', '1998-01-15', '2023-06-10', 112000, 108, 3),
(49, 'Employee49', 'M', '1999-01-15', '2024-06-10', 113500, 109, 4),
(50, 'Employee50', 'F', '1990-01-15', '2020-06-10', 115000, 110, 5);

Insert Into Customers
(Customer_ID, Customer_Name, City, Email, Phone, JoinDate)
Values
(201, 'Customer1', 'Chennai', 'customer1@mail.com', '9870000001', '2023-01-10'),
(202, 'Customer2', 'Coimbatore', 'customer2@mail.com', '9870000002', '2023-02-10'),
(203, 'Customer3', 'Bangalore', 'customer3@mail.com', '9870000003', '2023-03-10'),
(204, 'Customer4', 'Hyderabad', 'customer4@mail.com', '9870000004', '2023-04-10'),
(205, 'Customer5', 'Mumbai', 'customer5@mail.com', '9870000005', '2023-05-10'),
(206, 'Customer6', 'Delhi', 'customer6@mail.com', '9870000006', '2023-06-10'),
(207, 'Customer7', 'Pune', 'customer7@mail.com', '9870000007', '2023-07-10'),
(208, 'Customer8', 'Kochi', 'customer8@mail.com', '9870000008', '2023-08-10'),
(209, 'Customer9', 'Madurai', 'customer9@mail.com', '9870000009', '2023-09-10'),
(210, 'Customer10', 'Trichy', 'customer10@mail.com', '9870000010', '2023-10-10'),
(211, 'Customer11', 'Chennai', 'customer11@mail.com', '9870000011', '2023-11-10'),
(212, 'Customer12', 'Coimbatore', 'customer12@mail.com', '9870000012', '2023-12-10'),
(213, 'Customer13', 'Bangalore', 'customer13@mail.com', '9870000013', '2023-01-10'),
(214, 'Customer14', 'Hyderabad', 'customer14@mail.com', '9870000014', '2023-02-10'),
(215, 'Customer15', 'Mumbai', 'customer15@mail.com', '9870000015', '2023-03-10'),
(216, 'Customer16', 'Delhi', 'customer16@mail.com', '9870000016', '2023-04-10'),
(217, 'Customer17', 'Pune', 'customer17@mail.com', '9870000017', '2023-05-10'),
(218, 'Customer18', 'Kochi', 'customer18@mail.com', '9870000018', '2023-06-10'),
(219, 'Customer19', 'Madurai', 'customer19@mail.com', '9870000019', '2023-07-10'),
(220, 'Customer20', 'Trichy', 'customer20@mail.com', '9870000020', '2023-08-10'),
(221, 'Customer21', 'Chennai', 'customer21@mail.com', '9870000021', '2023-09-10'),
(222, 'Customer22', 'Coimbatore', 'customer22@mail.com', '9870000022', '2023-10-10'),
(223, 'Customer23', 'Bangalore', 'customer23@mail.com', '9870000023', '2023-11-10'),
(224, 'Customer24', 'Hyderabad', 'customer24@mail.com', '9870000024', '2023-12-10'),
(225, 'Customer25', 'Mumbai', 'customer25@mail.com', '9870000025', '2023-01-10'),
(226, 'Customer26', 'Delhi', 'customer26@mail.com', '9870000026', '2023-02-10'),
(227, 'Customer27', 'Pune', 'customer27@mail.com', '9870000027', '2023-03-10'),
(228, 'Customer28', 'Kochi', 'customer28@mail.com', '9870000028', '2023-04-10'),
(229, 'Customer29', 'Madurai', 'customer29@mail.com', '9870000029', '2023-05-10'),
(230, 'Customer30', 'Trichy', 'customer30@mail.com', '9870000030', '2023-06-10'),
(231, 'Customer31', 'Chennai', 'customer31@mail.com', '9870000031', '2023-07-10'),
(232, 'Customer32', 'Coimbatore', 'customer32@mail.com', '9870000032', '2023-08-10'),
(233, 'Customer33', 'Bangalore', 'customer33@mail.com', '9870000033', '2023-09-10'),
(234, 'Customer34', 'Hyderabad', 'customer34@mail.com', '9870000034', '2023-10-10'),
(235, 'Customer35', 'Mumbai', 'customer35@mail.com', '9870000035', '2023-11-10'),
(236, 'Customer36', 'Delhi', 'customer36@mail.com', '9870000036', '2023-12-10'),
(237, 'Customer37', 'Pune', 'customer37@mail.com', '9870000037', '2023-01-10'),
(238, 'Customer38', 'Kochi', 'customer38@mail.com', '9870000038', '2023-02-10'),
(239, 'Customer39', 'Madurai', 'customer39@mail.com', '9870000039', '2023-03-10'),
(240, 'Customer40', 'Trichy', 'customer40@mail.com', '9870000040', '2023-04-10'),
(241, 'Customer41', 'Chennai', 'customer41@mail.com', '9870000041', '2023-05-10'),
(242, 'Customer42', 'Coimbatore', 'customer42@mail.com', '9870000042', '2023-06-10'),
(243, 'Customer43', 'Bangalore', 'customer43@mail.com', '9870000043', '2023-07-10'),
(244, 'Customer44', 'Hyderabad', 'customer44@mail.com', '9870000044', '2023-08-10'),
(245, 'Customer45', 'Mumbai', 'customer45@mail.com', '9870000045', '2023-09-10'),
(246, 'Customer46', 'Delhi', 'customer46@mail.com', '9870000046', '2023-10-10'),
(247, 'Customer47', 'Pune', 'customer47@mail.com', '9870000047', '2023-11-10'),
(248, 'Customer48', 'Kochi', 'customer48@mail.com', '9870000048', '2023-12-10'),
(249, 'Customer49', 'Madurai', 'customer49@mail.com', '9870000049', '2023-01-10'),
(250, 'Customer50', 'Trichy', 'customer50@mail.com', '9870000050', '2023-02-10');

Insert Into Products
(Product_ID, Product_Name, Category, UnitPrice, Stock)
Values
(301, 'Product1', 'Category1', 575, 51),
(302, 'Product2', 'Category2', 650, 52),
(303, 'Product3', 'Category3', 725, 53),
(304, 'Product4', 'Category4', 800, 54),
(305, 'Product5', 'Category5', 875, 55),
(306, 'Product6', 'Category1', 950, 56),
(307, 'Product7', 'Category2', 1025, 57),
(308, 'Product8', 'Category3', 1100, 58),
(309, 'Product9', 'Category4', 1175, 59),
(310, 'Product10', 'Category5', 1250, 60),
(311, 'Product11', 'Category1', 1325, 61),
(312, 'Product12', 'Category2', 1400, 62),
(313, 'Product13', 'Category3', 1475, 63),
(314, 'Product14', 'Category4', 1550, 64),
(315, 'Product15', 'Category5', 1625, 65),
(316, 'Product16', 'Category1', 1700, 66),
(317, 'Product17', 'Category2', 1775, 67),
(318, 'Product18', 'Category3', 1850, 68),
(319, 'Product19', 'Category4', 1925, 69),
(320, 'Product20', 'Category5', 2000, 70),
(321, 'Product21', 'Category1', 2075, 71),
(322, 'Product22', 'Category2', 2150, 72),
(323, 'Product23', 'Category3', 2225, 73),
(324, 'Product24', 'Category4', 2300, 74),
(325, 'Product25', 'Category5', 2375, 75);

Insert Into Projects
(Project_ID, Project_Name, Dept_ID, Budget, Start_Date)
Values
(401, 'Project1', 101, 125000, '2024-01-01'),
(402, 'Project2', 102, 150000, '2024-02-01'),
(403, 'Project3', 103, 175000, '2024-03-01'),
(404, 'Project4', 104, 200000, '2024-04-01'),
(405, 'Project5', 105, 225000, '2024-05-01'),
(406, 'Project6', 106, 250000, '2024-06-01'),
(407, 'Project7', 107, 275000, '2024-07-01'),
(408, 'Project8', 108, 300000, '2024-08-01'),
(409, 'Project9', 109, 325000, '2024-09-01'),
(410, 'Project10', 110, 350000, '2024-10-01'),
(411, 'Project11', 101, 375000, '2024-11-01'),
(412, 'Project12', 102, 400000, '2024-12-01'),
(413, 'Project13', 103, 425000, '2024-01-01'),
(414, 'Project14', 104, 450000, '2024-02-01'),
(415, 'Project15', 105, 475000, '2024-03-01'),
(416, 'Project16', 106, 500000, '2024-04-01'),
(417, 'Project17', 107, 525000, '2024-05-01'),
(418, 'Project18', 108, 550000, '2024-06-01'),
(419, 'Project19', 109, 575000, '2024-07-01'),
(420, 'Project20', 110, 600000, '2024-08-01');

Insert Into Orders
(Order_ID, Customer_ID, EmpID, Project_ID, OrderDate, Status_Verify)
Values
(501, 201, 1, 401, '2025-01-15', 'Completed'),
(502, 202, 2, 402, '2025-02-15', 'Pending'),
(503, 203, 3, 403, '2025-03-15', 'Cancelled'),
(504, 204, 4, 404, '2025-04-15', 'Completed'),
(505, 205, 5, 405, '2025-05-15', 'Pending'),
(506, 206, 6, 406, '2025-06-15', 'Cancelled'),
(507, 207, 7, 407, '2025-07-15', 'Completed'),
(508, 208, 8, 408, '2025-08-15', 'Pending'),
(509, 209, 9, 409, '2025-09-15', 'Cancelled'),
(510, 210, 10, 410, '2025-10-15', 'Completed'),
(511, 211, 11, 411, '2025-11-15', 'Pending'),
(512, 212, 12, 412, '2025-12-15', 'Cancelled'),
(513, 213, 13, 413, '2025-01-15', 'Completed'),
(514, 214, 14, 414, '2025-02-15', 'Pending'),
(515, 215, 15, 415, '2025-03-15', 'Cancelled'),
(516, 216, 16, 416, '2025-04-15', 'Completed'),
(517, 217, 17, 417, '2025-05-15', 'Pending'),
(518, 218, 18, 418, '2025-06-15', 'Cancelled'),
(519, 219, 19, 419, '2025-07-15', 'Completed'),
(520, 220, 20, 420, '2025-08-15', 'Pending'),
(521, 221, 21, 401, '2025-09-15', 'Cancelled'),
(522, 222, 22, 402, '2025-10-15', 'Completed'),
(523, 223, 23, 403, '2025-11-15', 'Pending'),
(524, 224, 24, 404, '2025-12-15', 'Cancelled'),
(525, 225, 25, 405, '2025-01-15', 'Completed'),
(526, 226, 26, 406, '2025-02-15', 'Pending'),
(527, 227, 27, 407, '2025-03-15', 'Cancelled'),
(528, 228, 28, 408, '2025-04-15', 'Completed'),
(529, 229, 29, 409, '2025-05-15', 'Pending'),
(530, 230, 30, 410, '2025-06-15', 'Cancelled'),
(531, 231, 31, 411, '2025-07-15', 'Completed'),
(532, 232, 32, 412, '2025-08-15', 'Pending'),
(533, 233, 33, 413, '2025-09-15', 'Cancelled'),
(534, 234, 34, 414, '2025-10-15', 'Completed'),
(535, 235, 35, 415, '2025-11-15', 'Pending'),
(536, 236, 36, 416, '2025-12-15', 'Cancelled'),
(537, 237, 37, 417, '2025-01-15', 'Completed'),
(538, 238, 38, 418, '2025-02-15', 'Pending'),
(539, 239, 39, 419, '2025-03-15', 'Cancelled'),
(540, 240, 40, 420, '2025-04-15', 'Completed'),
(541, 241, 41, 401, '2025-05-15', 'Pending'),
(542, 242, 42, 402, '2025-06-15', 'Cancelled'),
(543, 243, 43, 403, '2025-07-15', 'Completed'),
(544, 244, 44, 404, '2025-08-15', 'Pending'),
(545, 245, 45, 405, '2025-09-15', 'Cancelled'),
(546, 246, 46, 406, '2025-10-15', 'Completed'),
(547, 247, 47, 407, '2025-11-15', 'Pending'),
(548, 248, 48, 408, '2025-12-15', 'Cancelled'),
(549, 249, 49, 409, '2025-01-15', 'Completed'),
(550, 250, 50, 410, '2025-02-15', 'Pending'),
(551, 201, 1, 411, '2025-03-15', 'Cancelled'),
(552, 202, 2, 412, '2025-04-15', 'Completed'),
(553, 203, 3, 413, '2025-05-15', 'Pending'),
(554, 204, 4, 414, '2025-06-15', 'Cancelled'),
(555, 205, 5, 415, '2025-07-15', 'Completed'),
(556, 206, 6, 416, '2025-08-15', 'Pending'),
(557, 207, 7, 417, '2025-09-15', 'Cancelled'),
(558, 208, 8, 418, '2025-10-15', 'Completed'),
(559, 209, 9, 419, '2025-11-15', 'Pending'),
(560, 210, 10, 420, '2025-12-15', 'Cancelled'),
(561, 211, 11, 401, '2025-01-15', 'Completed'),
(562, 212, 12, 402, '2025-02-15', 'Pending'),
(563, 213, 13, 403, '2025-03-15', 'Cancelled'),
(564, 214, 14, 404, '2025-04-15', 'Completed'),
(565, 215, 15, 405, '2025-05-15', 'Pending'),
(566, 216, 16, 406, '2025-06-15', 'Cancelled'),
(567, 217, 17, 407, '2025-07-15', 'Completed'),
(568, 218, 18, 408, '2025-08-15', 'Pending'),
(569, 219, 19, 409, '2025-09-15', 'Cancelled'),
(570, 220, 20, 410, '2025-10-15', 'Completed'),
(571, 221, 21, 411, '2025-11-15', 'Pending'),
(572, 222, 22, 412, '2025-12-15', 'Cancelled'),
(573, 223, 23, 413, '2025-01-15', 'Completed'),
(574, 224, 24, 414, '2025-02-15', 'Pending'),
(575, 225, 25, 415, '2025-03-15', 'Cancelled'),
(576, 226, 26, 416, '2025-04-15', 'Completed'),
(577, 227, 27, 417, '2025-05-15', 'Pending'),
(578, 228, 28, 418, '2025-06-15', 'Cancelled'),
(579, 229, 29, 419, '2025-07-15', 'Completed'),
(580, 230, 30, 420, '2025-08-15', 'Pending'),
(581, 231, 31, 401, '2025-09-15', 'Cancelled'),
(582, 232, 32, 402, '2025-10-15', 'Completed'),
(583, 233, 33, 403, '2025-11-15', 'Pending'),
(584, 234, 34, 404, '2025-12-15', 'Cancelled'),
(585, 235, 35, 405, '2025-01-15', 'Completed'),
(586, 236, 36, 406, '2025-02-15', 'Pending'),
(587, 237, 37, 407, '2025-03-15', 'Cancelled'),
(588, 238, 38, 408, '2025-04-15', 'Completed'),
(589, 239, 39, 409, '2025-05-15', 'Pending'),
(590, 240, 40, 410, '2025-06-15', 'Cancelled'),
(591, 241, 41, 411, '2025-07-15', 'Completed'),
(592, 242, 42, 412, '2025-08-15', 'Pending'),
(593, 243, 43, 413, '2025-09-15', 'Cancelled'),
(594, 244, 44, 414, '2025-10-15', 'Completed'),
(595, 245, 45, 415, '2025-11-15', 'Pending'),
(596, 246, 46, 416, '2025-12-15', 'Cancelled'),
(597, 247, 47, 417, '2025-01-15', 'Completed'),
(598, 248, 48, 418, '2025-02-15', 'Pending'),
(599, 249, 49, 419, '2025-03-15', 'Cancelled'),
(600, 250, 50, 420, '2025-04-15', 'Completed');

Insert Into OrderDetails
(OrderDetail_ID, Order_ID, Product_ID, Quantity, UnitPrice)
Values
(601, 501, 301, 1, 500),
(602, 502, 302, 2, 575),
(603, 503, 303, 3, 650),
(604, 504, 304, 4, 725),
(605, 505, 305, 5, 800),
(606, 506, 306, 1, 875),
(607, 507, 307, 2, 950),
(608, 508, 308, 3, 1025),
(609, 509, 309, 4, 1100),
(610, 510, 310, 5, 1175),
(611, 511, 311, 1, 1250),
(612, 512, 312, 2, 1325),
(613, 513, 313, 3, 1400),
(614, 514, 314, 4, 1475),
(615, 515, 315, 5, 1550),
(616, 516, 316, 1, 1625),
(617, 517, 317, 2, 1700),
(618, 518, 318, 3, 1775),
(619, 519, 319, 4, 1850),
(620, 520, 320, 5, 1925),
(621, 521, 321, 1, 2000),
(622, 522, 322, 2, 2075),
(623, 523, 323, 3, 2150),
(624, 524, 324, 4, 2225),
(625, 525, 325, 5, 2300),
(626, 526, 301, 1, 500),
(627, 527, 302, 2, 575),
(628, 528, 303, 3, 650),
(629, 529, 304, 4, 725),
(630, 530, 305, 5, 800),
(631, 531, 306, 1, 875),
(632, 532, 307, 2, 950),
(633, 533, 308, 3, 1025),
(634, 534, 309, 4, 1100),
(635, 535, 310, 5, 1175),
(636, 536, 311, 1, 1250),
(637, 537, 312, 2, 1325),
(638, 538, 313, 3, 1400),
(639, 539, 314, 4, 1475),
(640, 540, 315, 5, 1550),
(641, 541, 316, 1, 1625),
(642, 542, 317, 2, 1700),
(643, 543, 318, 3, 1775),
(644, 544, 319, 4, 1850),
(645, 545, 320, 5, 1925),
(646, 546, 321, 1, 2000),
(647, 547, 322, 2, 2075),
(648, 548, 323, 3, 2150),
(649, 549, 324, 4, 2225),
(650, 550, 325, 5, 2300),
(651, 551, 301, 1, 500),
(652, 552, 302, 2, 575),
(653, 553, 303, 3, 650),
(654, 554, 304, 4, 725),
(655, 555, 305, 5, 800),
(656, 556, 306, 1, 875),
(657, 557, 307, 2, 950),
(658, 558, 308, 3, 1025),
(659, 559, 309, 4, 1100),
(660, 560, 310, 5, 1175),
(661, 561, 311, 1, 1250),
(662, 562, 312, 2, 1325),
(663, 563, 313, 3, 1400),
(664, 564, 314, 4, 1475),
(665, 565, 315, 5, 1550),
(666, 566, 316, 1, 1625),
(667, 567, 317, 2, 1700),
(668, 568, 318, 3, 1775),
(669, 569, 319, 4, 1850),
(670, 570, 320, 5, 1925),
(671, 571, 321, 1, 2000),
(672, 572, 322, 2, 2075),
(673, 573, 323, 3, 2150),
(674, 574, 324, 4, 2225),
(675, 575, 325, 5, 2300),
(676, 576, 301, 1, 500),
(677, 577, 302, 2, 575),
(678, 578, 303, 3, 650),
(679, 579, 304, 4, 725),
(680, 580, 305, 5, 800),
(681, 581, 306, 1, 875),
(682, 582, 307, 2, 950),
(683, 583, 308, 3, 1025),
(684, 584, 309, 4, 1100),
(685, 585, 310, 5, 1175),
(686, 586, 311, 1, 1250),
(687, 587, 312, 2, 1325),
(688, 588, 313, 3, 1400),
(689, 589, 314, 4, 1475),
(690, 590, 315, 5, 1550),
(691, 591, 316, 1, 1625),
(692, 592, 317, 2, 1700),
(693, 593, 318, 3, 1775),
(694, 594, 319, 4, 1850),
(695, 595, 320, 5, 1925),
(696, 596, 321, 1, 2000),
(697, 597, 322, 2, 2075),
(698, 598, 323, 3, 2150),
(699, 599, 324, 4, 2225),
(700, 600, 325, 5, 2300);

-- Q4: DISPLAY ALL RECORDS FROM EVERY TABLE

select * From Customers;
select * From Departments;
select * From Employees;
select * From Orderdetails;
select * From Orders;
select * From Products;
select * From Projects;

-- Q5: EMPLOYEES EARNING MORE THAN 60000

select * From Employees
Where Salary >60000;

-- Q6: EMPLOYEES HIRED AFTER 01-JAN-2022

select * From Employees
where HireDate > '2022-01-01';

-- Q7: EMPLOYEES NAMES BEGINNING WITH 'A'

select * From Employees
Where Emp_Name Like 'A%';

-- Q8: THE TOP FIVE HIGHEST-PAID EMPLOYEES

select * From Employees
Order by Salary Desc
Limit 5;

-- Q9: EMPLOYEE NAMES IN UPPERRCASE

select upper(Emp_Name) As Employee_Names
from Employees;

-- Q10: THE FIRST THREE CHARACTERS OF EVERY EMPLOYEE NAME.

select left(Emp_Name, 3) As First_Three_Character
From Employees;

-- Q11: EMPLOYEE EXPERIENCE IN YEARS.

select Emp_Name, HireDate, timestampdiff(Year, hiredate, Curdate()) As Experience
From Employees;

-- Q12: TOTAL, AVERAGE, MINIMUM AND MAXIMUM SALARY

select Emp_Name, 
		Round(avg(Salary), 0) As Avg_Salary,
		Round(min(Salary), 0) As Min_Salary,
        Round(max(Salary), 0) As max_Salary
From Employees
Group by Emp_Name;

-- Q13: EMPLOYEES IN EACH DEPARTMENT.

select Dept_Name, Count(*) As Emp_Count 
From Departments
group by Dept_Name;

-- Q14: DEPARTMENTS HAVING MORE THAN THREE EMPLOYEES

select Dept_name, count(*) As Morethan_Three_Employees
From Departments
group by Dept_Name
Having count(*) >3;

-- Q15: EMPLOYEE NAME WITH DEPARTMENT NAME USING INNER JOIN

select E.Emp_Name,D.Dept_Name
From Employees E
Inner Join Departments D
On D.Dept_ID = E.DeptID;

-- Q16: DISPLAY ALL DEPARTMENTS INCLUDING THOSE WITHOUT EMPLOYEES USING LEFT JOIN

select D.Dept_Name,E.Emp_Name From Departments D
Left join Employees E
On E.DeptID = D.Dept_ID;

-- Q17: EMPLOYEE AND MANAGER NAMES USING SELF JOIN

select E.Emp_Name,M.ManagerID
From Employees E
Inner join Employees M
on E.ManagerId = M.EmpId;

-- Q18: CUSTOMERS ALONG WITH THEIR ORDER AMOUNTS

select C.Customer_Name,O.order_ID,sum(OD.Quantity * OD.UnitPrice) As Order_Amount
From Customers C
Inner Join Orders O
On C.Customer_ID = O.Customer_ID
Inner Join orderdetails OD
On O.Order_ID = OD.Order_ID
group by C.Customer_ID, C.Customer_Name, O.Order_ID;

-- Q19: EMPLOYEES EARNING ABOVE THE COMPANY AVERAGE SALARY

select Emp_Name, Salary
from Employees
Where Salary >
(
select Avg(Salary)
From Employees
);

-- Q20: THE SECOND HIGHEST SALARY

select max(Salary) As Second_Max_Salary
From Employees
Where Salary <
(
select Max(Salary) From Employees
);

-- Q21: THE THIRD HIGHEST SALARY

select Salary from Employees
order by Salary desc
limit 1 offset 2;

select Salary from Employees
order by Salary
limit 1 offset 3;

-- Q22: EMPLOYEES EARNING ABOVE THEIR DEPARTMENT AVERAGE USING A CORRELATED SUBQUERY.

select E.Emp_Name,E.DeptID,E.Salary
From Employees E
Where E.Salary >
(
select avg(E2.Salary) From Employees E2
where E2.DeptID = E.DeptID
);

-- Q23: THE HIGHEST-PAID EMPLOYEE IN EACH DEPARTMENT

select E.Emp_Name,E.Salary,D.Dept_Name
From Employees E
inner Join Departments D
On D.Dept_ID = E.DeptID
where E.Salary = (select max(E2.Salary) from Employees E2
where E2.DeptID = E.DeptID
);

-- Q24: EXISTS TO DISPLAY CUSTOMERS WHO PLACED ORDERS

select  C.Customer_ID, C.Customer_Name
From Customers C
Where exists
(
Select 1 From Orders O
Where O.Customer_ID = C.Customer_ID
);

-- Q25: NOT EXISTS TO DISPLAY CUSTOMERS WHO NEVER PLACED ORDERS

Select  C.Customer_ID, C.Customer_Name
From Customers C
Where Not exists
(
Select 1 From Orders O
Where O.Customer_ID = C.Customer_ID
);

-- Q26: TO DISPLAY EMPLOYEES WORKING IN HR OR IT

select Dept_Name from Departments
Where Dept_Name in ('Department2'); 

-- Q27: TO COMPARE EMPLOYEE SALARIES WITH SALES DEPARTMENT SALARIES

Select  E.Emp_Name, E.Salary
From Employees E
Where E.Salary > Any
(
Select E2.Salary From Employees E2
Inner Join Departments D
On E2.DeptID = D.Dept_ID
Where D.Dept_Name = 'Sales'
);

-- Q28: TO COMPARE EMPLOYEE SALARIES WITH HR DEPARTMENT SALARIES

Select  E.Emp_Name, E.Salary
From Employees E
Where E.Salary > Any
(
Select E2.Salary From Employees E2
Inner Join Departments D
On E2.DeptID = D.Dept_ID
Where D.Dept_Name = 'Hr'
);

-- Q29: A CTE TO DISPLAY DEPARTMENT-WISE AVERAGE SALARY

With Dept_Avg_Salary As
(
select Dept_ID,Round(avg(Salary), 0) As Average_Salary
From Employees
group by Dept_ID
)
SELECT * From Dept_Avg_Salary;

-- Q30: DISPLAY THE TOP TWO SALARIES IN EACH DEPARTMENT

With Ranked_Employees As
(
Select Emp_Name,DeptID,Salary,
row_number() Over
(
partition by DeptID
Order by Salary Desc
)
As Salary_Rank From Employees
)
Select Emp_Name,DeptID,Salary From Ranked_Employees
Where Salary_Rank <= 2;

-- Q31: A UDF ANNUALSALARY()

DELIMITER //
CREATE FUNCTION AnnualSalary(MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
RETURN MonthlySalary * 12;
END //
DELIMITER ;

-- Q32: A UDF BONUS() RETURNING 15% OF SALARY

DELIMITER //
CREATE FUNCTION Bonus(Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
RETURN Salary * 0.15;
END //
DELIMITER ;

-- Q33: A UDF TAXAMOUNT() USING SALARY SLABS

DELIMITER //
CREATE FUNCTION TaxAmount(Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE Tax DECIMAL(10,2);
IF Salary <= 30000 THEN
SET Tax = Salary * 0.00;
ELSEIF Salary <= 60000 THEN
SET Tax = Salary * 0.10;
ELSE
SET Tax = Salary * 0.20;
END IF;
RETURN Tax;
END //
DELIMITER ;

-- Q34: A VIEW COMBINING EMPLOYEE AND DEPARTMENT DETAILS

CREATE VIEW Employee_Department_Details AS
SELECT E.EmpID, E.Emp_Name, E.Salary, D.Dept_ID, D.Dept_Name, D.Location
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.Dept_ID;

-- Q35: A STORED PROCEDURE TO INCREMENT SALARIES DEPARTMENT-WISE

DELIMITER //
CREATE PROCEDURE IncrementSalary(
IN p_DeptID INT,
IN p_Percentage DECIMAL(5,2)
)
BEGIN
UPDATE Employees
SET Salary = Salary + (Salary * p_Percentage / 100)
WHERE DeptID = p_DeptID;
END //
DELIMITER ;

-- Q36: DEMONSTRATE COMMIT AND ROLLBACK USING A TRANSACTION

START TRANSACTION;
UPDATE Employees
SET Salary = Salary + 5000
WHERE EmpID = 1;
COMMIT;

START TRANSACTION;
UPDATE Employees
SET Salary = Salary + 10000
WHERE EmpID = 2;
ROLLBACK;

-- Q37: THE CUSTOMER WITH THE HIGHEST LIFETIME SPEND

SELECT  C.Customer_ID, C.Customer_Name,
SUM(OD.Quantity * OD.UnitPrice) AS Lifetime_Spend FROM Customers C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
INNER JOIN OrderDetails OD
ON O.Order_ID = OD.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Lifetime_Spend DESC
LIMIT 1;

-- Q38: MONTHLY SALES REVENUE

SELECT DATE_FORMAT(O.OrderDate, '%Y-%m') AS Sales_Month, SUM(OD.Quantity * OD.UnitPrice) AS Monthly_Revenue
FROM Orders O
INNER JOIN OrderDetails OD
ON O.Order_ID = OD.Order_ID
GROUP BY DATE_FORMAT(O.OrderDate, '%Y-%m')
ORDER BY Sales_Month;

-- Q39: DEPARTMENTS WITHOUT PROJECTS

SELECT  D.Dept_ID, D.Dept_Name
FROM Departments D
LEFT JOIN Projects P
ON D.Dept_ID = P.Dept_ID
WHERE P.Project_ID IS NULL;

-- Q40: PROJECTS WITHOUT EMPLOYEES

SELECT  P.Project_ID, P.Project_Name
FROM Projects P
LEFT JOIN Orders O
ON P.Project_ID = O.Project_ID
WHERE O.Order_ID IS NULL;

-- Q41: INDEXES TO IMPROVE QUERY PERFORMANCE

-- 1. Improve employee department searches and joins
CREATE INDEX idx_employees_deptid
ON Employees(DeptID);

-- 2. Improve salary filtering and sorting
CREATE INDEX idx_employees_salary
ON Employees(Salary);

-- 3. Improve employee manager searches and self-joins
CREATE INDEX idx_employees_managerid
ON Employees(ManagerID);

-- 4. Improve department name searches
CREATE INDEX idx_departments_deptname
ON Departments(Dept_Name);

-- 5. Improve customer order searches
CREATE INDEX idx_orders_customerid
ON Orders(Customer_ID);

-- 6. Improve product searches in order details
CREATE INDEX idx_orderdetails_productid
ON OrderDetails(Product_ID);

-- 7. Improve project department searches
CREATE INDEX idx_projects_deptid
ON Projects(Dept_ID);

-- Q42: THE EXECUTION PLAN FOR ONE COMPLEX QUERY

SELECT E.EmpID, E.Emp_Name, E.DeptID, E.Salary
FROM Employees E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employees E2
    WHERE E2.DeptID = E.DeptID
);

-- Q43: FIVE ADDITIONAL INTERVIEW-LEVEL SQL QUESTIONS 

-- 1 Find the third-highest distinct salary
SELECT DISTINCT Salary FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 2;

-- 2 Compare employee salary with manager salary
SELECT
    E.Emp_Name AS Employee_Name,
    E.Salary AS Employee_Salary,
    M.Emp_Name AS Manager_Name,
    M.Salary AS Manager_Salary
FROM Employees E
INNER JOIN Employees M
    ON E.ManagerID = M.EmpID
WHERE E.Salary > M.Salary;

-- 3 Find the department with the highest average salary
SELECT DeptID,
    ROUND(AVG(Salary), 2) AS Average_Salary
FROM Employees
GROUP BY DeptID
ORDER BY Average_Salary DESC
LIMIT 1;

-- 4 Find customers with more than three orders
SELECT C.Customer_ID, C.Customer_Name,
    COUNT(O.Order_ID) AS Total_Orders
FROM Customers C
INNER JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
HAVING COUNT(O.Order_ID) > 3;

-- 5 Rank employees based on salary within each department
WITH Ranked_Employees AS (
    SELECT Emp_Name, DeptID, Salary,
        DENSE_RANK() OVER (
            PARTITION BY DeptID
            ORDER BY Salary DESC
        ) AS Salary_Rank
    FROM Employees
)
SELECT Emp_Name, DeptID, Salary
FROM Ranked_Employees
WHERE Salary_Rank = 1;
