package com.tjx.service.imp;

import com.tjx.entity.Grade;
import com.tjx.mapper.IGradeMapper;
import com.tjx.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private IGradeMapper iGradeMapper;

    @Override
    public List<Grade> gradeAll() {
        List<Grade> grades = iGradeMapper.gradeAll();
        return grades;
    }
}
