<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%

  String product_name = request.getParameter("product_name");
  String sku = request.getParameter("sku");
  String category = request.getParameter("category");
  int price = Integer.parseInt(request.getParameter("price"));
  String action = request.getParameter("action");
  int id = Integer.parseInt(request.getParameter("id"));

  Class.forName("org.postgresql.Driver");
  String JDBC_DRIVER = "org.postgresql.Driver";
  String DB_URL = "jdbc:postgresql://localhost:5434/project";

//database credentials
  String USER = "postgres";
  String PASS = "bao.9418";

  Connection con =DriverManager.getConnection(DB_URL, USER, PASS);
  Statement st = con.createStatement();

  if(action.equals("submit_products")){
    String sql = "INSERT INTO products (name, sku, category, price) VALUES ('" + product_name + "', '" + sku + "', (SELECT name FROM categories WHERE name = '" + category + "')," +  price + ");";
    st.executeUpdate(sql);
  }
  else if (action.equals("update")){
    String sql = "UPDATE products SET name = '" + product_name + "' , sku = '" + sku
    + "' , category = (SELECT name FROM categories WHERE name = '" + category + "')"
    + " , price = " + price
    + " WHERE id = " + id + ";" ;
    //String sql = "UPDATE products SET name = 'bb', sku = 'bb', category = (SELECT name FROM categories WHERE name = 'aaa'), price = 15 WHERE id = 1;";
    st.executeUpdate(sql);
  }
  else if(action.equals("delete")){
    String sql = "DELETE FROM products WHERE id = " + id + ";" ;
    st.executeUpdate(sql);
  }
  st.close();
  con.close();
  response.sendRedirect("products.jsp");
%>
