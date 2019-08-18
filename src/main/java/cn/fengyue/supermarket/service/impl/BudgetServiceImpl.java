package cn.fengyue.supermarket.service.impl;

import cn.fengyue.supermarket.mapper.BudgetMapper;
import cn.fengyue.supermarket.po.Budget;
import cn.fengyue.supermarket.po.BudgetExample;
import cn.fengyue.supermarket.service.BudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BudgetServiceImpl implements BudgetService {

    @Autowired
    private BudgetMapper budgetMapper;

    //显示所有的收支信息
    @Override
    public List<Budget> findBudgetAll() {

        BudgetExample budgetExample = new BudgetExample();
        BudgetExample.Criteria criteria = budgetExample.createCriteria();
        List<Budget> budgetList = budgetMapper.selectByExample(budgetExample);

        return budgetList;
    }

    //添加收支信息
    @Override
    public void saveBudget(Budget budget) {
        budgetMapper.insertSelective(budget);
    }
}
