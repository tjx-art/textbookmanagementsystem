package com.tjx.mapper;

import com.tjx.entity.Department;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IDepartmentMapper {
    @Select("select * from department where did=#{did}")
    List<Department>  departmentByID(Integer did);

    @Select("select * from department")
    List<Department>  departmentAll();
}
