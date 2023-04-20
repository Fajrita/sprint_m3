/*
Evaluación Final Módulo 3
Alexis Campusano
Fernanda Fajre
Christopher Figueroa
*/


USE sprint_M3;

-- Cuál es la categoría de productos que más se repite.
SELECT categoria_producto, COUNT(*) AS cantidad
FROM Producto
GROUP BY categoria_producto
HAVING COUNT(*) = (
  SELECT COUNT(*) AS cantidad_repetida
  FROM Producto
  GROUP BY categoria_producto
  ORDER BY cantidad_repetida DESC
  LIMIT 1)
ORDER BY cantidad DESC;
/* Computadoras y Audio tienen la mayor y la misma cantidad*/

-- Cuáles son los productos con mayor stock
SELECT id_Producto, STOCK FROM Producto
ORDER BY STOCK DESC
LIMIT 2;

-- Qué color de producto es más común en nuestra tienda.
SELECT color, COUNT(*) as count
FROM Producto
GROUP BY color
ORDER BY count DESC
LIMIT 1;

-- Cual o cuales son los proveedores con menor stock de productos.
SELECT proveedor, SUM(STOCK) as total_stock
FROM Producto
GROUP BY proveedor
ORDER BY total_stock ASC
LIMIT 2;

-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
UPDATE Producto SET categoria_producto = 'Electrónica y computación' 
WHERE categoria_producto = (SELECT categoria_producto 
                            FROM (SELECT categoria_producto, COUNT(*) AS cantidad 
                                  FROM Producto 
                                  GROUP BY categoria_producto 
                                  ORDER BY cantidad DESC LIMIT 1) AS subquery);

