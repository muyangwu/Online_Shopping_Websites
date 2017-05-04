<%@page import="java.sql.*"%>


<%

  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String email = request.getParameter("email");
  String role = (String)request.getParameter("role");
  String age = request.getParameter("age");
  String state = (String)request.getParameter("state");

  Class.forName("org.postgresql.Driver");
  String JDBC_DRIVER = "org.postgresql.Driver";
  String DB_URL = "jdbc:postgresql://localhost:5434/project";


//database credentials
  String USER = "postgres";
  String PASS = "bao.9418";

  Connection con =DriverManager.getConnection(DB_URL, USER, PASS);

  Statement st = con.createStatement();

  String values = ("'" + username + "'" + ",")  + ("'" + password + "'" + "," ) + ("'" +
  email + "'" + "," ) + ("'" + role + "'" + ","  ) + (age  + ",") + ("'" + state +  "'");
  System.out.println(values);
  String sql = "INSERT INTO userData (username, password, email, role, age, state)" +
               "VALUES (" + values + ");";

  st.executeUpdate(sql);

%>
