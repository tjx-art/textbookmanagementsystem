package com.tjx.controller;

import com.tjx.entity.Textbook;
import com.tjx.service.TextbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TextbookController {
    @Autowired
    private TextbookService textbookService;

    @RequestMapping("/textbookAll")
    public String textbookAll(Textbook textbook, Model model){
        List<Textbook> textbooks = textbookService.textbookAll(textbook);
        model.addAttribute("booklist",textbooks);
        return "textbook";
    }

    @RequestMapping("/textbookAdd")
    public String textbookAdd(Textbook textbook) {
        Integer i = textbookService.textbookAdd(textbook);
        return "redirect:textbookAll";
    }

    @RequestMapping("/textbookUpdate")
    public String textbookUpdate(Textbook textbook) {
        System.out.println(textbook);
        Integer i = textbookService.textbookUpdate(textbook);
        return "redirect:textbookAll";
    }

    @RequestMapping("/textbookDelete")
    public String textbookDelete(Integer bid){
        textbookService.textbookDelete(bid);
        return "redirect:textbookAll";
    }
}
