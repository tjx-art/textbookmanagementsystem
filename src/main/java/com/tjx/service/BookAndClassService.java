package com.tjx.service;

import com.tjx.entity.BookAndClass;

import java.util.List;

public interface BookAndClassService {
    List<BookAndClass> bookAndTeachersRight(Integer tid);

    Integer bookAndClassInsert(BookAndClass bookAndClass);

    Integer bookAndClassDelete(BookAndClass bookAndClass);

    List<BookAndClass> bookAndClassByCid(Integer cid);

    Integer bookandClassUpdate(BookAndClass bookAndClass);
}
