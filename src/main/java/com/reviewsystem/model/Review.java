package com.reviewsystem.model;

import javax.persistence.*;

@Entity
@Table(name = "review")
public class Review {
    @Id
    @Column(name = "reviewID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer reviewID;

    @Lob
    @Column(name = "pdffile")
    private byte[] pdffile;

    @Column(name = "status")
    private Integer status;


    @ManyToOne
    @JoinColumn(name="review_article_ID")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "reviewerID")
    private User user;

    public Integer getReviewID() {
        return reviewID;
    }

    public void setReviewID(Integer reviewID) {
        this.reviewID = reviewID;
    }

    public byte[] getPdffile() {
        return pdffile;
    }

    public void setPdffile(byte[] pdffile) {
        this.pdffile = pdffile;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
