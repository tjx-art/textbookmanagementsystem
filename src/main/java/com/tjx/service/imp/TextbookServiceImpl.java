package com.tjx.service.imp;

import com.tjx.entity.Textbook;
import com.tjx.mapper.ITextbookMapper;
import com.tjx.service.TextbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TextbookServiceImpl implements TextbookService {
    @Autowired
    private ITextbookMapper iTextbookMapper;
    @Override
    public List<Textbook> textbookAll(Textbook textbook) {
        List<Textbook> textbooks = iTextbookMapper.textbookAll(textbook);
        return textbooks;
    }

    @Transactional
    @Override
    public Integer textbookAdd(Textbook textbook) {
        Integer i = iTextbookMapper.textbookAdd(textbook);
        return i;
    }
    @Transactional
    @Override
    public Integer textbookUpdate(Textbook textbook) {
        Integer i = iTextbookMapper.textbookUpdate(textbook);
        return i;
    }

    @Override
    public Integer textbookDelete(Integer bid) {
        Integer i = iTextbookMapper.textbookDelete(bid);
        return i;
    }
}
