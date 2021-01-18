SELECT 'YTD' as good_name, sum(amount) as total
FROM master.dbo.sales
where s_date BETWEEN DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
	and DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 1) 
UNION
SELECT 'MTD', sum(amount)
FROM master.dbo.sales
where s_date BETWEEN DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)
	and DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 1)
UNION
SELECT 'QTD', sum(amount)
FROM master.dbo.sales
where s_date BETWEEN DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0)
	and DATEADD(qq, 1, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0))
UNION
SELECT 'PYTD', sum(amount)
FROM master.dbo.sales
where s_date BETWEEN DATEADD(yy, -1, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0))
	and DATEADD(yy, -1, DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 1))
UNION
SELECT 'PMTD', sum(amount)
FROM master.dbo.sales
where s_date BETWEEN DATEADD(yy, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0))
	and DATEADD(yy, -1, DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 1))
UNION
SELECT 'PQTD', sum(amount)
FROM master.dbo.sales
where s_date BETWEEN DATEADD(yy, -1, DATEADD(qq, DATEDIFF(qq, 0, GETDATE()), 0))
	and DATEADD(yy, -1, DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 1));
