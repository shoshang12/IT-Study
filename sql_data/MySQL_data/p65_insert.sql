use shopdb;

select * from membertbl;

truncate table membertbl;

insert into membertbl(memberid, membername, memberAddress)
		values('Dang', '당탕이', '경기 부천시 중동');
insert into membertbl(memberid, membername, memberAddress)
		values('Han', '한주연', '인천 남구 주안동');
insert into membertbl(memberid, membername, memberAddress)
		values('Jee', '지웅이', '서울 은평구 주안동');
insert into membertbl(memberid, membername, memberAddress)
		values('Sang', '상길이', '경기 성남시 분당구');
insert into membertbl(memberid, membername, memberAddress)
		values('NaoTa', '나오타', '주소불명');
        
delete from membertbl where memberid='NaoTa';

insert into producttbl(productName, cost, memberDate, company, ammount)
		values('냉장고', '5', '2023-02-01', '대우', '31');