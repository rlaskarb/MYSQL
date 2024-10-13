use employee;
-- 1 번
-- EMPLOYEE 테이블에서 직원들의 주민번호를 조회하여
-- 사원명, 생년, 생월, 생일을 각각 분리하여 조회
-- 단, 컬럼의 별칭은 사원명, 생년, 생월, 생일로 한다.
select * from employee;
select * from job;
select * from location;
select * from nation;
select * from sal_grade;

select
	emp_name as '사원명' ,
    substring(emp_no ,1,2) as '생년',
    substring(emp_no ,3,2) as '생월',
    substring(emp_no ,5,2) as '생일'
from
	employee ;

-- 2번
-- 날짜 데이터에서 사용할 수 있다.
-- 직원들의 입사일에도 입사년도, 입사월, 입사날짜를 분리 조회

select
	emp_id as 번호,
    emp_name as 이름,
    date_format(hire_date, '%Y') as 입사년도,
    date_format(hire_date, '%m') as 입사월,
    date_format(hire_date, '%d') as 입사날짜
from
	employee;

-- 3번
-- WHERE 절에서 함수 사용도 가능하다.
-- 여직원들의 모든 컬럼 정보를 조회

select
	*
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.dept_code = d.dept_id)
    join
    location l
    on (d.location_id = l.local_code)
    join
    nation n
    on(l.national_code = n.national_code) 
where
	substring(emp_no,8,1)=2;
    
    
-- 4번
-- 함수 중첩 사용 가능 : 함수안에서 함수를 사용할 수 있음
-- EMPLOYEE 테이블에서 사원명, 주민번호 조회
-- 단, 주민번호는 생년월일만 보이게 하고, '-'다음의 값은
-- '*'로 바꿔서 출력

select
	emp_name 이름,
	concat(substring(emp_no,1,6),'-*******') as '주민번호 조회'
from
	employee;


-- 5번
-- EMPLOYEE 테이블에서 사원명, 이메일,
-- @이후를 제외한 아이디 조회

select
	emp_name 이름,
    email 이메일,
    substring_index(email,'@',1) 아이디
from
	employee;
  
-- 6번  
-- EMPLOYEE 테이블에서 사원의 이름, 입사일, 입사후 6개월이
-- 되는 날짜를 조회    

select
	emp_name 이름,
    hire_date 입사일,
    date_add(hire_date, interval 6 month) as 6개월이후날짜
from
	employee;
    

-- 7번
-- EMPLOYEE 테이블에서 근무 년수가 20년 이상인 직원 조회

select
	*
from
	employee
where
	floor(datediff(current_date(),hire_date)/365) >= 20 ;
    

-- 8번
-- EMPLOYEE 테이블에서 사원명, 입사일, 
-- 입사한 월의 근무일수를 조회하세요

select
	emp_name 이름,
    hire_date 입사일,
   timestampdiff(month,hire_date,current_date) as 근무일수
from
	employee; -- 포기
    
-- 9번   
-- EMPLOYEE 테이블에서 직원의 이름, 입사일, 근무년수를 조회
-- 단, 근무년수는 현재년도 - 입사년도로 조회

select
	emp_name 이름,
    hire_date 입사일,
    timestampdiff(year, hire_date, current_date) as '근무년도 수'
from
	employee;

-- 10번delete
-- EMPLOYEE 테이블에서 사번이 홀수인 직원들의 정보 모두 조회 (mod)
select
	*
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.dept_code = d.dept_id)
    join
    location l
    on (d.location_id = l.local_code)
    join
    nation n
    on(l.national_code = n.national_code) 
where
	mod(emp.emp_id,2) != 0;


    