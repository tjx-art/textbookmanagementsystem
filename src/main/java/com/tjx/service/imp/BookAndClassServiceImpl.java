package com.tjx.service.imp;

import com.tjx.entity.BookAndClass;
import com.tjx.mapper.IBookAndClassMapper;
import com.tjx.service.BookAndClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookAndClassServiceImpl implements BookAndClassService {
    @Autowired
    private IBookAndClassMapper iBookAndClassMapper;
    @Override
    public List<BookAndClass> bookAndTeachersRight(Integer tid) {
        List<BookAndClass> bookAndClasses = iBookAndClassMapper.bookAndTeachersRight(tid);
        return bookAndClasses;
    }

    @Override
    public Integer bookAndClassInsert(BookAndClass bookAndClass) {
        Integer i=iBookAndClassMapper.bookAndClassInsert(bookAndClass);
        return i;
    }

    @Override
    public Integer bookAndClassDelete(BookAndClass bookAndClass) {
        Integer i=iBookAndClassMapper.bookAndClassDelete(bookAndClass);
        return i;
    }

    @Override
    public List<BookAndClass> bookAndClassByCid(Integer cid) {
        List<BookAndClass> bookAndClasses=iBookAndClassMapper.bookAndClassByCid(cid);
        return bookAndClasses;
    }

    @Override
    public Integer bookandClassUpdate(BookAndClass bookAndClass) {
        Integer i=iBookAndClassMapper.bookandClassUpdate(bookAndClass);
        return i;
    }
}
