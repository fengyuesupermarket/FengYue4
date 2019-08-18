package cn.fengyue.supermarket.service;

import cn.fengyue.supermarket.po.Budget;

import java.util.List;

public interface BudgetService {

    List<Budget> findBudgetAll();

    void saveBudget(Budget budget);
}
