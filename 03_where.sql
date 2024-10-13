-- where 절
-- 특정 조건에 일치하는 행(레코드) 만 선택을 하는데 사용되며
-- 다양한 조건으로 설정을 할수있다.

-- tbl_menu 테이블에서 이름,가격,판매상태를 조회해줘
-- 근데 판매상태가 Y 인 친구들만 조회를 해줘

select
 menu_name,
 menu_price,
 orderable_status
from
 tbl_menu
where
 orderable_status = 'Y' ;
 
 -- tbl_menu 테이블 에서 이름,가격,판매상태를 조회할거야
 -- 근데 메뉴가격이 13000원 인 메뉴만 조회를 해줘
 
 select
  menu_name,
  menu_price,
  orderable_status
 from
  tbl_menu
where
 menu_price = 13000;
 
 
 -- 메뉴 테이블에서 코드, 이름, 판매 상태 조회
-- 단, 판매 상태가 Y가 아닌 애들만 조회 ( N 직접쓰기 금지.)

select
 menu_code,
 menu_name,
 orderable_status
from
 tbl_menu
where
-- 부정의 의미 : != , <>
 orderable_status != 'Y'; 
 
 
-- 메뉴테이블에서 전체조회를 할껀데
-- 가격이 2만원 초과인 친구들만 조회해줘

select
 menu_code,
 menu_name,
 orderable_status
from
 tbl_menu
where
 menu_price > 20000;
 
-- 메뉴 테이블에서 모든 컬럼조회
-- 가격이 만원 이상 2만원 미민인 메뉴를 조회

select
  *
from
 tbl_menu
where
 menu_price >= 10000 and menu_price < 20000 ; 
 
 
 -- and / or 연산자
 --  자바와 똑같다.
 
 -- 메뉴 테이블에서 모든 칼럼조회
 -- 단, 판매상태가 Y이거나 카테고기 코드가 10인 메뉴조회
 -- 그리고 카테고리 코드로 오름차순 정렬
 
 select
   *
from
  tbl_menu
where
 orderable_status = 'Y'
 or 
 category_code = 10
order by
 category_code asc;
 
 
  -- 메뉴 테이블에서 모든 칼럼조회
 -- 단, 판매상태가 Y 이면서 카테고기 코드가 10인 메뉴조회
 -- 그리고 카테고리 코드로 오름차순 정렬
 
  select
   *
from
  tbl_menu
where
 orderable_status = 'Y'
 and 
 category_code = 10
order by
 category_code;
 
 
 -- and 둘중 하나라도 true 가 아니면 false 
 -- or 둘중 하나라도 true 면 true



-- between : ~ 사이 
-- between a and b :  
-- 메뉴테이블에서 모든 컬럼 조회
-- 단, 메뉴 가격이 10000 과 20000 원 사이 인 메뉴만 조회

select
 *
from
 tbl_menu
where
 menu_price between 10000 and 20000;
 
 
 -- between : ~ 사이 
-- between a and b :  
-- 메뉴테이블에서 모든 컬럼 조회
-- 단, 메뉴 가격이 10000 과 20000 원 사이가 아닌 메뉴만 조회
-- 부정의 키워드 not
select
 *
from
 tbl_menu
where
 menu_price not between 10000 and 20000 ;


-- like 연사자
-- 메뉴테이블에서 이름과 가격 조회
-- 단, 메뉴이름이 '마늘' 을 포함하고 있는 메뉴만 조회

select
 menu_name,
 menu_price
from
 tbl_menu
where
-- 반드시 일치하는 행만 return
-- % <- 포함하는 것도 return
-- % 위치에 따라 단어로 시작하거나 , 끝나거나 , 포함하는 식을 만들 수 있다.
 menu_name like '%마늘%'; 
 
-- 메뉴 테이블에서 전체 컬럼 조회
-- 단, 가격이 5000원 넘으면서 카테고리 코드가 10이면서 '갈치' 단어를 포함하는 메뉴조회

select
 *
from
 tbl_menu
where
 menu_price>5000 
 and 
 category_code = 10 
 and 
 menu_name like '%갈치%';
 
 
 
 -- in 연산자 활용
 -- 메뉴 테이블에서 이름, 카테고리 조회
 -- 단 카테고리 코드가 4,5,6 인 애들만 조회 (or 연산자 사용금지)
 
 select
 menu_name,
 menu_price
from
 tbl_menu
where
category_code in(4,5,6);

-- category_code = 4 or category_code =5 or category_code or =6


-- is null 활용
-- 카테고리 테이블에 모든 데이터 조회
-- 단, null 값을 포함한 것은 제외

 select
  *
from
 tbl_category
where
ref_category_code is not null;


 