 

 select *,
        ROUND(sales.quantity * product.purchase_price,2) as purchase_cost,
        ROUND(sales.revenue - (sales.quantity * product.purchase_price),2 ) as margin
 from {{ ref("stg_raw__sales")}} as sales
 left join {{ ref("stg_raw__product")}} as product 
 on sales.product_id = product.products_id

