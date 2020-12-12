<html lang="en">
<head>
    <title>Persona 5 List of Personas</title>
    <link rel = "stylesheet" type = "text/css" href ="home_style.css"><!--used to add style-->
</head>
    <body>
        <h1>Persona 5 Fusion Calculator</h1>
        <?php
            //CONNECTING TO MS SQLSERVER HERE. IF NO CONNECTION MADE, SCRIPT WILL NOT RUN
            require 'db_conn.php';
            //DEFAULT VARIABLE IS USED WHEN NO PARAMETER IS INSERTED. USED FOR DISPLAYING COMPLETE TABLE. ADD PARAMETER FOR SEARCH BAR
            $initialize_table = "SELECT * INTO #MainTable FROM Create_MainTable(DEFAULT)";
            //ACCESS THE STORED PROCEDURES IN THIS VARIABLE. TEMP TABLE
            $sql = "SELECT * FROM #MainTable";
            $result1 = sqlsrv_query($conn, $initialize_table);
            //RUN THE QUERY
            $result2 = sqlsrv_query($conn, $sql);
            //IF NO RESULT, DISPLAY ERROR MESSAGE
            if( $result2 === false ) {
                die( print_r( sqlsrv_errors(), true));
            }
        ?>

<!--CREATES SEARCH BAR-->
        <form name = "search_form" method ="POST" action = "filterBy.php">
            Search: <input type = "text" name = "search_box" value = ""/>
            <input type="submit" name = "search" value = "Go!" href = "filterBy?"/>

        </form>

<!--CREATES TABLE SHOWING ALL PERSONAS-->
    <?php require 'create_home_table.php' ?>


    </body>
</html>