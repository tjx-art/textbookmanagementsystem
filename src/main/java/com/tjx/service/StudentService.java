package com.tjx.service;

import com.tjx.entity.Student;

import java.util.List;

public interface StudentService {
    List<Student> studentAll(Student student);
    Integer studentAdd(Student student);
    Integer studentUpdate(Student student);
    Integer studentDelete(Integer sid);
}
