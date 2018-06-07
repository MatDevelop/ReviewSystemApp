package com.reviewsystem.repository;

import com.reviewsystem.model.UserRole;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional(readOnly = true)
public class UserRepositoryImpl implements UserRepositoryCustom {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<UserRole> findByroleID(Integer roleID) {
        Query query = entityManager.createNativeQuery("SELECT * FROM reviewsystemdb.user_role " +
                "WHERE roleID LIKE ?", UserRole.class);
        query.setParameter(1, roleID);
        return query.getResultList();
    }
}
