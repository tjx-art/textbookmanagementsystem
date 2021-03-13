package com.tjx.mapper;

import com.tjx.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUserMapper {
    /**
     * 通过用户名和密码查询用户是否存在
     * @param user
     * @return list集合
     */
    @Select("select * from user where username=#{username} and password=${password};")
    List<User> userByNameAndPwd(User user);
}
