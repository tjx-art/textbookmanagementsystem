package com.tjx.controller;

import com.tjx.entity.ClassA;
import com.tjx.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private ClassService classService;

    @RequestMapping("/classByCName")
    public String classByCName(ClassA classA, Model model) {
        List<ClassA> classAS = classService.classByCName(classA);
        model.addAttribute("clist",classAS);
        return "classA";
    }

    @RequestMapping("/classAdd")
    public String classAdd(ClassA classA){
        Integer i = classService.classAdd(classA);
        return "redirect:classByCName";
    }

    @RequestMapping("/classUpdate")
    public String classUpdate(ClassA classA){
        Integer integer = classService.classUpdate(classA);
        return "redirect:classByCName";
    }

    @RequestMapping("/classAllOne")
    @ResponseBody
    public List<ClassA> classAllOne(){
        List<ClassA> classAS = classService.classAllOne();
        return classAS;
    }
}
