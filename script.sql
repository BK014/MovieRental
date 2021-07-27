USE [master]
GO
/****** Object:  Database [VBMOVIESFULLDATA.MDF]    Script Date: 27/07/2021 3:46:42 PM ******/
CREATE DATABASE [VBMOVIESFULLDATA.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VBMoviesFullData', FILENAME = N'C:\DATABASE\VBMoviesFullData.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VBMoviesFullData_log', FILENAME = N'C:\DATABASE\VBMoviesFullData_log.ldf' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VBMOVIESFULLDATA.MDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET  MULTI_USER 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VBMOVIESFULLDATA.MDF', N'ON'
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET QUERY_STORE = OFF
GO
USE [VBMOVIESFULLDATA.MDF]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nvarchar](50) NULL,
	[Title] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Rental_Cost] [money] NULL,
	[Copies] [nvarchar](50) NULL,
	[Plot] [ntext] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedMovies](
	[RMID] [int] IDENTITY(1,1) NOT NULL,
	[MovieIDFK] [int] NULL,
	[CustIDFK] [int] NULL,
	[DateRented] [datetime] NULL,
	[DateReturned] [datetime] NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustomerAndMoviesRented]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerAndMoviesRented]
AS
SELECT     dbo.RentedMovies.RMID, dbo.Customer.FirstName, dbo.Customer.LastName, dbo.Customer.Address, dbo.Movies.Title, dbo.Movies.Rental_Cost, dbo.RentedMovies.DateRented, dbo.RentedMovies.DateReturned
FROM        dbo.Customer INNER JOIN
                  dbo.RentedMovies ON dbo.Customer.CustID = dbo.RentedMovies.CustIDFK INNER JOIN
                  dbo.Movies ON dbo.RentedMovies.MovieIDFK = dbo.Movies.MovieID
