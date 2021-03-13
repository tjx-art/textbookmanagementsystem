package com.tjx.mapper;

import com.tjx.entity.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IStudentMapper {
    /**
     * 查询学生信息表里面的所有
     * @return list集合
     */
    @Select({"<script> select * from student" +
            "<where>" +
            "<if test='sname!=null'>" +
            "sname like '%${sname}%'" +
            "</if>" +
            "</where>" +
            "</script>"})
    @Results(
            @Result(column = "cid", property = "classA",
                    one=@One(select = "com.tjx.mapper.IClassMapper.classAll"))
    )
    List<Student> studentAll(Student student);

    @Insert("insert into student(sname,ssex,cid) values(#{sname},#{ssex},#{cid})")
    Integer studentAdd(Student student);

    @Update("update student set sname=#{sname},ssex=#{ssex},cid=#{cid} where sid=#{sid}")
    Integer studentUpdate(Student student);

    @Delete("delete from student where sid=#{sid}")
    Integer studentDelete(Integer sid);
}
