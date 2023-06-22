CREATE DATABASE UBER_COMPANY;

CREATE table members
( mid int primary key ,
 gender varchar(1),
phone varchar(20) not null,
email varchar(50),
fname varchar(30) not null,
lname varchar(30) not null,
member_type varchar(10) not null,
member_rating float not null
)

CREATE table users
(userid  int primary key,
adress varchar(50) not null,
    FOREIGN KEY (userid) REFERENCES members(mid)
)

CREATE table driver
( driverid int primary key,
ssn varchar(14) not null,
 DLno varchar(40) not null
)
alter table driver
add FOREIGN KEY (driverid) REFERENCES members(mid)
alter table driver
add Constraint ssn_un unique (ssn);
alter table driver
add Constraint dlno_un unique (Dlno);

create table offers
( offerid varchar (20) primary key,
promocode varchar(20),
discount varchar(10)
)

create table user_offer
(
offerid varchar(20) foreign key references offers(offerid),
userid int foreign key references users(userid),
primary key (offerid ,userid)

)
create table payments
(
pid int primary key,
amount_charged money,
method varchar(10),
userid int foreign key references users(userid),
driverid int foreign key references driver(driverid),
)
alter table payments
alter column amount_charged float

create table cash 
( pid int primary key,
currency varchar(20),
FOREIGN KEY (pid) REFERENCES payments(pid)
)

create table wallet
( pid int primary key,
wallet_balance float,
FOREIGN KEY (pid) REFERENCES payments(pid)
)
create table card
( pid int primary key,
cardinfo varchar(20) unique not null,
cvv varchar(20) not null,
FOREIGN KEY (pid) REFERENCES payments(pid)
)

create table rides
(
rid int primary key not null,
pickup_location varchar(60) not null,
pickup_time datetime ,
dropoff_time datetime  ,
dropoff_location varchar(60) not null,
distance varchar(20) not null,
duration varchar(30) not null,
fare varchar(10),
Rtype varchar(50) not null,
rstatus varchar(50) not null,
mid int foreign key references members(mid),
userid int foreign key references users(userid),
driverid int foreign key references driver(driverid),
pid int foreign key references payments(pid)
)
create table cancellation
(reason varchar(50),
mid int foreign key references members(mid),
rid int foreign key references rides(rid),
primary key(rid,mid)
)
create table vehicle 
(
vid int primary key,
color varchar(20) not null,
manufacturer varchar(20) not null,
model varchar(20) not null,
plate_no varchar (10) not null,
vtype varchar(10) not null ,
driverid int foreign key references driver(driverid)
)
alter table vehicle
alter column plate_no Nvarchar(15)

create table scooter
( vid int primary key,
maxspeed varchar(10),
 foreign key (vid) references vehicle(vid)
)
create table car
(vid int primary key,
bodytype varchar(20),
 foreign key (vid) references vehicle(vid)
)
create table bus
(vid int primary key,
seatingcapacity varchar(2) ,
foreign key (vid) references vehicle(vid)
)
create table ratings
(Rno int primary key,
points varchar(5),
mid int foreign key references members(mid),
rid int foreign key references rides(rid),
)
alter table ratings
 add feedback varchar(60);

