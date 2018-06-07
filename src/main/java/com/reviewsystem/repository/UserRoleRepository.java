package com.reviewsystem.repository;

import com.reviewsystem.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
    UserRole findByuserID(Integer userID);
}
