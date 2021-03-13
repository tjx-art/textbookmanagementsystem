package com.tjx.mapper;

import com.tjx.entity.Student;
import com.tjx.entity.Teacher;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ITeacherMapper {

    /**\
     * 动态sql，通过页面的传值来从teacher表中取值
     * @param teacher 从实体类中传值进来
     * @return list集合
     */
    @Select({"<script>" +
            "select * from teacher " +
            "<where>" +
            "<if test='tname!=null'>" +
            "   tname like '%${tname}%'" +
            "</if>" +
            "</where>" +
            "</script>"})
    List<Teacher> teacherAll(Teacher teacher);

    @Insert("insert into teacher(tname,tsex) values(#{tname},#{tsex});")
    Integer teacherAdd(Teacher teacher);

    @Update("update teacher set tname=#{tname},tsex=#{tsex} where tid=#{tid}")
    Integer teacherUpdate(Teacher teacher);

    @Delete("delete from teacher where tid=#{tid}")
    Integer teacherDelete(Integer tid);
}
