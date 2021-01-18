
DECLARE @date_from as NVARCHAR(20)
DECLARE @date_to as NVARCHAR(20)
DECLARE @cols AS NVARCHAR(MAX)
DECLARE @query AS NVARCHAR(MAX)
-- set the begin date
SET @date_from = '2020-12-01'
-- set the end date
SET @date_to = '2020-12-09'
--
SELECT @cols = STUFF((
	SELECT DISTINCT ',' + QUOTENAME(CONVERT(VARCHAR(10), s_date, 120))
	FROM master.dbo.sales s
	where s.s_date >= @date_from and s.s_date < @date_to
	FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')
	,1,1,'')
SET @query ='SELECT *
	FROM (
		SELECT CONVERT(VARCHAR(10), s_date, 120) as day, good_name,  sum(amount) as total
		FROM master.dbo.sales s
		left join master.dbo.ref_goods rg on s.id_good = rg.id
		where s.s_date >= ''' + @date_from + ''' and s.s_date < ''' + @date_to + '''
		GROUP BY CONVERT(VARCHAR(10), s_date, 120), good_name
	) as src
	PIVOT 
	(
	MAX(total)
	for day in (' + @cols + ')
	) piv;'
EXEC (@query);
