<html>
  <head>
    <title>Members & Membership</title>
  </head>
  <body>
    <div style="float: right;">
      <form action="index.php" method="POST">
        <input type="submit" value="Logout">
      </form>
    </div>
    <h1>Members & Membership</h1>
    <p>Search for members by search for members by first name, last name, email, phone number, or address.</p>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
      <input type="text" name="search" placeholder="Search...">
      <input type="submit" value="Go">
    </form>

<?php
  include "db_connect.php";

  // Select all members and membership information from the Member and Membership tables
  $query = "SELECT * FROM Member, Membership WHERE Member.MEM_ID = Membership.MEM_ID";

  // Check if the user has submitted a search query
  if (isset($_POST['search'])) {
      // Add search criteria to the query
      $search = mysqli_real_escape_string($conn, $_POST['search']);
      $query .= " AND (MEM_FName LIKE '%$search%' OR MEM_LName LIKE '%$search%' OR CONCAT(MEM_FName, ' ', MEM_LName) LIKE '%$search%' OR MEM_Email LIKE '%$search%' OR MEM_Phone LIKE '%$search%' OR MEM_Address LIKE '%$search%')";
  }

  // Execute the query and store the result
  $result = mysqli_query($conn, $query);

  // Check if the query was successful
  if (!$result) {
      die("Query failed: " . mysqli_error($conn));
  }

  // Print the information for each member and their corresponding membership
  while ($row = mysqli_fetch_assoc($result)) {
      echo "<h2>" . $row['MEM_FName'] . " " . $row['MEM_LName'] . "</h2>";
      echo "<p>DOB: " . $row['MEM_DOB'] . "</p>";
      echo "<p>Gender: " . $row['MEM_Gender'] . "</p>";
      echo "<p>Email: " . $row['MEM_Email'] . "</p>";
      echo "<p>Phone: " . $row['MEM_Phone'] . "</p>";
      echo "<p>Address: " . $row['MEM_Address'] . "</p>";
      echo "<p>Membership Type: " . $row['MSHIP_Type'] . "</p>";
      echo "<p>Expiry Date: " . $row['MSHIP_ExpiryDate'] . "</p>";
      echo "<p>Date Created: " . $row['MSHIP_DateCreated'] . "</p>";
      echo "<p>Cost: $" . $row['MSHIP_Cost'] . "</p>";
      echo "<p>Status: " . $row['MSHIP_Status'] . "</p>";
  }

  // Close the connection
  mysqli_close($conn);
?>
  </body>
</html>
