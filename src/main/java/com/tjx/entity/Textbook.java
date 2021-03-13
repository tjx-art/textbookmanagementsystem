package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Textbook {
    private Integer bid;
    private String bookname;
    private String press;
    private String bdate;
}
