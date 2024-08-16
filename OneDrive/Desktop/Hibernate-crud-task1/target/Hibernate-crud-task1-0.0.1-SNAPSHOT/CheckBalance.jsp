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
<%        String username = request.getParameter("username");
StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
Session se = sessionFactory.openSession();
Transaction transaction = se.beginTransaction();
String hql = "FROM InserPojo WHERE email = :username ";
InserPojo user = (InserPojo) se.createQuery(hql)
        .setParameter("username", username)
        
        .uniqueResult();

if (user != null) {
    // Valid credentials, redirect to success page or perform further actions
	
	
out.println("Available Balance: "+user.getAmount());
	
   
} else {
   out.println("incorrect username");%>
 <%--  <jsp:include page="Username.jsp"></jsp:include> --%>
  
  <% 
}
transaction.commit();
se.close();
sessionFactory.close();




%>
</body>
</html>