<%@page import="java.sql.*"%>


<%

  String category_name = request.getParameter("category_name");
  String description = (String)request.getParameter("description");

  Class.forName("org.postgresql.Driver");
  String JDBC_DRIVER = "org.postgresql.Driver";
  String DB_URL = "jdbc:postgresql://localhost:5434/project";

//database credentials
  String USER = "postgres";
  String PASS = "bao.9418";

  Connection con =DriverManager.getConnection(DB_URL, USER, PASS);

  Statement st = con.createStatement();

  String values = ("'" + category_name + "'" + ",")  + ("'" + description + "'") ;
  //System.out.println(values);
  String sql = "INSERT INTO categories (name, description)" +
               "VALUES (" + values + ");";

  st.executeUpdate(sql);
  st.close();
  con.close();
  response.sendRedirect("categories.jsp");

%>
