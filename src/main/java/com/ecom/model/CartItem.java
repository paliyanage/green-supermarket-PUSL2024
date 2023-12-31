package com.ecom.model;

public class CartItem {
    private String itemName;
    private int quantity;

    public CartItem(String itemName, int quantity) {
        this.itemName = itemName;
        this.quantity = quantity;
    }

    public String getItemName() {
        return itemName;
    }

    public int getQuantity() {
        return quantity;
    }
}

