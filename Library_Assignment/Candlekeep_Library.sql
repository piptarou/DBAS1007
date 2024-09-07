create table members (
    id int primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) null,
    join_date date not null,
);

create table books (
    id int primary key,
    title varchar(255) not null,
    genre varchar(255) not null,
    publication_date date null,
    ISBN varchar(17) not null,
);

create table borrowing_record (
    borrowing_id int primary key,
    member_id int not null,
    book_id int not null,
    borrow_date date not null,
    return_date date null,
    foreign key (member_id) references members(id),
    foreign key (book_id) references books(id),
);

insert into members (id, first_name, last_name, email, join_date)
VALUES
(1, 'Volothamp', 'Geddarm', 'vololuvstravel@dragons.net', '1812-12-23'),
(2, 'Elminster', 'Aumar', 'elmthewizard@dragons.net', '1112-01-26'),
(3, 'Klak', 'Klik', 'klakthedragun@dragons.net', '1835-08-12'),
(4, 'Boblin', 'de Goblin', '', '1835-08-13');

insert into books (id, title, genre, publication_date, ISBN)
VALUES
(1, 'Dragon Taming For Dummies', 'pet care', '1112-01-02', '780-7869-6729-2'),
(2, 'Potions of the Ages', 'history', '1822-03-12',	'978-0-7869-6702-5'),
(3, 'Bullywug Mating Calls', 'nature', '1244-12-09', '978-0-7869-6601-1'),
(4, 'In The Eye of The Beholder', 'fiction', '1422-11-05', '978-0-7869-6611-0'),
(5, 'Enchantments to Enhance Your Equipment', 'survival', '1543-10-12', '978-0-7869-6744-5'),
(6, 'Infernal for Idiots', 'languages', '1788-01-02', '978-0-7869-667-69'),
(7, 'Enchantments to Enhance your Equipment', 'survival', '1543-10-12', '978-0-7869-6744-5');

insert into borrowing_record (borrowing_id, member_id, book_id, borrow_date, return_date)
VALUES
(1, 2, 1, '1112-01-26', '1112-02-12'),
(2, 2, 1, '1112-02-12', '1112-02-22'),
(3, 2, 1, '1112-03-26', '1112-04-11'),
(4, 2, 1, '1112-04-26', '1112-05-18'),
(5, 1, 1, '1812-12-23', '1813-01-02'),
(6, 1, 3, '1812-12-23', '1812-12-18'),
(7, 1, 1, '1813-01-02', '1813-01-12'),
(8, 1, 1, '1813-01-12', '1813-01-22'),
(9, 1, 1, '1813-01-22', '1813-02-02'),
(10, 3, 4, '1835-08-12'),
(11, 3, 6, '1835-08-12'),
(12, 4, 3, '1835-08-13');