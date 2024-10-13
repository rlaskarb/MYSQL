use menudb;

-- group by 절
-- 결과 집합을 특정 열의 값에 따라 구룹하 하는 것에 사용한다.

-- having 절은 group by 절과 함께 사용이 되며 
-- 그룹에 대한 조건을 정의할 때 사용이 된다.

-- where 조건절 / having 조건절 차이 
-- where 조건절의 경우
-- 그룹화를 하기전 개별 행에 대한 조건을 적용하는 것

-- having 조건절의 경우
-- 생성 된 그룹에 대한 조건을 적용하는 것

-- 메뉴가 존재하는 카테고리 그룹 조회

select
	category_code
from
	tbl_menu
group by
	category_code;
    
-- 위에서 만든 카테고리 코드를 기준으로 만둔 그룹에 포함된 행의 수 조회
-- count() : 갯수 

select
	category_code as '카테고리코드',
    count(*) as '그룹에 포한 된 행의 수'
from
	tbl_menu
group by
	category_code;
    
    
-- sum() : 합계
-- 메뉴테이블에서 카테고리 코드를 기준으로 그룹화 한 후 , 그룹의 메뉴가격 합계 조회

select
	*
from
	tbl_menu;
    
    
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code;


-- avg() 활용
-- 카테고리 메뉴 가격의 평균 조회

select
	category_code,
    avg(menu_price)
from
	tbl_menu
group by
	category_code;
    
    
-- 2개 이상의 그룹 생성하기

select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code;
    

-- having 절을 사용해서 5번 카테고리 부터 8번 카테고리까지의
-- 메뉴 카테고리 번호 조회

select
    category_code
from
	tbl_menu
group by
    category_code
having
	category_code between 5 and 8;
    
-- with rollup

select
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
    category_code
with rollup;

    
-- 컬럼 2개를 활용한 rollup(같은 메뉴 가격별 총합 및 해당 메뉴 가격별 같은 카테고리 총합)
-- rollup 을 통해 먼저 나온 칼럼의 총합을 구하고 이후 나오는 칼럼의 총합도 구하는 방식이다.
select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
	menu_price,
    category_code
with rollup;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	