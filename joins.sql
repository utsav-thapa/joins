# 1. List the product id, product name, unit price and category name of all products.
# Order by category name and within that, by product name.

SELECT products.ProductID,products.ProductName,products.UnitPrice,categories.CategoryName
FROM products
         JOIN categories
              ON products.CategoryID = categories.CategoryID
ORDER BY CategoryName, ProductName;

# 2. List the product id, product name, unit price and supplier name of all products
# that cost more than $75. Order by product name.
SELECT products.ProductID, products.ProductName, products.UnitPrice, suppliers.CompanyName
FROM products
         JOIN northwind.suppliers
              on products.SupplierID = suppliers.SupplierID
WHERE UnitPrice > 75
ORDER BY ProductName;

# 3. List the product id, product name, unit price, category name, and supplier name
# of every product. Order by product name.
SELECT products.ProductID, products.ProductName, products.UnitPrice,categories.CategoryName, suppliers.CompanyName
FROM products
         JOIN categories
              ON categories.CategoryID = products.CategoryID
         JOIN suppliers
              ON suppliers.SupplierID = products.SupplierID
order by ProductName;

# 4. What is the product name(s) and categories of the most expensive products?
# HINT: Find the max price in a subquery and then use that in your more complex
# query that joins products with categories.
SELECT products.ProductName, categories.CategoryName
FROM products
         JOIN categories
              ON categories.CategoryID = products.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice)
                   FROM products);

# 5. List the order id, ship name, ship address, and shipping company name of every
# order that shipped to Germany.
SELECT o.OrderID, o.ShipName, o.ShipAddress, s.CompanyName
FROM orders o
         JOIN shippers s
              ON o.ShipVia = s.ShipperID
WHERE ShipCountry = "Germany";
# 6. List the order id, order date, ship name, ship address of all orders that ordered
# "Sasquatch Ale"?
SELECT orders.OrderID, orders.OrderDate, orders.ShipName,orders.ShipAddress
FROM orders
         JOIN `order details`
              ON `order details`.OrderID = orders.OrderID
         JOIN products
              ON `order details`.ProductID = products.ProductID
WHERE `order details`.ProductID = (SELECT ProductID
                                   FROM products
                                   WHERE ProductName LIKE "Sasquatch Ale");


SELECT *
FROM `order details`;