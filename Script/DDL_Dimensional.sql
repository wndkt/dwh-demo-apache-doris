-- model.dim_customer definition

CREATE TABLE `dim_customer` (
  `sk_customer` int(11) NULL,
  `customer_number` int(11) NULL,
  `customer_name` varchar(50) NULL,
  `customer_contact_last_name` varchar(50) NULL,
  `customer_contact_first_name` varchar(50) NULL,
  `customer_phone_number` varchar(50) NULL,
  `customer_address_line1` varchar(50) NULL,
  `customer_address_line2` varchar(50) NULL,
  `customer_city` varchar(50) NULL,
  `customer_state` varchar(50) NULL,
  `customer_postalcode` varchar(15) NULL,
  `customer_country` varchar(50) NULL,
  `customer_sales_representative` int(11) NULL,
  `start_date` date NULL,
  `end_date` date NULL
) ENGINE=OLAP
UNIQUE KEY(`sk_customer`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sk_customer`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- model.dim_date definition

CREATE TABLE `dim_date` (
  `sk_date` bigint(20) NULL,
  `date_id` bigint(20) NULL,
  `date` date NOT NULL,
  `year` int(11) NULL,
  `month` varchar(10) NULL,
  `month_of_year` varchar(2) NULL,
  `day_of_month` int(11) NULL,
  `day` varchar(10) NULL,
  `day_of_week` int(11) NULL,
  `weekend` varchar(10) NOT NULL DEFAULT "Weekday",
  `day_of_year` int(11) NULL,
  `week_of_year` varchar(2) NULL,
  `quarter` int(11) NULL,
  `previous_day` date NOT NULL DEFAULT "1900-01-01",
  `next_day` date NOT NULL DEFAULT "1900-01-01"
) ENGINE=OLAP
DUPLICATE KEY(`sk_date`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sk_date`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- model.dim_product definition

CREATE TABLE `dim_product` (
  `sk_product` int(11) NULL,
  `product_code` varchar(15) NULL,
  `product_name` varchar(70) NULL,
  `product_scale` varchar(10) NULL,
  `product_vendor` varchar(50) NULL,
  `product_description` text NULL,
  `product_category` varchar(50) NULL,
  `start_date` date NULL,
  `end_date` date NULL
) ENGINE=OLAP
UNIQUE KEY(`sk_product`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sk_product`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- model.dim_sales definition

CREATE TABLE `dim_sales` (
  `sk_sales` int(11) NULL,
  `sales_number` int(11) NULL,
  `sales_last_name` varchar(50) NULL,
  `sales_first_name` varchar(50) NULL,
  `sales_extension` varchar(10) NULL,
  `sales_email` varchar(100) NULL,
  `sales_job_title` varchar(50) NULL,
  `sales_office_code` varchar(10) NULL,
  `sales_office_city` varchar(50) NULL,
  `sales_office_phone` varchar(50) NULL,
  `sales_office_address_line1` varchar(50) NULL,
  `sales_office_address_line2` varchar(50) NULL,
  `sales_office_state` varchar(50) NULL,
  `sales_office_country` varchar(50) NULL,
  `sales_office_postal_code` varchar(15) NULL,
  `sales_office_territory` varchar(10) NULL,
  `start_date` date NULL,
  `end_date` date NULL
) ENGINE=OLAP
UNIQUE KEY(`sk_sales`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sk_sales`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- model.fact_order definition

CREATE TABLE `fact_order` (
  `sk_order` bigint(20) NULL,
  `sk_customer` int(11) NULL,
  `sk_product` varchar(15) NULL,
  `sk_order_date` int(11) NULL,
  `sk_order_required_date` int(11) NULL,
  `sk_order_shipped_date` int(11) NULL,
  `order_number` int(11) NULL,
  `order_status` varchar(15) NULL,
  `order_comment` text NULL,
  `order_quantity` int(11) NULL,
  `order_price_each` decimal(10, 2) NULL,
  `order_amount` decimal(16, 2) NULL,
  `order_line_number` smallint(6) NULL
) ENGINE=OLAP
DUPLICATE KEY(`sk_order`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`sk_order`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);