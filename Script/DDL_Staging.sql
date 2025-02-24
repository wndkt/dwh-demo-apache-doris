-- staging.customers definition

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NULL,
  `postalCode` varchar(15) NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) NULL,
  `creditLimit` decimal(10, 2) NULL
) ENGINE=OLAP
DUPLICATE KEY(`customerNumber`, `customerName`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`customerNumber`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.customers_two definition

CREATE TABLE `customers_two` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NULL,
  `postalCode` varchar(15) NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) NULL,
  `creditLimit` decimal(10, 2) NULL
) ENGINE=OLAP
DUPLICATE KEY(`customerNumber`, `customerName`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`customerNumber`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.employees definition

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) NULL,
  `jobTitle` varchar(50) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`employeeNumber`, `lastName`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`employeeNumber`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.offices definition

CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) NULL,
  `state` varchar(50) NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`officeCode`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`officeCode`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.orderdetails definition

CREATE TABLE `orderdetails` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  `priceEach` decimal(10, 2) NOT NULL,
  `orderLineNumber` smallint(6) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`orderNumber`, `productCode`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`orderNumber`, `productCode`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.orders definition

CREATE TABLE `orders` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date NULL,
  `status` varchar(15) NOT NULL,
  `comments` text NULL,
  `customerNumber` int(11) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`orderNumber`, `orderDate`, `requiredDate`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`orderNumber`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.payments definition

CREATE TABLE `payments` (
  `customerNumber` int(11) NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10, 2) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`customerNumber`, `checkNumber`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`customerNumber`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.productlines definition

CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) NULL,
  `htmlDescription` text NULL,
  `image` text NULL
) ENGINE=OLAP
DUPLICATE KEY(`productLine`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`productLine`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);


-- staging.products definition

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10, 2) NOT NULL,
  `MSRP` decimal(10, 2) NOT NULL
) ENGINE=OLAP
DUPLICATE KEY(`productCode`)
COMMENT 'OLAP'
DISTRIBUTED BY HASH(`productCode`) BUCKETS 1
PROPERTIES (
"replication_allocation" = "tag.location.default: 1",
"in_memory" = "false",
"storage_format" = "V2",
"disable_auto_compaction" = "false"
);