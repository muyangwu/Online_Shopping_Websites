<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Registration</title>
    </head>
    <body>
      <form method="post" action="registration.jsp">
        <center>
          <table border="1" width="30%" cellpadding="5" bgcolor="white">
            <thead>
              <tr>
                <th colspan="2">Please Register here</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Username</td>
                <td><input type="text" name="username" value=""/></td>
              </tr>

              <tr>
                <td>Password</td>
                <td><input type="text" name="password" value=""/></td>
              </tr>

              <tr>
                <td>Email</td>
                <td><input type="text" name="email" value=""/></td>
              </tr>

              <tr>
                <td>Are you
                </td>
                <td>
                  <select name="role">
                    <option value="customer">Customer</option>
                    <option value="owner">Owner</option>
                  </select>
                </td>
              </tr>

              <tr>
                <td>How old are you?</td>
                <td><input type="text" name="age" value=""/></td>
              </tr>

              <tr>
                <td>Which state are you from?</td>
                <td>
                  <select name="state">
                      <option value="AL">Alabama</option>
                      <option value="AK">Alaska</option>
                      <option value="AZ">Arizona</option>
                      <option value="AR">Arkansas</option>
                      <option value="CA">California</option>
                      <option value="CO">Colorado</option>
                      <option value="CT">Connecticut</option>
                      <option value="DE">Delaware</option>
                      <option value="DC">District Of Columbia</option>
                      <option value="FL">Florida</option>
                      <option value="GA">Georgia</option>
                      <option value="HI">Hawaii</option>
                      <option value="ID">Idaho</option>
                      <option value="IL">Illinois</option>
                      <option value="IN">Indiana</option>
                      <option value="IA">Iowa</option>
                      <option value="KS">Kansas</option>
                      <option value="KY">Kentucky</option>
                      <option value="LA">Louisiana</option>
                      <option value="ME">Maine</option>
                      <option value="MD">Maryland</option>
                      <option value="MA">Massachusetts</option>
                      <option value="MI">Michigan</option>
                      <option value="MN">Minnesota</option>
                      <option value="MS">Mississippi</option>
                      <option value="MO">Missouri</option>
                      <option value="MT">Montana</option>
                      <option value="NE">Nebraska</option>
                      <option value="NV">Nevada</option>
                      <option value="NH">New Hampshire</option>
                      <option value="NJ">New Jersey</option>
                      <option value="NM">New Mexico</option>
                      <option value="NY">New York</option>
                      <option value="NC">North Carolina</option>
                      <option value="ND">North Dakota</option>
                      <option value="OH">Ohio</option>
                      <option value="OK">Oklahoma</option>
                      <option value="OR">Oregon</option>
                      <option value="PA">Pennsylvania</option>
                      <option value="RI">Rhode Island</option>
                      <option value="SC">South Carolina</option>
                      <option value="SD">South Dakota</option>
                      <option value="TN">Tennessee</option>
                      <option value="TX">Texas</option>
                      <option value="UT">Utah</option>
                      <option value="VT">Vermont</option>
                      <option value="VA">Virginia</option>
                      <option value="WA">Washington</option>
                      <option value="WV">West Virginia</option>
                      <option value="WI">Wisconsin</option>
                      <option value="WY">Wyoming</option>
                    </select>
                </td>
              </tr>

              <tr>
                <td><input type="submit" value="Submit"/></td>
                <td><input type="reset" value="Reset"/></td>
              </tr>
              <tr>
                <td colspan="2">Already registered?<ahref="index.jsp">Login Here</a>
                </td>
              </tr>
            </tbody>
          </table>
        </center>
      </form>
    </body>
  </html>
