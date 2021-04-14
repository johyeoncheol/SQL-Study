select * from starwars;
select * from characters;
select * from casting;
select * from roles;

-- 1. 전 스타워즈 시리즈의 상영년도, 에피소드이름, 배역, 출연배우 이름
select s.openyear,s.episodename,ch.charactername,c.realname
from starwars s,characters ch,casting c
where s.episodeid = c.episodeid
and ch.characterid = c.characterid;
  
-- 2. 에피소드 4에 출연한 배우는 모두 몇 명인지 구하는 쿼리
select count(*) as "에피소드4 출연자"
from casting
where episodeid=4;

-- 3. 각 배우 별 출연횟수를 조회하는 쿼리
select realname,count(characterid) as "출연횟수"
from casting
group by realname;

-- 4. 에피소드별 이름과 출연자 수
select s.episodename, count(c.episodeid) as "출연자수"
from starwars s join casting c
on s.episodeid=c.episodeid
group by episodename;

-- 5. 출연자수가 10명 이상인 에피소드의 이름과 출연자수
select s.episodename, count(realname) as "출연자수"
from starwars s join casting c
on s.episodeid=c.episodeid
group by episodename
having 출연자수>=10
order by 2 desc;

-- 6.제국의 역습에 등장하는 배우 이름
select realname
from casting
where episodeid=(
select episodeid
from starwars
where episodename="제국의 역습(The Empire Strikes Back)");

-- 7. '아미달라 여왕'이 등장했던 에피소드 id, 에피소드 이름과 상영연도
select episodeid,episodename,openyear
from starwars
where episodeid in(
					select episodeid
					from casting
					where characterid=(
										select characterid
										from characters
										where charactername="아미달라 여왕"));
                                        
-- 8. 해리슨 포드가 등장했던 에피소드의 id와 에피소드 이름
select episodeid, episodename
from starwars
where episodeid in(
					select episodeid
					from casting
					where realname="해리슨 포드");
                    
-- 9. 각 에피소드의 id와 출연한 인원 수
select episodeid, count(*)
from casting
group by episodeid
order by 2 desc;

-- 10. 각 에피소드에 출연한 인원 수 중 가장 많은 인원수
-- max(count(*))) 에러
select count(c.characterid)
from starwars s join casting
on s.episodeid = c.episodeid
group by c.episodeid
order by count(c.episodeid) desc
limit 1;

select max(tmp)
from (select count(*)
from casting
group by episodeid) tmp;

-- 11. 가장 많은 인원이 출연한 에피소드의 id와 인원 수
select episodeid,count(episodeid) as "인원 수"
from casting
group by episodeid
having count(*) =12
order by count(episodeid) desc;

-- 12. 가장 많은 인원이 출연한 에피소드 id, 그 에피소드에 출연한 배우명
select episodeid,realname
from casting
where episodeid = (select episodeid
					from casting
					group by episodeid
					order by count(episodeid) desc
					limit 2);

-- 13. 출연했던 횟수가 가장 많은 배우 TOP 5의 이름과 횟수를 조회
select realname ,count(*)
from casting
group by  characterid
order by count(characterid) desc
limit 5;

-- 14. 출연했던 횟수가 가장 많은 배우 TOP 6-10의 이름과 횟수를 조회
select realname ,count(*)
from casting
group by  characterid
order by count(characterid) desc
limit 5,5;

-- 15. 캐릭터에 role값을 부여하여 update(롤의 이름을 활용한다.)
-- 1,4,13 제다이
-- 2,9 반란군
-- 5,12,18 시스
update characters 
set roleid=(select roleid from roles where rolename='제다이') 
where characterid in (1,4,13);

update characters 
set roleid=(select roleid from roles where rolename='반란군') 
where characterid in (2,9);

update characters 
set roleid=(select roleid from roles where rolename='시스') 
where characterid in (5,12,18);

-- 16. 캐릭터와 마스터 연결하여  update
-- 아나킨 스카이워커 13 		오비완 케노비 4
-- 루크 스카이워커 1		오비완 케노비 4
-- 마스터 윈두 	20		요다 11
-- 듀크백작 	21			요다	11
-- 다스 베이더		5		다스 시디어스 12
-- 다스 몰		18		다스 시디어스 12
-- 오비완 캐노비 4			콰이곤 진 14
-- 콰이콘 진		14		듀크백작 21


update characters
set masterid =4
where characterid in (13,1);

update characters
set masterid =11
where characterid in (20,21);

update characters
set masterid =12
where characterid in (5,18);

update characters
set masterid =14
where characterid in (4);

update characters
set masterid =21
where characterid in (14);

-- 17. 마스터 역할의 배역이름
select charactername '마스터 역활'
from characters
where characterid in (
					select distinct c.masterid
                    from characters c
                    where c.masterid is not null);
       
select c2.charactername '마스터 역활'
from characters c1,characters c2
where c1.masterid = c2.characterid
and c1.masterid is not null;
       
-- 18. 오비완 케노비의 제자는
select charactername
from characters c
where c.masterid = (
					select c.characterid
					from characters c
					where c.charactername = '오비완 케노비');

-- 19. 오비완 케노비의 제자는 몇명 
select count(charactername)
from characters c
where c.masterid = (
					select c.characterid
					from characters c
					where c.charactername = '오비완 케노비');
                    
-- 20. 모든 배역과 해당 배역의 마스터 역할배역의 이름을 함께 조회(단, 마스터가 없는 배역도 포함)
select ch1.charactername 'character', ch2.charactername 'master'
from characters ch1 left outer join characters ch2
on ch1.masterid = ch2.characterid;




  










   