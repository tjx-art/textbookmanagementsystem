package com.tjx.controller;

import com.tjx.entity.BookAndClass;
import com.tjx.entity.BookAndTeacher;
import com.tjx.service.BookAndClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookAndClassController {
    @Autowired
    private BookAndClassService bookAndClassService;

    @RequestMapping("/bookAndTeachersRightOne")
    @ResponseBody
    public List<BookAndClass> bookAndTeachersRight(Integer tid){
        List<BookAndClass> bookAndClasses=bookAndClassService.bookAndTeachersRight(tid);
        return bookAndClasses;
    }

    @RequestMapping("/bookAndClassInsert")
    @ResponseBody
    public Integer bookAndClassInsert(BookAndClass bookAndClass){
        Integer i=bookAndClassService.bookAndClassInsert(bookAndClass);
        return i;
    }

    @RequestMapping("/bookAndClassDelete")
    @ResponseBody
    public Integer bookAndClassDelete(BookAndClass bookAndClass){
        Integer i=bookAndClassService.bookAndClassDelete(bookAndClass);
        return i;
    }

    @RequestMapping("/bookAndClassByCid")
    @ResponseBody
    public List<BookAndClass> bookAndClassByCid(Integer cid){
        List<BookAndClass> bookAndClasses=bookAndClassService.bookAndClassByCid(cid);
        return bookAndClasses;
    }

    @RequestMapping("/bookandClassUpdate")
    @ResponseBody
    public Integer bookandClassUpdate(BookAndClass bookAndClass){
        Integer i=bookAndClassService.bookandClassUpdate(bookAndClass);
        return i;
    }
}
