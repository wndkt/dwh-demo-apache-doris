-- dim_customers
select
	customers.customerNumber as customer_number,
	customers.customerName as customer_name,
	customers.contactLastName as customer_contact_last_name,
	customers.contactFirstName as customer_contact_first_name,
	customers.phone as customer_phone_number,
	customers.addressLine1 as customer_address_line1, 
	customers.addressLine2 as customer_address_line2, 
	customers.city as customer_city, 
	customers.state as customer_state, 
	customers.postalCode as customer_postalcode, 
	customers.country as customer_country, 
	customers.salesRepEmployeeNumber as customer_sales_representative, 
	curdate() as start_date,
	null as end_date
from staging.customers
;

-- dim_product
select
	products.productCode as product_code,
	products.productName as product_name,
	products.productScale as product_scale,
	products.productVendor as product_vendor,
	REPLACE(REPLACE(products.productDescription, '\r', ''), '\n', '') as product_description,
	products.productLine as product_category,
	curdate() as start_date,
	null as end_date
from staging.products

;

--dim_sales

select
	employees.employeeNumber as sales_number,
	employees.lastName as sales_last_name, 
	employees.firstName as sales_first_name, 
	employees.extension as sales_extension, 
	employees.email as sales_email, 
	employees.jobTitle as sales_job_title, 
	employees.officeCode as sales_office_code, 
	offices.city as sales_office_city,
	offices.phone as sales_office_phone, 
	offices.addressLine1 as sales_office_address_line1, 
	offices.addressLine2 as sales_office_address_line2, 
	offices.state as sales_office_state, 
	offices.country as sales_office_country, 
	offices.postalCode as sales_office_postal_code, 
	offices.territory as sales_office_territory, 
	curdate() as start_date,
	null as end_date
from staging.employees
	join staging.offices on employees.officecode=offices.officecode
where employees.jobtitle='Sales Rep'
;

--fact order
select
	dim_customer.sk_customer as sk_customer,
	dim_product.sk_product as sk_product,
	dd1.sk_date as sk_order_date,
	dd2.sk_date as sk_order_required_date,
	dd3.sk_date as sk_order_shipped_date, 
	orders.orderNumber as order_number, 
	orders.status as order_status, 
	orders.comments as order_comment, 
	orderdetails.quantityOrdered as order_quantity, 
	orderdetails.priceEach as order_price_each, 
	(orderdetails.quantityOrdered * orderdetails.priceEach) as order_amount,
	orderdetails.orderLineNumber as order_line_number
from staging.orderdetails
	join staging.orders on orderdetails.ordernumber=orders.ordernumber
	left join model.dim_customer on orders.customernumber = dim_customer.customer_number
	left join model.dim_product on orderdetails.productcode = dim_product.product_code 
	left join model.dim_date dd1 on orders.orderdate = dd1.date
	left join model.dim_date dd2 on orders.requiredDate = dd2.date
	left join model.dim_date dd3 on orders.shippedDate = dd3.date
;