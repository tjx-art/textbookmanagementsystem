package com.tjx.service;

import com.tjx.entity.BookAndTeacher;

import java.util.List;

public interface BookAndTeacherService {

   List<BookAndTeacher> bookAndTeachersByTid(Integer tid);

   Integer bookandteacherUpdate(BookAndTeacher bookandteacher);

    List<BookAndTeacher> bookAndTeachersRight(Integer tid);

    Integer bookAndTeacherInsert(BookAndTeacher bookAndTeacher);

    Integer bookAndTeacherDelete(BookAndTeacher bookAndTeacher);
}
