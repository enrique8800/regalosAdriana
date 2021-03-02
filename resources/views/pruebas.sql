DELIMITER //
CREATE TRIGGER `updStockCompra` AFTER INSERT ON `detalles_compras`
    FOR EACH ROW BEGIN
    UPDATE productos SET stock = stock + NEW.cantidad
    WHERE productos.id = NEW.producto_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `updStockCompraAnular` AFTER UPDATE ON `compras`
    FOR EACH ROW BEGIN
        UPDATE productos p
            JOIN detalles_compras di
                ON  di.producto_id = p.id
                AND di.compra_id = new.id
                SET p.stock = p.stock - di.cantidad;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `updStockVenta` AFTER INSERT ON `detalles_ventas`
    FOR EACH ROW BEGIN
    UPDATE productos SET stock = stock - NEW.cantidad
    WHERE productos.id = NEW.producto_id;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `updStockVentaAnular` AFTER UPDATE ON `ventas`
    FOR EACH ROW BEGIN
        UPDATE productos p
            JOIN detalles_ventas dv
                ON  dv.producto_id = p.id
                AND dv.fecha_venta = new.id
                SET p.stock = p.stock - dv.cantidad;
END; //
DELIMITER ;