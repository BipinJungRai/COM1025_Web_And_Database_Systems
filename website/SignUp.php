<?php

include "db_connect.php";

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

# Processing Form data when the Form is Submitted.
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    # Define Variables.
    $fname = test_input($_POST["STAFF_FName"]);   
    $lname = test_input($_POST["STAFF_LName"]);
    $dob = test_input($_POST["STAFF_DOB"]);
    $email = test_input($_POST["STAFF_Email"]);
    $gender = test_input($_POST["STAFF_Gender"]);
    $phone = test_input($_POST["STAFF_Phone"]);
    $teaching_level = test_input($_POST["STAFF_TeachingLevel"]);
    $manages = test_input($_POST["STAFF_Manages"]);
    $password = test_input($_POST["ACC_Password"]);

    # Insert a new record into the Staff table.
    $sql = "INSERT INTO Staff (STAFF_FName, STAFF_LName, STAFF_DOB, STAFF_Email, STAFF_Gender, STAFF_Phone, STAFF_TeachingLevel, STAFF_Manages) VALUES ('$fname', '$lname', '$dob', '$email', '$gender', '$phone', '$teaching_level', '$manages')";
    $conn->query($sql);

    # Get the newly inserted STAFF_ID value.
    $staff_id = $conn->insert_id;

    # Insert a new record into the Account table using the STAFF_ID value.
    $sql2 = "INSERT INTO Account (STAFF_ID, ACC_Password) VALUES ('$staff_id', '$password')";
    $conn->query($sql2);

    # Frees the connection for the MySQL Database connection.
    $conn->close();
}

?>

<!DOCTYPE html>
<html>
<body>

<form class="form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
    <label for="STAFF_FName">First Name:</label><br>
    <input type="text" id="STAFF_FName" name="STAFF_FName"><br><br>

    <label for="STAFF_LName">Last Name:</label><br>
    <input type="text" id="STAFF_LName" name="STAFF_LName"><br><br>

    <label for="STAFF_DOB">Date of Birth:</label><br>
    <input type="date" id="STAFF_DOB" name="STAFF_DOB"><br><br>

    <label for="STAFF_Email">Email:</label><br>
    <input type="email" id="STAFF_Email" name="STAFF_Email"><br><br>

    <label for="STAFF_Gender">Gender:</label><br>
    <input type="radio" id="STAFF_Gender" name="STAFF_Gender" value="M"> Male 
    <input type="radio" id="STAFF_Gender" name="STAFF_Gender" value="F"> Female 
    <input type="radio" id="STAFF_Gender" name="STAFF_Gender" value="O"> Other<br><br>

    <label for="STAFF_Phone">Phone:</label><br>
    <input type="tel" id="STAFF_Phone" name="STAFF_Phone"><br><br>

    <label for="STAFF_TeachingLevel">Teaching Level:</label><br>
    <input type="radio" id="STAFF_TeachingLevel" name="STAFF_TeachingLevel" value="1"> Level 1 
    <input type="radio" id="STAFF_TeachingLevel" name="STAFF_TeachingLevel" value="2"> Level 2<br><br>

    <label for="STAFF_Manages">Your Manager's Staff ID:</label><br>
    <input type="text" id="STAFF_Manages" name="STAFF_Manages"><br><br>

    <label for="ACC_Password">Password:</label><br>
    <input type="password" id="ACC_Password" name="ACC_Password"><br><br>
    <input type="submit" value="Sign Up">
</form>

</body>
</html>
