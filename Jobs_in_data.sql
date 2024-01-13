select * from datajobs

--1)What are different types of job title and their total count?

select distinct(job_title), (select count(distinct(job_title)) from datajobs) as total_JT
from datajobs;


--2)How many data analyst are there?

select count(job_title) as total_DA
from datajobs 
where job_title = 'data analyst';


--3)What are highest 5 salary of data analyst?

select top 5 salary_in_usd
from datajobs
where job_title = 'data analyst'
order by salary desc;


--4)How many data analyst are there who are working remotely?

select count(work_setting) as DA_remote_job 
from datajobs
where work_setting = 'remote' and job_title = 'data analyst';


--5)What is the average salary of data analyst, data engineer and data scientist?

Select job_title, avg(salary_in_usd) as Salary_avg
from datajobs
where job_title in ('data analyst','data engineer','data scientist')
group by job_title;


--6)Which are job title's maximum salary is greater than 400000? order in descending.

Select job_title, max(salary_in_usd) as Salary_max
from datajobs
group by job_title
having max(salary_in_usd)>400000
order by 2 desc;


--7)Which highest 10 job category has salary in range from 100000 to 1000000? 

select top 10 job_category, salary_in_usd
from datajobs
where salary_in_usd between 100000 and 1000000
order by 2 desc;


--8)Which are highest 10 job title by salary? rank them.

select top 10 job_title, salary_in_usd,
row_number() over(order by salary_in_usd desc) as Sr_no,
rank() over(order by salary_in_usd desc) as Rank_no,
dense_rank() over(order by salary_in_usd desc) as DenseRank_no
from datajobs;