use employee;

select * from employee;
select * from job;
select * from department;
select * from location;
select * from nation;  
-- 1. 직급이 대리이면서 아시아 지역에 근무하는 직원 조회
-- 사번, 이름, 직급명, 부서명, 근무지역명, 급여를 조회하세요
-- (조회시에는 모든 컬럼에 테이블 별칭을 사용하는 것이 좋다.)
-- (사용 테이블 : job, department, location, employee)

select
	emp.emp_id,
    emp.emp_name,
    d.dept_title,
    l.local_name,
    emp.salary
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
where
	j.job_name = '대리' and l.local_name like 'asia%' ;
    

    
-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 
--    성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
-- (사용 테이블 : employee, department, job)

    
select
	emp.emp_name,
    emp.emp_no,
    d.dept_title,
    j.job_name
from
	employee emp
    join
    job j
    on(emp.job_code = j.job_code)
    join
    department d
    on (emp.dept_code = d.dept_id)
where
	emp.emp_no like '7%'
    and
    emp.emp_no like '_______2%'
    and
    emp.emp_name like '전%';
    
    
-- 3. 이름에 '형'자가 들어가는 직원들의
-- 사번, 사원명, 직급명을 조회하시오.
-- (사용 테이블 : employee, job)

select
	emp.emp_id,
    emp.emp_name,
    j.job_name
from
	employee emp
    join
    job j
    on(emp.job_code = j.job_code)
where
	emp.emp_name like '_형%';
    


-- 4. 해외영업팀에 근무하는 사원명, 
--    직급명, 부서코드, 부서명을 조회하시오.
-- (사용 테이블 : employee, department, job)

select
	emp.emp_name,
    j.job_name,
    emp.dept_code,
    d.dept_title
from
	employee emp
    join
    job j
    on(emp.job_code = j.job_code)
    join
    department d
    on (emp.dept_code = d.dept_id)
where
	d.dept_title like '해외영업%';
	


-- 5. 보너스포인트를 받는 직원들의 사원명, 
--    보너스포인트, 부서명, 근무지역명을 조회하시오.
-- (사용 테이블 : employee, department, location)

select
	emp.emp_name,
    emp.bonus,
    d.dept_title,
    l.local_name
from
	employee emp
    join 
    department d 
    on (emp.DEPT_CODE = d.DEPT_ID)
    join
    location l
    on (d.location_id = l.local_code)
where
	emp.bonus is not null;

    
-- 6. 부서코드가 D2인 직원들의 사원명, 
--    직급명, 부서명, 근무지역명을 조회하시오.
-- (사용 테이블 : employee, job, department, location)  

select
	emp.emp_name,
    j.job_name,
    d.dept_title,
    l.local_name
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.DEPT_CODE = d.DEPT_ID)
    join
    location l
    on (d.location_id = l.local_code)
where
	d.dept_id = 'd2';
 
 
 -- 7. 본인 급여 등급의 최소급여(MIN_SAL)를 초과하여 급여를 받는 직원들의
--    사원명, 직급명, 급여, 보너스포함 연봉을 조회하시오.
--    연봉에 보너스포인트를 적용하시오.
-- (사용 테이블 : employee, job, sal_grade)
select
	emp.emp_name,
    j job_name,
    emp.salary,
    emp.bunus
from
	employee emp
    join
    job j
    on(emp.job_code = j.job_code)
    join
    sal_grade s
    on(emp.sal_level = s.sal_level)
where
	emp.sal_level > s.min_sal ; -- 포기
    
    
-- 8. 한국(KO)과 일본(JP)에 근무하는 직원들의 
--    사원명, 부서명, 지역명, 국가명을 조회하시오.

select
    emp.emp_name,
    d.dept_title,
    l.local_name,
    n.national_name
from
	employee emp
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
	n.national_code in( 'ko','jp');
    

    
    









    