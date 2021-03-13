package com.tjx.mapper;

import com.tjx.entity.BookAndClass;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IBookAndClassMapper {

    @Select("select b.cid,t.bid,t.bookname,t.press from bookandclass b right join textbook t on b.bid=t.bid and b.cid=#{tid};")
    List<BookAndClass> bookAndTeachersRight(Integer tid);

    @Insert("insert into bookandclass value(#{cid},#{bid},0)")
    Integer bookAndClassInsert(BookAndClass bookAndClass);

    @Delete("delete from bookandclass where cid=#{cid} and bid=#{bid}")
    Integer bookAndClassDelete(BookAndClass bookAndClass);


    @Select("select * from bookandclass where cid=#{cid};")
    @Results(
            @Result(column = "bid",property = "textbook",
                    many = @Many(select = "com.tjx.mapper.ITextbookMapper.textbookById"))
    )
    List<BookAndClass> bookAndClassByCid(Integer cid);

    @Update("update bookandclass set state=1 where cid=#{cid} and bid=#{bid}")
    Integer bookandClassUpdate(BookAndClass bookAndClass);
}
