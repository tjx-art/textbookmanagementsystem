package com.tjx.service.imp;

import com.tjx.entity.Department;
import com.tjx.mapper.IDepartmentMapper;
import com.tjx.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private IDepartmentMapper iDepartmentMapper;

    @Override
    public List<Department> departmentAll() {
        List<Department> departments = iDepartmentMapper.departmentAll();
        return departments;
    }
}
