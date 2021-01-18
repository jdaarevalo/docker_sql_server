SELECT week_nun, doc_id, good_name, good_group_name, s_date, amount, rate
FROM (
	SELECT *, ROW_NUMBER() OVER(PARTITION BY week_nun ORDER BY rate, s_date DESC) AS rn
	FROM (
		SELECT 
			case 
				when s_date >= '2016-12-01' and s_date < '2016-12-09' then '1 week' 
				when s_date >= '2016-12-09' and s_date < '2016-12-16' then '2 week'
				when s_date >= '2016-12-16' and s_date < '2016-12-23' then '3 week'
				when s_date >= '2016-12-23' and s_date < '2017-01-01' then '4 week'
			else '' end as week_nun
			, d.id as doc_id
			, rg.good_name
			, rgg.good_group_name
			, d.s_date
			, d.amount 
			, d.rate 
		FROM master.dbo.docs d
		left join master.dbo.ref_goods rg on rg.id = d.id_good
		left join master.dbo.ref_good_groups rgg on rg.id_good_group = rgg.id
		where d.s_date >= '2016-12-01' and d.s_date < '2017-01-01'
	) as t1
) as t2
where rn = 1;
