package com.reviewsystem.repository;

import com.reviewsystem.model.UserRole;

import java.util.List;

public interface UserRepositoryCustom {
    List<UserRole> findByroleID(Integer roleID);
}
