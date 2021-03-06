-- DELIMITER //
-- CREATE TRIGGER `updStockCompra` AFTER INSERT ON `detalles_compras`
--     FOR EACH ROW BEGIN
--     UPDATE productos SET stock = stock + NEW.cantidad
--     WHERE productos.id = NEW.producto_id;
-- END;
-- //
-- DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER `updStockCompraAnular` AFTER UPDATE ON `compras`
--     FOR EACH ROW BEGIN
--     IF NEW.estado = 'CANCELADO' THEN 
--         UPDATE productos p
--             JOIN detalles_compras dc
--                 ON  dc.producto_id = p.id
-- 				AND  dc.compra_id = NEW.id
--             SET p.stock = p.stock - dc.cantidad;
-- END IF; END;
-- //
-- DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER `updStockCompraActivar` AFTER UPDATE ON `compras`
--     FOR EACH ROW BEGIN
--         IF NEW.estado = 'VALIDO' THEN 
--         UPDATE productos p
--             JOIN detalles_compras dc
--                 ON  dc.producto_id = p.id
-- 				AND  dc.compra_id = NEW.id
--             SET p.stock = p.stock + dc.cantidad;
-- END IF; END;
-- //
-- DELIMITER ;


-- DELIMITER //
-- CREATE TRIGGER `updStockVenta` AFTER INSERT ON `detalles_ventas`
--     FOR EACH ROW BEGIN
--     UPDATE productos SET stock = stock - NEW.cantidad
--     WHERE productos.id = NEW.producto_id;
-- END;
-- //
-- DELIMITER ;


-- DELIMITER //
-- CREATE TRIGGER `updStockVentaAnular` AFTER UPDATE ON `ventas`
--     FOR EACH ROW BEGIN
--     IF NEW.estado = 'CANCELADO' THEN 
--         UPDATE productos p
--             JOIN detalles_ventas dv
--                 ON  dv.producto_id = p.id
-- 				AND  dv.venta_id = NEW.id
--             SET p.stock = p.stock + dv.cantidad;
-- END IF; END;
-- //
-- DELIMITER ;

-- DELIMITER //
-- CREATE TRIGGER `updStockVentaActivar` AFTER UPDATE ON `ventas`
--     FOR EACH ROW BEGIN
--         IF NEW.estado = 'VALIDO' THEN 
--         UPDATE productos p
--             JOIN detalles_ventas dv
--                 ON  dv.producto_id = p.id
-- 				AND  dv.venta_id = NEW.id
--             SET p.stock = p.stock - dv.cantidad;
-- END IF; END;
-- //
-- DELIMITER ;
