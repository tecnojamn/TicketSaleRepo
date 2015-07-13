USE [master]
GO
/****** Object:  Database [TicketSale]    Script Date: 13/07/2015 13:33:53 ******/
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
/****** Object:  Table [dbo].[CashPayment]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPayment](
	[idReservation] [int] NOT NULL,
	[cod] [int] NOT NULL,
	[idPaymentLocation] [int] NOT NULL,
 CONSTRAINT [PK_CashPayment] PRIMARY KEY CLUSTERED 
(
	[idReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[enabled] [tinyint] NOT NULL,
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
/****** Object:  Table [dbo].[EventLocation]    Script Date: 13/07/2015 13:33:53 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[date] [date] NOT NULL,
	[amount] [float] NOT NULL,
	[idReservation] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[idReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentLocation]    Script Date: 13/07/2015 13:33:53 ******/
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
/****** Object:  Table [dbo].[PaypalPayment]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaypalPayment](
	[idReservation] [int] NOT NULL,
	[transactionCod] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaypalPayment] PRIMARY KEY CLUSTERED 
(
	[idReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubOrder]    Script Date: 13/07/2015 13:33:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [tinyint] NOT NULL CONSTRAINT [DF_SubOrder_active]  DEFAULT ((1)),
	[idReservation] [int] NOT NULL,
	[idTicket] [int] NOT NULL,
 CONSTRAINT [PK_SubOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 13/07/2015 13:33:53 ******/
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
/****** Object:  Table [dbo].[TicketType]    Script Date: 13/07/2015 13:33:53 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 13/07/2015 13:33:53 ******/
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
	[active] [tinyint] NOT NULL CONSTRAINT [DF_User_active]  DEFAULT ((0)),
	[token] [varchar](100) NOT NULL CONSTRAINT [DF_User_registrationLink]  DEFAULT (''),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CashPayment] ([idReservation], [cod], [idPaymentLocation]) VALUES (18, 524545, 1)
