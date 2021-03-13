package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookAndClass {
    private Integer cid;
    private Integer bid;
    private Integer state;
    private String bookname;
    private String press;
    private Textbook textbook;

}
