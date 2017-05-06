<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<!-- If IE use the latest rendering engine -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Set the page to the width of the device and set the zoon level -->
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Products</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style>
.jumbotron{
    background-color:#2E2D88;
    color:white;
}
/* Adds borders for tabs */
.tab-content {
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    padding: 10px;
}
.nav-tabs {
    margin-bottom: 0;
}
</style>
</head>
<body>

  <nav class="navbar navbar-inverse">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="home.jsp">FAKE Amazon</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <% if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
            %>
            <a href = "login.jsp"><button type="button" class="btn btn-default navbar-btn">Log in</button></a>
            <a href = "signup.jsp"><button type="button" class="btn btn-default navbar-btn">Sign Up</button></a>
            <% }else { %>
            <a href = "categories.jsp"><button type="button" class="btn btn-default navbar-btn">Categories</button></a>
            <a href = "products.jsp"><button type="button" class="btn btn-default navbar-btn">Products</button></a>
            <a href = "dashboard.jsp"><button type = "button" class = "btn btn-default navbar-btn"><%=session.getAttribute("username")%> </button></a>
            <a href = "logout.jsp"><button type = "button" class = "btn btn-default navbar-btn"> Logout </button> </a>
            <%}%>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  <div>
    <h2><% if ( ((String)session.getAttribute("role")).equals("customer")) { %>
    This page is avilable to Owners only! Click <a href = "home.jsp">here</a> to go to homepage.
    <%} else {%></h2>


    <h2> Hi, <%=session.getAttribute("username")%>!</h2>

    <h3><a href="#" id="popover">Add Products</a></h3>
    <div id="popover-head" class="hide">Add to the Products</div>
    <div id="popover-content" class="hide">
      <form action = "insert_product.jsp" method = "post">
        Name
        <input type="text" name="product_name" class="form-control" placeholder="Name of the Products" required autofocus>
          SKU
          <input type="text" name="sku" class="form-control" placeholder="Unique SKU" required>
            Category
            <input type="text" name="category" class="form-control" placeholder="Category that products belong to" required>
              Price
              <input type="number" name="price" class="form-control" placeholder="Price" required >
            <!--<input type="text" name="description" value="" class="form-control" placeholder="Enter the Description" required >-->
            <button class="btn btn-lg btn-primary" type="submit" name = "action" value = "submit_products">Submit</button>
            <button class="btn btn-lg btn-danger" type="reset">Cancel</button>
      </form>
    </div>
    <%
      Class.forName("org.postgresql.Driver");
      String JDBC_DRIVER = "org.postgresql.Driver";
      String DB_URL = "jdbc:postgresql://localhost:5434/project";

      String USER = "postgres";
      String PASS = "bao.9418";


      Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
      Statement st = con.createStatement();

      ResultSet rs;
      String qry = "SELECT * FROM products; ";
      rs = st.executeQuery(qry);

      while(rs.next()){ %>
      <center>
          <form action = "update_product.jsp" method = post>
              <table class = "table table-striped table-bordered table-hover table-condensed">
                  <caption>Products List</caption>
                  <tr>
                      <th>Product ID</th>
                      <th>Products Name</th>
                      <th>SKU</th>
                      <th>Category</th>
                      <th>Price</th>
                      <th>Action</th>
                  </tr>
                      <tr>
                        <td><input type = "number" name = "id" class = "form-control" value = "<%=rs.getInt("id")%>"></td>
                        <td><input type = "text" name = "product_name" class = "form-control" value = "<%=rs.getString("name")%>" required></td>
                        <td><input type = "text" name = "sku" class = "form-control" value = "<%=rs.getString("sku")%>" required></td>
                        <td><input type = "text" name = "category" class = "form-control" value = "<%=rs.getString("category")%>" required></td>
                        <td><input type = "number" name = "price" class = "form-control" value = "<%=rs.getInt("price")%>" required></td>

                        <td>
                          <button class = "btn btn-primary" type = "submit" name = "action" value = "update" >Update</button>
                            <button class = "btn btn-danger" type = "submit" name = "action" value = "delete">Delete</button>
                        </td>

                      </tr>
              </table>
          </form>
          <a href="home.jsp">Go Home</a>
      </center>
      <%}%>
   </div>
   <% } %>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
</body>
</html>
<script>
$('#popover').popover({
    html : true,
    title: function() {
      return $("#popover-head").html();
    },
    content: function() {
      return $("#popover-content").html();
    }
});
</script>
