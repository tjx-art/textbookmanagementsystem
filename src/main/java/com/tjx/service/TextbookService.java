package com.tjx.service;

import com.tjx.entity.Textbook;

import java.util.List;

public interface TextbookService {
    List<Textbook> textbookAll(Textbook textbook);

    Integer textbookAdd(Textbook textbook);

    Integer textbookUpdate(Textbook textbook);

    Integer textbookDelete(Integer bid);
}
