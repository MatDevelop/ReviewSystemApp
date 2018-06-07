package com.reviewsystem.repository;

import com.reviewsystem.model.Review;

import java.util.List;

public interface ReviewRepositoryCustom {
    List<Review> findByreviewerID(Integer reviewerID);
    List<Review> findByreview_article_ID(Integer review_article_ID);
}
