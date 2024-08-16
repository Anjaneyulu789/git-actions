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
<% String id2=request.getParameter("id");
 int id=Integer.parseInt(id2);
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobileno");
String amount=request.getParameter("amount");
String password=request.getParameter("password");
String accno=request.getParameter("accno");

request.getParameter("resume");

StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
Session se = sessionFactory.openSession();


Transaction transaction = se.beginTransaction();






try {

    String sql = "INSERT INTO InserPojo(id, name, email, mobileno, amount, password, accno) " +
            "VALUES (:id, :name, :email, :mobileno, :amount, :password, :accno)";

    org.hibernate.query.Query query = se.createSQLQuery(sql)
            .setParameter("id", id)
            .setParameter("name", name)
            .setParameter("email", email)
            .setParameter("mobileno", mobile)
            .setParameter("amount", amount)
            .setParameter("password", password)
            .setParameter("accno", accno); 
            

    int count=query.executeUpdate();

    transaction.commit();
    out.println("Data inserted successfully");%>
   <%--  <jsp:include page="index.jsp"></jsp:include> --%>
    <% 
} catch (Exception e) {
if (transaction != null) {
   transaction.rollback();
   out.println("signup failed");%>
  
   <%-- <jsp:include page="Signup.jsp"></jsp:include> --%>
   <% 
}
e.printStackTrace();
} 
se.close();
sessionFactory.close();



%>
</body>
</html>