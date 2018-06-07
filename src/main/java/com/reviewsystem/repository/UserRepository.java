package com.reviewsystem.repository;

import com.reviewsystem.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User,Long>, UserRepositoryCustom {
    User findByEmail(String email);
    User findByuserID(Integer userID);
}
