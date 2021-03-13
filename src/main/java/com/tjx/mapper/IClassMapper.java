package com.tjx.mapper;

import com.tjx.entity.ClassA;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IClassMapper {
    @Select("select * from classs where cid=#{cid}")
    @Results({
            @Result(column = "did",property = "department",
                    one = @One(select = "com.tjx.mapper.IDepartmentMapper.departmentByID")),
            @Result(column = "gid",property = "grade",
                    one = @One(select = "com.tjx.mapper.IGradeMapper.gradeByID"))
    })
    List<ClassA> classAll(Integer cid);


    @Select({"<script>" +
            "select * from classs" +
            "<where>" +
            "<if test='cname!=null'>cname like '%${cname}%'</if>" +
            "</where>" +
            "</script>"})
    @Results({
            @Result(column = "did",property = "department",
                    one = @One(select ="com.tjx.mapper.IDepartmentMapper.departmentByID")),
            @Result(column = "gid",property = "grade",
                    one = @One(select = "com.tjx.mapper.IGradeMapper.gradeByID"))
    })
    List<ClassA> classByCName(ClassA classA);

    @Insert("insert into classs(cname,gid,did) values (#{cname},#{gid},#{did})")
    Integer classAdd(ClassA classA);

    @Update("update classs set cname=#{cname},gid=#{gid},did=#{did} where cid=#{cid}")
    Integer classUpdate(ClassA classA);

    @Select("select * from classs")
    List<ClassA> classAllOne();

}
