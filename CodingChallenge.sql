--1 Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”. 
create database CareerHub;
use CareerHub;

--2. Create tables for Companies, Jobs, Applicants and Applications. 
-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL,
    JobType VARCHAR(255),
    PostedDate DATETIME,
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Resume TEXT
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
);
-- Add foreign key to Jobs table
ALTER TABLE Jobs
ADD CONSTRAINT FK_Jobs_Companies FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID);

-- Add foreign key to Applications table referencing Jobs table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Jobs FOREIGN KEY (JobID) REFERENCES Jobs(JobID);

-- Add foreign key to Applications table referencing Applicants table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Applicants FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID);

-- Insert data into Companies table
INSERT INTO Companies
VALUES
    (1, 'Company A', 'Location A'),
    (2, 'Company B', 'Location B'),
    (3, 'Company C', 'Location C'),
    (4, 'Company D', 'Location D'),
    (5, 'Company E', 'Location E'),
    (6, 'Company F', 'Location F'),
    (7, 'Company G', 'Location G'),
    (8, 'Company H', 'Location H'),
    (9, 'Company I', 'Location I'),
    (10, 'Company J', 'Location J');

-- Insert data into Jobs table
INSERT INTO Jobs 
VALUES
    (1, 1, 'Software Engineer', 'Develop software applications', 'Location A', 80000.00, 'Full-time', '2023-01-01 08:00:00'),
    (2, 1, 'Marketing Specialist', 'Create and implement marketing strategies', 'Location A', 60000.00, 'Part-time', '2023-01-02 10:30:00'),
    (3, 2, 'Data Analyst', 'Analyze and interpret data', 'Location B', 70000.00, 'Full-time', '2023-01-03 12:00:00'),
    (4, 2, 'Sales Representative', 'Promote and sell products', 'Location B', 55000.00, 'Full-time', '2023-01-04 14:30:00'),
    (5, 3, 'Graphic Designer', 'Create visual concepts', 'Location C', 65000.00, 'Part-time', '2023-01-05 09:45:00'),
    (6, 3, 'HR Manager', 'Oversee human resources functions', 'Location C', 75000.00, 'Full-time', '2023-01-06 11:15:00'),
    (7, 4, 'Financial Analyst', 'Conduct financial analysis', 'Location D', 72000.00, 'Full-time', '2023-01-07 13:30:00'),
    (8, 4, 'Customer Support Specialist', 'Assist customers with inquiries', 'Location D', 50000.00, 'Part-time', '2023-01-08 15:45:00'),
    (9, 5, 'Project Manager', 'Manage project timelines and resources', 'Location E', 85000.00, 'Full-time', '2023-01-09 17:00:00'),
    (10, 5, 'IT Support Technician', 'Provide technical support', 'Location E', 60000.00, 'Full-time', '2023-01-10 19:15:00');

-- Insert data into Applicants table
INSERT INTO Applicants 
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', 'Resume for John Doe'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', 'Resume for Jane Smith'),
    (3, 'Mike', 'Johnson', 'mike.johnson@email.com', '345-678-9012', 'Resume for Mike Johnson'),
    (4, 'Emily', 'Williams', 'emily.williams@email.com', '567-890-1234', 'Resume for Emily Williams'),
    (5, 'Chris', 'Brown', 'chris.brown@email.com', '789-012-3456', 'Resume for Chris Brown'),
    (6, 'Laura', 'Miller', 'laura.miller@email.com', '901-234-5678', 'Resume for Laura Miller'),
    (7, 'David', 'Jones', 'david.jones@email.com', '234-567-8901', 'Resume for David Jones'),
    (8, 'Emma', 'Taylor', 'emma.taylor@email.com', '456-789-0123', 'Resume for Emma Taylor'),
    (9, 'Brian', 'White', 'brian.white@email.com', '678-901-2345', 'Resume for Brian White'),
    (10, 'Olivia', 'Davis', 'olivia.davis@email.com', '890-123-4567', 'Resume for Olivia Davis');

-- Insert data into Applications table
INSERT INTO Applications 
VALUES
    (1, 1, 1, '2023-01-03 12:45:00', 'Cover letter for Software Engineer from John Doe'),
    (2, 1, 2, '2023-01-04 14:20:00', 'Cover letter for Software Engineer from Jane Smith'),
    (3, 2, 3, '2023-01-05 15:30:00', 'Cover letter for Marketing Specialist from Mike Johnson'),
    (4, 2, 4, '2023-01-06 16:45:00', 'Cover letter for Marketing Specialist from Emily Williams'),
    (5, 3, 5, '2023-01-07 18:00:00', 'Cover letter for Data Analyst from Chris Brown'),
    (6, 3, 6, '2023-01-08 19:15:00', 'Cover letter for Data Analyst from Laura Miller'),
    (7, 4, 7, '2023-01-09 20:30:00', 'Cover letter for Sales Representative from David Jones'),
    (8, 4, 8, '2023-01-10 21:45:00', 'Cover letter for Sales Representative from Emma Taylor'),
    (9, 5, 9, '2023-01-11 23:00:00', 'Cover letter for Graphic Designer from Brian White'),
    (10, 5, 10, '2023-01-12 01:15:00', 'Cover letter for Graphic Designer from Olivia Davis');

