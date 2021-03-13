package com.tjx.mapper;

import com.tjx.entity.Grade;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IGradeMapper {
    @Select("select * from grade where gid=#{gid}")
    List<Grade> gradeByID(Integer gid);

    @Select("select * from grade")
    List<Grade> gradeAll();
}
