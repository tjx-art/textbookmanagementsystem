package com.tjx.controller;

import com.tjx.entity.Student;
import com.tjx.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/studentAll")
    public String studentAll(Model model,Student student){
        System.out.println(student);
        List<Student> slist = studentService.studentAll(student);
        model.addAttribute("slist",slist);
        for (Student s : slist) {
            System.out.println(s);
        }
        return "student";
    }

    @RequestMapping("/studentAdd")
    public String studentAdd(Student student){
        Integer i = studentService.studentAdd(student);
        return "redirect:studentAll";
    }

    @RequestMapping("/studentUpdate")
    public String studentUpdate(Student student){
        Integer i = studentService.studentUpdate(student);
        return "redirect:studentAll";
    }

    @RequestMapping("/studentDelete")
    public String studentDelete(Integer sid){
        Integer i = studentService.studentDelete(sid);
        return "redirect:studentAll";
    }

}
