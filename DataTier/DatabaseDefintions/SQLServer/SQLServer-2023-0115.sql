USE [datasynthesis]
GO
ALTER DATABASE [DataSynthesis] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataSynthesis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataSynthesis] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DataSynthesis] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DataSynthesis] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DataSynthesis] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DataSynthesis] SET ARITHABORT OFF
GO
ALTER DATABASE [DataSynthesis] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DataSynthesis] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DataSynthesis] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DataSynthesis] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DataSynthesis] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DataSynthesis] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DataSynthesis] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DataSynthesis] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DataSynthesis] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DataSynthesis] SET  DISABLE_BROKER
GO
ALTER DATABASE [DataSynthesis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DataSynthesis] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DataSynthesis] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DataSynthesis] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DataSynthesis] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DataSynthesis] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DataSynthesis] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DataSynthesis] SET RECOVERY FULL
GO
ALTER DATABASE [DataSynthesis] SET  MULTI_USER
GO
ALTER DATABASE [DataSynthesis] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DataSynthesis] SET DB_CHAINING OFF
GO
ALTER DATABASE [DataSynthesis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [DataSynthesis] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [DataSynthesis] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [DataSynthesis] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DataSynthesis', N'ON'
GO
ALTER DATABASE [DataSynthesis] SET QUERY_STORE = ON
GO
ALTER DATABASE [DataSynthesis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DataSynthesis]
GO
/****** Object:  User [datasynthesis]    Script Date: 1/15/2023 8:24:57 PM ******/
CREATE USER [datasynthesis] FOR LOGIN [datasynthesis] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [datasynthesis]
GO
/****** Object:  Table [dbo].[dataexisting_ababanking]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_ababanking](
	[ababankingid] [int] NOT NULL,
	[routingnumber] [varchar](9) NULL,
	[telegraphicname] [varchar](20) NULL,
	[customername] [varchar](36) NULL,
	[city] [varchar](20) NULL,
	[statecode] [varchar](2) NULL,
	[zipcode] [varchar](5) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[ababankingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_areacode]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_areacode](
	[areacodeid] [int] NOT NULL,
	[areacodevalue] [varchar](3) NOT NULL,
	[timezone] [varchar](3) NULL,
	[statecode] [varchar](2) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[areacodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_areacodeintl]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_areacodeintl](
	[iddcode] [varchar](5) NOT NULL,
	[countryid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[iddcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_companies]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_companies](
	[companiesid] [int] NOT NULL,
	[companyname] [varchar](79) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[companiesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_namefirst]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_namefirst](
	[firstnameid] [int] NOT NULL,
	[firstname] [varchar](39) NULL,
	[gender] [varchar](1) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[firstnameid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_namelast]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_namelast](
	[lastnameid] [int] NOT NULL,
	[lastname] [varchar](69) NULL,
	[statusid] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[lastnameid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_upccodes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_upccodes](
	[upccodeid] [int] NOT NULL,
	[upccodename] [varchar](15) NULL,
	[upcproductname] [varchar](150) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[upccodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_zipcodeintl]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_zipcodeintl](
	[zipcodeintnlid] [int] NOT NULL,
	[zipcode] [char](10) NOT NULL,
	[zipcodetype] [varchar](15) NULL,
	[city] [varchar](75) NULL,
	[country] [int] NULL,
	[lattitude] [varchar](10) NULL,
	[longitude] [varchar](10) NULL,
	[Location] [varchar](99) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[zipcodeintnlid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataexisting_zipcodeus]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataexisting_zipcodeus](
	[zipcodeid] [int] NOT NULL,
	[zipcode] [char](5) NOT NULL,
	[zipcodetype] [varchar](15) NULL,
	[city] [varchar](75) NULL,
	[statecode] [varchar](2) NULL,
	[lattitude] [varchar](10) NULL,
	[longitude] [varchar](10) NULL,
	[lctn] [varchar](99) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[zipcodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_accountnumbers]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_accountnumbers](
	[accountnumbersid] [int] NOT NULL,
	[accountnumbervalue] [varchar](20) NULL,
	[createddate] [datetime] NULL,
	[createduser] [varchar](20) NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[accountnumbersid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_addresses]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_addresses](
	[addressid] [int] NOT NULL,
	[addressstreet] [varchar](99) NULL,
	[addressstreet2] [varchar](59) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[addressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_bankaccount]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_bankaccount](
	[bankaccountsid] [int] NOT NULL,
	[bankaccountvalue] [varchar](17) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[bankaccountsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_creditcard]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_creditcard](
	[creditcardid] [int] NOT NULL,
	[creditcardnumber] [varchar](20) NULL,
	[creditcardname] [varchar](20) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[creditcardid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_custom]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_custom](
	[datagencustomdid] [int] NOT NULL,
	[customidentifier] [varchar](40) NULL,
	[customidentifierdesc] [varchar](29) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[datagencustomdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_dateofbirth]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_dateofbirth](
	[dateofbirthsid] [int] NOT NULL,
	[dateofbirth] [varchar](12) NULL,
	[dateofbirthdate] [date] NULL,
	[age] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[dateofbirthsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_devices]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_devices](
	[devicesid] [int] NOT NULL,
	[devicename] [varchar](40) NULL,
	[devicetypeid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[application] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[devicesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_driverslicenses]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_driverslicenses](
	[driverslicensesid] [int] NOT NULL,
	[dln] [varchar](25) NULL,
	[statecode] [varchar](2) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[datagentypeid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[driverslicensesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_ein]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_ein](
	[einid] [int] NOT NULL,
	[einvalue] [varchar](10) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[einid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_phonenumber]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_phonenumber](
	[phonenumberid] [int] NOT NULL,
	[phonenumbervalue] [varchar](8) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[phonenumberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_phonenumbersintl]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_phonenumbersintl](
	[phonenumberintlid] [int] NOT NULL,
	[phonenumbervalue] [varchar](12) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[countryid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[phonenumberintlid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_serialnumbers]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_serialnumbers](
	[serialnumberid] [int] NOT NULL,
	[serialnumbervalue] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[serialnumberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_socialsecuritynumber]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_socialsecuritynumber](
	[socialsecuritynumberid] [int] NOT NULL,
	[socialsecuritynumbervalue] [varchar](11) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[socialsecuritynumberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datagenerated_useridentities]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datagenerated_useridentities](
	[useridentitiesid] [int] NOT NULL,
	[useridentityvalue] [varchar](20) NULL,
	[userdomain] [varchar](20) NULL,
	[additionalattributes] [varchar](40) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
	[datagentypeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[useridentitiesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datamodel_apis]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datamodel_apis](
	[datamodelapiid] [int] NOT NULL,
	[technology] [varchar](30) NULL,
	[baseurllocation] [varchar](99) NULL,
	[apiname] [varchar](79) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[details] [varchar](249) NULL,
	[datmodel_tablename] [varchar](99) NULL,
	[apiparams] [varchar](59) NULL,
	[apiexample] [varchar](149) NULL,
	[dataattributeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[datamodelapiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datamodel_datatables]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datamodel_datatables](
	[tablename] [varchar](64) NOT NULL,
	[tableinformation] [varchar](249) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NULL,
	[domain] [varchar](64) NULL,
PRIMARY KEY CLUSTERED
(
	[tablename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datamodel_domain]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datamodel_domain](
	[domainname] [varchar](64) NOT NULL,
	[domaininformation] [varchar](249) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[domainname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datastructure_core]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datastructure_core](
	[datastructurecoreid] [int] NOT NULL,
	[datastructurename] [varchar](29) NULL,
	[datastructuredetails] [text] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[datastructurecoreid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_application]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_application](
	[appguid] [char](38) NOT NULL,
	[applicationcustomcode] [varchar](15) NULL,
	[applicationdesc] [varchar](50) NULL,
	[createduser] [varchar](20) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[vendorid] [int] NULL,
	[industry_oid] [varchar](49) NULL,
	[organization_uid] [varchar](49) NULL,
PRIMARY KEY CLUSTERED
(
	[appguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_codesets]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_codesets](
	[implcodesetid] [int] NOT NULL,
	[codesetsid] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[organizationid] [char](38) NULL,
	[applicationid] [char](38) NULL,
	[industrystd] [varchar](6) NULL,
	[externaltableid] [varchar](20) NULL,
	[externalnotes] [varchar](149) NULL,
	[externallink] [varchar](99) NULL,
	[codesetdesc] [varchar](69) NULL,
PRIMARY KEY CLUSTERED
(
	[implcodesetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_codesets_crossmaps]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_codesets_crossmaps](
	[codesetcrossmapid] [int] NOT NULL,
	[implcodesetsid] [int] NOT NULL,
	[codesettoapplicationid] [bigint] NULL,
	[terminologystdto] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[transformcodevalue] [varchar](40) NULL,
	[transformcodedesc] [varchar](129) NULL,
	[originalcodevalue] [varchar](40) NULL,
	[originalcodedesc] [varchar](40) NULL,
PRIMARY KEY CLUSTERED
(
	[codesetcrossmapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_legalentities]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_legalentities](
	[legalentityguid] [char](38) NOT NULL,
	[locationname] [varchar](50) NULL,
	[address] [varchar](75) NULL,
	[city] [varchar](60) NULL,
	[stateid] [varchar](2) NULL,
	[zipcode] [varchar](12) NULL,
	[createduser] [varchar](20) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NOT NULL,
	[locationurl] [varchar](99) NULL,
	[locationphone] [varchar](12) NULL,
PRIMARY KEY CLUSTERED
(
	[legalentityguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_organization]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_organization](
	[organizationguid] [char](38) NOT NULL,
	[organizationinternalcode] [varchar](10) NULL,
	[organizationinternalid] [varchar](10) NULL,
	[organizationname] [varchar](50) NULL,
	[address] [varchar](75) NULL,
	[city] [varchar](60) NULL,
	[stateid] [varchar](2) NULL,
	[zipcode] [varchar](12) NULL,
	[createduser] [varchar](20) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NOT NULL,
	[legalentityguid] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[organizationguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_rulesets]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_rulesets](
	[ruleid] [int] NOT NULL,
	[rulename] [varchar](65) NULL,
	[createduser] [varchar](20) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[expirationdate] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[ruleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impl_rulesetsdefinitions]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impl_rulesetsdefinitions](
	[rulesetdefinitionsid] [char](38) NOT NULL,
	[rulesetdefinitionname] [varchar](50) NULL,
	[rulesetid] [int] NULL,
	[steporderid] [int] NULL,
	[operationtypeid] [varchar](7) NULL,
	[rulesetdefvalue] [char](40) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NULL,
	[effectivedate] [datetime] NULL,
	[applicationid] [char](38) NULL,
	[termdate] [datetime] NULL,
	[dataattributeid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[rulesetdefinitionsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_appsettings_general]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_appsettings_general](
	[appsettingsid] [int] NOT NULL,
	[appsettingname] [varchar](50) NULL,
	[appsettingvalue] [varchar](199) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
	[defaultdatagenerationapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[appsettingsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_config_dataattributes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_config_dataattributes](
	[datagenconfigid] [int] NOT NULL,
	[datatypegenconfigname] [varchar](25) NULL,
	[dataattributeid] [int] NULL,
	[runquantity] [int] NULL,
	[datagentypeid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[applicationid] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[datagenconfigid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_config_datastructures]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_config_datastructures](
	[platformdatastructuresid] [int] NOT NULL,
	[datastructurename] [varchar](50) NULL,
	[sensitivityflagid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[platformdatastructuresguid] [char](38) NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[platformdatastructuresid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_config_datastructures_dtl]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_config_datastructures_dtl](
	[platformdatastructurestodataattributesid] [int] NOT NULL,
	[platformdatastructuresid] [int] NULL,
	[compositedatastructurename] [varchar](50) NULL,
	[sensitivityflagid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[platformdatastructurestodataattributesguid] [char](38) NULL,
	[registeredapp] [char](38) NULL,
	[platformdataattributesid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[platformdatastructurestodataattributesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[platform_dataattributes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform_dataattributes](
	[platformdataattributesid] [int] NOT NULL,
	[dataattributename] [varchar](50) NULL,
	[sensitivityflagid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[platformdataattributeguid] [char](38) NULL,
	[registeredapp] [char](38) NULL,
	[platformtablename] [varchar](38) NULL,
PRIMARY KEY CLUSTERED
(
	[platformdataattributesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_codeset]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_codeset](
	[codesetsid] [int] NOT NULL,
	[codesetname] [varchar](50) NULL,
	[industrystd] [varchar](6) NULL,
	[statusid] [int] NULL,
	[createddate] [datetime] NULL,
	[createduser] [varchar](20) NULL,
	[codesetguid] [char](38) NULL,
	[fieldmapping] [varchar](40) NULL,
	[sensitivityflagid] [int] NULL,
	[externaltableid] [varchar](20) NULL,
	[externalnotes] [varchar](149) NULL,
	[externallink] [varchar](99) NULL,
PRIMARY KEY CLUSTERED
(
	[codesetsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_countries]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_countries](
	[countryid] [int] NOT NULL,
	[idd] [varchar](5) NULL,
	[countryname] [varchar](59) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[countryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_datagentypes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_datagentypes](
	[datagentypeid] [int] NOT NULL,
	[datagentypedescription] [varchar](65) NULL,
	[definition] [varchar](255) NULL,
	[dataattributeid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[datagentypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_devicetypes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_devicetypes](
	[devicetypeid] [int] NOT NULL,
	[devicetype] [varchar](30) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[devicetypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_industries]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_industries](
	[industryid] [int] NOT NULL,
	[industryname] [varchar](45) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[industryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_industriestobusiness]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_industriestobusiness](
	[industrytobusinessid] [int] NOT NULL,
	[industryid] [int] NULL,
	[businessarea] [varchar](50) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[industrytobusinessid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_industrystd]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_industrystd](
	[industrystd] [varchar](6) NOT NULL,
	[industrystddesc] [varchar](30) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[industrystd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_operationtype]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_operationtype](
	[operationtypeid] [varchar](7) NOT NULL,
	[operationtypename] [varchar](60) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[operationtypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_platformparams]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_platformparams](
	[platformparamsid] [int] NOT NULL,
	[platformparamvalues] [varchar](35) NULL,
	[platformparamdesc] [varchar](70) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[platformparamsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_platformparamstodataattributes]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_platformparamstodataattributes](
	[platformparamstodataattributeid] [int] NOT NULL,
	[platformparamsid] [int] NULL,
	[dataattributeid] [int] NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[registeredapp] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[platformparamstodataattributeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_sensitivityflag]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_sensitivityflag](
	[sensitiveflagid] [int] NOT NULL,
	[sensitiveflagdesc] [varchar](30) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[sensitiveflagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_status]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_status](
	[statusid] [int] NOT NULL,
	[statusdescription] [varchar](45) NOT NULL,
	[createddate] [datetime] NULL,
	[createduser] [varchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[statusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_terminologystd]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_terminologystd](
	[terminologystdid] [int] NOT NULL,
	[terminologystd] [varchar](25) NOT NULL,
	[terminologystdversion] [varchar](10) NOT NULL,
	[terminologystddesc] [varchar](129) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[terminologystdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_timezones]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_timezones](
	[timezonevalue] [varchar](3) NOT NULL,
	[timezonedesc] [varchar](25) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[timezonevalue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_usstates]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_usstates](
	[stateid] [varchar](2) NOT NULL,
	[statedescription] [varchar](65) NULL,
	[lattitude] [varchar](12) NULL,
	[longitude] [varchar](12) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[stateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refdata_vendor]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refdata_vendor](
	[vendorid] [int] NOT NULL,
	[vendorname] [varchar](50) NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[createduser] [varchar](20) NULL,
	[vendorguid] [char](38) NULL,
PRIMARY KEY CLUSTERED
(
	[vendorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[terms_codeset_industrystd]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[terms_codeset_industrystd](
	[termcodesetid] [int] NOT NULL,
	[codesetsid] [int] NOT NULL,
	[createddate] [datetime] NULL,
	[statusid] [int] NULL,
	[codevalue] [varchar](20) NULL,
	[codedesc] [varchar](129) NULL,
	[industrystd] [varchar](6) NULL,
	[terminologystdid] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[termcodesetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[terms_umls_mrconoso]    Script Date: 1/15/2023 8:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[terms_umls_mrconoso](
	[cui] [char](8) NOT NULL,
	[lat] [char](3) NOT NULL,
	[ts] [char](1) NOT NULL,
	[lui] [varchar](10) NOT NULL,
	[stt] [varchar](3) NOT NULL,
	[sui] [varchar](10) NOT NULL,
	[ispref] [char](1) NOT NULL,
	[aui] [varchar](9) NOT NULL,
	[saui] [varchar](50) NULL,
	[scui] [varchar](100) NULL,
	[sdui] [varchar](100) NULL,
	[sab] [varchar](20) NOT NULL,
	[tty] [varchar](20) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[str] [varchar](3000) NOT NULL,
	[srl] [varchar](25) NOT NULL,
	[suppress] [char](1) NOT NULL,
	[cvf] [varchar](25) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dataexisting_ababanking]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_ababanking]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_areacode]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_areacode]  WITH CHECK ADD FOREIGN KEY([statecode])
REFERENCES [dbo].[refdata_usstates] ([stateid])
GO
ALTER TABLE [dbo].[dataexisting_areacode]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_areacode]  WITH CHECK ADD FOREIGN KEY([timezone])
REFERENCES [dbo].[refdata_timezones] ([timezonevalue])
GO
ALTER TABLE [dbo].[dataexisting_areacodeintl]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[refdata_countries] ([countryid])
GO
ALTER TABLE [dbo].[dataexisting_areacodeintl]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_areacodeintl]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_companies]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_companies]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_namefirst]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_namefirst]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_namelast]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_namelast]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_upccodes]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_upccodes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_zipcodeintl]  WITH CHECK ADD FOREIGN KEY([country])
REFERENCES [dbo].[refdata_countries] ([countryid])
GO
ALTER TABLE [dbo].[dataexisting_zipcodeintl]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_zipcodeintl]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[dataexisting_zipcodeus]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[dataexisting_zipcodeus]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_accountnumbers]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_accountnumbers]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_accountnumbers]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_addresses]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_addresses]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_addresses]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_bankaccount]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_bankaccount]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_bankaccount]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_creditcard]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_creditcard]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_creditcard]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_custom]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_custom]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_custom]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_dateofbirth]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_dateofbirth]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_devices]  WITH CHECK ADD FOREIGN KEY([application])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_devices]  WITH CHECK ADD FOREIGN KEY([devicetypeid])
REFERENCES [dbo].[refdata_devicetypes] ([devicetypeid])
GO
ALTER TABLE [dbo].[datagenerated_devices]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_driverslicenses]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_driverslicenses]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_driverslicenses]  WITH CHECK ADD FOREIGN KEY([statecode])
REFERENCES [dbo].[refdata_usstates] ([stateid])
GO
ALTER TABLE [dbo].[datagenerated_driverslicenses]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_ein]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_ein]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_phonenumber]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_phonenumber]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_phonenumbersintl]  WITH CHECK ADD FOREIGN KEY([countryid])
REFERENCES [dbo].[refdata_countries] ([countryid])
GO
ALTER TABLE [dbo].[datagenerated_phonenumbersintl]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_phonenumbersintl]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_serialnumbers]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_serialnumbers]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_socialsecuritynumber]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_socialsecuritynumber]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datagenerated_useridentities]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[datagenerated_useridentities]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datagenerated_useridentities]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datamodel_apis]  WITH CHECK ADD FOREIGN KEY([dataattributeid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[datamodel_apis]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datamodel_datatables]  WITH CHECK ADD FOREIGN KEY([domain])
REFERENCES [dbo].[datamodel_domain] ([domainname])
GO
ALTER TABLE [dbo].[datamodel_datatables]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[datastructure_core]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[datastructure_core]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_application]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_application]  WITH CHECK ADD FOREIGN KEY([vendorid])
REFERENCES [dbo].[refdata_vendor] ([vendorid])
GO
ALTER TABLE [dbo].[impl_codesets]  WITH CHECK ADD FOREIGN KEY([applicationid])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[impl_codesets]  WITH CHECK ADD FOREIGN KEY([codesetsid])
REFERENCES [dbo].[refdata_codeset] ([codesetsid])
GO
ALTER TABLE [dbo].[impl_codesets]  WITH CHECK ADD FOREIGN KEY([industrystd])
REFERENCES [dbo].[refdata_industrystd] ([industrystd])
GO
ALTER TABLE [dbo].[impl_codesets]  WITH CHECK ADD FOREIGN KEY([organizationid])
REFERENCES [dbo].[impl_organization] ([organizationguid])
GO
ALTER TABLE [dbo].[impl_codesets]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_codesets_crossmaps]  WITH CHECK ADD FOREIGN KEY([implcodesetsid])
REFERENCES [dbo].[impl_codesets] ([implcodesetid])
GO
ALTER TABLE [dbo].[impl_codesets_crossmaps]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_codesets_crossmaps]  WITH CHECK ADD FOREIGN KEY([terminologystdto])
REFERENCES [dbo].[refdata_terminologystd] ([terminologystdid])
GO
ALTER TABLE [dbo].[impl_legalentities]  WITH CHECK ADD FOREIGN KEY([stateid])
REFERENCES [dbo].[refdata_usstates] ([stateid])
GO
ALTER TABLE [dbo].[impl_legalentities]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_organization]  WITH CHECK ADD FOREIGN KEY([legalentityguid])
REFERENCES [dbo].[impl_legalentities] ([legalentityguid])
GO
ALTER TABLE [dbo].[impl_organization]  WITH CHECK ADD FOREIGN KEY([stateid])
REFERENCES [dbo].[refdata_usstates] ([stateid])
GO
ALTER TABLE [dbo].[impl_organization]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_rulesets]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[impl_rulesetsdefinitions]  WITH CHECK ADD FOREIGN KEY([applicationid])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[impl_rulesetsdefinitions]  WITH CHECK ADD FOREIGN KEY([dataattributeid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[impl_rulesetsdefinitions]  WITH CHECK ADD FOREIGN KEY([operationtypeid])
REFERENCES [dbo].[refdata_operationtype] ([operationtypeid])
GO
ALTER TABLE [dbo].[impl_rulesetsdefinitions]  WITH CHECK ADD FOREIGN KEY([rulesetid])
REFERENCES [dbo].[impl_rulesets] ([ruleid])
GO
ALTER TABLE [dbo].[impl_rulesetsdefinitions]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[platform_appsettings_general]  WITH CHECK ADD FOREIGN KEY([defaultdatagenerationapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_appsettings_general]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_appsettings_general]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[platform_config_dataattributes]  WITH CHECK ADD FOREIGN KEY([applicationid])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_config_dataattributes]  WITH CHECK ADD FOREIGN KEY([dataattributeid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[platform_config_dataattributes]  WITH CHECK ADD FOREIGN KEY([datagentypeid])
REFERENCES [dbo].[refdata_datagentypes] ([datagentypeid])
GO
ALTER TABLE [dbo].[platform_config_dataattributes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[platform_config_datastructures]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_config_datastructures]  WITH CHECK ADD FOREIGN KEY([sensitivityflagid])
REFERENCES [dbo].[refdata_sensitivityflag] ([sensitiveflagid])
GO
ALTER TABLE [dbo].[platform_config_datastructures]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[platform_config_datastructures_dtl]  WITH CHECK ADD FOREIGN KEY([platformdatastructuresid])
REFERENCES [dbo].[platform_config_datastructures] ([platformdatastructuresid])
GO
ALTER TABLE [dbo].[platform_config_datastructures_dtl]  WITH CHECK ADD FOREIGN KEY([platformdataattributesid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[platform_config_datastructures_dtl]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_config_datastructures_dtl]  WITH CHECK ADD FOREIGN KEY([sensitivityflagid])
REFERENCES [dbo].[refdata_sensitivityflag] ([sensitiveflagid])
GO
ALTER TABLE [dbo].[platform_config_datastructures_dtl]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[platform_dataattributes]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[platform_dataattributes]  WITH CHECK ADD FOREIGN KEY([sensitivityflagid])
REFERENCES [dbo].[refdata_sensitivityflag] ([sensitiveflagid])
GO
ALTER TABLE [dbo].[platform_dataattributes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_codeset]  WITH CHECK ADD FOREIGN KEY([industrystd])
REFERENCES [dbo].[refdata_industrystd] ([industrystd])
GO
ALTER TABLE [dbo].[refdata_codeset]  WITH CHECK ADD FOREIGN KEY([sensitivityflagid])
REFERENCES [dbo].[refdata_sensitivityflag] ([sensitiveflagid])
GO
ALTER TABLE [dbo].[refdata_codeset]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_countries]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_datagentypes]  WITH CHECK ADD FOREIGN KEY([dataattributeid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[refdata_datagentypes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_devicetypes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_industries]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_industriestobusiness]  WITH CHECK ADD FOREIGN KEY([industryid])
REFERENCES [dbo].[refdata_industries] ([industryid])
GO
ALTER TABLE [dbo].[refdata_industriestobusiness]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_industrystd]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_operationtype]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_platformparams]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_platformparamstodataattributes]  WITH CHECK ADD FOREIGN KEY([dataattributeid])
REFERENCES [dbo].[platform_dataattributes] ([platformdataattributesid])
GO
ALTER TABLE [dbo].[refdata_platformparamstodataattributes]  WITH CHECK ADD FOREIGN KEY([platformparamsid])
REFERENCES [dbo].[refdata_platformparams] ([platformparamsid])
GO
ALTER TABLE [dbo].[refdata_platformparamstodataattributes]  WITH CHECK ADD FOREIGN KEY([registeredapp])
REFERENCES [dbo].[impl_application] ([appguid])
GO
ALTER TABLE [dbo].[refdata_platformparamstodataattributes]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_sensitivityflag]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_terminologystd]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_timezones]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_usstates]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[refdata_vendor]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[terms_codeset_industrystd]  WITH CHECK ADD FOREIGN KEY([codesetsid])
REFERENCES [dbo].[refdata_codeset] ([codesetsid])
GO
ALTER TABLE [dbo].[terms_codeset_industrystd]  WITH CHECK ADD FOREIGN KEY([industrystd])
REFERENCES [dbo].[refdata_industrystd] ([industrystd])
GO
ALTER TABLE [dbo].[terms_codeset_industrystd]  WITH CHECK ADD FOREIGN KEY([statusid])
REFERENCES [dbo].[refdata_status] ([statusid])
GO
ALTER TABLE [dbo].[terms_codeset_industrystd]  WITH CHECK ADD FOREIGN KEY([terminologystdid])
REFERENCES [dbo].[refdata_terminologystd] ([terminologystdid])
GO

CREATE INDEX dataexisting_namefirst_idx ON dataexisting_namefirst (firstnameid, firstname, gender, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namefirst_uindex ON dataexisting_namefirst (firstname, gender, registeredapp);

CREATE INDEX dataexisting_namelast_index ON dataexisting_namelast (lastnameid, lastname, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namelast_uindex ON dataexisting_namelast (lastname, registeredapp);

CREATE INDEX datagenerated_accountnumbers_index ON datagenerated_accountnumbers (accountnumbersid, accountnumbervalue, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_accountnumbers_uindex ON datagenerated_accountnumbers (accountnumbervalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_addresses_index ON datagenerated_addresses (addressid, addressstreet, addressstreet2, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_addresses_pkey ON datagenerated_addresses (addressid);

CREATE UNIQUE INDEX datagenerated_addresses_uindex ON datagenerated_addresses (addressstreet, addressstreet2, registeredapp, datagentypeid);

CREATE INDEX datagenerated_bankaccount_index ON datagenerated_bankaccount (bankaccountsid, bankaccountvalue, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_bankaccount_pkey ON datagenerated_bankaccount (bankaccountsid);

CREATE UNIQUE INDEX datagenerated_bankaccount_uindex ON datagenerated_bankaccount (bankaccountvalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_creditcard_index ON datagenerated_creditcard (creditcardid, creditcardnumber, creditcardname, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_creditcard_uindex ON datagenerated_creditcard (creditcardnumber, creditcardname, registeredapp, datagentypeid);

CREATE INDEX datagenerated_custom_index ON datagenerated_custom (customidentifier, customidentifierdesc, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_custom_uindex ON datagenerated_custom (customidentifier, customidentifierdesc, registeredapp, datagentypeid);

CREATE INDEX datagenerated_dateofbirth_index ON datagenerated_dateofbirth (dateofbirthsid, dateofbirth, age, dateofbirthdate, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_dateofbirth_uindex ON datagenerated_dateofbirth (dateofbirthdate, dateofbirth,  registeredapp);

CREATE INDEX datagenerated_driverslicenses_index ON datagenerated_driverslicenses (driverslicensesid, dln, statecode, createddate, statusid, datagentypeid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_driverslicenses_uindex ON datagenerated_driverslicenses (dln, statecode, datagentypeid, registeredapp);

CREATE INDEX datagenerated_ein_index ON datagenerated_ein (einid, einvalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_ein_uindex ON datagenerated_ein (einvalue, registeredapp);

CREATE INDEX datagenerated_phonenumber_index ON datagenerated_phonenumber (phonenumberid, phonenumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumber_uindex ON datagenerated_phonenumber (phonenumbervalue, registeredapp);

CREATE INDEX datagenerated_phonenumbersintl_index ON datagenerated_phonenumbersintl (phonenumberintlid, phonenumbervalue, createddate, statusid, countryid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumbersintl_uindex ON datagenerated_phonenumbersintl (phonenumbervalue, countryid, registeredapp);

CREATE INDEX datagenerated_socialsecuritynumber_index ON datagenerated_socialsecuritynumber (socialsecuritynumberid, socialsecuritynumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_socialsecuritynumber_uindex ON datagenerated_socialsecuritynumber (socialsecuritynumbervalue, registeredapp);

CREATE INDEX datagenerated_useridentities_index ON datagenerated_useridentities (useridentitiesid, useridentityvalue, userdomain, additionalattributes, createddate, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_useridentities_uindex ON datagenerated_useridentities (useridentityvalue, userdomain, additionalattributes, registeredapp);

CREATE UNIQUE INDEX refdata_devices_devicesid_uindex ON datagenerated_devices (devicesid);

CREATE UNIQUE INDEX refdata_industriestobusiness_industrytobusinessid_uindex ON refdata_industriestobusiness (industrytobusinessid);

CREATE INDEX terms_codeset_industrystd_index ON terms_codeset_industrystd (termcodesetid, codesetsid, createddate, statusid, codevalue, codedesc, industrystd);

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON terms_codeset_industrystd (codesetsid, codevalue, codedesc, industrystd);

CREATE INDEX terms_umls_mrconoso_index ON terms_umls_mrconoso (cui, lat, ts, lui, stt, sui, ispref, aui, saui, scui, sdui, sab, tty, code, str, srl, suppress, cvf);

USE [master]
GO
ALTER DATABASE [DataSynthesis] SET  READ_WRITE
GO
