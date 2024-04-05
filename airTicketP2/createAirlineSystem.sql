create table customer (
 f_name varchar(15) not null,
 l_name varchar(15) not null,
 date_of_birth date not null,
 email varchar(100) unique not null,
 password varchar(20) not null,
 street_name varchar(50) not null,
 building_num numeric(2,0),
 apt_num numeric(2,0),
 city varchar(20) not null,
 state varchar(20),
 zip numeric(10,0) not null,
 phone numeric(10,0) not null,
 passport_num varchar(9) unique,
 passport_exp_date date,
 passport_country varchar(30),
 primary key (email)
);

create table airline (
	airline_name varchar(30) unique not null,
	primary key (airline_name)
);

create table airline_staff (
 f_name varchar(25) not null,
 l_name varchar(25) not null,
 email varchar(100) unique not null,
 airline_name varchar(20) not null,
 username varchar(20) unique not null,
 password varchar(20) not null,
 date_of_birth date not null,
 phone numeric(10,0),
 primary key (username, airline_name),
 foreign key (airline_name) references airline(airline_name) 
	on delete cascade
    on update cascade
);

create table user_account (
	staff_email varchar(100),
	customer_email varchar(100),
	f_name varchar(15) not null,
	l_name varchar(15) not null,
    username varchar(20) ,
    user_type varchar(20) not null,
    loginTime timestamp not null,
    logoutTime timestamp,
    primary key (customer_email, username),
    foreign key (customer_email) references customer (email)
		on delete cascade
        on update cascade,
    foreign key (username) references airline_staff (username)
		on delete cascade
        on update cascade,
    check (user_type in ('Customer', 'Airline Staff'))
    );

create table airplane (
	plane_id varchar(15) unique,
	airline_name varchar(20) not null,
    num_of_seat numeric(3,0) not null,
    manufacture_co varchar(20) not null,
    model_num numeric(4,0) not null,
    date_made date,
    age numeric(2,0),
    primary key (plane_id, airline_name),
    foreign key (airline_name) references airline(airline_name)
		on delete cascade
        on update cascade,
    check(age>=0 and num_of_seat > 0 and model_num > 0)
);
create table airport (
	port_id varchar(15) unique,
	port_name varchar(150),
    port_city varchar(25),
    port_country varchar(20),
	port_type varchar(20),
    terminal_num numeric(2,0),
    primary key (port_id),
    check (port_type in ('Domestic', 'International', 'Both'))
);
create table flight(
	flight_num numeric(3,0) unique,
    airline_name varchar(30),
  	plane_id varchar(15),
	flight_type varchar(30),
	base_price decimal(6,2),
    dept_port_id varchar(15),
    dept_date date not null,
    dept_time time not null,
    arrive_port_id varchar(15),
    arrive_date date not null,
    arrive_time time not null,
    flight_status varchar(20) not null,
    primary key (plane_id, airline_name, flight_num, dept_port_id, dept_date),
	foreign key (plane_id) references airplane(plane_id)
		on delete cascade
        on update cascade,
	foreign key (airline_name) references airline(airline_name)
		on delete cascade
        on update cascade,
	foreign key (dept_port_id) references airport(port_id),
    foreign key (arrive_port_id) references airport(port_id),
    check (flight_status in ('Delayed', 'On Time', 'Canceled')),
    check (flight_type in ('Round-trip', 'One-way')),
    check (base_price >= 0.00 and flight_num > 0)
);

create table ticket (
	ticket_id varchar(20) unique,
    flight_num numeric(3,0),
    airline_name varchar(30),
	plane_id varchar(15),
	price decimal(6,2),

    primary key (ticket_id, airline_name, plane_id, flight_num),
	foreign key (flight_num) references flight (flight_num)
		on delete cascade
        on update cascade,
	foreign key (airline_name) references airline(airline_name)
		on delete cascade
        on update cascade,
	foreign key (plane_id) references airplane(plane_id)
		on delete cascade
        on update cascade,
    check (price >= 0)
);

create table purchase (
 ticket_id varchar(20),
 email varchar(100) not null,
 purchase_date date not null,
 purchase_time time not null,
 card_type varchar(10) not null,
 card_num numeric(16,0) not null,
 card_name varchar(50) not null,
 card_exp_date date not null,
 primary key (ticket_id, email),
 foreign key (ticket_id) references ticket (ticket_id)
	on delete cascade
    on update cascade,
foreign key (email) references customer (email)
	on delete cascade
    on update cascade,
check (card_type in ('Credit', 'Debit'))
);

create table maintenance (
	airline_name varchar(30) unique not null,
	plane_id varchar(15) unique,
	start_date date,
    start_time time,
    end_date date,
    end_time time,
    primary key (airline_name, plane_id),
    foreign key (airline_name) references airline (airline_name)
    	on delete cascade
		on update cascade,
    foreign key (plane_id) references airplane(plane_id)
    	on delete cascade
		on update cascade
);

create table review (
 email varchar(100) not null,
 flight_num numeric(3,0),
 airline_name varchar(30), 
 plane_id varchar(15),
 comment varchar(500),
 rating numeric (2,0),
 primary key (email, flight_num, airline_name, plane_id),
 foreign key (email) references customer (email)
	on delete cascade
    on update cascade,
 foreign key (flight_num) references flight (flight_num),
 foreign key (plane_id) references airplane (plane_id)
	on delete cascade
    on update cascade,
foreign key (airline_name) references airline(airline_name),
check (rating >= 0 and rating <= 10)
);


drop table maintenance;
drop table purchase;
drop table review;
drop table ticket;
drop table flight;
drop table airplane;
drop table airport;
drop table user_account;
drop table airline_staff;
drop table airline;
drop table customer;

