package cn.fengyue.supermarket.po;

import java.util.Date;

public class Budget {
    private Integer id;

    private Date date;

    private String incomeOrExpenditure;

    private Double amount;

    private Integer quantity;

    private Integer itemsId;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getIncomeOrExpenditure() {
        return incomeOrExpenditure;
    }

    public void setIncomeOrExpenditure(String incomeOrExpenditure) {
        this.incomeOrExpenditure = incomeOrExpenditure == null ? null : incomeOrExpenditure.trim();
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getItemsId() {
        return itemsId;
    }

    public void setItemsId(Integer itemsId) {
        this.itemsId = itemsId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}