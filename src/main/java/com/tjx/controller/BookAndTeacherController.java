package com.tjx.controller;

import com.tjx.entity.BookAndTeacher;
import com.tjx.service.BookAndTeacherService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookAndTeacherController {
    @Autowired
    private BookAndTeacherService bookAndTeacherService;

    @RequestMapping("/bookAndTeachersByTid")
    @ResponseBody
    public List<BookAndTeacher> bookAndTeachersByTid(@RequestParam(value = "tid") Integer tid){
        System.out.println(tid);
        List<BookAndTeacher> bookAndTeachers = bookAndTeacherService.bookAndTeachersByTid(tid);
        System.out.println(bookAndTeachers.size());
        return JSONArray.fromObject(bookAndTeachers);
    }

    @RequestMapping("/bookandteacherUpdate")
    @ResponseBody
    public Integer bookandteacherUpdate(BookAndTeacher bookandteacher){
        Integer i = bookAndTeacherService.bookandteacherUpdate(bookandteacher);
        return i;
    }

    @RequestMapping("/bookAndTeachersRight")
    @ResponseBody
    public List<BookAndTeacher> bookAndTeachersRight(Integer tid){
        List<BookAndTeacher> bookAndTeachers=bookAndTeacherService.bookAndTeachersRight(tid);
        return bookAndTeachers;
    }

    @RequestMapping("/bookAndTeacherInsert")
    @ResponseBody
    public Integer bookAndTeacherInsert(BookAndTeacher bookAndTeacher){
        Integer i=bookAndTeacherService.bookAndTeacherInsert(bookAndTeacher);
        return i;
    }

    @RequestMapping("/bookAndTeacherDelete")
    @ResponseBody
    public Integer bookAndTeacherDelete(BookAndTeacher bookAndTeacher){
        Integer i=bookAndTeacherService.bookAndTeacherDelete(bookAndTeacher);
        return i;
    }
}
