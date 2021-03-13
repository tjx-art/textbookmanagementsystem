package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private Integer sid;
    private String sname;
    private String ssex;
    private Integer  cid;
    private ClassA classA;
}
