<!--CONNECTING TO MS SQLSERVER HERE-->

<?php

    $serverName = "MSI"; //ADDING SERVER FOR MS SQLSERVER
    //FOR UNKNOWN REASONS MS SQLSERVER REFUSED TO ALLOW ME TO MAKE A CUSTOM UID OR PWD
    //SINCE UID AND PWD ARE NOT SPECIFIED , THE CONNECTION USES WINDOWS AUTHENTICATION
    $connectionInfo = array("Database"=>"Persona_Data");
    $conn = sqlsrv_connect($serverName, $connectionInfo);

    //CHECKS IF CONNECTION WAS ESTABLISHED. IF NOT, SHOW ERROR AND KILL PROCESS
    if (!$conn){
        echo "Connection could not be established =(";
        die(print_r(sqlsrv_errors(), true));
    }
    ?>
