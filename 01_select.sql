-- SELECT 절은 MYQSL 의 가장 기본적인 명령어 특정 테이블에서 원하는 데이터를
-- 조회할수 있는 명령어이다.

select -- 조회해줘
	menu_name -- 무엇을??
 from  -- 어디서??
	tbl_menu; -- tel_meun 테이블에서.
    
    
-- tbl_menu 테이블에서 메뉴 코드와 카테고리 코드, 메뉴 가격을 조회 해줘

select
	menu_ code,
    category_code,
    menu_price
from
	tbl_menu;

-- tbl_menu 에서 모든 컬럼을 조회해줘

select
    meun_code,
    menu_name,
    menu_price,
    category_code
from    
     tbl_meun;
     
-- 모든 컬럼을 조회해야 할 상황일때 * 문자를 사용하면 된다.

select
		*
from
	tbl_meun;
    
-- 현재 시간 조회

select now();
-- concat() : 합치기
select concat ('조' , '문자열' , '평훈');

-- 컬럼에 별칭을 지정할 수 있다.

select concat('조' ,'문자열', '평훈' , '문자열') as 내이름;
-- 별칭을 띄어쓰기가 포함된 문자열을 적용할 때는 ' ' 사용해야 한다.
select concat('조' ,'문자열', '평훈' , '문자열') as '내이름';


    
        