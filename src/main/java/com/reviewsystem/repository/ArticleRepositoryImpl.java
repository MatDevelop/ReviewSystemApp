package com.reviewsystem.repository;

import com.reviewsystem.model.Article;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional()
public class ArticleRepositoryImpl implements ArticleRepositoryCustom {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<Article> findByuserid(Integer userid) {
        Query query = entityManager.createNativeQuery("SELECT * FROM reviewsystemdb.article " +
                "WHERE userid LIKE ?", Article.class);
        query.setParameter(1, userid);
        return query.getResultList();
    }

    @Override
    public List<Article> findBystatus(Integer status) {
        Query query = entityManager.createNativeQuery("SELECT * FROM reviewsystemdb.article " +
                "WHERE status LIKE ?", Article.class);
        query.setParameter(1, status);
        return query.getResultList();
    }

    @Override
    public void updateStatus(Integer articleID, Integer status) {
        Query query = entityManager.createNativeQuery("UPDATE reviewsystemdb.article SET status=? " +
                "WHERE articleID LIKE ?");
        query.setParameter(1, status);
        query.setParameter(2, articleID);
        query.executeUpdate();
    }
}
