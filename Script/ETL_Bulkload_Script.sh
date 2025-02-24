#load script format
curl --location-trusted -u your_username:your_password -H "Expect:100-continue" -H "column_separator:your_column_file_separator"  -H "columns:all_of_the_column_of_table" -T path_of_file_to_load -H "max_filter_ratio:0.1"  -XPUT http://your_host:8030/api/your_database/your_table/_stream_load

#dim_customer

curl --location-trusted -u root:"" -H "Expect:100-continue" -H "column_separator:|"  -H "columns:sk_customer,customer_number,customer_name,customer_contact_last_name,customer_contact_first_name,customer_phone_number,customer_address_line1,customer_address_line2,customer_city,customer_state,customer_postalcode,customer_country,customer_sales_representative,start_date,end_date" -T /home/administrator/application/apache-hop/hop/config/projects/demoDoris/files/dim_customer.csv -H "max_filter_ratio:0.1"  -XPUT http://103.82.93.55:8030/api/model/dim_customer/_stream_load

#dim_sales

curl --location-trusted -u root:"" -H "Expect:100-continue" -H "column_separator:|"  -H "columns:sk_sales,sales_number,sales_last_name,sales_first_name,sales_extension,sales_email,sales_job_title,sales_office_code,sales_office_city,sales_office_phone,sales_office_address_line1,sales_office_address_line2,sales_office_state,sales_office_country,sales_office_postal_code,sales_office_territory,start_date,end_date" -T /home/administrator/application/apache-hop/hop/config/projects/demoDoris/files/dim_sales.csv -H "max_filter_ratio:0.1"  -XPUT http://103.82.93.55:8030/api/model/dim_sales/_stream load

#dim_product

curl --location-trusted -u root:"" -H "Expect:100-continue" -H "column_separator:%"  -H "columns:sk_product,product_code,product_name,product_scale,product_vendor,product_description,product_category,start_date,end_date" -T /home/administrator/application/apache-hop/hop/config/projects/demoDoris/files/dim_product.csv -H "max_filter_ratio:0.1"  -XPUT http://103.82.93.55:8030/api/model/dim_product/_stream_load


#fact_order

curl --location-trusted -u root:"" -H "Expect:100-continue" -H "column_separator:|"  -H "columns:sk_order,sk_customer,sk_product,sk_order_date,sk_order_required_date,sk_order_shipped_date,order_number,order_status,order_comment,order_quantity,order_price_each,order_amount,order_line_number" -T /home/administrator/application/apache-hop/hop/config/projects/demoDoris/files/fact_order.csv -H "max_filter_ratio:0.1"  -XPUT http://103.82.93.55:8030/api/model/fact_order/_stream_load