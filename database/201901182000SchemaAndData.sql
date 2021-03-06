USE [master]
GO
/****** Object:  Database [Bangazon]    Script Date: 1/18/2019 7:56:03 PM ******/
CREATE DATABASE [Bangazon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bangazon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bangazon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bangazon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Bangazon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bangazon] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bangazon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bangazon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bangazon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bangazon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bangazon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bangazon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bangazon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bangazon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bangazon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bangazon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bangazon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bangazon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bangazon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bangazon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bangazon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bangazon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bangazon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bangazon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bangazon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bangazon] SET RECOVERY FULL 
GO
ALTER DATABASE [Bangazon] SET  MULTI_USER 
GO
ALTER DATABASE [Bangazon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bangazon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bangazon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bangazon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bangazon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bangazon] SET QUERY_STORE = OFF
GO
USE [Bangazon]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Bangazon]
GO
/****** Object:  Table [dbo].[computer]    Script Date: 1/18/2019 7:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[computer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[purchase_date] [datetime] NOT NULL,
	[decommissioned] [datetime] NULL,
	[employee_id] [int] NULL,
	[in_use] [bit] NOT NULL,
	[is_malfunctioning] [bit] NOT NULL,
	[make] [varchar](50) NOT NULL,
	[model] [varchar](50) NOT NULL,
 CONSTRAINT [PK__computer__3213E83FCBD1F7B0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[date_joined] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK__customer__3213E83F85423B68] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[name] [varchar](255) NOT NULL,
	[expense_budget] [int] NOT NULL,
	[supervisor_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__departme__3213E83F9F8D443F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[name] [varchar](255) NOT NULL,
	[is_supervisor] [bit] NOT NULL,
	[department_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__employee__3213E83FEA1746C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_training_program_pair]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_training_program_pair](
	[training_program_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__employee__3213E83F8599B7FD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_product_pair]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_product_pair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK__order_pr__3213E83F5FC92363] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [bit] NOT NULL,
	[can_complete] [bit] NOT NULL,
	[payment_type_id] [int] NOT NULL,
 CONSTRAINT [PK__orders__3213E83F4CF09FF0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_type]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_number] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[active] [bit] NOT NULL,
	[title] [nvarchar](500) NULL,
 CONSTRAINT [PK__payment___3213E83FD0F55F83] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
	[owner_id] [int] NOT NULL,
 CONSTRAINT [PK__product__3213E83F9BE391B5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_types]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](255) NOT NULL,
 CONSTRAINT [PK__product___3213E83FD4D7E369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[training_programs]    Script Date: 1/18/2019 7:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_programs](
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[max_attendees] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
 CONSTRAINT [PK__training__3213E83F6BB37FB3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[computer] ON 

INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1, CAST(N'2016-06-04T00:00:00.000' AS DateTime), CAST(N'2016-06-04T00:00:00.000' AS DateTime), 2, 1, 1, N'Dell', N'XPS15')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (7, CAST(N'2015-04-12T00:00:00.000' AS DateTime), NULL, 7, 1, 0, N'Apple', N'Macbook')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (8, CAST(N'2017-03-12T00:00:00.000' AS DateTime), NULL, 8, 1, 0, N'Asus', N'E-12')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (9, CAST(N'2016-05-11T00:00:00.000' AS DateTime), NULL, 9, 1, 0, N'Dell', N'IS342')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (10, CAST(N'1945-06-29T00:00:00.000' AS DateTime), NULL, 10, 1, 0, N'Apple', N'Macbook')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (12, CAST(N'2017-12-25T00:00:00.000' AS DateTime), CAST(N'2017-12-26T00:00:00.000' AS DateTime), NULL, 0, 1, N'Dell', N'IS342')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1011, CAST(N'2018-07-12T00:00:00.000' AS DateTime), CAST(N'1753-01-01T00:00:00.000' AS DateTime), 7, 1, 0, N'Apple', N'Macbook')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1014, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-02T00:00:00.000' AS DateTime), 10, 1, 0, N'Lenovo', N'T60')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1015, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-02T00:00:00.000' AS DateTime), 10, 1, 0, N'Lenovo', N'T60')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1016, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-02T00:00:00.000' AS DateTime), 10, 1, 0, N'Lenovo', N'T60')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (1018, CAST(N'2000-01-01T00:00:00.000' AS DateTime), CAST(N'2000-01-02T00:00:00.000' AS DateTime), 11, 1, 0, N'Lenovo', N'T60')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (2044, CAST(N'2018-12-06T00:00:00.000' AS DateTime), NULL, 3, 1, 0, N'HP', N'zyx')
INSERT [dbo].[computer] ([id], [purchase_date], [decommissioned], [employee_id], [in_use], [is_malfunctioning], [make], [model]) VALUES (2045, CAST(N'2018-12-19T00:00:00.000' AS DateTime), NULL, 4, 1, 0, N'hp', N'xyz')
SET IDENTITY_INSERT [dbo].[computer] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (1, N'Steve', N'Belushi', CAST(N'2010-11-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (2, N'Sam', N'Poodles', CAST(N'1999-12-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (3, N'Barry', N'Blues', CAST(N'2018-12-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (4, N'Andy', N'Anderson', CAST(N'2017-03-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (5, N'Alex', N'Azell', CAST(N'2017-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (6, N'Lola', N'Orange', CAST(N'2017-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (7, N'Nathan', N'Newsome', CAST(N'2018-10-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (8, N'Meli', N'Frank', CAST(N'2000-05-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (9, N'Bob', N'Thebuilder', CAST(N'2000-07-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (10, N'Natalie', N'Peters', CAST(N'2001-09-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (11, N'William', N'Williams', CAST(N'2014-08-03T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (12, N'Molly', N'Moped', CAST(N'2015-04-23T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (13, N'Bruce', N'Wild', CAST(N'2018-04-02T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (14, N'John', N'Baptiste', CAST(N'2018-11-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (1002, N'John', N'Doe', CAST(N'2018-11-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [date_joined], [active]) VALUES (1003, N'Barry', N'Bluee', CAST(N'2018-12-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'HumanResources', 50, 1, 1)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'IT', 100000, 6, 2)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'Sales', 150000, 7, 3)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'HelpDesk', 25000, 4, 4)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'Photography', 1000000, 5, 5)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'Shipping', 20000, 7, 1002)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'Accounts Receivable', 12, NULL, 2020)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'BlahdeeBlah', 2000, 4, 2024)
INSERT [dbo].[department] ([name], [expense_budget], [supervisor_id], [id]) VALUES (N'asdasdas', 21321, 2, 2026)
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Frank', 1, 1, 1)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'James', 0, 2, 2)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Jimothy', 0, 3, 3)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Rotunda', 1, 4, 4)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Yamil', 1, 5, 5)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Michelle', 1, 2, 6)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Larrence', 1, 3, 7)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Matisyahu', 1, 1002, 8)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Ed', 0, 1, 9)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Steve', 0, 5, 10)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'Johnplashuous7676', 1, 3, 11)
INSERT [dbo].[employee] ([name], [is_supervisor], [department_id], [id]) VALUES (N'{}', 1, 1, 12)
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[employee_training_program_pair] ON 

INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (1, 1, 3)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (2, 2, 4)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (3, 3, 5)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (4, 4, 6)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (5, 5, 8)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (6, 6, 9)
INSERT [dbo].[employee_training_program_pair] ([training_program_id], [employee_id], [id]) VALUES (7, 7, 10)
SET IDENTITY_INSERT [dbo].[employee_training_program_pair] OFF
SET IDENTITY_INSERT [dbo].[order_product_pair] ON 

INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (2, 1, 5)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (3, 2, 2008)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (5, 2, 2010)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (6, 3, 2013)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (7, 3, 2014)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (8, 3, 2015)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (9, 4, 2016)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (10, 5, 2019)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (11, 2002, 2019)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (12, 2002, 2020)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (13, 2004, 2022)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (14, 2005, 2026)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (15, 2006, 2030)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (17, 2007, 2032)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (18, 2007, 2033)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (19, 2007, 2034)
INSERT [dbo].[order_product_pair] ([id], [order_id], [product_id]) VALUES (20, 2007, 2039)
SET IDENTITY_INSERT [dbo].[order_product_pair] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2, 2, 0, 0, 2)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (3, 3, 1, 1, 3)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (4, 4, 0, 1, 4)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (5, 5, 1, 0, 5)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2002, 5, 1, 1, 4)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2003, 3, 0, 0, 2)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2004, 2, 1, 0, 1)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2005, 1002, 0, 0, 3)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2006, 1003, 1, 1, 1)
INSERT [dbo].[orders] ([id], [customer_id], [order_status], [can_complete], [payment_type_id]) VALUES (2007, 14, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[payment_type] ON 

INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (1, 12345, 1, 1, N'My Visa')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (2, 23456, 2, 0, N'My Mastercard')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (3, 34567, 3, 1, N'Main Account')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (4, 45678, 4, 1, N'Savings Account')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (5, 56789, 5, 1, N'My AmEx')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (6, 56754, 6, 0, N'Visa 2')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (7, 987654, 7, 1, N'Savings Account')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (1006, 22334455, 8, 0, N'Cash')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (1007, 33343, 9, 1, N'Amex 4')
INSERT [dbo].[payment_type] ([id], [account_number], [customer_id], [active], [title]) VALUES (1008, 64643, 1002, 1, NULL)
SET IDENTITY_INSERT [dbo].[payment_type] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (5, 1, CAST(50 AS Decimal(18, 0)), N'Lenovo', N'T60', 0, 1)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2008, 1, CAST(100 AS Decimal(18, 0)), N'HP', N'460x', 1, 2)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2009, 1, CAST(500 AS Decimal(18, 0)), N'Microsoft', N'Surface', 5, 3)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2010, 2, CAST(5 AS Decimal(18, 0)), N'Ratchet', N'1/2"', 1, 4)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2011, 2, CAST(10 AS Decimal(18, 0)), N'Wrench', N'Metric', 1, 5)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2012, 2, CAST(50 AS Decimal(18, 0)), N'Drill', N'Makita', 6, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2013, 3, CAST(5 AS Decimal(18, 0)), N'1984', N'George Orwell', 1, 8)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2014, 3, CAST(10 AS Decimal(18, 0)), N'Collusion', N'Nomi Prins', 4, 1002)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2015, 3, CAST(50 AS Decimal(18, 0)), N'Third Industrial Revolution', N'Jeremy Rifkin', 0, 1003)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2016, 4, CAST(1 AS Decimal(18, 0)), N'Ball', N'Orange', 1, 1)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2017, 4, CAST(4 AS Decimal(18, 0)), N'Bone', N'Rawhide', 1, 2)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2018, 4, CAST(11 AS Decimal(18, 0)), N'Food', N'Kibble', 3, 3)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2019, 5, CAST(100 AS Decimal(18, 0)), N'Milk', N'Chocolate', 1, 4)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2020, 5, CAST(115 AS Decimal(18, 0)), N'Hummus', N'Original', 6, 5)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2021, 5, CAST(188 AS Decimal(18, 0)), N'Wine', N'Red', 1, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2022, 6, CAST(55 AS Decimal(18, 0)), N'Ball', N'Rubber', 0, 7)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2023, 6, CAST(23 AS Decimal(18, 0)), N'Frisbee', N'Orange', 1, 8)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2024, 6, CAST(55 AS Decimal(18, 0)), N'Bicycle', N'Training Wheels', 2, 9)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2026, 8, CAST(55 AS Decimal(18, 0)), N'Ball', N'Softball', 1, 10)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2027, 8, CAST(75 AS Decimal(18, 0)), N'Canoe', N'Red', 44, 11)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2028, 8, CAST(77 AS Decimal(18, 0)), N'Discs', N'Disc Golf', 1, 12)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2029, 1013, CAST(50 AS Decimal(18, 0)), N'Oil Filter', N'Maserati', 0, 13)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2030, 1013, CAST(108 AS Decimal(18, 0)), N'Jack Stands', N'3000 pound', 1, 14)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2031, 1013, CAST(766 AS Decimal(18, 0)), N'Transmision', N'CVT', 3, 1002)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2032, 1014, CAST(55 AS Decimal(18, 0)), N'Face Mask', N'Hydrating', 1, 1)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2033, 1014, CAST(89 AS Decimal(18, 0)), N'Lip Stick', N'Purple', 2, 2)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2034, 1014, CAST(4 AS Decimal(18, 0)), N'Shampoo', N'Smelly', 0, 3)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2035, 1, CAST(44 AS Decimal(18, 0)), N'Dell', N'XPS 13', 5, 14)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2036, 2, CAST(5 AS Decimal(18, 0)), N'Hammer', N'Wooden Handle', 3, 2)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2037, 3, CAST(8 AS Decimal(18, 0)), N'Animal Farm', N'George Orwell', 4, 3)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2038, 4, CAST(89 AS Decimal(18, 0)), N'Stuffy', N'Duck', 3, 9)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2039, 5, CAST(12 AS Decimal(18, 0)), N'Beer', N'Ale', 6, 14)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2040, 6, CAST(444 AS Decimal(18, 0)), N'Legos', N'Star Wars Kit', 4, 1002)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2041, 8, CAST(4 AS Decimal(18, 0)), N'Ping Pong Table', N'Regulation Size', 999, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2042, 1013, CAST(4 AS Decimal(18, 0)), N'Tires', N'225/55-16', 4, 3)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2043, 1014, CAST(4432 AS Decimal(18, 0)), N'Soap', N'Lavendar', 42, 14)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2044, 2, CAST(44 AS Decimal(18, 0)), N'Pry Bar', N'Made in USA', 0, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2045, 8, CAST(10 AS Decimal(18, 0)), N'Goal', N'Hockey Goal', 5, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2046, 1013, CAST(300 AS Decimal(18, 0)), N'Wheel', N'5x100', 1, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2047, 1013, CAST(1 AS Decimal(18, 0)), N'Air Freshener', N'Strawberry', 6, 6)
INSERT [dbo].[product] ([id], [categoryId], [price], [title], [description], [quantity], [owner_id]) VALUES (2048, 1, CAST(5 AS Decimal(18, 0)), N'Canned Air', N'Use Properly Kids', 4, 6)
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_types] ON 

INSERT [dbo].[product_types] ([id], [category]) VALUES (1, N'Computers')
INSERT [dbo].[product_types] ([id], [category]) VALUES (2, N'Tools')
INSERT [dbo].[product_types] ([id], [category]) VALUES (3, N'Books')
INSERT [dbo].[product_types] ([id], [category]) VALUES (4, N'Pet Supplies')
INSERT [dbo].[product_types] ([id], [category]) VALUES (5, N'Food and Drink')
INSERT [dbo].[product_types] ([id], [category]) VALUES (6, N'Toys')
INSERT [dbo].[product_types] ([id], [category]) VALUES (8, N'Sports')
INSERT [dbo].[product_types] ([id], [category]) VALUES (1013, N'Automotive')
INSERT [dbo].[product_types] ([id], [category]) VALUES (1014, N'Health and Beauty')
SET IDENTITY_INSERT [dbo].[product_types] OFF
SET IDENTITY_INSERT [dbo].[training_programs] ON 

INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2018-02-01T00:00:00.000' AS DateTime), CAST(N'2018-03-02T00:00:00.000' AS DateTime), 5, 1, N'OnBoarding')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2017-04-02T00:00:00.000' AS DateTime), CAST(N'2017-04-27T00:00:00.000' AS DateTime), 20, 2, N'Sales Force')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2018-03-03T00:00:00.000' AS DateTime), CAST(N'2018-04-04T00:00:00.000' AS DateTime), 40, 3, N'Sexual Harrassment')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2014-01-02T00:00:00.000' AS DateTime), CAST(N'2014-02-01T00:00:00.000' AS DateTime), 2, 4, N'Compliance Training')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2005-09-02T00:00:00.000' AS DateTime), CAST(N'2005-09-05T00:00:00.000' AS DateTime), 10, 5, N'Team Building')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2015-06-02T00:00:00.000' AS DateTime), CAST(N'2015-06-07T00:00:00.000' AS DateTime), 5, 6, N'Project Management')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2004-09-03T00:00:00.000' AS DateTime), CAST(N'2009-10-01T00:00:00.000' AS DateTime), 12, 7, N'6Sigma')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2018-02-01T00:00:00.000' AS DateTime), CAST(N'2018-03-02T00:00:00.000' AS DateTime), 35, 1006, N'Personal Development')
INSERT [dbo].[training_programs] ([start_date], [end_date], [max_attendees], [id], [title]) VALUES (CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2019-03-01T00:00:00.000' AS DateTime), 20, 1007, N'Competency Development')
SET IDENTITY_INSERT [dbo].[training_programs] OFF
ALTER TABLE [dbo].[computer]  WITH CHECK ADD  CONSTRAINT [FK__computer__employ__160F4887] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[computer] CHECK CONSTRAINT [FK__computer__employ__160F4887]
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD  CONSTRAINT [FK__departmen__super__0C85DE4D] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[department] CHECK CONSTRAINT [FK__departmen__super__0C85DE4D]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK__employee__depart__0B91BA14] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK__employee__depart__0B91BA14]
GO
ALTER TABLE [dbo].[employee_training_program_pair]  WITH CHECK ADD  CONSTRAINT [FK__employee___emplo__0D7A0286] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[employee_training_program_pair] CHECK CONSTRAINT [FK__employee___emplo__0D7A0286]
GO
ALTER TABLE [dbo].[employee_training_program_pair]  WITH CHECK ADD  CONSTRAINT [FK__employee___train__0E6E26BF] FOREIGN KEY([training_program_id])
REFERENCES [dbo].[training_programs] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee_training_program_pair] CHECK CONSTRAINT [FK__employee___train__0E6E26BF]
GO
ALTER TABLE [dbo].[order_product_pair]  WITH CHECK ADD  CONSTRAINT [FK__order_pro__order__123EB7A3] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_product_pair] CHECK CONSTRAINT [FK__order_pro__order__123EB7A3]
GO
ALTER TABLE [dbo].[order_product_pair]  WITH CHECK ADD  CONSTRAINT [FK__order_pro__produ__1332DBDC] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_product_pair] CHECK CONSTRAINT [FK__order_pro__produ__1332DBDC]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__customer__114A936A] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__customer__114A936A]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__payment___151B244E] FOREIGN KEY([payment_type_id])
REFERENCES [dbo].[payment_type] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__payment___151B244E]
GO
ALTER TABLE [dbo].[payment_type]  WITH CHECK ADD  CONSTRAINT [FK__payment_t__custo__10566F31] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[payment_type] CHECK CONSTRAINT [FK__payment_t__custo__10566F31]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__0F624AF8] FOREIGN KEY([categoryId])
REFERENCES [dbo].[product_types] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__0F624AF8]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__owner_i__14270015] FOREIGN KEY([owner_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__owner_i__14270015]
GO
USE [master]
GO
ALTER DATABASE [Bangazon] SET  READ_WRITE 
GO
