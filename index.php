<?php
    //import
    include_once "Adatbazis.php"
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magyar kártya</title>
</head>
<body>
    <?php
        $adatbazis = new Adatbazis();
        //lekérdezések:
        /* $matrix = $adatbazis->adatLeker("kep", "szin");
        $adatbazis->megjelenit($matrix); */
        //modosit($tabla, $oszlop, $regiErtek, $ujErtek)
        $adatbazis->modosit("szin", "nev", "green", "zold");
        //torles($tabla, $oszlop, $ertek)
        $adatbazis->torles("szin", "nev", "zold");
        $matrix = $adatbazis->adatLeker2("nev","kep", "szin");
        $adatbazis->megjelenit2($matrix);
        if($adatbazis->rekordokSzama("kartya") == 0){
            $adatbazis->kartyaFeltolt();
        }
        
        $adatbazis->kapcsolatBezar();
    ?>
    
</body>
</html>