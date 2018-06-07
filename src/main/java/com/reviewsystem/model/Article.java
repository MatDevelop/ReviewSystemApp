package com.reviewsystem.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="article")
public class Article {

    @Id
    @Column(name = "articleID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer articleID;

    @Column(name="title")
    private String title;

    @Column(name="description")
    private String description;

    @Column(name = "keywords")
    private String keywords;

    @Column(name = "authorname")
    private String authorname;

    @Column(name = "contact")
    private String contact;

    @Column(name = "authoraddress")
    private String authoraddress;

    @Column(name = "affiliation")
    private String affiliation;

    @Column(name = "status")
    private Integer status;

    @Lob
    @Column(name = "pdffile")
    private byte[] pdffile;

    @Lob
    @Column(name = "docfile")
    private byte[] docfile;

    @ManyToOne
    @JoinColumn(name="userID", nullable=false)
    private User user;

    @OneToMany(mappedBy="article")
    private List<Review> reviews;


    public Integer getArticleID() {
        return articleID;
    }

    public void setArticleID(Integer articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }

    public String getAuthoraddress() {
        return authoraddress;
    }

    public void setAuthoraddress(String authoraddress) {
        this.authoraddress = authoraddress;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affilation) {
        this.affiliation = affilation;
    }

    public byte[] getPdffile() {
        return pdffile;
    }

    public void setPdffile(byte[] pdffile) {
        this.pdffile = pdffile;
    }

    public byte[] getDocfile() {
        return docfile;
    }

    public void setDocfile(byte[] docfile) {
        this.docfile = docfile;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
