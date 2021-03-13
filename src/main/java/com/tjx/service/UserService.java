package com.tjx.service;

import com.tjx.entity.User;

import java.util.List;

public interface UserService {
    List<User> userByNameAndPwd(User user);
}
