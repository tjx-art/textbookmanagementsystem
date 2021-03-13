package com.tjx.service.imp;

import com.tjx.entity.User;
import com.tjx.mapper.IUserMapper;
import com.tjx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private IUserMapper iUserMapper;
    @Override
    public List<User> userByNameAndPwd(User user) {
        List<User> ulist = iUserMapper.userByNameAndPwd(user);
        return ulist;
    }
}
