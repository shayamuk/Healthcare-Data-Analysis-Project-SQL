/* =====================================================
Query to check the whole data
   ===================================================== */
SELECT * FROM healthcare_data;

/* =====================================================
1.Total Number of Patients
  ===================================================== */
Select count(distinct Name) from healthcare_data;

/* =====================================================
   2. List of distinct medical conditions
   ===================================================== */
   
   Select Distinct medical_condition from healthcare_data;

/* =====================================================
   3. Average patient age by gender
   ===================================================== */

Select gender, round(avg(Age),2) as avg_age from healthcare_data
group by gender;

/* =====================================================
   4. Total admissions by admission type
   ===================================================== */

Select admission_type, count(*) as total_admission 
from healthcare_data
GROUP BY admission_type;

/* =====================================================
   5. Total billing amount by insurance provider
   ===================================================== */

Select insurance_provider, round(sum(billing_amount),2) as Total_billing_amount 
from healthcare_data
GROUP BY insurance_provider;

/* =====================================================
   6. Top 5 medical conditions by number of admissions
   ===================================================== */
   
SELECT medical_condition, COUNT(*) AS admission_count
FROM healthcare_data
group by medical_condition
order by total_admission desc
limit 5;

/* =====================================================
   7. Average billing amount per medical condition
   ===================================================== */

Select medical_condition, round(avg(billing_amount),2) as avg_billing_amount
from healthcare_data
group by medical_condition;

/* =====================================================
   8. Top 5 Hospitals by number of admissions
   ===================================================== */
   
Select hospital, count(*) as total_admission
from healthcare_data
GROUP BY hospital
order by total_admission desc
limit 5;

/* =====================================================
   9. Emergency admission percentage per hospital
   ===================================================== */
   
SELECT hospital, 
ROUND(
100 * SUM(
CASE 
WHEN admission_type = 'Emergency' THEN 1 ELSE 0 END)/ COUNT(*),2) AS emergency_percentage
FROM healthcare_data
GROUP BY hospital
ORDER BY emergency_percentage DESC;

/* =====================================================
   10. Average billing comparison by gender
   ===================================================== */

Select gender, round(avg(billing_amount),2) as avg_billing_comparison
   from healthcare_data
   GROUP BY gender;
   
/* =====================================================
   11. Rank hospitals by total billing
   ===================================================== */
   
   select * from healthcare_data;
   
With hospital_billing as(
select hospital, sum(billing_amount) as total_billing
from healthcare_data
GROUP BY hospital
)
select hospital, total_billing,
DENSE_RANK() OVER(order by total_billing desc) as billing_rank
from hospital_billing;

/* =====================================================
   12. Doctors handling the highest number of patients
   ===================================================== */
select * from healthcare_data;

Select doctor, count(name) as highest_number_of_patients
from healthcare_data
GROUP BY doctor
order by highest_number_of_patients desc;

/* =====================================================
   13. High-risk patients: abnormal tests + high billing
   ===================================================== */
   
   WITH avg_billing_cte AS (
    SELECT AVG(billing_amount) AS avg_billing
    FROM healthcare_data
)
SELECT
name,
    medical_condition,
    test_results,
    billing_amount
FROM healthcare_data
CROSS JOIN avg_billing_cte
where test_results = 'Abnormal'
AND billing_amount>avg_billing;

/* =====================================================
   14. Identify duplicate patient records
   ===================================================== */
   
   Select name, count(*) as duplicate_record
   FROM healthcare_data
   GROUP BY name
   HAVING duplicate_record>1;

/* =====================================================
   15. Remove duplicate records (keep latest discharge)
   ===================================================== */
   
   WITH dedup_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY name, date_of_admission
               ORDER BY discharge_date DESC
           ) AS rn
    FROM healthcare_data
)
DELETE FROM healthcare_data
WHERE (name, date_of_admission) IN (
    SELECT name, date_of_admission
    FROM dedup_cte
    WHERE rn > 1
);

/* =====================================================
   /////////////////THE END/////////////////////////////
   ===================================================== */