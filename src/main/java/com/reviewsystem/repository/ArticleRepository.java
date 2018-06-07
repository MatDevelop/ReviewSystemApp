package com.reviewsystem.repository;

import com.reviewsystem.model.Article;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ArticleRepository extends JpaRepository<Article, Integer>, ArticleRepositoryCustom {

}
