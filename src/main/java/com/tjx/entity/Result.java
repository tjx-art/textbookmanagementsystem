package com.tjx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result {
    private Integer code;
    private String msg;
    private Object data;

    public static Result setSuccess(Object data){
        return new Result(200,"success",data);
    }

    public static Result setSuccess(Object data,String msg){
        return new Result(200,msg,data);
    }

    public static Result setError(Object data){
        return new Result(500,"error",data);
    }

    public static Result setError(Object data,String msg){
        return new Result(500,msg,data);
    }
}
