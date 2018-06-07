package com.reviewsystem.repository;

import com.reviewsystem.model.Review;
import com.reviewsystem.model.UserRole;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional(readOnly = true)
public class ReviewRepositoryImpl implements  ReviewRepositoryCustom {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<Review> findByreviewerID(Integer reviewerID) {
        Query query = entityManager.createNativeQuery("SELECT * FROM reviewsystemdb.review " +
                "WHERE reviewerID LIKE ?", Review.class);
        query.setParameter(1, reviewerID);
        return query.getResultList();
    }

    @Override
    public List<Review> findByreview_article_ID(Integer review_article_ID) {
        Query query = entityManager.createNativeQuery("SELECT * FROM reviewsystemdb.review " +
                "WHERE review_article_ID LIKE ?", Review.class);
        query.setParameter(1, review_article_ID);
        return query.getResultList();
    }
}
