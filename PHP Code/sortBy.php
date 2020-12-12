<html>
<head>
    <title>Sorting Page</title>
</head>
    <body>

    <h1>Persona 5 Fusion Calculator</h1>

    <!--CREATES SEARCH BAR-->
    <form name = "search_form" method ="POST" action = "filterBy.php">
        Search: <input type = "text" name = "search_box" value = ""/>
        <input type="submit" name = "search" value = "Go!" href = "filterBy?"/>

    </form>

        <?php
            include 'db_conn.php';
            $sort_type = $_GET['sort'];

        if (!isset($sort_type)) {
            echo "Setting Persona move did not work or is invalid";
            die(print_r(sqlsrv_errors(), true));
        }

        if ($sort_type == 'level'){
            //echo "This is a test";
            $sql = "SELECT * FROM Persona_Data.dbo.Create_MainTable(DEFAULT) ORDER BY persona_level";
            $result2 = sqlsrv_query($conn, $sql);
        }
        else if ($sort_type == 'arcana'){
            //echo "This is a test arccana";
            $sql = "SELECT * FROM Persona_Data.dbo.Create_MainTable(DEFAULT) ORDER BY arcana_type";
            $result2 = sqlsrv_query($conn, $sql);

        }else if ($sort_type == 'persona'){
            //echo "this is a test persona";
            $sql = "SELECT * FROM Persona_Data.dbo.Create_MainTable(DEFAULT) ORDER BY persona_name";
            $result2 = sqlsrv_query($conn, $sql);

        }else{
            echo "INVALID INPUT";
            exit;
        }
        require 'create_home_table.php';

        ?>
    </body>
</html>