create table shifts
(
shiftno int primary key,
login_time datetime ,
logout_time datetime 
)  
create table driver_shift
(
shiftno int foreign key references shifts(shiftno),
driverid int foreign key references driver(driverid),
primary key (shiftno,driverid)
)
alter table driver_shift
alter column working_hours varchar(10)
--//insert//--
---//member//--
INSERT INTO members
VALUES('201','m','0127374653','mohamed@gmail.com','mohamed','aly','user','5')
INSERT INTO members
VALUES('202','m','0127476465','aly@gmail.com','aly','omar','user','4.5')
INSERT INTO members
VALUES('203','f','0123445337','doaa@gmail.com','doaa','rashad','user','4.7')
INSERT INTO members
VALUES('204','f','012465939','mariam19@gmail.com','mariam','ezz','user','4.3')
INSERT INTO members
VALUES('205','m','012558654','do7a@gmail.com','mohamed','mamdouh','driver','4.7')
INSERT INTO members
VALUES('206','m','01248952','mazen@gmail.com','mazen','khaled','driver','4.85')
INSERT INTO members
VALUES('207','f','01264535575','marina@gmail.com','marina','magdy','driver','3.9')
INSERT INTO members
VALUES('208','m','0124537583','moahmed20@gmail.com','mohamed','nasr','driver','5')
INSERT INTO members
VALUES('209','m','01274526483','ahmed@gmail.com','ahmed','ibrahim','user','4.65')
INSERT INTO members
VALUES('210','f','012025462','sara@gmail.com','sara','sayed','user','5')
INSERT INTO members
VALUES('211','f','0125404042','maram@gmail,com','maram','mostafa','user','4.8')
INSERT INTO members
VALUES('212','f','012548904062','laila@gmail,com','laila','mohamed','driver','2.9')
INSERT INTO members
VALUES('213','f','012398962','nadine@gmail,com','nadine','mohsen','driver','3.88')
INSERT INTO members
VALUES('214','f','012278962','laila@gmail,com','tamara','tamer','driver','4.6')
INSERT INTO members
VALUES('215','m','011278962','malek@gmail,com','malek','mohamed','driver','3.5')
INSERT INTO members
VALUES('216','f','011278962','malek@gmail,com','fateema','ussama','user','4.68')
select * from members
INSERT INTO members
VALUES('217','m','011278542','youssef@gmail,com','youssef','hamdy','driver','4.57')
INSERT INTO members
VALUES('218','m','012278962','selim@gmail.com','selim','salem','user','3.67')
INSERT INTO members
VALUES('219','f','012278962','suzan@gmail.com','suzan','salem','user','2.9')
INSERT INTO members
VALUES('220','f','012278962','jesica@gmail.com','jesica','john','user','4.45')
select*from members
select*from members where member_type='user'
select*from members where member_type='driver'
select*from members where gender='f'
select*from members where gender='m'
-----//user//
insert into users 
values('201',' 305 zamalek')

insert into users 
values ('202',' 23helwan')

insert into users 
values ('203',' nasrcity,abbas-alakkad ')

insert into users 
values ('204','30 giza')  
  
insert into users 
values ('209','alexandria')  

insert into users 
values ('210','shobra')  

insert into users 
values ('211','mokatam') 
insert into users 
values ('216','newcairo') 
insert into users 
values ('218','nasrcity') 
insert into users 
values ('219','fifth settlement')
insert into users 
values ('220','fifth settlement')
select*from users
--//driver/--

insert into driver 
values ('205','3024546','7788')

insert into driver 
values ('206','4032625','3456')

insert into driver 
values ('207','5073645','2943')

insert into driver 
values ('208','3047584','4387')
insert into driver 
values ('212','408487584','543387'),
('213','608487584','943287'),
('214','708487584','123087'),
('215','958487584','455387'),
('217','988487584','493377');
select*from driver
insert into offers
values ('300','DO7A20','20%'),
('301','MARIAM30','30%'),
('302','','40%'),
('303','ASMAA50',''),
('304','MARAM60','60%'),
('305','NABIL90','90%'),
('306','AHMED70','70%')
select * from offers

insert into user_offer
values('300','201'),
('301','203'),
('302','210'),
('303','211')
select * from user_offer

insert into payments 
values('400','50','cash','201','205'),
('401','75.5','wallet','202','206'),
('402','30.4','card','203','212'),
('403','100.2','cash','204','207'),
('404','200.1','cash','209','208'),
('405','80','wallet','210','213'),
('406','55','card','211','214'),
('407','35','wallet','216','215'),
('408','40.5','cash','218','217')
insert into payments 
values ('409','0.00','','201','207'),
('410','0.00','','204','217'),
('411','0.00','','210','208')
select * from payments
select * from payments where amount_charged<50
select * from payments where method= 'cash' 

