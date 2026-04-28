CREATE OR REPLACE FUNCTION update_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Tbl_Products
    SET stock_qty = stock_qty - NEW.qty
    WHERE prod_id = NEW.prod_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_update_stock
AFTER INSERT ON Tbl_Orders
FOR EACH ROW
EXECUTE FUNCTION update_stock();
INSERT INTO Tbl_Orders VALUES (9003, 501, 103, '2026-04-28', 2);