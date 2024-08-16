<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.boot.registry.StandardServiceRegistryBuilder, org.hibernate.boot.registry.StandardServiceRegistry" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="com.ex.InserPojo" %>
<%@ page import="org.hibernate.boot.registry.StandardServiceRegistryBuilder, org.hibernate.boot.MetadataSources" %>
<%@ page import="org.hibernate.Session, org.hibernate.Transaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String amount=request.getParameter("amount");
String username=request.getParameter("username");



StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
Session se = sessionFactory.openSession(); 
Transaction transaction = se.beginTransaction();

  try {
         String hql = "UPDATE InserPojo SET amount = amount + :amount WHERE email = :username";
        int updatedRows = se.createQuery(hql)
                .setParameter("amount", amount)
                .setParameter("username", username)
                .executeUpdate();

        if (updatedRows > 0) {
            // If rows were updated successfully, redirect to success page
            transaction.commit();
          out.println("Successfull Deposited");
        } else {
            // If no rows were updated, handle the case (e.g., redirect to an error page)
            transaction.rollback();
           out.println("deposit Failed");
        }
    } catch (Exception e) {
        // Handle exceptions (e.g., redirect to an error page)
        if (transaction != null) {
            transaction.rollback();
        }
        e.printStackTrace();
        response.sendRedirect("error.jsp?message=Error during update");
    }
  %>
</body>
</html>