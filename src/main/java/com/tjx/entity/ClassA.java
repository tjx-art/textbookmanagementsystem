package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassA {
    private Integer cid;
    private String cname;
    private Integer gid;
    private Integer did;
    private Department department;
    private Grade grade;
}

