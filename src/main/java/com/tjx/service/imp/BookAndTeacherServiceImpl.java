package com.tjx.service.imp;

import com.tjx.entity.BookAndTeacher;
import com.tjx.mapper.IBookAndTeacherMapper;
import com.tjx.service.BookAndTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookAndTeacherServiceImpl implements BookAndTeacherService {
    @Autowired
    private IBookAndTeacherMapper iBookAndTeacherMapper;
    @Override
    public List<BookAndTeacher> bookAndTeachersByTid(Integer tid) {
        List<BookAndTeacher> bookAndTeachers = iBookAndTeacherMapper.bookAndTeachersByTid(tid);
        return bookAndTeachers;
    }

    @Override
    public Integer bookandteacherUpdate(BookAndTeacher bookandteacher) {
        Integer i = iBookAndTeacherMapper.bookandteacherUpdate(bookandteacher);
        return i;
    }

    @Override
    public List<BookAndTeacher> bookAndTeachersRight(Integer tid) {
        List<BookAndTeacher> bookAndTeachers=iBookAndTeacherMapper.bookAndTeachersRight(tid);
        return bookAndTeachers;
    }

    @Override
    public Integer bookAndTeacherInsert(BookAndTeacher bookAndTeacher) {
        Integer i=iBookAndTeacherMapper.bookAndTeacherInsert(bookAndTeacher);
        return i;
    }

    @Override
    public Integer bookAndTeacherDelete(BookAndTeacher bookAndTeacher) {
        Integer i=iBookAndTeacherMapper.bookAndTeacherDelete(bookAndTeacher);
        return i;
    }
}
