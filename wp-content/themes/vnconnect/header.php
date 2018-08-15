<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WordPress
 * @subpackage Twenty_Seventeen
 * @since 1.0
 * @version 1.0
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js no-svg">
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">

<?php wp_head(); ?>

<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/css/bootstrap.min.css">
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/fonts/flaticon/flaticon.css"> 
<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/css/cart.css"> 


<script type="text/javascript">
	jQuery(document).ready(function($){

		// var data = JSON.parse($.cookie("product_cart"));
		// console.log(data['length']);

		function updateSidepanelCart(){
			$('.sidepanel-content').empty();
			var data = JSON.parse($.cookie("product_cart"));
			$.each(data, function (index) {
				// console.log(data[index]['product_title']);
				$('.sidepanel-content').prepend(
					'<div class="sp-product">'+
						'<div class="sp-product-left">'+
							'<img src="'+data[index]["product_img"]+'" alt="">'+
						'</div>'+
						'<div class="sp-product-content">'+
							'<h6>'+data[index]["product_title"]+'</h6>'+
							data[index]["product_excerpt"]+
							'<p class="product-price">$'+data[index]["product_price"]+'</p>'+
						'</div>'+
					'</div>'
				);
			});
		}

		function updatePrice(){
			var data = JSON.parse($.cookie("product_cart"));
			var total = 0;
			$.each(data, function (index) {
				var price = data[index]['product_price'];
				if(price == ''){
					price = 0;
				}
				total += parseFloat(price);
			});
			$('.sidepanel-total').text('$'+total);
		}

		$('.shopping-cart').click(function(){
			if ($.cookie("product_cart") != null) {
				updatePrice();
				updateSidepanelCart();
			}
			$('#side-bar-wrap').addClass('is-visible');
			$('.is-visible .sidepanel').css('transform', 'none');
		});

		$('.btn-addBag').click(function(){

			var product_id 			= $(this).attr('data-id');
			var product_title 		= $(this).attr('data-title');
			var product_excerpt 	= $(this).attr('data-excerpt');
			var product_price 		= $(this).attr('data-price');
			var product_img 		= $(this).attr('data-img');

			if ($.cookie("product_cart")) {
				// prevert cookie json
				var product_cart = JSON.parse($.cookie("product_cart"));
				// cookie product_cart not null
				if (product_cart['length'] > 0) {

					// merge items to list
					product_cart.push(
					    { product_id, product_title,  product_excerpt, product_price, product_img }
					);

					// push cookie json list
					$.cookie("product_cart", JSON.stringify(product_cart), { expires: 365, path: '/chanel' });

				// cookie product_cart null
				}else{
					var product_cart = [
					   { product_id, product_title,  product_excerpt, product_price, product_img }
					];
					$.cookie("product_cart", JSON.stringify(product_cart), { expires: 365, path: '/chanel' });
				}

			}else{
				var product_cart = [
				   { product_id, product_title,  product_excerpt, product_price, product_img }
				];
				$.cookie("product_cart", JSON.stringify(product_cart), { expires: 365, path: '/chanel' });
			}

			updatePrice();
			updateSidepanelCart();
			$('#side-bar-wrap').addClass('is-visible');
			$('.is-visible .sidepanel').css('transform', 'none');

		});


		$('.btn-close').click(function(){
			// $.removeCookie("product_cart");
			$('.is-visible .sidepanel').css('transform', 'translateX(100%)');
			setTimeout(function(){
				$('#side-bar-wrap').removeClass('is-visible');
			},700);
		});

	});
</script>

</head>

<body <?php body_class(); ?>>
<div id="page" class="site">

	<div id="side-bar-wrap">
		<div class="sidepanel">
			<span class="btn-close"><i class="fa fa-times"></i></span>
			<div class="sidepanel-cart">
				<div class="sidepanel-head">
					<h3>Shopping Bag</h3>
				</div>
				<div class="sidepanel-content"></div>
				<div class="sidepanel-price">
					<div class="sidepanel-price-box">
						<span>Subtotal</span>
						<span class="sidepanel-total">$0</span>
					</div>
				</div>
				<div class="sidepanel-shipping-promotion">
					<p>Your order qualifies for complimentary shipping</p>
				</div>
				<div class="sidepanel-btn">
					<a class="btn-btnBlack btn-checkout" href="<?php echo esc_url(get_page_link(50)); ?>">Review Bag & Checkout</a>
					<a class="btn-btnBlack btn-continue" href="<?php echo site_url(); ?>">Continue shopping</a>
				</div>
			</div>
		</div>
	</div>

	<header id="masthead" class="site-header" role="banner">

		<?php get_template_part( 'template-parts/header/header', 'image' ); ?>

		<?php if ( has_nav_menu( 'top' ) ) : ?>
			<div class="navigation-top">
				<div class="wrap">
					<?php get_template_part( 'template-parts/navigation/navigation', 'top' ); ?>
				</div><!-- .wrap -->
			</div><!-- .navigation-top -->
		<?php endif; ?>

		<div class="header-control">
			<span>
				<i class="flaticon-keyword-search"></i>
			</span>
			<span>
				<i class="flaticon-support"></i>
			</span>
			<span>
				<i class="flaticon-truck"></i>
			</span>
			<span class="shopping-cart">
				<i class="flaticon-shopping-bag"></i>
			</span>
		</div>

	</header><!-- #masthead -->

	<div class="site-content-contain">
		<div id="content" class="site-content">
