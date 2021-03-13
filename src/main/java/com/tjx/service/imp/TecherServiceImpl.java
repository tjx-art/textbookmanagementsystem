package com.tjx.service.imp;

import com.tjx.entity.Student;
import com.tjx.entity.Teacher;
import com.tjx.mapper.ITeacherMapper;
import com.tjx.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TecherServiceImpl implements TeacherService {
    @Autowired
    private ITeacherMapper iTeacherMapper;

    @Override
    public List<Teacher> teacherAll(Teacher teacher) {
        List<Teacher> teachers = iTeacherMapper.teacherAll(teacher);
        return teachers;
    }

    @Override
    public Integer teacherAdd(Teacher teacher) {
        Integer i = iTeacherMapper.teacherAdd(teacher);
        return i;
    }

    @Override
    public Integer teacherUpdate(Teacher teacher) {
        Integer i = iTeacherMapper.teacherUpdate(teacher);
        return i;
    }

    @Override
    public Integer teacherDelete(Integer tid) {
        Integer i = iTeacherMapper.teacherDelete(tid);
        return i;
    }
}
