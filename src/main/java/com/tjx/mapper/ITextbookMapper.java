package com.tjx.mapper;

import com.tjx.entity.Textbook;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ITextbookMapper {
    @Select("select * from textbook where bid=#{bid};")
    List<Textbook> textbookById(Integer bid);

    @Select({"<script>" +
            "select * from textbook" +
            "<where>" +
            "<if test='bookname!=null'>" +
            "bookname like '%${bookname}%'" +
            "</if>" +
            "</where>" +
            "</script>"})
    List<Textbook> textbookAll(Textbook textbook);

    @Insert("insert into textbook(bookname,press) values(#{bookname},#{press})")
    Integer textbookAdd(Textbook textbook);

    @Update({"<script>" +
            "update textbook" +
            "<set>" +
            "<if test='bookname!=null'>bookname=#{bookname},</if>" +
            "<if test='press!=null'>press=#{press},</if>" +
            "</set>" +
            "where bid=#{bid}" +
            "</script>"})
    Integer textbookUpdate(Textbook textbook);

    @Delete("delete from textbook where bid=#{bid}")
    Integer textbookDelete(Integer bid);

}