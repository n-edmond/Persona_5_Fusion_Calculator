<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="home_style.css"><!--used to add style-->
    <title>Persona 5 Fusion Results</title>
</head>
<body>
<!--ADDING MAIN TABLE WITH HEADERS TO WEBPAGE. DISPLAYS ALL PERSONAS THAT CAN BE FUSED-->
<table class="main_table">
    <tr>
        <th><a href="sortBy.php?sort=level">Level</a></th>
        <th><a href ="sortBy.php?sort=persona">Persona</a></th>
        <th><a href ="sortBy.php?sort=arcana">Arcana</a></th>
        <th style="width:70%">Luck</th>
        <th>Agility</th>
        <th>Endurance</th>
        <th>Strength</th>
        <th style="width:70%">Magic</th>
        <th>Gun</th>
        <th>Pys</th>
        <th>Fire</th>
        <th>Ice</th>
        <th>Elec</th>
        <th>Wind</th>
        <th>Nuke</th>
        <th>Psy</th>
        <th>Curse</th>
        <th>Bless</th>
    </tr>


    <!--ACCESSING SQL TABLE AND DISPLAYING RESULTS HERE. THIS SQL TABLE IS A TEMPORARY TABLE -->
    <?php
    //PRINTING INFO TO SCREEN. GENERAL TABLE FORMATTING

    while( $row = sqlsrv_fetch_array( $result2, SQLSRV_FETCH_ASSOC)) {
        echo "<strong><tr><td>"
            .$row['persona_level']. "</td><td>",
            //CREATES HYPERLINK FOR EACH NAME IN TEMP SQL TABLE
            '<a href="details.php?persona_name=' .$row['persona_name']. '">'.$row['persona_name']."</a></td><td>"
            .$row['arcana_type']. "</td><td>"
            .$row['stat_luck']. "</td><td>"
            .$row['stat_agility']. "</td><td>"
            .$row['stat_endurance']. "</td><td>"
            .$row['stat_strength']. "</td><td>"
            .$row['stat_magic']. "</td><td>"
            .$row['Gun']. "</td><td>"
            .$row['Phys']. "</td><td>"
            .$row['Fire']. "</td><td>"
            .$row['Ice']. "</td><td>"
            .$row['Elec']. "</td><td>"
            .$row['Wind']. "</td><td>"
            .$row['Nuke']. "</td><td>"
            .$row['Psy']. "</td><td>"
            .$row['Curse']. "</td><td>"
            .$row['Bless']. "</td><td>
                    </strong</tr></td>";
    }

    ?>
</table>

</body>
