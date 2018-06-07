package com.reviewsystem.service;

import com.reviewsystem.model.UserRole;
import com.reviewsystem.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleImpl implements UserRoleService {
    @Autowired
    UserRoleRepository userRoleRepository;

    @Override
    public UserRole findByuserID(Integer userID) {
        return userRoleRepository.findByuserID(userID);
    }

    @Override
    public void saveUserRole(UserRole userRole) {
        userRoleRepository.save(userRole);
    }
}
