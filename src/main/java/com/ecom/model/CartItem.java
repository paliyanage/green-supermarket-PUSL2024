package com.ecom.model;

import java.util.Objects;

public class CartItem {
    private String productID;
    private int quantity;

    public CartItem(String productID, String quantity) {
        this.productID = productID;
        this.quantity = Integer.parseInt(quantity);
    }

    public String getproductID() {
        return productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int qt) {
        this.quantity =qt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartItem cartItem = (CartItem) o;
        return Objects.equals(productID, cartItem.productID) &&
                Objects.equals(quantity, cartItem.quantity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(productID, quantity);
    }
}

