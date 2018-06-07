package com.reviewsystem.service;

import com.reviewsystem.model.UserRole;

public interface UserRoleService {
    public UserRole findByuserID(Integer userID);
    public void saveUserRole(UserRole userRole);
}
