package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    private Integer uid;
    private String username;
    private String password;
    private Integer utype;
    private Long utime;

}