INSERT [dbo].[CashPayment] ([idReservation], [cod], [idPaymentLocation]) VALUES (20, 78419761, 1)
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (2, CAST(N'2015-06-06 16:00:00.000' AS DateTime), 1, N'Barcelona vs Juventus', N'Champions League - Final (Revancha)', 3, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (4, CAST(N'2015-06-13 16:00:00.000' AS DateTime), 1, N'Racing vs Peñarol', N'Campeonato Uruguayo', 1, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (5, CAST(N'2015-06-06 17:30:00.000' AS DateTime), 1, N'San Lorenzo vs Belgrano', N'Torneo Final', 1, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (7, CAST(N'2015-06-05 16:00:00.000' AS DateTime), 1, N'Nacional vs Tacuarembo', N'Campeonato Uruguayo', 1, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (10, CAST(N'2015-06-01 16:00:00.000' AS DateTime), 1, N'Fenix vs Racing', N'Campeonato Uruguayo', 1, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (11, CAST(N'2015-07-20 20:00:00.000' AS DateTime), 1, N'Kolia', N'llega Kolia, un viaje al interior, un camino en búsqueda de la poesía. Un espectáculo para toda la familia.', 4, N'Teatro')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (12, CAST(N'2015-07-17 10:00:00.000' AS DateTime), 1, N'Submarina, una aventura profunda', N'Marina, una golondrina, es la madre de Tyky, una pequeña tortuga de mar, quien parece no volvió de la escuela a tiempo.', 4, N'Teatro')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (13, CAST(N'2015-08-04 21:00:00.000' AS DateTime), 1, N'Las Voces del Terror', N'Los mejores autores de terror y miedo toman cuerpo en la voz de los narradores orales de Cazacuento', 4, N'Teatro')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (14, CAST(N'2015-07-18 15:00:00.000' AS DateTime), 1, N'Peñarol vs Juventud', N'Vine a ver a Forlan', 5, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (15, CAST(N'2015-09-08 15:00:00.000' AS DateTime), 1, N'Argentina vs Mexico', N'Amistoso', 6, N'Futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (16, CAST(N'2015-09-19 20:00:00.000' AS DateTime), 1, N'Buitres', N'Canciones de una Noche de Verano', 7, N'Musica')
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventLocation] ON 

INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (1, N'Estadio Centenario', 25456614, N'Barrio Parque Batlle, Montevideo, Uruguay')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (2, N'Estadio Gran Parque Central', 2234235, N'Carlos Anaya 2900, Montevideo, Uruguay')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (3, N'Estadio Olímpico de Berlin', 12345645, N'Charlottenburg, Berlin, Alemania')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (4, N'Teatro Solís', 24578326, N'Buenos Aires 678/686, Montevideo, Uruguay')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (5, N'Estadio Domingo Burgueño Miguel', 4222554, N'Campus, Maldonado, Maldonado')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (6, N'AT and T Stadium', 546457567, N'Arlington, Texas, USA')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (7, N'Velódromo Municipal de Montevideo', 2345687, N'Parque Batlle, Montevideo, Uruguay')
SET IDENTITY_INSERT [dbo].[EventLocation] OFF
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-10' AS Date), 17500, 2)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 1600, 3)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 2000, 4)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 2500, 8)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 3000, 9)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 2500, 10)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-12' AS Date), 2500, 12)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-13' AS Date), 3000, 15)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-13' AS Date), 2700, 18)
INSERT [dbo].[Payment] ([date], [amount], [idReservation]) VALUES (CAST(N'2015-07-13' AS Date), 2000, 20)
SET IDENTITY_INSERT [dbo].[PaymentLocation] ON 

INSERT [dbo].[PaymentLocation] ([id], [phoneNumber], [address], [name]) VALUES (1, 4224565, N'Joquin de Viana y Ventura Alegre', N'Redpagos 14')
SET IDENTITY_INSERT [dbo].[PaymentLocation] OFF
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (2, N'EVTO0GOOUK')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (3, N'JSMEXKEJWL')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (4, N'U81X74Y2P6')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (8, N'YT4R5QHW8L')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (9, N'57OYMKC7BQ')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (10, N'KUYNP4DJ4L')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (12, N'CUCWQCJNYV')
INSERT [dbo].[PaypalPayment] ([idReservation], [transactionCod]) VALUES (15, N'JLJHBCLSXT')
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (2, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (3, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (4, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (5, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (6, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (7, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (8, 1, CAST(N'2015-07-10' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (9, 1, CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (10, 1, CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (11, 1, CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (12, 6, CAST(N'2015-07-12' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (13, 1, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (14, 9, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (15, 9, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (16, 8, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (17, 8, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (18, 8, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (19, 8, CAST(N'2015-07-13' AS Date))
INSERT [dbo].[Reservation] ([id], [idUser], [date]) VALUES (20, 8, CAST(N'2015-07-13' AS Date))
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[SubOrder] ON 

INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (2, 1, 2, 36)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (3, 1, 2, 37)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (4, 1, 2, 38)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (5, 1, 2, 39)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (6, 1, 2, 40)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (7, 1, 2, 41)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (8, 0, 2, 42)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (9, 1, 2, 43)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (10, 1, 2, 44)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (11, 1, 2, 45)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (12, 1, 2, 46)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (13, 1, 2, 47)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (14, 1, 2, 48)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (15, 1, 2, 49)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (16, 1, 2, 50)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (17, 1, 2, 51)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (18, 1, 2, 52)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (19, 0, 2, 53)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (20, 0, 2, 54)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (21, 0, 2, 55)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (22, 1, 2, 56)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (23, 0, 2, 57)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (24, 1, 2, 58)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (25, 1, 2, 59)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (26, 1, 2, 60)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (27, 1, 2, 61)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (28, 0, 2, 62)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (29, 1, 2, 63)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (30, 1, 2, 64)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (31, 1, 2, 65)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (32, 0, 2, 66)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (33, 1, 2, 67)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (34, 1, 2, 68)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (35, 1, 2, 69)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (36, 1, 2, 70)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (37, 1, 3, 71)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (38, 1, 3, 72)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (39, 1, 3, 73)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (40, 1, 3, 74)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (41, 1, 4, 75)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (42, 1, 4, 76)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (43, 1, 4, 77)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (44, 1, 4, 78)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (45, 1, 4, 79)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (46, 1, 5, 16)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (47, 1, 5, 17)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (48, 1, 5, 18)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (49, 1, 5, 29)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (50, 1, 5, 30)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (51, 1, 6, 1)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (52, 1, 6, 3)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (53, 1, 6, 4)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (54, 1, 6, 5)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (55, 1, 6, 6)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (56, 1, 7, 7)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (57, 1, 7, 8)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (58, 1, 7, 9)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (59, 1, 7, 10)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (60, 1, 7, 11)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (61, 1, 8, 2)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (62, 1, 8, 12)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (63, 1, 8, 13)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (64, 1, 8, 14)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (65, 1, 8, 15)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (66, 1, 9, 42)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (67, 1, 9, 80)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (68, 1, 9, 81)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (69, 1, 9, 82)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (70, 1, 9, 83)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (71, 1, 10, 19)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (72, 1, 10, 20)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (73, 1, 10, 21)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (74, 1, 10, 22)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (75, 1, 10, 23)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (76, 0, 11, 84)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (77, 0, 11, 85)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (78, 0, 11, 86)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (79, 0, 11, 87)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (80, 0, 11, 88)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (81, 1, 12, 89)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (82, 1, 12, 90)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (83, 1, 12, 91)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (84, 1, 12, 92)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (85, 0, 12, 93)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (86, 1, 13, 94)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (87, 1, 13, 95)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (88, 1, 13, 96)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (89, 1, 13, 97)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (90, 1, 13, 98)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (91, 1, 14, 99)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (92, 1, 14, 100)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (93, 1, 14, 101)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (94, 1, 14, 102)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (95, 1, 14, 103)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (96, 0, 14, 104)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (97, 0, 14, 105)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (98, 0, 14, 106)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (99, 1, 14, 107)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (100, 1, 14, 108)
GO
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (101, 1, 14, 109)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (102, 1, 14, 110)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (103, 1, 14, 111)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (104, 1, 14, 112)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (105, 1, 14, 113)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (106, 1, 15, 114)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (107, 1, 15, 115)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (108, 1, 15, 116)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (109, 1, 15, 117)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (110, 1, 15, 118)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (111, 1, 15, 119)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (112, 1, 15, 120)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (113, 1, 15, 121)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (114, 1, 15, 122)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (115, 1, 15, 123)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (116, 0, 16, 124)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (117, 0, 16, 125)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (118, 0, 16, 126)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (119, 0, 16, 127)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (120, 0, 16, 128)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (121, 0, 16, 129)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (122, 0, 16, 130)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (123, 0, 16, 131)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (124, 0, 16, 132)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (125, 0, 16, 133)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (126, 1, 17, 124)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (127, 1, 17, 125)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (128, 1, 17, 126)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (129, 1, 17, 127)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (130, 1, 17, 129)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (131, 1, 17, 130)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (132, 1, 17, 131)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (133, 1, 17, 132)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (134, 1, 17, 133)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (135, 1, 18, 134)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (136, 1, 18, 135)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (137, 1, 18, 136)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (138, 0, 18, 137)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (139, 1, 18, 138)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (140, 1, 18, 139)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (141, 1, 18, 140)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (142, 1, 18, 141)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (143, 1, 18, 142)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (144, 1, 18, 143)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (145, 1, 19, 104)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (146, 1, 19, 105)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (147, 1, 19, 106)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (148, 1, 19, 144)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (149, 1, 19, 145)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (150, 1, 19, 146)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (151, 1, 19, 147)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (152, 1, 19, 148)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (153, 1, 19, 149)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (154, 1, 19, 150)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (155, 1, 20, 151)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (156, 1, 20, 152)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (157, 1, 20, 153)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (158, 1, 20, 154)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (159, 1, 20, 155)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (160, 1, 20, 156)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (161, 1, 20, 157)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (162, 1, 20, 158)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (163, 1, 20, 159)
INSERT [dbo].[SubOrder] ([id], [active], [idReservation], [idTicket]) VALUES (164, 1, 20, 160)
SET IDENTITY_INSERT [dbo].[SubOrder] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (1, 1, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (2, 1, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (3, 2, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (4, 2402, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (5, 65241, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (6, 39526, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (7, 13043, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (8, 97438, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (9, 18198, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (10, 39758, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (11, 40418, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (12, 87650, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (13, 8210, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (14, 45462, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (15, 66122, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (16, 87882, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (17, 14024, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (18, 51166, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (19, 96758, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (20, 45531, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (21, 66101, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (22, 93344, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (23, 87861, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (24, 14004, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (25, 35764, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (26, 71906, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (27, 92566, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (28, 29708, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (29, 13226, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (30, 40478, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (31, 61038, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (32, 8270, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (33, 35412, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (34, 29930, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (35, 56172, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (36, 1, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (37, 1, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (38, 2, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (39, 2402, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (40, 65241, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (41, 39526, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (42, 13043, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (43, 97438, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (44, 18198, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (45, 39758, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (46, 40418, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (47, 87650, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (48, 8210, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (49, 45462, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (50, 66122, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (51, 87882, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (52, 14024, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (53, 51166, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (54, 96758, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (55, 45531, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (56, 66101, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (57, 93344, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (58, 87861, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (59, 14004, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (60, 35764, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (61, 71906, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (62, 92566, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (63, 29708, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (64, 13226, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (65, 40478, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (66, 61038, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (67, 8270, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (68, 35412, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (69, 29930, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (70, 56172, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (71, 87882, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (72, 14024, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (73, 51166, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (74, 13226, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (75, 87882, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (76, 14024, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (77, 51166, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (78, 13226, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (79, 40478, 3)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (80, 64267, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (81, 2404, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (82, 23064, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (83, 44724, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (84, 63771, 4)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (85, 90258, 4)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (86, 11918, 4)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (87, 95336, 4)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (88, 22578, 4)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (89, 73188, 16)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (90, 64281, 16)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (91, 85941, 16)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (92, 6601, 16)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (93, 43853, 16)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (94, 68441, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (95, 17124, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (96, 1642, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (97, 74036, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (98, 58554, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (99, 55795, 8)
GO
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (100, 30164, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (101, 51834, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (102, 72494, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (103, 46001, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (104, 73243, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (105, 94803, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (106, 31045, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (107, 52705, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (108, 73475, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (109, 9517, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (110, 94035, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (111, 20277, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (112, 67410, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (113, 41937, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (114, 66642, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (115, 20471, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (116, 57523, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (117, 78283, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (118, 62701, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (119, 99943, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (120, 84988, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (121, 78405, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (122, 5658, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (123, 99175, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (124, 94812, 10)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (125, 58550, 10)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (126, 79210, 10)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (127, 16453, 10)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (128, 90970, 10)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (129, 63255, 11)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (130, 57773, 11)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (131, 84925, 11)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (132, 21167, 11)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (133, 5685, 11)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (134, 19842, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (135, 30502, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (136, 4986, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (137, 98404, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (138, 19064, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (139, 83458, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (140, 67976, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (141, 31250, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (142, 25778, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (143, 46438, 20)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (144, 49495, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (145, 18948, 8)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (146, 92466, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (147, 50268, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (148, 87400, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (149, 8160, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (150, 45213, 9)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (151, 49746, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (152, 97429, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (153, 34671, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (154, 18199, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (155, 55331, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (156, 76091, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (157, 3133, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (158, 87651, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (159, 24893, 13)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (160, 45553, 13)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
SET IDENTITY_INSERT [dbo].[TicketType] ON 

INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (1, 600, N'America', 1, 5000, 7)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (2, 500, N'Olimpica', 5001, 20000, 7)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (3, 400, N'Amsterdam', 20001, 30000, 7)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (4, 300, N'pepe', 1, 3453, 10)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (5, 600, N'Platea', 1, 200, 11)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (6, 500, N'Palcos Bajos', 201, 500, 11)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (7, 300, N'Cazuela', 501, 800, 11)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (8, 600, N'Platea', 1, 200, 12)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (9, 400, N'Palco', 201, 500, 12)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (10, 450, N'Platea', 1, 200, 13)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (11, 300, N'Palco', 201, 400, 13)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (12, 250, N'Tribuna Norte', 1, 3000, 14)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (13, 200, N'Tribuna Julio Abbadie', 3001, 5000, 14)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (14, 200, N'Tribuna Roberto Sosa', 5001, 7000, 14)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (15, 200, N'Tribuna Sur', 7001, 9000, 14)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (16, 500, N'Tribuna Norte', 1, 10000, 15)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (17, 400, N'Tribuna Sur', 10001, 20000, 15)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (18, 300, N'Tribuna Este', 20001, 25000, 15)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (19, 300, N'Tribuna Oeste', 25001, 30000, 15)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (20, 300, N'General', 1, 15000, 16)
SET IDENTITY_INSERT [dbo].[TicketType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (1, N'penalunandres@gmail.com', N'12345678', N'Andres', N'Peña', CAST(N'1990-03-28' AS Date), 0, 1, N'')
INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (5, N'admin@ticketsale.com', N'12345678', N'Carlos', N'Perez', CAST(N'1990-06-20' AS Date), 1, 1, N'')
INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (6, N'andres07_28@hotmail.com', N'123456789', N'Andrés', N'Peña', CAST(N'2015-07-13' AS Date), 0, 1, N'')
INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (7, N'maxisamuelsosa@gmail.com', N'12345678', N'Maximiliano', N'Sosa', CAST(N'1998-07-07' AS Date), 0, 1, N'444e8c3ac69ae31abe3980e777edfa59')
INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (8, N'julito.gg@gmail.com', N'123456789', N'Julio', N'Grajales', CAST(N'1985-04-14' AS Date), 0, 1, N'8e01f1d88c1d8c9adc4871fc710f04a9')
INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (9, N'nicolascarnebia@gmail.com', N'12345678', N'Nicolas', N'Carnebia', CAST(N'1987-07-13' AS Date), 0, 1, N'3b4d9e28964593b538b90ab8c427d4fe')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[CashPayment]  WITH CHECK ADD  CONSTRAINT [FK_CashPayment_Payment] FOREIGN KEY([idReservation])
REFERENCES [dbo].[Payment] ([idReservation])
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
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Reservation] FOREIGN KEY([idReservation])
REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Reservation]
GO
ALTER TABLE [dbo].[PaypalPayment]  WITH CHECK ADD  CONSTRAINT [FK_PaypalPayment_Payment] FOREIGN KEY([idReservation])
REFERENCES [dbo].[Payment] ([idReservation])
GO
ALTER TABLE [dbo].[PaypalPayment] CHECK CONSTRAINT [FK_PaypalPayment_Payment]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_User]
GO
ALTER TABLE [dbo].[SubOrder]  WITH CHECK ADD  CONSTRAINT [FK_SubOrder_Reservation] FOREIGN KEY([idReservation])
REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[SubOrder] CHECK CONSTRAINT [FK_SubOrder_Reservation]
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
USE [master]
GO
ALTER DATABASE [TicketSale] SET  READ_WRITE 
GO
