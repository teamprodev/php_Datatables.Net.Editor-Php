<?php
$servername = "localhost";
$username = "mysql";
$password = "mysql";
$database = 'laravel_editor';

// Create connection
$conn = new mysqli($servername, $username, $password,$database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT first_name,last_name,position,email,office,extn,age,salary,start_date FROM datatables_demo";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    echo "<table><tr><th>ID</th><th>Name</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["firstname"]." ".$row["lastname"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}
echo "Connected successfully";
$conn->close();
?>
