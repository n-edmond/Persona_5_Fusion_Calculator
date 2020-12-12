<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="home_style.css"><!--used to add style-->
    <title>Persona 5 Table Filter</title>
</head>
    <body>

    <form name = "search_form" method ="POST" action = "filterBy.php">
        Search: <input type = "text" name = "search_box" value = ""/>
        <input type="submit" name = "search" value = "Go!" href = "filterBy?"/>

    </form>

    <?php
        include 'db_conn.php';



    $user_input = $_POST['search_box'];

    //CHECK TO SEE IF USER HAS INPUT TEXT INTO SEARCH BAR;
    if (isset($_POST['search_box'])){
        $user_input = $_POST['search_box'];
        $sql = "EXEC Create_Main_Table '$user_input'";

        $result2 = sqlsrv_query($conn, $sql);
        if ($result2 === false) {
            echo "Error (sqlsrv_query): ".print_r(sqlsrv_errors(), true);
            exit;
        }
    }
    require 'create_home_table.php'
    ?>


    </body>
</html>