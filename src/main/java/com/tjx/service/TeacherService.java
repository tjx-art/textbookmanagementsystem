package com.tjx.service;

import com.tjx.entity.Student;
import com.tjx.entity.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> teacherAll(Teacher teacher);
    Integer teacherAdd(Teacher teacher);
    Integer teacherUpdate(Teacher teacher);
    Integer teacherDelete(Integer tid);
}
