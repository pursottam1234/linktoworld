<?php
$servername = "mysql01-srv";
$username = "test";
$password = "test123";
$useremail = $_POST['useremail'];
$userpass = $_POST['userpasswd'];

$conn = mysqli_connect($servername, $username, $password,"test");
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully</br>";
$sql = "insert into test.userinfo values('$useremail','$userpass')";

if ($conn->query($sql) === TRUE) {
  echo "<br>New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
echo "<h1> Existing Users: </h1></br>";
$sql1 = "select * from test.userinfo";
$result = $conn->query($sql1);
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
echo  $row["username"] . $row["useremail"] . "<br>";
}
} else {
echo "0 results";
}
$conn->close();
?>
