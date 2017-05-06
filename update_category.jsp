<%@page import="java.sql.*"%>


<%
  int id = Integer.parseInt(request.getParameter("id"));
  String name = request.getParameter("category_name");
  String description = (String)request.getParameter("description");
  Class.forName("org.postgresql.Driver");
  String JDBC_DRIVER = "org.postgresql.Driver";
  String DB_URL = "jdbc:postgresql://localhost:5434/project";
  String action = request.getParameter("action");

//database credentials
  String USER = "postgres";
  String PASS = "bao.9418";
//connecting to database
  Connection con =DriverManager.getConnection(DB_URL, USER, PASS);
  Statement st = con.createStatement();

  if(action.equals("update")){
    String sql = "UPDATE categories SET name = '" + name + "' ,description = '" + description + "' WHERE id = " + id + ";" ;
    st.executeUpdate(sql);
    st.close();
    con.close();
    response.sendRedirect("categories.jsp");
  }
  else{
    String sql = "DELETE FROM categories WHERE id = " + id + ";" ;
    st.executeUpdate(sql);
    st.close();
    con.close();
    response.sendRedirect("categories.jsp");
  }

%>
