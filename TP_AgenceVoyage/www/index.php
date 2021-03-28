<html>
<head>
    <meta charset="UTF-8">
    <title>Mon titre</title>
</head>
<body>

<?php 

    /*$db = new PDO('mysql:host=127.0.0.1;port=3306;charset=utf8;dbname=usal37_agence', 'root', '');

    $stmt = $db->query(
        "select * from cities"
    );

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo '<pre>';

    var_export($result);

    
    echo '</pre>';*/

    echo password_hash('azerty', PASSWORD_BCRYPT);
    echo '<br>';

    echo password_hash('azerty', PASSWORD_BCRYPT);
    echo '<br>';

    echo password_hash('azerty', PASSWORD_BCRYPT);
    echo '<br>';

    echo password_hash('azerty', PASSWORD_BCRYPT);
    echo '<br>';

    echo password_hash('azerty', PASSWORD_BCRYPT);
    echo '<br>';

?>

</body>
</html>
