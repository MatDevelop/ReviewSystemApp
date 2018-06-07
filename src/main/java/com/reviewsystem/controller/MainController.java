package com.reviewsystem.controller;

import com.reviewsystem.model.Article;
import com.reviewsystem.model.Review;
import com.reviewsystem.model.User;
import com.reviewsystem.model.UserRole;
import com.reviewsystem.repository.ArticleRepository;
import com.reviewsystem.repository.ReviewRepository;
import com.reviewsystem.service.UserRoleService;
import com.reviewsystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private UserRoleService userRoleService;


    @GetMapping("/")
    public String home(HttpServletRequest request){
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String login(HttpServletRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        List<String> roles = new ArrayList<String>();
        for(GrantedAuthority ga : auth.getAuthorities()){
            roles.add(ga.getAuthority());
        }
        //zabezpieczenie przed ponownym zalogowaniem
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            if(roles.contains("ADMIN")){
                return ("redirect:/admin/home");
            }else if(roles.contains("USER")){
                return ("redirect:/user/home");
            }else if(roles.contains("REVIEWER")){
                return ("redirect:/reviewer/home");
            }
        }
        return "login";
    }
    @GetMapping("/registration")
    public String registration(HttpServletRequest request){
        return "registration";
    }
    @PostMapping("/registration")
    public String registrationPost(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            request.setAttribute("emailerror", true);
            return "registration";
        }
        if (bindingResult.hasErrors()) {
            System.out.println("Błąd w bindingResult");
            return "registration";
        } else {
            userService.saveUser(user);
            request.setAttribute("successMessage", "Rejestracja przebiegła pomyślnie. Możesz się teraz zalogować.");
            return "login";
        }
    }

    @GetMapping("/admin/home")
    public String adminHome(HttpServletRequest request){
        List<Article> newArticleList = articleRepository.findBystatus(1);
        List<Article> reviewArticleList = articleRepository.findBystatus(2);
        List<Article> endArticleList = articleRepository.findBystatus(0);
        request.setAttribute("newarticleList", newArticleList);
        request.setAttribute("reviewarticleList", reviewArticleList);
        request.setAttribute("endarticleList", endArticleList);
        return "admin/home";
    }
    @GetMapping("/admin/addreviewers")
    public String addReviewers(@RequestParam int id, @RequestParam int articleID, HttpServletRequest request){
        List<UserRole> reviewers_role = userService.findByroleID(2);                //pobranie pozycji z tabeli user_role
        List<User> reviewers = new ArrayList<>();
        Article article = articleRepository.findOne(articleID);                     //znalezienie konkrentego artykułu do którego ma być przydzielony recenzent
        List<Review> review = reviewRepository.findByreview_article_ID(articleID);  //pobranie recenzji już przypisanych do artykułu
        for(UserRole reviewer : reviewers_role){                                    //dla każdego recenzenta wykonaj
            if(review.isEmpty()) {                                                  //czy jest już jakaś recenzja jeżeli nie ma to pokazuję administratorowi wszystkich dostępnych recenzentów
                reviewers.add(userService.findUserByuserID(reviewer.getUserID()));
            }else{
                if(!(review.get(0).getUser().getUserID()==reviewer.getUserID())){       //jeżeli recenzent już jest dodany do artykułu to go pomiń
                    reviewers.add(userService.findUserByuserID(reviewer.getUserID()));
                }
            }
        }
        request.setAttribute("reviewerList", reviewers);
        request.setAttribute("article", articleRepository.findOne(id));
        return  "/admin/addreviewers";
    }
    @GetMapping("/admin/addreviewer")
    public String addReviewer(@RequestParam int idreviewer, @RequestParam int idarticle, HttpServletRequest request){
        Review review = new Review();
        Article article = articleRepository.findOne(idarticle);
        User reviewerUser = userService.findUserByuserID(idreviewer);
        review.setArticle(article);
        review.setUser(reviewerUser);
        review.setStatus(0);
        reviewRepository.save(review);
        if(article.getReviews().size()==2) {
            articleRepository.updateStatus(review.getArticle().getArticleID(), 2);
        }
        return "redirect:/admin/home?success=true";
    }
    @GetMapping("/admin/deletereview")
    public String deleteReview(@RequestParam int articleID, HttpServletRequest request){
        List<Review> reviews = reviewRepository.findByreview_article_ID(articleID);
        for(Review review : reviews){
            reviewRepository.delete(review);
        }
        articleRepository.updateStatus(articleID, 1);
        return "redirect:/admin/home";
    }
    @GetMapping("/admin/deletearticle")
    public String deleteArticle(@RequestParam int articleID, HttpServletRequest request){
        List<Review> reviews = reviewRepository.findByreview_article_ID(articleID);
        for(Review review : reviews){
            reviewRepository.delete(review);
        }
        articleRepository.delete(articleID);
        return "redirect:/admin/home";
    }

    @GetMapping("/admin/viewusers")
    public String viewUsers(HttpServletRequest request){
        List<UserRole> users_role = userService.findByroleID(3);
        List<UserRole> reviewers_role = userService.findByroleID(2);
        List<User> users = new ArrayList<>();
        List<User> reviewers = new ArrayList<>();
        for(UserRole user : users_role){
            users.add(userService.findUserByuserID(user.getUserID()));
        }
        for(UserRole reviewer : reviewers_role){
            reviewers.add(userService.findUserByuserID(reviewer.getUserID()));
        }
        request.setAttribute("userList", users);
        request.setAttribute("reviewerList", reviewers);
        return "/admin/viewusers";
    }
    @GetMapping("/admin/update-user")
    public String updateTask(@RequestParam int id, HttpServletRequest request){
        request.setAttribute("user", userService.findUserByuserID(id));
        return "/admin/updateuser";
    }
    @PostMapping("/admin/save-user")
    public String saveUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        UserRole userRole = userRoleService.findByuserID(user.getUserID());
        userRole.setRoleID(Integer.valueOf(request.getParameter("role")));
        userRoleService.saveUserRole(userRole);
        return "redirect:/admin/viewusers";
    }

    @GetMapping("/reviewer/home")
    public String reviewerHome(HttpServletRequest request){
        User currentUser = userService.findUserByEmail(request.getUserPrincipal().getName());   //pobranie aktualnie zalogowanego użytkownika
        List<Review> reviewList = reviewRepository.findByreviewerID(currentUser.getUserID());   //lista wszystkich recenzji przypisanych do użytkownika
        List<Article> articleList = new ArrayList<>();
        for(Review review : reviewList){
            if(review.getPdffile()==null){
                articleList.add(review.getArticle());
            }
        }
        request.setAttribute("articlelist", articleList);
        return "reviewer/home";
    }
    @GetMapping("/reviewer/addreview")
    public String addReview(@RequestParam int articleID, HttpServletRequest request){
        request.setAttribute("article",articleRepository.findOne(articleID));
        return "/reviewer/addreview";
    }

    @PostMapping("/reviewer/addreview")
    public String addReviewPost(@RequestParam int articleID, @RequestParam MultipartFile pdffile, HttpServletRequest request){
        User currentUser = userService.findUserByEmail(request.getUserPrincipal().getName());   //pobranie aktualnie zalogowanego użytkownika
        List<Review> reviewList = reviewRepository.findByreviewerID(currentUser.getUserID());   //lista wszystkich recenzji przypisanych do użytkownika
        int sum = 0;
        for(Review review : reviewList){
            if(review.getArticle().getArticleID()==articleID){                                  //jeśli id artykułu przypisanego do recenzji jest równa artykułowi pobranemu w parametrze
                try {
                    if (pdffile != null) {
                        System.out.println("Saving file: " + pdffile.getOriginalFilename());        //dodajemy plik pdf do obiektu
                        review.setPdffile(pdffile.getBytes());
                        review.setStatus(1);
                    }
                    reviewRepository.save(review);
                    List<Review> reviewListAfterUpdate = reviewRepository.findByreview_article_ID(articleID);   //lista recencji przypisanych do artykułu po dodaniu recenzji
                    for(Review review1 : reviewListAfterUpdate){
                        sum+=review1.getStatus();                                                               //suma statusów recenzji
                    }
                    if(sum==reviewListAfterUpdate.size() && reviewListAfterUpdate.size()==2){
                        articleRepository.updateStatus(articleID,0);                                     //jeśli suma statusów jest równa ilości znalezionych recenzji to artykuł uważa
                    }                                                                                           //jako zrecenzowany w całości i daje mu status 0
                    return "redirect:/reviewer/home?addingerror=true";
                }catch (IOException e){
                    return "redirect:/reviewer/home?addingerror=false";
                }
            }
        }
        return "redirect:/reviewer/home";
    }
    @GetMapping(value = "/reviewer/getPdf")
    private void reviewerGetPdf(@RequestParam int id, HttpServletRequest request, HttpServletResponse response){
        Article article = articleRepository.findOne(id);
            try {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition","attachment; filename=\"" + article.getTitle() + ".pdf"+"\"");
                response.getOutputStream().write(article.getPdffile());

            }catch (IOException e){
                e.printStackTrace();
            }
    }
    @GetMapping(value = "/reviewer/getDoc")
    private void reviewerGetDoc(@RequestParam int id, HttpServletRequest request, HttpServletResponse response){
        Article article = articleRepository.findOne(id);
            try {
                response.setContentType("doc");
                response.setHeader("Content-Disposition","attachment; filename=\"" + article.getTitle() + ".doc"+"\"");
                response.getOutputStream().write(article.getDocfile());

            }catch (IOException e){
                e.printStackTrace();
            }
    }
    @GetMapping("/user/home")
    public String userHome(HttpServletRequest request){
        return "redirect:/user/viewarticles";
    }
    @GetMapping("/user/addarticle")
    public String addArticleGet(HttpServletRequest request){
        return "user/addarticle";
    }
    @PostMapping("/user/addarticle")
    public String addArticlePost(@ModelAttribute Article article, BindingResult bindingResult, HttpServletRequest request,
                                 @RequestParam MultipartFile pdffile, @RequestParam MultipartFile docfile){
        try {
            if (pdffile != null) {
                System.out.println("Saving file: " + pdffile.getOriginalFilename());
                article.setPdffile(pdffile.getBytes());

            }
            if (docfile != null) {
                System.out.println("Saving file: " + docfile.getOriginalFilename());
                article.setDocfile(docfile.getBytes());
            }
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = userService.findUserByEmail(request.getUserPrincipal().getName());
            article.setUser(currentUser);
            article.setStatus(1);
            articleRepository.save(article);
            return "redirect:/user/viewarticles?addingerror=true";
        }catch (IOException e){
            return "redirect:/user/viewarticles?addingerror=false";
        }

    }
    @GetMapping("/user/viewarticles")
    public String viewArticles(HttpServletRequest request){
        User currentUser = userService.findUserByEmail(request.getUserPrincipal().getName());
        List<Article> articleList = articleRepository.findByuserid(currentUser.getUserID());
        List<Article> waitingArticleList = new ArrayList<>();
        List<Article>endedArticleList = new ArrayList<>();
        for(Article article : articleList){
            if(article.getStatus()==1 || article.getStatus()==2){
                waitingArticleList.add(article);
            }else if(article.getStatus()==0){
                endedArticleList.add(article);
            }
        }
        request.setAttribute("waitingarticleList", waitingArticleList);
        request.setAttribute("endedarticleList", endedArticleList);
        return "user/viewarticles";
    }
    @GetMapping(value = "/user/getPdf")
    private void userGetPdf(@RequestParam int id, HttpServletRequest request, HttpServletResponse response){
        Review review = reviewRepository.findOne(id);
        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition","attachment; filename=\"" +"reviewnr"+ review.getReviewID() + ".pdf"+"\"");
            response.getOutputStream().write(review.getPdffile());
        }catch (IOException e){
            e.printStackTrace();
        }
    }

}
