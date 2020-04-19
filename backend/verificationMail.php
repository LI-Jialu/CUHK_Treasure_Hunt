<?php
    
// Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader
require 'vendor/autoload.php';

// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);


    
try {
    
    // Get username, student ID and verification code
    $username = $_POST['username'];
    $sid = $_POST['sid'];
    $code = $_POST['code'];
    
    if (empty($username) || empty($sid) || empty($code)){
        echo 'fail';
        die();
    }
    
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_OFF;                      // Enable verbose debug output
    $mail->isSMTP();                                            // Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
    $mail->Username   = 'treasurehunt.cuhk@gmail.com';                     // SMTP username
    $mail->Password   = '';                               // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
    $mail->Port       = 587;                                    // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

    //Recipients
    $mail->setFrom('treasurehunt.cuhk@gmail.com', 'Treasure Hunt');
    $address = "{$sid}@link.cuhk.edu.hk";
    $mail->addAddress($address);     // Add a recipient

    // Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = 'Treasure Hunt Email Verification';
    $body = "<h>Dear {$username},</h><p>Your verification number is {$code}.</p><p>Treasure Hunt Team</p>";
    $mail->Body    = $body;

    $mail->send();
    echo 'success';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}

?>
