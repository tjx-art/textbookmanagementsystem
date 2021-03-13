package com.tjx.controller;

import com.tjx.entity.Teacher;
import com.tjx.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/teacherAll")
    public String teacherAll(Teacher teacher, Model model){
        List<Teacher> teachers = teacherService.teacherAll(teacher);
        model.addAttribute("tlist",teachers);
        return "teacher";
    }

    @RequestMapping("/teacherAllOne")
    @ResponseBody
    public List<Teacher> teacherAllOne(Teacher teacher){
        List<Teacher> teachers = teacherService.teacherAll(teacher);
        return teachers;
    }

    @RequestMapping("/teacherAdd")
    public String teacherAdd(Teacher teacher){
        Integer i = teacherService.teacherAdd(teacher);
        return "redirect:teacherAll";
    }

    @RequestMapping("/teacherUpdate")
    public String teacherUpdate(Teacher teacher){
        Integer i = teacherService.teacherUpdate(teacher);
        return "redirect:teacherAll";
    }

    @RequestMapping("/teacherDelete")
    public String teacherDelete(Integer tid){
        Integer i = teacherService.teacherDelete(tid);
        return "redirect:teacherAll";
    }
}
