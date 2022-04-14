create database Library
use Library
create table Books
(
	ID int primary key IDENTITY(1,1),
	AuthorsID int foreign key references Authors(ID),
	[Name] nvarchar(30)
)
create table Authors
(
	ID int primary key IDENTITY(1,1),
	[Name] nvarchar(30)
)
create table Genres
(
	ID int primary key IDENTITY(1,1),
	[Name] nvarchar(30)
)
create Table BookToGenre
(
	GenreID int foreign key references Genres(ID),
	BookID int foreign key references Books(ID)
)
insert into Authors values('Goerge Orwell'),('J.R.R Tolkien'),
('William Shakespeare'),
('Henry James'), ('Mark Dawson')
insert into Books ([Name],AuthorsID) values  ('1984',1), ('The Hobbit',2),
('Hamlet',3),('Twelfth Night',3),
('Animal Farm',1), ('The Lord Of The Rings',2), 
('The Cleaner',5),('Headhunters',5),
('The Ambassadors',4), ('Confidence',4)
insert into Genres values('Dystophian Finction'),('Social Science Finction'),
('Political Fiction'),('Science Fiction'),
('Novel'),('Fantasy Fiction'),
('Drama'), ('Tragedy')
insert into BookToGenre (GenreID,BookID) values(1,2),(2,2),(1,2),(2,3),(3,2),(4,5),(5,5),(6,2)
select Books.[Name] 'Book',Authors.[Name] 'Author',Genres.[Name] 'Genre' from BooktoGenre join Books
on BookID = Books.ID join Authors 
on Books.AuthorsID = Authors.ID join Genres
on GenreID = Genres.ID