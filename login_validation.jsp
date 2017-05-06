<%@page import="java.sql.*"%>

<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String role = null;
  Class.forName("org.postgresql.Driver");
  String JDBC_DRIVER = "org.postgresql.Driver";
  String DB_URL = "jdbc:postgresql://localhost:5434/project";


  String USER = "postgres";
  String PASS = "bao.9418";


  Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
  Statement st = con.createStatement();

  ResultSet rs;
  String qry = "SELECT * FROM userData WHERE username ='" + username + "' AND password = '" + password + "';" ;
  rs = st.executeQuery(qry);

  if(rs.next()){
    session.setAttribute("username", username);
    role = rs.getString("role");
    session.setAttribute("role",role);
    response.sendRedirect("home.jsp");
  }
  else{
    request.setAttribute("errorMessage", "Invalid user or password");
    request.getRequestDispatcher("/login.jsp").forward(request,response);
  }
  rs.close();
  st.close();
  con.close();
%>
