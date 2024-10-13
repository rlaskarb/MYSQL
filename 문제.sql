Use employee;
-- 1 모든 행 모든 컬럼 조회

select
	*
from
	employee;
    

-- 2 원하는 컬럼 조회 사번,이름 조회

select
	emp_id,
    emp_name
from    
    employee;


-- 3 원하는 행 조회  테이블에서 부서코드가 d9 인 사원 조회
   
select
	*
from
    department
where
	dept_id = 'd9';


-- 4 원하는 행과 컬럼 조회 / employee 테이블에서 급여가 300 이상인 사원의 사번,이름,부서코드,급여 조회.
select
	emp_id,
    emp_name,
    dept_code,
    salary
from
	employee
where
    salary >= 3000000;


-- 5. 부서코드가 d6 이고 급여을 200만원 보다 많이 받는 직원의 이름,부서코드,급여 조회. 

select
	emp_name,
    dept_code,
    salary
from
	employee
where    
	dept_code = 'd6' and salary > 2000000 ;


-- 6 null 값 조회 //보너스 지급받지 않는 사원의 사번,이름,급여, 보너스 조회.

select
	emp_id,
    emp_name,
    salary,
    bonus
from
	employee
order by
	bonus is null asc;
    

-- 7 employee 테이블에서 급여를 350만 이상 500만 이하 받는
-- 직원이름,주민번호,부서코드

select
	emp_name,
    emp_no,
    dept_code
from
	employee
where
	salary >= 3500000 and salary <= 5000000;


-- 8 employee 테이블에서 성이 김씨인 직원의
-- 사번,이름 입사일 조회

select
	emp_id,
    emp_name,
    hire_date
from
	employee
where
	emp_name like '김%';

-- 9 employee 테이블에서 '하' 가 이름에 포함된
-- 직원이름,주민번호,부서코드 조회

select
	emp_name,
	emp_id,
    emp_no,
    dept_code
from
	employee
where
	emp_name like '%하%';


-- 10 employee 테이블에서 전화번호 국번이 9로 시작하는 
-- 직원의 사번, 이름,전화번호 조회
-- 와일드 카드 사용 : _(글자 한자리), %(0개 이상의 글자)
-- 이해 안가는 문제 !
select
	emp_id,
    emp_name,
    phone
from
	employee
where
	phone like '___9%';  

-- 11. employee 테이블에서 전화번호 국번이 4자리 이면서
-- 9로 시작하는 직원의 사번,이름,전화버호를 조회

select
	emp_id,
    emp_name,
    phone
from
	employee
where
	phone like '___9%___';

-- 12.부서코드가 'D6' 이거나 'D8'인 직원의
-- 이름, 부서, 급여를 조회하세요
-- IN 연산자 : 비교하려는 값 목록에 일치하는 값이 있는지 확인

select
	emp_name,
    dept_code,
    salary
from
	employee
where
	-- dept_code ='d6' or dept_code = 'd8'
	 dept_code in('d6','d8');
     
     
     
-- 13. 이씨성이 아닌 직원의 사번, 이름, 이메일주소 조회

select
	emp_id,
    emp_name,
    email
from
	employee
where
	emp_name not like '이%';
    
    
-- 14. j2 직급의 급여 200만원 이상 받는 직원이거나
-- j7 직급인 직원의 이름,급여,직급코드 조회

select
	emp_name,
    salary,
    job_code
from
	employee
where
	job_code = 'j7' or (job_code = 'j2' and salary >= 2000000) ;
    
    
--   j7 직급이거나 j2 직급인 직원들 중
-- 급여가 200만원 이상인 직원의 
-- 이름,급여,직급콬드를 조회하세요

select
	emp_name,
    salary,
    job_code
from
	employee
where
	job_code in ('j7','j2') and (salary >= 2000000);