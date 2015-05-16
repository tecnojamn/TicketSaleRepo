USE [master]
GO
/****** Object:  Database [TicketSale]    Script Date: 16/05/2015 20:03:52 ******/
CREATE DATABASE [TicketSale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TicketSale.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TicketSale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TicketSale_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TicketSale] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSale] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketSale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSale] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketSale] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSale] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TicketSale] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TicketSale]
GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPayment](
	[idPayment] [int] NOT NULL,
	[cod] [int] NOT NULL,
	[idPaymentLocation] [int] NOT NULL,
 CONSTRAINT [PK_CashPayment] PRIMARY KEY CLUSTERED 
(
	[idPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[enable] [tinyint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NOT NULL,
	[idEventLocation] [int] NOT NULL,
	[type] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventLocation]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventLocation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventLocation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[mount] [float] NOT NULL,
	[idOrder] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentLocation]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentLocation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[address] [varchar](50) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PaymentLocation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaypalPayment]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaypalPayment](
	[idPayment] [int] NOT NULL,
	[transactionCod] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaypalPayment] PRIMARY KEY CLUSTERED 
(
	[idPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[idOrder] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubOrder]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [tinyint] NOT NULL CONSTRAINT [DF_SubOrder_active]  DEFAULT ((1)),
	[idOrder] [int] NOT NULL,
	[idTicket] [int] NOT NULL,
 CONSTRAINT [PK_SubOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[idTicketType] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cost] [float] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[startNum] [int] NOT NULL,
	[finalNum] [int] NOT NULL,
	[idEvent] [int] NOT NULL,
 CONSTRAINT [PK_TicketType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 16/05/2015 20:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[lastName] [varchar](30) NOT NULL,
	[dateBirth] [date] NOT NULL,
	[userType] [tinyint] NOT NULL,
	[mobileNum] [int] NOT NULL CONSTRAINT [DF_Usuario_celular]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CashPayment]  WITH CHECK ADD  CONSTRAINT [FK_CashPayment_Payment] FOREIGN KEY([idPayment])
REFERENCES [dbo].[Payment] ([id])
GO
ALTER TABLE [dbo].[CashPayment] CHECK CONSTRAINT [FK_CashPayment_Payment]
GO
ALTER TABLE [dbo].[CashPayment]  WITH CHECK ADD  CONSTRAINT [FK_CashPayment_PaymentLocation] FOREIGN KEY([idPaymentLocation])
REFERENCES [dbo].[PaymentLocation] ([id])
GO
ALTER TABLE [dbo].[CashPayment] CHECK CONSTRAINT [FK_CashPayment_PaymentLocation]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventLocation] FOREIGN KEY([idEventLocation])
REFERENCES [dbo].[EventLocation] ([id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventLocation]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[PaypalPayment]  WITH CHECK ADD  CONSTRAINT [FK_PaypalPayment_Payment] FOREIGN KEY([idPayment])
REFERENCES [dbo].[Payment] ([id])
GO
ALTER TABLE [dbo].[PaypalPayment] CHECK CONSTRAINT [FK_PaypalPayment_Payment]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Order]
GO
ALTER TABLE [dbo].[SubOrder]  WITH CHECK ADD  CONSTRAINT [FK_SubOrder_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[SubOrder] CHECK CONSTRAINT [FK_SubOrder_Order]
GO
ALTER TABLE [dbo].[SubOrder]  WITH CHECK ADD  CONSTRAINT [FK_SubOrder_Ticket] FOREIGN KEY([idTicket])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[SubOrder] CHECK CONSTRAINT [FK_SubOrder_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketType] FOREIGN KEY([idTicketType])
REFERENCES [dbo].[TicketType] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_TicketType]
GO
ALTER TABLE [dbo].[TicketType]  WITH CHECK ADD  CONSTRAINT [FK_TicketType_Event] FOREIGN KEY([idEvent])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[TicketType] CHECK CONSTRAINT [FK_TicketType_Event]
GO
USE [master]
GO
ALTER DATABASE [TicketSale] SET  READ_WRITE 
GO
