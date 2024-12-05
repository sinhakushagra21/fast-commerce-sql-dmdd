-- Example of adding items to the cart
BEGIN
    -- Add product with ID 1, quantity 2 to the cart
    cart_package.add_to_cart(p_product_id => 1, p_quantity => 2);

    -- Add product with ID 2, quantity 1 to the cart
    cart_package.add_to_cart(p_product_id => 2, p_quantity => 1);
END;
/
