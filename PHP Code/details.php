<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="home_style.css"><!--used to add style-->
    <title>Persona 5 Fusion Results</title>
</head>
    <body>

<!--CONNECTING TO SERVER-->
        <div class = "styles">
            <div class = title>
                <?php
                require 'db_conn.php';
                $page_title = $_GET['persona_name'];
                echo "$page_title";
                ?>
            </div>


<!--CREATING IMAGE PLACEHOLDER BOX-->
            <div id="image">
                <?php
                    $persona_name = $_GET['persona_name'];
                    $sql = "SELECT TOP 1 photo FROM Persona WHERE persona_name = '$persona_name'";
                    $query = sqlsrv_query($conn, $sql);

                    while($result = sqlsrv_fetch_array($query, SQLSRV_FETCH_ASSOC))
                    {
                        echo '<img height="550" width="450" src="data:image/jpg;base64,' . base64_encode($result['photo'])  . '" >';
                        echo "<br/>";
                    }
                ?>
            </div>

<!--ADDING PERSONA LORE HERE -->
                <?php
                    //$special_case_check = 0;
                    $persona_name = $_GET['persona_name'];
                    $person_lore = "SELECT persona_lore FROM Persona WHERE persona_name = '$persona_name'";
                    $lore_query = sqlsrv_query($conn, $person_lore) or die(print_r(sqlsrv_errors(), true));

                    while( $rows = sqlsrv_fetch_array($lore_query,SQLSRV_FETCH_ASSOC)) {
                        echo $rows['persona_lore'];
                    }
                ?>

        <br><br><br>

<!--CREATING SKILLS TABLE HEADERS HERE-->
        <table class="fusion_tables">
            <thead>Persona Skills</thead>
            <tr>
                <th>Skill name</th>
                <th>Description</th>
                <th>Level Learned</th>
            </tr>
            <?php
            $persona_name = $_GET['persona_name'];
            $skill_sql = "SELECT m_name, m_descript, s_level FROM Persona_Data.dbo.Find_Skill('$persona_name')";
            $skill_query = sqlsrv_query($conn, $skill_sql) or die(print_r(sqlsrv_errors(), true));

            if (!isset($persona_name)) {
                echo "Setting Persona move did not work or is invalid";
                die(print_r(sqlsrv_errors(), true));
            }


            while( $rows = sqlsrv_fetch_array($skill_query,SQLSRV_FETCH_ASSOC)) {
                echo "<strong><tr><td>"
                    . $rows['m_name']. "</td><td>"
                    . $rows['m_descript']."</td><td>"
                    . $rows['s_level']."</td><td>
                        </strong</tr></td>";
            }

            ?>


        <br><br>

<!--CREATING FUSION RESULT TABLE HEADERS HERE -->




