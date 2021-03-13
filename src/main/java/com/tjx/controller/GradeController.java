package com.tjx.controller;

import com.tjx.entity.Grade;
import com.tjx.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GradeController {
    @Autowired
    private GradeService gradeService;
    @RequestMapping("gradeAll")
    @ResponseBody
    public List<Grade> gradeAll(){
        List<Grade> grades = gradeService.gradeAll();
        return grades;
    }
}
