USE [master]
GO
/****** Object:  Database [TicketSale]    Script Date: 21/06/2015 17:26:06 ******/
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
/****** Object:  Table [dbo].[CashPayment]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[EventLocation]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[PaymentLocation]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[PaypalPayment]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[Reservation]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[SubOrder]    Script Date: 21/06/2015 17:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [tinyint] NOT NULL,
	[idReservation] [int] NOT NULL,
	[idTicket] [int] NOT NULL,
 CONSTRAINT [PK_SubOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[TicketType]    Script Date: 21/06/2015 17:26:07 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 21/06/2015 17:26:07 ******/
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
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (2, CAST(N'2015-06-06 00:00:00.000' AS DateTime), 1, N'Barcelona Juventus of the stones', N'Final Champions League', 1, N'futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (4, CAST(N'2015-07-06 00:00:00.000' AS DateTime), 1, N'Racing - Penarol', N'Campeonato Uruguayo', 1, N'futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (5, CAST(N'2015-06-06 00:00:00.000' AS DateTime), 1, N'San Lorenzo - Belgrano', N'Torneo Final', 1, N'futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (7, CAST(N'2015-05-06 00:00:00.000' AS DateTime), 1, N'Nacional - Tacuarembo', N'Campeonato Uruguayo', 1, N'futbol')
INSERT [dbo].[Event] ([id], [date], [enabled], [name], [description], [idEventLocation], [type]) VALUES (9, CAST(N'2015-06-20 00:00:00.000' AS DateTime), 1, N'Uruguay - Paraguay', N'Copa America 2015', 1, N'futbol')
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventLocation] ON 

INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (1, N'Estadio Centenario', 123456, N'Atras del clinica')
INSERT [dbo].[EventLocation] ([id], [name], [phoneNumber], [address]) VALUES (2, N'Parque Central', 223423, N'Por ahi')
SET IDENTITY_INSERT [dbo].[EventLocation] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (1, 1, 1)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (2, 1, 2)
INSERT [dbo].[Ticket] ([id], [number], [idTicketType]) VALUES (3, 2, 1)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
SET IDENTITY_INSERT [dbo].[TicketType] ON 

INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (1, 600, N'America', 1, 5000, 9)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (2, 500, N'Olimpica', 5001, 20000, 9)
INSERT [dbo].[TicketType] ([id], [cost], [description], [startNum], [finalNum], [idEvent]) VALUES (3, 400, N'Amsterdam', 20001, 30000, 9)
SET IDENTITY_INSERT [dbo].[TicketType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [mail], [password], [name], [lastName], [dateBirth], [userType], [active], [token]) VALUES (1, N'penalunandres@gmail.com', N'123456', N'Andres', N'Peña', CAST(N'2015-06-19' AS Date), 0, 1, N'')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[SubOrder] ADD  CONSTRAINT [DF_SubOrder_active]  DEFAULT ((1)) FOR [active]
GO
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
ALTER TABLE [dbo].[TicketType]  WITH CHECK ADD  CONSTRAINT [FK_TicketType_Event] FOREIGN KEY([idEvent])
REFERENCES [dbo].[Event] ([id])
GO
ALTER TABLE [dbo].[TicketType] CHECK CONSTRAINT [FK_TicketType_Event]
GO
USE [master]
GO
ALTER DATABASE [TicketSale] SET  READ_WRITE 
GO
