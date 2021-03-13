package com.tjx.service;

import com.tjx.entity.ClassA;

import java.util.List;

public interface ClassService {
    List<ClassA> classByCName(ClassA classA);
    Integer classAdd(ClassA classA);
    Integer classUpdate(ClassA classA);
    List<ClassA> classAllOne();
}
