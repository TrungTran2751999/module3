package controller;

import models.User;
import services.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    public void init(){
        userDAO = new UserDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
            switch (action){
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    editUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        try {
            switch (action){
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                default:{
                    listUser(request, response);
                    break;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void listUser(HttpServletRequest request, HttpServletResponse response){
        List<User> listUser = userDAO.selectAllUser();
        request.setAttribute("user", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private User getOneUser(int id){
        User user = null;
        try {
            user = userDAO.selectUser(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        RequestDispatcher dispatcher;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            User existingUser = userDAO.selectUser(id);
            if(existingUser != null){
                dispatcher = request.getRequestDispatcher("user/edit.jsp");
                request.setAttribute("user",existingUser);
            }else{
                dispatcher = request.getRequestDispatcher("error-404.jsp");
            }
        }catch (Exception e){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }

        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws SQLException{
        RequestDispatcher dispatcher;
        String name = request.getParameter("name");
        List<User> searchs = userDAO.selectUserByName(name);
        if(searchs.size() > 0){
            request.setAttribute("user", searchs);
            request.setAttribute("country", name);
            dispatcher = request.getRequestDispatcher("user/search.jsp");
        }else{
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        userDAO.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException{
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String country = request.getParameter("country");
            User userPrev = getOneUser(id);
            if(userPrev != null){
                User user = new User(id, name, email, country);
                userDAO.updateUser(user);
                response.sendRedirect("/user");
            }else{
                response.sendRedirect("user/error-404.jsp");
            }
        }catch (Exception e){
            try {
                response.sendRedirect("user/error-404.jsp");
            }catch (Exception en){
                en.printStackTrace();
            }
        }
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException{
        int id = Integer.parseInt(request.getParameter("id"));
        User userPrev = getOneUser(id);
        try{
            if(userPrev != null){
                userDAO.deleteUser(id);
                response.sendRedirect("/user");
            }else{
                response.sendRedirect("user/error-404.jsp");
            }
        }catch (Exception e){
            try {
                response.sendRedirect("user/error-404.jsp");
            }catch (Exception en){
                en.printStackTrace();
            }
        }
    }
}
