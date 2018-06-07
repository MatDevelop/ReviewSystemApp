package com.reviewsystem.service;

import com.reviewsystem.model.Role;
import com.reviewsystem.model.User;
import com.reviewsystem.model.UserRole;
import com.reviewsystem.repository.RoleRepository;
import com.reviewsystem.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepository.findByRole("USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public List<UserRole> findByroleID(Integer roleID) {
        return userRepository.findByroleID(roleID);
    }

    @Override
    public User findUserByuserID(Integer userID){
        return userRepository.findByuserID(userID);
    }
}
