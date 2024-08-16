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
<% String idd=request.getParameter("id");
int id=Integer.parseInt(idd);
StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
Session se = sessionFactory.openSession();


Transaction transaction = se.beginTransaction();

String hql = "DELETE FROM InserPojo WHERE id = :id";

// Create the query and set the parameter
org.hibernate.query.Query query = se.createQuery(hql);
query.setParameter("id", id);

// Execute the delete query
int deletedRows = query.executeUpdate();

// Commit the transaction
transaction.commit();
if (deletedRows > 0) {
    out.println("Record with ID " + id + " deleted successfully.");
} else {
    out.println("No record found with ID " + id + ". Nothing deleted.");
}

se.close();
sessionFactory.close();

%>
</body>
</html>