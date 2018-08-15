<?php

/* Template Name: Checkout */


include (dirname(__FILE__) . '/phpmailer6x/src/PHPMailer.php');
include (dirname(__FILE__) . '/phpmailer6x/src/Exception.php');
include (dirname(__FILE__) . '/phpmailer6x/src/OAuth.php');
include (dirname(__FILE__) . '/phpmailer6x/src/POP3.php');
include (dirname(__FILE__) . '/phpmailer6x/src/SMTP.php');
 
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(true);                              // Passing `true` enables exceptions

if  ( !empty($_POST['f_fullname']) && !empty($_POST['f_phone']) && !empty($_POST['f_email'] ) )
{
	try {
	    //Server settings
	    $mail->CharSet = 'UTF-8';
	    $mail->SMTPDebug = 0;                                 // Enable verbose debug output
	    $mail->isSMTP();                                      // Set mailer to use SMTP
	    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
	    $mail->SMTPAuth = true;                               // Enable SMTP authentication
	    $mail->Username = 'mailcontact315@gmail.com';         // SMTP username
	    $mail->Password = 'wrxwnkhqxurhxmpg';                 // SMTP password
	    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
	    $mail->Port = 587;                                    // TCP port to connect to
	 
	    //Recipients
	    $mail->setFrom($_POST['f_email'], $_POST['f_fullname']);
	    $mail->addAddress('kongnc1992@gmail.com', 'Chanel');     // Add a recipient

	    //Content
	    $mail->isHTML(true);                                  // Set email format to HTML
	    $mail->Subject = 'Giỏ hàng';
	    $content  = '<h3>Thông tin khách hàng</h3>';
	    $content .= '<p>Họ tên: '.$_POST['f_fullname'].'</p>';
	    $content .= '<p>Email: '.$_POST['f_email'].'</p>';
	    $content .= '<p>Điện thoại: '.$_POST['f_phone'].'</p>';
	    $content .= '<p>Lời nhắn: '.$_POST['f_message'].'</p>';

	    if(!empty($_POST['product'])){
	    	$content  .= '<h3>Thông tin sản phẩm</h3>';
			$product = $_POST['product'];
			foreach ($product as $key => $value) {
				$content .= '<p>Sản phẩm['.$key.']: '.$value.'</p>';
			}
		}

	    $mail->Body    = $content;
	 
	    $mail->send();
	    echo 'Success';
	} catch (Exception $e) {
	    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
	}
}else{
	echo 'Data null';
}

?>