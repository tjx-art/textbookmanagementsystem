package com.tjx.service.imp;

import com.tjx.entity.Student;
import com.tjx.mapper.IStudentMapper;
import com.tjx.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImp implements StudentService {

    @Autowired
    private IStudentMapper iStudentMapper;

    @Override
    public List<Student> studentAll(Student student) {
        List<Student> slist=iStudentMapper.studentAll(student);
        return slist;
    }

    @Override
    public Integer studentAdd(Student student) {
        Integer i = iStudentMapper.studentAdd(student);
        return i;
    }

    @Override
    public Integer studentUpdate(Student student) {
        Integer i = iStudentMapper.studentUpdate(student);
        return i;
    }

    @Override
    public Integer studentDelete(Integer sid) {
        Integer i = iStudentMapper.studentDelete(sid);
        return i;
    }
}
