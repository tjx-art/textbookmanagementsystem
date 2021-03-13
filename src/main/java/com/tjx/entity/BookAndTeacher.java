package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookAndTeacher {
    private Integer tid;
    private Integer bid;
    private Integer state;
    private Textbook textbook;
    private String bookname;
    private String press;
}
