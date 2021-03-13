package com.tjx.mapper;

import com.tjx.entity.BookAndTeacher;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IBookAndTeacherMapper {

    @Select("select * from bookandteacher where tid=#{tid};")
    @Results(
            @Result(column = "bid",property = "textbook",
                    many = @Many(select = "com.tjx.mapper.ITextbookMapper.textbookById"))
    )
    List<BookAndTeacher> bookAndTeachersByTid(Integer tid);

    @Update("update bookandteacher set state=1 where tid=#{tid} and bid=#{bid}")
    Integer bookandteacherUpdate(BookAndTeacher bookandteacher);


    @Select("select b.tid,t.bid,t.bookname,t.press from bookandteacher b right join textbook t on b.bid=t.bid and b.tid=#{tid};")
    List<BookAndTeacher> bookAndTeachersRight(Integer tid);

    @Insert("insert into bookandteacher values(#{tid},#{bid},0)")
    Integer bookAndTeacherInsert(BookAndTeacher bookAndTeacher);

    @Delete("delete from bookandteacher where tid=#{tid} and bid=#{bid}")
    Integer bookAndTeacherDelete(BookAndTeacher bookAndTeacher);
}