GO
/****** Object:  View [dbo].[MoviesOut]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MoviesOut]
AS
SELECT     dbo.RentedMovies.RMID, dbo.Customer.FirstName, dbo.Customer.LastName, dbo.Customer.Address, dbo.Movies.Title, dbo.Movies.Rental_Cost, dbo.RentedMovies.DateRented, dbo.RentedMovies.DateReturned
FROM        dbo.Customer INNER JOIN
                  dbo.RentedMovies ON dbo.Customer.CustID = dbo.RentedMovies.CustIDFK INNER JOIN
                  dbo.Movies ON dbo.RentedMovies.MovieIDFK = dbo.Movies.MovieID
WHERE     (dbo.RentedMovies.DateReturned IS NULL) AND (NOT (dbo.RentedMovies.DateRented IS NULL))
GROUP BY dbo.RentedMovies.RMID, dbo.Customer.FirstName, dbo.Customer.LastName, dbo.Customer.Address, dbo.Movies.Title, dbo.Movies.Rental_Cost, dbo.RentedMovies.DateRented, dbo.RentedMovies.DateReturned
GO
/****** Object:  View [dbo].[CUSTOMER_BORROWING_MORE_MOVIES]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CUSTOMER_BORROWING_MORE_MOVIES]
AS
select top 1000 c.CustID,c.FirstName,c.LastName,c.Address,c.Phone,count(rm.MovieIDFK) as [NumberOfMovies] from Customer c
inner join RentedMovies rm on rm.CustIDFK=c.CustID
group by c.CustID,c.FirstName,c.LastName,c.Address,c.Phone
order by count(rm.MovieIDFK) desc
GO
/****** Object:  View [dbo].[MostBorrowedMovies]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MostBorrowedMovies]
AS
select top 1000 m.MovieID,m.Rating,m.Title,m.Year,m.Rental_Cost,m.Copies,CAST(m.Plot as nvarchar(1000)) as Plot,m.Genre, count(m.MovieId) as TotalCount from Movies m
inner join RentedMovies rm on rm.MovieIDFK=m.MovieID
group by m.MovieID,m.Rating,m.Title,m.Year,m.Rental_Cost,m.Copies,CAST(m.Plot as nvarchar(1000)),m.Genre
order by count(m.MovieId) desc
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (3, N'Dianne ', N'Shelton', N'484 4th Street North', N'2084708')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (4, N'Harlan ', N'Shields', N'111 Brook Lane', N'4434972')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (5, N'Bobbi ', N'Shannon', N'767 Route 17', N'7225220')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (6, N'Stan ', N'Short', N'875 Edgewood Drive', N'2615295')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (8, N'Tyson ', N'Shepherd', N'398 Pine Street', N'8346936')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (9, N'Laurel ', N'Short', N'955 Valley Drive', N'8406969')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (10, N'Therese ', N'Shepherd', N'226 Front Street South', N'9208849')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (11, N'Ulysses ', N'Shannon', N'529 2nd Avenue', N'5678883')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (12, N'Reuben ', N'Shaffer', N'570 Maiden Lane', N'6049232')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (13, N'Alberta ', N'Sharp', N'222 Route 1', N'5759347')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (14, N'Clara ', N'Shawsss', N'807 Route 41', N'7739826')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (15, N'Hugh ', N'Silva', N'206 Main Street', N'8860054')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (16, N'Maxine ', N'Silva', N'305 Prospect Avenue', N'1371532')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (17, N'Shawn ', N'Simmons', N'130 Cooper Street', N'7642181')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (18, N'Van ', N'Singleton', N'775 Edgewood Drive', N'2582573')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (19, N'Ginger ', N'Simon', N'992 Holly Court', N'4053574')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (20, N'Laurence ', N'Simon', N'950 Maple Street', N'5374945')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1506, N'Feemi', N'Sherman', N'823 Church Street North', N'9564395')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1509, N'ss', N'ss', N'ff', N'123346')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (1, N'N/A', N'Henry IV, Part 1', N'', 0.0000, N'', N'1403:- Henry IV finds himself facing uprisings from the Welsh chieftain Owen Glendower and impetuous young Harry Hotspur,son of the Duke of Northumberland,angry with the king for not paying...        ', N'')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (2, N'N/A', N'Psalm 21', N'2009', 2.0000, N'', N'Henrik, a much beloved priest, doesn''t believe in hell. Upon receiving the news of his fathers death, he starts a journey that will take him through terrifying secrets, distorted childhood memories, and shake the foundation of his belief.', N'Horror, Sci-Fi, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (3, N'R', N'Kill Bill: Vol. 1', N'2003', 2.0000, N'', N'The Bride wakens from a four-year coma. The child she carried in her womb is gone. Now she must wreak vengeance on the team of assassins who betrayed her - a team she was once part of.                ', N'Action, Crime')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (4, N'PG', N'Superbabies: Baby Geniuses 2', N'2004', 2.0000, N'', N'A group of smart-talking toddlers find themselves at the center of a media mogul''s experiment to crack the code to baby talk. The toddlers must race against time for the sake of babies everywhere.', N'Comedy, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (5, N'8', N'Harry Potter and the Deathly Hallows: Part 2', N'2011', 2.0000, N'', N'Harry, Ron and Hermione search for Voldemort''s remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.', N'Adventure, Fantasy, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (6, N'8', N'FX/2', N'1991', 2.0000, N'2', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (7, N'Not Rated', N'8Â½', N'1963', 2.0000, N'', N'A harried movie director retreats into his memories and fantasies.', N'Drama, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (8, N'PG-13', N'Troll 2', N'1990', 2.0000, N'', N'A family vacationing in a small town discovers the entire town is inhabited by goblins in disguise as humans, who plan to eat them.', N'Fantasy, Horror, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (9, N'G', N'Monsters, Inc.', N'2001', 2.0000, N'', N'Monsters generate their city''s power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley finds his world disrupted.', N'Animation, Adventure, Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (10, N'R', N'Snatch.', N'2000', 2.0000, N'', N'Unscrupulous boxing promoters, violent bookmakers, a Russian gangster, incompetent amateur robbers, and supposedly Jewish jewelers fight to track down a priceless stolen diamond.', N'Comedy, Crime')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (11, N'G', N'Toy Story 3', N'2010', 2.0000, N'', N'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it''s up to Woody to convince the other toys that they weren''t abandoned and to return home.', N'Animation, Adventure, Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (12, N'Not Rated', N'Who''s Afraid of Virginia Woolf?', N'1966', 2.0000, N'', N'A bitter aging couple with the help of alcohol, use a young couple to fuel anguish and emotional pain towards each other.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (13, N'Not Rated', N'The Incredibly Strange Creatures Who Stopped Living and Became Mixed-Up Zombies!!?', N'1964', 2.0000, N'', N'Jerry falls in love with a stripper he meets at a carnival. Little does he know that she is the sister of a gypsy fortune teller whose predictions he had scoffed at earlier. The gypsy turns him into a zombie and he goes on a killing spree.', N'Horror, Music, Musical')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (14, N'Not Rated', N'8Â½', N'1963', 2.0000, N'', N'A harried movie director retreats into his memories and fantasies.', N'Drama, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (15, N'PG-13', N'Who''s Your Caddy?', N'2007', 2.0000, N'', N'When a rap mogul from Atlanta tries to join a conservative country club in the Carolinas he runs into fierce opposition from the board President- but it''s nothing that he and his entourage can''t handle.', N'Comedy, Sport')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (16, N'TV-14', N'24', N'2001â€“2010', 2.0000, N'', N'Jack Bauer, Director of Field Ops for the Counter-Terrorist Unit of Los Angeles, races against the clock to subvert terrorist plots and save his nation from ultimate disaster.', N'Action, Drama, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (17, N'G', N'The Mad Adventures of ''Rabbi'' Jacob', N'1973', 2.0000, N'', N'A bigoted Frenchman finds himself forced to impersonate a popular rabbi while on the run from a group of assassins - and the police.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (18, N'N/A', N'Titanic: The Legend Goes On...', N'2000', 2.0000, N'', N'A Cinderella meets her Prince Charming on the ill-fated Titanic. Along for the ride are a rapping dog, other talking animals, and an assortment of wacky humans.', N'Animation, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (19, N'PG-13', N'Car 54, Where Are You?', N'1994', 2.0000, N'', N'Brash NYC policeman Officer Gunther Toody is partnered with stiff, by-the-book Officer Francis Muldoon to protect an important mafia witness prior to testifying against orgainzed crime in ...', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (20, N'PG', N'Leonard Part 6', N'1987', 2.0000, N'', N'A secret agent is called out of retirement to save the world from an evil genius.', N'Action, Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (21, N'Not Rated', N'Stalag 17', N'1953', 2.0000, N'', N'When two escaping American World War II prisoners are killed, the German POW camp barracks black marketeer, J.J. Sefton, is suspected of being an informer.', N'Comedy, Drama, War')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (22, N'PG-13', N'O Brother, Where Art Thou?', N'2000', 2.0000, N'', N'In the deep south during the 1930s, three escaped convicts search for hidden treasure while a relentless lawman pursues them.', N'Comedy, Crime')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (23, N'R', N'District 9', N'2009', 2.0000, N'', N'An extraterrestrial race forced to live in slum-like conditions on Earth suddenly finds a kindred spirit in a government agent who is exposed to their biotechnology.', N'Action, Sci-Fi, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (24, N'R', N'Once Upon a Time in America', N'1984', 2.0000, N'', N'A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan over thirty years later, where he once again must confront the ghosts and regrets of his old life.', N'Crime, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (25, N'Not Rated', N'Who''s Afraid of Virginia Woolf?', N'1966', 2.0000, N'', N'A bitter aging couple with the help of alcohol, use a young couple to fuel anguish and emotional pain towards each other.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (26, N'R', N'Anna Karenina', N'2012', 5.0000, N'', N'In late-19th-century Russian high society, St. Petersburg aristocrat Anna Karenina enters into a life-changing affair with the dashing Count Alexei Vronsky.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (27, N'PG-13', N'Hotel Rwanda', N'2004', 2.0000, N'', N'The true story of Paul Rusesabagina, a hotel manager who housed over a thousand Tutsi refugees during their struggle against the Hutu militia in Rwanda.', N'Biography, Drama, History')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (28, N'PG', N'Lawrence of Arabia', N'1962', 2.0000, N'', N'A flamboyant and controversial British military figure and his conflicted loyalties during his World War I service in the Middle East.', N'Adventure, Biography, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (29, N'Not Rated', N'Rebecca', N'1940', 2.0000, N'', N'A self-conscious bride is tormented by the memory of her husband''s dead first wife.', N'Drama, Mystery, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (30, N'R', N'Magnolia', N'1999', 2.0000, N'', N'An epic mosaic of interrelated characters in search of love, forgiveness, and meaning in the San Fernando Valley.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (31, N'Not Rated', N'La Strada', N'1954', 2.0000, N'', N'A care-free girl is sold to a traveling entertainer, consequently enduring physical and emotional pain along the way.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (32, N'4', N'Austin Powers: The Spy Who Sha', N'1954', 2.0000, N'2', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (33, N'Not Rated', N'Persona', N'1966', 2.0000, N'', N'A nurse is put in charge of an actress who can''t talk and finds that the actress''s persona is melding with hers.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (34, N'PG-13', N'Adam', N'2009', 2.0000, N'', N'Adam, a lonely man with Asperger''s Syndrome, develops a relationship with his upstairs neighbor, Beth.', N'Drama, Romance')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (35, N'N/A', N'Jalla! Jalla!', N'2000', 2.0000, N'', N'Roro, a foreign worker in Swedish parks, loves his girlfriend but is about to marry another girl to prevent her from being sent back to Lebanon. Roros best friend, MÃ¥ns, has his own ...', N'Comedy, Drama, Romance')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (36, N'N/A', N'Die Hard Dracula', N'1998', 2.0000, N'', N'A modern-day updating of the Dracula legend that finds Steven, a good-looking American hero devastated by the death of his girlfriend, wandering through Europe and looking for happiness. A ...', N'Comedy, Horror')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (37, N'PG', N'Casablanca', N'1942', 2.0000, N'', N'Set in unoccupied Africa during the early days of World War II: An American expatriate meets a former lover, with unforeseen complications.', N'Drama, Romance, War')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (38, N'R', N'V for Vendetta', N'2005', 2.0000, N'', N'In a future British tyranny, a shadowy freedom fighter plots to overthrow it with the help of a young woman.', N'Action, Sci-Fi, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (39, N'R', N'A Fish Called Wanda', N'1988', 2.0000, N'', N'In London, four very different people team up to commit armed robbery, then try to doublecross each other for the loot.', N'Comedy, Crime')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (40, N'PG', N'Kung Fu Panda', N'2008', 2.0000, N'', N'In the Valley of Peace, Po the Panda finds himself chosen as the Dragon Warrior despite the fact that he is obese and a complete novice at martial arts.', N'Animation, Action, Adventure')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (41, N'PG', N'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', N'1964', 2.0000, N'', N'An insane general triggers a path to nuclear holocaust that a war room full of politicians and generals frantically try to stop.', N'Comedy, War')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (42, N'Unrated', N'Body in the Web', N'1960', 2.0000, N'', N'Survivors of a plane crash on a remote island find it is covered by spiders. When bitten, the survivors start turning into spiders!', N'Horror')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (43, N'R', N'Fight Club', N'1999', 2.0000, N'', N'An insomniac office worker looking for a way to change his life crosses paths with a devil-may-care soap maker and they form an underground fight club that evolves into something much, much more...', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (44, N'R', N'The Breakfast Club', N'1985', 2.0000, N'', N'Five high school students, all different stereotypes, meet in detention, where they pour their hearts out to each other, and discover how they have a lot more in common than they thought.', N'Comedy, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (45, N'PG-13', N'The Italian Job', N'2003', 2.0000, N'', N'After being betrayed and left for dead in Italy, Charlie Croker and his team plan an elaborate gold heist against their former ally.', N'Action, Crime, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (46, N'N/A', N'Alan Davies: Live at the Lyric', N'1994', 2.0000, N'', N'N/A', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (47, N'PG', N'Cyrano de Bergerac', N'1990', 2.0000, N'', N'Embarrassed by his large nose, a romantic poet/soldier romances his cousin by proxy.', N'Biography, Comedy, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (48, N'R', N'Human Traffic', N'1999', 2.0000, N'', N'Five friends spend one lost weekend in a mix of music, love and club culture.', N'Comedy, Music')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (49, N'R', N'Going Overboard', N'1989', 2.0000, N'', N'A struggling young comedian takes a menial job on a cruise ship where he hopes for his big chance to make it in the world of cruise ship comedy.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (50, N'Not Rated', N'The Kid', N'1921', 2.0000, N'', N'The Tramp cares for an abandoned child, but events put that relationship in jeopardy.', N'Comedy, Drama, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (51, N'PG', N'Enchanted', N'2007', 2.0000, N'', N'A classic Disney fairytale collides with modern-day New York City in a story about a fairytale princess who is sent to our world by an evil queen. Soon after her arrival, Princess Giselle begins to change her views on life and love after meeting a handsome lawyer. Can a storybook view of romance survive in the real world?', N'Comedy, Family, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (52, N'TV-PG', N'Gone with the Wind', N'1939', 2.0000, N'', N'A manipulative Southern belle carries on a turbulent affair with a blockade runner during the American Civil War.', N'Drama, Romance, War')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (53, N'R', N'Eternal Sunshine of the Spotless Mind', N'2004', 2.0000, N'', N'A couple undergo a procedure to erase each other from their memories when their relationship turns sour, but it is only through the process of loss that they discover what they had to begin with.', N'Drama, Romance, Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (54, N'Not Rated', N'Sunset Blvd.', N'1950', 2.0000, N'', N'A hack screenwriter writes a screenplay for a former silent-film star who has faded into Hollywood obscurity.', N'Drama, Film-Noir')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (55, N'R', N'The Departed', N'2006', 2.0000, N'', N'An undercover state cop who has infiltrated an Irish gang and a mole in the police force working for the same mob race to track down and identify each other before being exposed to the enemy, after both sides realize their outfit has a rat.', N'Crime, Drama, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (56, N'PG-13', N'Chairman of the Board', N'1998', 2.0000, N'', N'A surfer becomes the head of a major company.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (57, N'R', N'Into the Wild', N'2007', 2.0000, N'', N'After graduating from Emory University, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity and hitchhikes to Alaska to live in the wilderness. Along the way, Christopher encounters a series of characters that shape his life.', N'Adventure, Biography, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (58, N'PG-13', N'A Beautiful Mind', N'2001', 2.0000, N'', N'After a brilliant but asocial mathematician accepts secret work in cryptography, his life takes a turn for the nightmarish.', N'Biography, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (59, N'R', N'City of God', N'2002', 2.0000, N'', N'Two boys growing up in a violent neighborhood of Rio de Janeiro take different paths: one becomes a photographer, the other a drug dealer.', N'Crime, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (60, N'R', N'Die Hard', N'1988', 2.0000, N'', N'John McClane, officer of the NYPD, tries to save wife Holly Gennaro and several others, taken hostage by German terrorist Hans Gruber during a Christmas party at the Nakatomi Plaza in Los Angeles.', N'Action, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (61, N'PG', N'Oh, God!', N'1977', 2.0000, N'', N'When God appears to an assistant grocery manager as a good natured old man, the Almighty selects him as his messenger for the modern world.', N'Comedy, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (62, N'R', N'House of the Dead', N'2003', 2.0000, N'', N'A group of teens arrive on an island for a rave--only to discover the island has been taken over by zombies. The group takes refuge in a house where they try to survive the night.', N'Action, Horror, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (63, N'R', N'Book of Blood', N'2009', 2.0000, N'', N'A paranormal expert discovers a house that is at the intersection of so-called "highways" transporting souls in the afterlife.', N'Drama, Horror, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (64, N'R', N'Shutter Island', N'2010', 2.0000, N'', N'In 1954, U.S. Marshal Teddy Daniels is investigating the disappearance of a murderess who escaped from a hospital for the criminally insane and is presumed to be hiding nearby.', N'Drama, Mystery, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (65, N'PG', N'Ed', N'', 0.0000, N'2', N'A trained chimpanzee plays third base for a minor-league baseball team.', N'')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (66, N'TV-14', N'Another World', N'1964â€“1999', 2.0000, N'', N'The continuing story of life in the Midwestern town of Bay City, and the love, loss, trials, and triumph of its residents, who come from different backgrounds and social circles. Those who ...', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (67, N'N/A', N'Butch Cassidy and the Sundance Kid', N'1969', 2.0000, N'', N'Two Western bank/train robbers flee to Bolivia when the law gets too close.', N'Adventure, Biography, Crime')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (68, N'R', N'There Will Be Blood', N'2007', 2.0000, N'', N'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (69, N'PG', N'Close Encounters of the Third Kind', N'1977', 2.0000, N'', N'After an encounter with UFOs, a line worker feels undeniably drawn to an isolated area in the wilderness where something spectacular is about to happen.', N'Adventure, Drama, Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (70, N'N/A', N'Kidz in da Hood', N'2006', 2.0000, N'', N'Kidz in da Hood is the gripping and warm story of Amina, who came to Sweden with her grandfather three years ago. Amina has not yet received her residency permit and when her grandfather ...', N'Comedy, Drama, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (71, N'PG', N'NausicaÃ¤ of the Valley of the Wind', N'1984', 2.0000, N'', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (72, N'R', N'Django Unchained', N'2012', 5.0000, N'', N'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', N'Adventure, Drama, Western')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (73, N'R', N'Demon Island', N'2002', 2.0000, N'', N'Teens trapped on an island are haunted by a demon hidden inside...a pinata.', N'Horror, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (74, N'Not Rated', N'To Kill a Mockingbird', N'1962', 2.0000, N'', N'Atticus Finch, a lawyer in the Depression-era South, defends a black man against an undeserved rape charge, and his kids against prejudice.', N'Crime, Drama, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (75, N'R', N'Speed', N'1994', 2.0000, N'', N'A young cop must prevent a bomb exploding aboard a city bus by keeping its speed above 50 mph.', N'Action, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (76, N'G', N'Barney''s Great Adventure', N'1998', 2.0000, N'', N'Mom and dad dump son Cody, daughter Abby, her best friend Marcella and a baby on the farm with Grandpa and Grandma. Purple dinosaur Barney soon appears to entertain kids, and when a large ...', N'Adventure, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (77, NULL, N'Emmerdale Live', NULL, NULL, N'2', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (78, N'N/A', N'Turks in Space', N'2006', 2.0000, N'', N'It is intended to be a comedy film with serious special effects, though it becomes an epic film of laughs as the suppressor of the first series of the film ''The man who saves Earth''...See full synopsis&nbsp;&raquo;', N'Action, Comedy, Sci-Fi')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (79, N'PG', N'Toby McTeague', N'1986', 2.0000, N'', N'Toby is a teenager who doesn''t care much about school. In fact, he has his eyes on the title of a prestigious dog-sleigh race. He will have to undergo extensive training in order to win it.', N'Action, Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (80, N'R', N'The Green Mile', N'1999', 2.0000, N'', N'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', N'Crime, Drama, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (81, N'N/A', N'Danes Without a Clue', N'1997', 2.0000, N'', N'Two comedians set out to make their own exploitation video.', N'Comedy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (82, N'TV-PG', N'All About Eve', N'1950', 2.0000, N'', N'An ingenue insinuates herself in to the company of an established but aging stage actress and her circle of theater friends.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (83, N'PG', N'Miracle', N'2004', 2.0000, N'', N'Miracle tells the true story of Herb Brooks (Russell), the player-turned-coach who led the 1980 U.S. Olympic hockey team to victory over the seemingly invincible Russian squad.', N'Drama, Family, History')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (84, N'Approved', N'The Man Who Shot Liberty Valance', N'1962', 2.0000, N'', N'A senator, who became famous for killing a notorious outlaw, returns for the funeral of an old friend and tells the truth about his deed.', N'Western')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (85, N'R', N'Jerry Maguire', N'1996', 2.0000, N'', N'When a sports agent has a moral epiphany and is fired for expressing it, he decides to put his new philosophy to the test as an independent with the only athlete who stays with him.', N'Comedy, Drama, Romance')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (86, N'PG', N'Jean de Florette', N'1986', 2.0000, N'', N'A greedy landowner and his backward nephew conspire to block the only water source for an adjoining property in order to bankrupt the owner and force him to sell.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (87, N'R', N'AmÃ©lie', N'2001', 2.0000, N'', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (88, N'R', N'My Bloody Valentine', N'2009', 2.0000, N'', N'Tom returns to his hometown on the tenth anniversary of the Valentine''s night massacre that claimed the lives of 22 people. Instead of a homecoming, however, Tom finds himself suspected of committing the murders, and it seems like his old flame is the only one will believes he''s innocent.', N'Horror, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (89, N'Approved', N'Citizen Kane', N'1941', 2.0000, N'', N'Following the death of a publishing tycoon, news reporters scramble to discover the meaning of his final utterance.', N'Drama, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (90, N'PG-13', N'Harry Potter and the Goblet of Fire', N'2005', 2.0000, N'', N'Harry finds himself mysteriously selected as an under-aged competitor in a dangerous tournament between three schools of magic.', N'Adventure, Family, Fantasy')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (91, N'Not Rated', N'La Haine', N'1995', 2.0000, N'', N'After local youth Abdel is beaten unconscious by police, a riot ensues on his estate during which a policeman loses his gun. The gun is found by Vinz who threatens he will kill a cop if Abdel dies.', N'Drama')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (92, N'PG-13', N'The Final Sacrifice', N'1990', 2.0000, N'', N'Fleeing from the cult that murdered his father, a teen is aided in his quest to find the lost city of the fabled Ziox by a secretive drifter.', N'Adventure, Fantasy, Horror')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (94, N'G', N'Ratatouille', N'2007', 2.0000, N'', N'A rat, who can also cook, makes an unusual alliance with a young kitchen worker at a famous restaurant.', N'Animation, Comedy, Family')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (95, N'R', N'Shakespeare in Love', N'1998', 2.0000, N'', N'A young Shakespeare, out of ideas and short of cash, meets his ideal woman and is inspired to write one of his most famous plays.', N'Comedy, Drama, Romance')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (96, N'PG-13', N'Casino Royale', N'2006', 2.0000, N'', N'Armed with a license to kill, Secret Agent James Bond sets out on his first mission as 007 and must defeat a weapons dealer in a high stakes game of poker at Casino Royale, but things are not what they seem.', N'Action, Crime, Thriller')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (97, N'TV-MA', N'Strange Love', N'2008', 2.0000, N'', N'In a society where humans and vampires co-exist, set in the small town of Bon Temps, Louisiana, Sookie Stackhouse is a young woman who may have found a perfect boyfriend. Sookie is ...', N'Drama, Fantasy, Mystery')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (98, N'R', N'The Manchurian Candidate', N'2004', 2.0000, N'', N'In the midst of the Gulf War, soldiers are kidnapped and brainwashed for sinister purposes.', N'Drama, Mystery, Sci-Fi')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (21, 5, 4, CAST(N'2020-11-05T13:27:40.000' AS DateTime), CAST(N'2021-12-06T09:48:57.000' AS DateTime))
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (22, 5, 3, CAST(N'2021-12-06T09:38:48.000' AS DateTime), CAST(N'2021-12-06T09:49:08.000' AS DateTime))
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (23, 10, 13, CAST(N'2021-12-06T09:39:36.000' AS DateTime), CAST(N'2021-06-12T11:46:14.737' AS DateTime))
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (24, 8, 3, CAST(N'2021-12-06T09:40:54.000' AS DateTime), NULL)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (25, 11, 14, CAST(N'2021-12-06T09:49:18.000' AS DateTime), NULL)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (26, 45, 10, CAST(N'2021-12-06T09:49:27.000' AS DateTime), NULL)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (27, 7, 10, CAST(N'2021-12-06T09:52:10.000' AS DateTime), NULL)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (28, 5, 12, CAST(N'2021-12-06T11:28:07.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
GO
ALTER TABLE [dbo].[RentedMovies]  WITH CHECK ADD  CONSTRAINT [FK_RentedMovies_Customer] FOREIGN KEY([CustIDFK])
REFERENCES [dbo].[Customer] ([CustID])
GO
ALTER TABLE [dbo].[RentedMovies] CHECK CONSTRAINT [FK_RentedMovies_Customer]
GO
ALTER TABLE [dbo].[RentedMovies]  WITH CHECK ADD  CONSTRAINT [FK_RentedMovies_Movies] FOREIGN KEY([MovieIDFK])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[RentedMovies] CHECK CONSTRAINT [FK_RentedMovies_Movies]
GO
/****** Object:  StoredProcedure [dbo].[ReturnMovie]    Script Date: 27/07/2021 3:46:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReturnMovie]
(
@RMID int,
@DateReturned datetime
)
AS
update RentedMovies set DateReturned=@DateReturned where RMID=@RMID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[10] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 247
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RentedMovies"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 232
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 227
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1575
         Width = 1770
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerAndMoviesRented'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerAndMoviesRented'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[18] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 161
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Movies"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 161
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RentedMovies"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 161
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2145
         Alias = 900
         Table = 2100
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MoviesOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MoviesOut'
GO
USE [master]
GO
ALTER DATABASE [VBMOVIESFULLDATA.MDF] SET  READ_WRITE 
GO
