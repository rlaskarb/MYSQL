select * from employee;
select * from job;
select * from department;
select * from location;
select * from nation;
select * from sal_grade;

-- 1.부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회

select
	emp_id,
    emp_name,
    dept_id,
    dept_title
from
	employee emp
    join
    department d
    on(emp.dept_code = d.dept_id)
where
	d.dept_title = ( select
						d2.dept_title
					from
						employee emp2
						join
						department d2
						on(emp2.dept_code = d2.dept_id)
					where emp2.emp_name = '노옹철' );
					

-- 2.전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의
-- 사번, 이름, 직급코드, 급여를 조회하세요
select
	avg(salary)
 from
	employee;


select
	emp1.emp_id,
    emp1.emp_name,
    emp1.job_code,
    emp1.salary
from
	employee emp1
where
	emp1.salary >= ( select
						avg(emp2.salary)
					from
						employee emp2);
                        
					
                    
-- 3.노옹철 사원의 급여보다 많이 받는 직원의
-- 사번, 이름, 부서, 직급, 급여를 조회하세요
select
	emp.emp_id,
    emp.emp_name,
    d.dept_title,
    j.job_name,
    emp.salary
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.dept_code = d.dept_id)
where
	emp.salary > (select
						emp2.salary
				  from
						employee emp2
				  where
						emp2.emp_name = '노옹철');


-- 4.가장 적은 급여를 받는 직원의
-- 사번, 이름, 직급, 부서, 급여, 입사일을 조회하세요 (MIN)

-- 서브쿼리는 SELECT, FROM, WHERE, HAVING, ORDER BY절에도 사용할 수 있다.
select
	emp.emp_id 번호,
    emp.emp_name 이름,
    j.job_name 직급,
    d.dept_title 부서,
    emp.salary 급여,
    emp.hire_date 입사일
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.dept_code = d.dept_id)
where
	emp.salary = ( select
						min(emp2.salary)
					from
						employee emp2);
					


-- 5.부서별 최고 급여를 받는 직원의 이름, 직급, 부서, 급여 조회
-- 힌트 : where 절에 subquery

select
	emp.emp_name,
    j.job_name,
    d.dept_title,
    emp.salary
from
	employee emp
    join
    job j
    on ( emp.job_code = j.job_code)
    join 
    department d 
    on (emp.dept_code = d.dept_id)
where
	emp.salary in ( select
						max(emp2.salary)
				   from
						employee emp2
					group by
						emp2.dept_code);


-- 6.관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의 
-- 정보를 추출하여 조회
-- 사번, 이름, 부서명, 직급, '관리자' AS 구분 / '직원' AS 구분
-- 힌트 : is not null, union(혹은 then, else), distinct

select
	emp.emp_id 번호,
    emp.emp_name 이름,
    d.dept_title 부서명,
	case
		when emp.emp_id in(select distinct
										emp2.manager_id
							from
									employee emp2
							where
									emp2.manager_id is not null)
		then '관리자'
        else '직원'
        end as 구분
	from
		employee emp
		left join
		department d
        on(emp.dept_code = d.dept_id);  -- 지금 못 푸는문제.
        

-- 7.자기 직급의 평균 급여를 받고 있는 직원의
-- 사번, 이름, 직급코드, 급여를 조회하세요
-- 단, 급여와 급여 평균은 만원단위로 계산하세요
-- 힌트 : round(컬럼명, -5)       

select
	emp.emp_id,
    emp.emp_name,
    emp.job_code,
    emp.salary
from
	employee emp
where
	(emp.job_code , emp.salary) in ( select
										emp2.job_code,
                                        round(avg(emp2.salary),-5)
									from
										employee emp2
									group by
										emp2.job_code);
                                        
                                        
                                        


    
    


	
	
    





					
    
    






















