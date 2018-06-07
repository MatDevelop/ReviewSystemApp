package com.reviewsystem.repository;

import com.reviewsystem.model.Article;

import java.util.List;

public interface ArticleRepositoryCustom {
    List<Article> findByuserid(Integer userid);
    List<Article> findBystatus(Integer status);
    void updateStatus(Integer articleID, Integer status);
}
