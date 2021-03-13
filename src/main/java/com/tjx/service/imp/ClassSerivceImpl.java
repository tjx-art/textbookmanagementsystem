package com.tjx.service.imp;

import com.tjx.entity.ClassA;
import com.tjx.mapper.IClassMapper;
import com.tjx.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassSerivceImpl implements ClassService {
    @Autowired
    private IClassMapper iClassMapper;

    @Override
    public List<ClassA> classByCName(ClassA classA) {
        List<ClassA> classAS = iClassMapper.classByCName(classA);
        return classAS;
    }

    @Override
    public Integer classAdd(ClassA classA) {
        Integer i = iClassMapper.classAdd(classA);
        return i;
    }

    @Override
    public Integer classUpdate(ClassA classA) {
        Integer i = iClassMapper.classUpdate(classA);
        return i;
    }

    @Override
    public List<ClassA> classAllOne() {
        List<ClassA> classAS = iClassMapper.classAllOne();
        return classAS;
    }
}