<!--CREATING SQL DATA INFO-->
                <?php
                //SQL FUNCTION USED TO HELP CALCULATE PERSONA FUSION.
                $persona_name = $_GET['persona_name'];
                $fusion_sql = "EXEC Persona_Data.dbo.Complete_Fusion_Chart '$persona_name'";
                $fusion_query = sqlsrv_query($conn, $fusion_sql) or die(print_r(sqlsrv_errors(), true));

                if (!isset($persona_name)) {
                    echo "Setting Persona name did not work or is invalid";
                    die(print_r(sqlsrv_errors(), true));
                }

                //SPECIAL FUSION STANDARD

                if ($persona_name == 'Alice' || $persona_name == 'Shiva' || $persona_name == 'Ardha'){

                    include 'standard_fusion.php';
                    if ($persona_name == 'Alice'){
                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Belial">'
                            ,'Belial',"</a></td><td>",
                        '<a href="details.php?persona_name=Nebiros">'
                        ,'Nebiros',"</a></td><td>
                        </strong</tr></td>";
                    }
                    else if ($persona_name == 'Shiva'){
                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Rangda">'
                        ,'Rangda',"</a></td><td>",
                        '<a href="details.php?persona_name=Barong">'
                        ,'Barong',"</a></td><td>
                        </strong</tr></td>";
                    }
                    else{
                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Shiva">'
                        ,'Shiva',"</a></td><td>",
                        '<a href="details.php?persona_name=Parvati">'
                        ,'Parvati',"</a></td><td>
                        </strong</tr></td>";
                    }
                }
                //SPECIAL FUSION TRIANGLE
                else if ($persona_name == 'Flauros' || $persona_name == 'Neko Shogun' || $persona_name == 'Bugs' ||
                $persona_name == 'Vasuki' || $persona_name == 'Black Frost' || $persona_name == 'Throne' ||
                    $persona_name == 'Ongyo-Ki' || $persona_name == 'Michael'){

                    include 'traingle_fusion.php';
                    if ($persona_name == 'Flaros'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Berith">'
                        ,'Berith',"</a></td><td>",
                        '<a href="details.php?persona_name=Andras">'
                        ,'Andras',"</a></td><td>",
                        '<a href="details.php?persona_name=Eligor">'
                        ,'Eligor',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Neko Shogun'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Kodama">'
                        ,'Kodama',"</a></td><td>",
                        '<a href="details.php?persona_name=Sudama">'
                        ,'Sudama',"</a></td><td>",
                        '<a href="details.php?persona_name=Anzu">'
                        ,'Anzu',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Bugs'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Pixie">'
                        ,'Pixie',"</a></td><td>",
                        '<a href="details.php?persona_name=Pisaca">'
                        ,'Pisaca',"</a></td><td>",
                        '<a href="details.php?persona_name=Hariti">'
                        ,'Hariti',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Vasuki'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Raga">'
                        ,'Raga',"</a></td><td>",
                        '<a href="details.php?persona_name=Raja%20Naga">'
                        ,'Raja Naga',"</a></td><td>",
                        '<a href="details.php?persona_name=Ananta">'
                        ,'Ananta',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Black Frost'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Jack%20Frost">'
                        ,'Jack Frost',"</a></td><td>",
                        '<a href="details.php?persona_name=PyroJack">'
                        ,'PyroJack',"</a></td><td>",
                        '<a href="details.php?persona_name=King%20Frost">'
                        ,'King Frost',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Throne'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Power">'
                        ,'Power',"</a></td><td>",
                        '<a href="details.php?persona_name=Melchizedek">'
                        ,'Melchizedek',"</a></td><td>",
                        '<a href="details.php?persona_name=Dominion">'
                        ,'Dominion',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Ongyo-Ki'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Kin-Ki">'
                        ,'Kin-Ki',"</a></td><td>",
                        '<a href="details.php?persona_name=Sui-Ki">'
                        ,'Sui-Ki',"</a></td><td>",
                        '<a href="details.php?persona_name=Fuu-Ki">'
                        ,'Fuu-Ki',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else{

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Raphael">'
                        ,'Raphael',"</a></td><td>",
                        '<a href="details.php?persona_name=Gabriel">'
                        ,'Gabriel',"</a></td><td>",
                        '<a href="details.php?persona_name=Uriel">'
                        ,'Uriel',"</a></td><td>
                        </strong</tr></td>";

                    }

                }
                //SPECIAL FUSION CROSS
                else if ($persona_name == 'Trumpeter' || $persona_name == 'Kohryu' || $persona_name == 'Asura'
                || $persona_name == 'Yoshitsune' || $persona_name == 'Seth'){

                    include 'cross_fusion.php';

                    if($persona_name == 'Trumpeter'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=White%20Rider">'
                        ,'White Rider',"</a></td><td>",
                        '<a href="details.php?persona_name=Red%20Rider">'
                        ,'Red Rider',"</a></td><td>",
                        '<a href="details.php?persona_name=Pale%20Rider">'
                        ,'Pale Rider',"</a></td><td>",
                        '<a href="details.php?persona_name=Black%20Rider">'
                        ,'Black Rider',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Kohryu'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Byakko">'
                        ,'Byakko',"</a></td><td>",
                        '<a href="details.php?persona_name=Genbu">'
                        ,'Genbu',"</a></td><td>",
                        '<a href="details.php?persona_name=Seiryu">'
                        ,'Seiryu',"</a></td><td>",
                        '<a href="details.php?persona_name=Suzaku">'
                        ,'Suzaku',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Asura'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Bishamonten">'
                        ,'Bishamonten',"</a></td><td>",
                        '<a href="details.php?persona_name=Koumokuten">'
                        ,'Koumokuten',"</a></td><td>",
                        '<a href="details.php?persona_name=Zouchouten">'
                        ,'Zouchouten',"</a></td><td>",
                        '<a href="details.php?persona_name=Jikokuten">'
                        ,'Jikokuten',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else{

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Isis">'
                        ,'Isis',"</a></td><td>",
                        '<a href="details.php?persona_name=Throth">'
                        ,'Throth',"</a></td><td>",
                        '<a href="details.php?persona_name=Anubis">'
                        ,'Anubis',"</a></td><td>",
                        '<a href="details.php?persona_name=Horus">'
                        ,'Horus',"</a></td><td>
                        </strong</tr></td>";

                    }

                }
                //SPECIAL FUSION PENTAGON
                else if ($persona_name == 'Yoshitsune' || $persona_name == 'Sraosha' || $persona_name == 'Chi You'){
                    include 'pentagon_fusion.php';

                    if ($persona_name == 'Yositsune'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Yatagarasu">'
                        ,'Yatagarasu',"</a></td><td>",
                        '<a href="details.php?persona_name=Futsunushi">'
                        ,'Futsunushi',"</a></td><td>",
                        '<a href="details.php?persona_name=Arahabaki">'
                        ,'Arahabaki',"</a></td><td>",
                        '<a href="details.php?persona_name=Okuninushi">'
                        ,'Okuninushi',"</a></td><td>",
                        '<a href="details.php?persona_name=Shiki-Ouji">'
                        ,'Shiki-Ouji',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Sraosha'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Mitra">'
                        ,'Mitra',"</a></td><td>",
                        '<a href="details.php?persona_name=Mithras">'
                        ,'Mithras',"</a></td><td>",
                        '<a href="details.php?persona_name=Melchizedek">'
                        ,'Melchizedek',"</a></td><td>",
                        '<a href="details.php?persona_name=Lilith">'
                        ,'Lilith',"</a></td><td>",
                        '<a href="details.php?persona_name=Gabriel">'
                        ,'Gabriel',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else{

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Hecatoncheires">'
                        ,'Hecatoncheires',"</a></td><td>",
                        '<a href="details.php?persona_name=White%20Rider">'
                        ,'White Rider',"</a></td><td>",
                        '<a href="details.php?persona_name=Thor">'
                        ,'Thor',"</a></td><td>",
                        '<a href="details.php?persona_name=Yoshitsune">'
                        ,'Yoshitsune',"</a></td><td>",
                        '<a href="details.php?persona_name=Cu%20Chulainn">'
                        ,'Cu Chulainn',"</a></td><td>
                        </strong</tr></td>";


                    }

                }
                //SPECIAL FUSION HEXAGON
                else if ($persona_name == 'Metatron' || $persona_name == 'Lucifer' || $persona_name == 'Satanael'){
                    include 'six_fusion.php';

                    if ($persona_name == 'Metatron'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Principality">'
                        ,'Principality',"</a></td><td>",
                        '<a href="details.php?persona_name=Power">'
                        ,'Power',"</a></td><td>",
                        '<a href="details.php?persona_name=Dominion">'
                        ,'Dominion',"</a></td><td>",
                        '<a href="details.php?persona_name=Melchizedek">'
                        ,'Melchizedek',"</a></td><td>",
                        '<a href="details.php?persona_name=Sandalphon">'
                        ,'Sandalphon',"</a></td><td>",
                        '<a href="details.php?persona_name=Michael">'
                        ,'Michael',"</a></td><td>
                        </strong</tr></td>";

                    }
                    else if ($persona_name == 'Lucifer'){

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Anubis">'
                        ,'Anubis',"</a></td><td>",
                        '<a href="details.php?persona_name=Ananta">'
                        ,'Ananta',"</a></td><td>",
                        '<a href="details.php?persona_name=Trumpeter">'
                        ,'Trumpeter',"</a></td><td>",
                        '<a href="details.php?persona_name=Metatron">'
                        ,'Metatron',"</a></td><td>",
                        '<a href="details.php?persona_name=Michael">'
                        ,'Michael',"</a></td><td>",
                        '<a href="details.php?persona_name=Satan">'
                        ,'Satan',"</a></td><td>
                        </strong</tr></td>";

                    }else{

                        echo "<strong><tr><td>",'<a href="details.php?persona_name=Arsene">'
                        ,'Arsene',"</a></td><td>",
                        '<a href="details.php?persona_name=Anzu">'
                        ,'Anzu',"</a></td><td>",
                        '<a href="details.php?persona_name=Ishtar">'
                        ,'Ishtar',"</a></td><td>",
                        '<a href="details.php?persona_name=Satan">'
                        ,'Satan',"</a></td><td>",
                        '<a href="details.php?persona_name=Lucifer">'
                        ,'Lucifer',"</a></td><td>",
                        '<a href="details.php?persona_name=Michael">'
                        ,'Michael',"</a></td><td>
                        </strong</tr></td>";

                    }

                    }
                else{
                    include 'standard_fusion.php';
                    while( $rows = sqlsrv_fetch_array($fusion_query,SQLSRV_FETCH_ASSOC)) {
                        echo "<strong><tr><td>",'<a href="details.php?persona_name='
                            .$rows['Primary_Name']. '">'.$rows['Primary_Name']."</a></td><td>",
                            '<a href="details.php?persona_name='
                            .$rows['Secondary_Name']. '">'.$rows['Secondary_Name']."</a></td><td>
                        </strong</tr></td>";
                    }
                }




                //DISPLAYS FUSION REQUIREMENTS TO SCREEN


                ?>

            </table>
        </div>
    </body>
</html>