insert into wallet
values ('401','100'),
('405','80'),
('407','50')
 select * from wallet

 insert into cash 
 values('400','EGP'),
 ('403','EGP'),
 ('404','EGP'),
 ('408','EGP')
 select * from cash

 insert into card 
 values('402','555538729364','333'),
 ('406','6574823981231934','444')

 select * from card
 select * from rides 

 select * from vehicle
 select * from scooter
 select * from car
 select * from bus
 select * from rides
  select * from rides





  
 --//user ride history//
 select fname as ' user first name',lname as ' user last name' ,rides.userid,rides.driverid, pickup_location,Dropoff_location,pickup_time,dropoff_time, rstatus 
,  rtype as 'ride type'  
,amount_charged ,Method,vtype as 'veichle type',color,model,plate_no  
from  members join users on members.mid=users.userid  
join rides on rides.userid=users.userid
 join driver on rides.driverid=driver.driverid join vehicle on vehicle.driverid=driver.driverid
 join payments on payments.userid=users.userid






  --//driver history//--
select driver.driverid ,fname as 'first name',lname as 'last name',Dlno as'driver license number',shifts.shiftno as 'shift number',working_hours,vtype as 'veichle type',plate_no,model,color
,amount_charged as'amount paid',method
from members inner join driver on members.mid=driver.driverid inner join driver_shift on driver_shift.driverid=driver.driverid
inner join shifts on shifts.shiftno=driver_shift.shiftno join vehicle on vehicle.driverid=driver.driverid 
inner join payments on payments.driverid=driver.driverid



--user offer--
select member_rating,member_type,mid from members where member_type='user' and member_rating >= 4.65


select fname as 'first name',lname as 'last name ',users.userid as'user id',member_rating
,promocode,discount,rides.rid as 'ride number'
from members  inner join users on members.mid=users.userid  inner join user_offer on user_offer.userid=users.userid inner join 
offers on offers.offerid=user_offer.offerid  inner join rides on users.userid=rides.userid
where member_rating >= 4.65


---------- user canceled rides----
select member_type as 'member', fname as 'first name',lname as 'last name',cancellation.mid as'member id',rides.rid as 'ride number',reason as'cancelation reason' 
from members inner join cancellation on cancellation.mid=members.mid inner join rides on cancellation.rid=rides.rid 
where member_type='user'

-------driver canceled rides
select member_type as 'member', fname as 'first name',lname as 'last name',members.mid as'member id',rides.rid as 'ride number',reason as'cancelation reason' 
from members inner join cancellation on cancellation.mid=members.mid inner join rides on cancellation.rid=rides.rid 
where member_type='driver'
------
select rid,mid from rides
-----
select driverid,fname from driver join members on driver.driverid=members.mid
----- 

select rstatus, count (*) as 'number ' 
from rides 
group by rstatus


select vtype,color,manufacturer,plate_no,driverid , seatingcapacity from vehicle inner join bus 
on vehicle.vid=bus.vid


select vtype,color,manufacturer,plate_no,driverid , bodytype from vehicle inner join car
on vehicle.vid=car.vid

----user rating

select members.mid,member_type,Rno as'rating no.',points,feedback,rides.driverid as 'driver id',
 ratings.rid as 'ride id'  from members join ratings on members.mid=ratings.mid
 join rides on rides.rid=ratings.rid
 where member_type='user'

-----driver rating 
  
  select members.mid,member_type,Rno as'rating no.',points,feedback,rides.userid as 'user id',
 ratings.rid as 'ride id'  from members join ratings on members.mid=ratings.mid
 join rides on rides.rid=ratings.rid
 where member_type='driver'

 
 
