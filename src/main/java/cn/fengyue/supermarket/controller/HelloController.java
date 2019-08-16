package cn.fengyue.supermarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/hello")
    public String Hello(Model model){

        model.addAttribute("msg","hello FengYue,这是一个JSP页面,哈哈哈");

        return "index";
    }
}
