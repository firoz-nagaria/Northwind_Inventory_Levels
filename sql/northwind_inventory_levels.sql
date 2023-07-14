--products low in stock, discontinued but in demand, over stocked
select p.product_name, p.units_in_stock, p.discontinued, p.reorder_level, p.units_on_order, p.discontinued, sum(od.quantity)
from products p 
join order_details od on p.product_id = od.product_id  
join orders o on o.order_id = od.order_id 
where o.order_date BETWEEN '1998-04-06' AND '1998-05-06'
group by p.product_name, p.units_in_stock, p.reorder_level, p.discontinued, p.units_on_order  
order by p.product_name 


---products orders received over the time
WITH Totalorder as	(select p.product_name, c.category_name, s.company_name, p.units_in_stock, p.units_on_order, 
					sum(od.quantity) as Total_ordered
					from products p 
					join suppliers s on p.supplier_id = s.supplier_id 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id
					join categories c ON c.category_id = p.category_id 
					where o.order_date between '1998-02-01' and '1998-05-06'
					group by p.product_name, p.units_in_stock, c.category_name, p.units_on_order, s.company_name),
	feb_w1	 as		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-02-01' AND '1998-02-07'
					group by p.product_name
					),
	feb_w2 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-02-08' AND '1998-02-14'
					group by p.product_name
					),
	feb_w3 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-02-15' AND '1998-02-21'
					group by p.product_name
					),
	feb_w4 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-02-22' AND '1998-02-28'
					group by p.product_name
					),
	march_w1 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-03-01' AND '1998-03-07'
					group by p.product_name
					),
	march_w2 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-03-08' AND '1998-03-14'
					group by p.product_name
					),
	march_w3 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-03-15' AND '1998-03-21'
					group by p.product_name
					),
	march_w4 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-03-22' AND '1998-03-28'
					group by p.product_name
					),
	april_w1 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-03-29' AND '1998-04-04'
					group by p.product_name
					),
	april_w2 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-04-05' AND '1998-04-11'
					group by p.product_name
					),
	april_w3 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-04-12' AND '1998-04-18'
					group by p.product_name
					),
	april_w4 as 		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-04-19' AND '1998-04-25'
					group by p.product_name
					),
	april_30 as		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-04-26' AND '1998-04-30'
					group by p.product_name
					),
	may_w1 as		(select p.product_name, sum(od.quantity)
					from products p 
					join order_details od on p.product_id = od.product_id 
					join orders o on od.order_id = o.order_id 
					where o.order_date BETWEEN '1998-05-01' AND '1998-05-06'
					group by p.product_name
					)
select totalorder.*, feb_w1.sum as feb_w1, feb_w2.sum as feb_w2, feb_w3.sum as feb_w3, feb_w4.sum as feb_week4, 
					march_w1.sum as march_w1, march_w2.sum as march_w2,	march_w3.sum as march_w3, march_w4.sum as march_w4,
					april_w1.sum as april_w1, april_w2.sum as april_w2,	april_w3.sum as april_w3, april_w4.sum as april_w4,
					april_30.sum as april_30, may_w1.sum as may_w1
from totalorder
left join feb_w1 on totalorder.product_name = feb_w1.product_name
left join feb_w2 on totalorder.product_name = feb_w2.product_name
left join feb_w3 on totalorder.product_name = feb_w3.product_name
left join feb_w4 on totalorder.product_name = feb_w4.product_name
left join march_w1 on totalorder.product_name = march_w1.product_name
left join march_w2 on totalorder.product_name = march_w2.product_name
left join march_w3 on totalorder.product_name = march_w3.product_name
left join march_w4 on totalorder.product_name = march_w4.product_name
left join april_w1 on totalorder.product_name = april_w1.product_name
left join april_w2 on totalorder.product_name = april_w2.product_name
left join april_w3 on totalorder.product_name = april_w3.product_name
left join april_w4 on totalorder.product_name = april_w4.product_name
left join april_30 on totalorder.product_name = april_30.product_name
left join may_w1 on totalorder.product_name = may_w1.product_name
order by totalorder.product_name 



select *
from products p  
