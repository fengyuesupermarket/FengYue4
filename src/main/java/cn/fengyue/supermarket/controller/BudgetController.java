package cn.fengyue.supermarket.controller;

import cn.fengyue.supermarket.po.Budget;
import cn.fengyue.supermarket.service.BudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/budget")
public class BudgetController {

    //引入业务逻辑层对象
    @Autowired
    private BudgetService budgetService;

    //按日查看收支信息
    @RequestMapping(value = "/findBudget.action")
    //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public String findIaeBydate(Model model){

        System.out.println("进入了查看收支信息的页面");
        List<Budget> budgetList = budgetService.findBudgetAll();
        model.addAttribute("budgetList",budgetList);


        return "budget/budgetList";
    }

    //前往添加信息页面
    @RequestMapping(value = "/toAddBudget.action")
    public String toAddBudget(){
        System.out.println("进入前往添加信息页面的方法");
        return "budget/addBudget";
    }

    //添加收支信息
    @RequestMapping(value = "/addBudget.action")
    public String addBudget(Budget budget){
        System.out.println("进入了添加收支信息的页面");

        budget.setDate(new Date());
        System.out.println(budget.getDate());
        budgetService.saveBudget(budget);

        return "redirect:findBudget.action";
    }

    //由excel批量导入收支信息
    @RequestMapping(value = "addBudgetByExcel.action")
    public String addBudgetByExcel(MultipartFile excel){
        System.out.println("进入了由excel批量添加收支信息的页面");


        return "redirect:findBudget.action";
    }


}