/* 5.Write an SQL query to count the number of applications received for each job listing in the
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all
jobs, even if they have no applications */

SELECT  j.JobID, J.JobTitle, COUNT(a.ApplicationID) AS ApplicationCount
FROM Jobs j
LEFT JOIN Applications a ON j.JobID = a.JobID
GROUP BY j.JobID, j.JobTitle;
    
 
/*6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary
range. Allow parameters for the minimum and maximum salary values. Display the job title,
company name, location, and salary for each matching job.*/

SELECT j.JobTitle, c.CompanyName,j.JobLocation, j.Salary FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE
    j.Salary >= 60000
    AND j.Salary <= 90000;
    
    
/*7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a
parameter for the ApplicantID, and return a result set with the job titles, company names, and
application dates for all the jobs the applicant has applied to.*/

SELECT j.JobTitle,
    (SELECT CompanyName FROM Companies WHERE CompanyID = j.CompanyID) AS CompanyName, a.ApplicationDate
FROM Applications a
JOIN Jobs j ON A.JobID = J.JobID
WHERE a.ApplicantID = 6;
    
/*8. Create an SQL query that calculates and displays the average salary offered by all companies for
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.*/

SELECT
    AVG(Salary) AS AvgSalary FROM Jobs
WHERE Salary !=0;
    
/*9. Write an SQL query to identify the company that has posted the most job listings. Display the
company name along with the count of job listings they have posted. Handle ties if multiple
companies have the same maximum count.*/

SELECT TOP 1 WITH TIES  c.CompanyName,
    COUNT(j.JobID) AS JobCount FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyID, c.CompanyName
ORDER BY
    JobCount DESC;
    

--10Find the applicants who have applied for positions in companies located in 'CityX' and have at  least 3 years of experience.
--altering as no colmn given
ALTER TABLE Applicants
ADD Experience INT;


UPDATE Applicants
SET Experience = 5 
WHERE ApplicantID = 1; 
UPDATE Applicants
SET Experience = 3 
WHERE ApplicantID = 2; 

SELECT a.* FROM Applicants a
JOIN  Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN  Jobs j ON ap.JobID = j.JobID
JOIN  Companies c ON j.CompanyID = c.CompanyID
WHERE  c.Location = 'Location A' AND a.Experience >= 3;

--11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

SELECT JobTitle , Salary FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

--12. Find the jobs that have not received any applications.

SELECT j.JobTitle FROM Jobs j
LEFT JOIN Applications ap ON j.JobID = ap.JobID
WHERE ap.ApplicantID is NULL;

--13.Retrieve a list of job applicants along with the companies they have applied to and the positions  they have applied for.
SELECT a.FirstName ,a.LastName,c.CompanyName ,j.jobTitle FROM Applicants a
JOIN Applications ap ON a.ApplicantID =ap.ApplicantID
JOIN Jobs J ON ap.JobID=j.JobID
JOIN Companies c ON j.CompanyID =c.CompanyID;

--14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not  received any applications.
SELECT c.CompanyName ,COUNT(j.JobID) AS JobCount
FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID =j.CompanyID
GROUP BY c.CompanyName;

--15. List all applicants along with the companies and positions they have applied for, including those  who have not applied

SELECT a.FirstName , a.LastName ,c.CompanyName ,j.JobTitle
FROM Applicants a
LEFT JOIN Applications ap ON a.ApplicantID=ap.ApplicantID
LEFT JOIN Jobs j ON ap.JobID =j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

SELECT DISTINCT  c.CompanyName
FROM  Companies c
JOIN  Jobs j ON c.CompanyID = j.CompanyID
WHERE j.Salary > (SELECT AVG(Salary) FROM Jobs);
    
--17. Display a list of applicants with their names and a concatenated string of their city and state.  

--altering as no colmn given
ALTER TABLE Applicants
ADD City VARCHAR(255),
    State VARCHAR(255);

Update Applicants
SET City ='Pune', State ='Maharashtra'
WHERE ApplicantID =1;

SELECT
    ApplicantID,
    FirstName,
    LastName,
    CONCAT(City, ', ', State) AS Location
FROM Applicants;   
    
--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

SELECT  * FROM  Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';    

/* 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not
applied and jobs without applicants.   */

SELECT 
    a.FirstName,
    a.LastName,
    j.JobTitle
FROM 
    Applicants a
LEFT JOIN 
    Applications ap ON a.ApplicantID = ap.ApplicantID
LEFT JOIN 
    Jobs j ON ap.JobID = j.JobID;

--20. List all combinations of applicants and companies where the company is in a specific city and the  applicant has more than 2 years of experience.
SELECT a.ApplicantID, a.FirstName,a.LastName, a.Experience, c.CompanyID, c.CompanyName,
    c.Location AS CompanyLocation
FROM  Applicants a
CROSS JOIN Companies c
WHERE
   c.Location = 'Location A'
    AND a.Experience > 2;

