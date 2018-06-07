package com.reviewsystem.service;

import com.reviewsystem.model.User;
import com.reviewsystem.model.UserRole;

import java.util.List;

public interface UserService {
    public User findUserByEmail(String email);
    public User findUserByuserID(Integer userID);
    public void saveUser(User user);
    public List<UserRole> findByroleID(Integer roleID);
}
