 -- distinct 
 -- 중복된 값을 제거하는 것에 사용된다.
 -- 칼럼에 있는 칼럼 값들의 종류를 쉽게 파악 가능하다.
 
 -- 단일 열(컬럼) 중복 제거
 select
   distinct category_code
 from
  tbl_menu
 order by
  category_code;

-- 다중 열(컬럼) 중복 제거 
-- 다중열의 값들이 모두 동일하면 중복된 것으로 판단한다. 
select
 category_code,
 orderable_status
from
 tbl_menu;
 
 
 
 select
 distinct -- 모두 동일해야 중복된것으로 판단한다.
  category_code,
  orderable_status
from
 tbl_menu;
 
 
  