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


<style type="text/css">
	#side-bar-wrap{

	}
	.sidepanel{
		position: fixed;
	    top: 0;
	    right: 0; 
	    bottom: 0;
	    overflow-y: auto;
	    transform: translateX(100%);
	    background: #fff;
	    max-width: 30rem;
	    width: calc(100% - 2.5rem);
	    padding: 25px 50px;
	    transition: transform .3s ease-in;
	    outline: none;
	}
	#side-bar-wrap.is-visible{
		transition-delay: 0s;
		background-color: rgba(29,29,29,.8);

		position: fixed;
		height: 100%;
	    left: 0;
	    top: 0;
	    transition: background-color .3s .2s;
	    width: 100%;
	    z-index: 100;
	}
	.is-visible .sidepanel {
	    transform: none;
	    transition-duration: .55s;
	    transition-timing-function: ease-out;
	    transition-delay: .2s;
	}
	.btn-close{
		width: 40px;
	    height: 40px;
	    text-align: center;
	    position: absolute;
	    top: 10px;
	    right: 0;
	    line-height: 40px;
	    cursor: pointer;
	    font-size: 20px;
	}
	.sidepanel-head h3{
		text-align: center;
		text-transform: uppercase;
	}
	.sp-product{
		float: left;
		margin: 15px 0;
	}
	.sp-product-left{
		width: 30%;
		float: left;
	}
	.sp-product-left img{
		width: 100%;
	}
	.sp-product-content{
		width: 70%;
		float: left;
		padding-top: 10px;
	}
	.sp-product-content h6, .sp-product-content p{
		margin-bottom: 0;
	}
	.sp-product-content .product-price{
		font-weight: bold;
	}
	.sidepanel-price{
		float: left;
    	width: 100%;
    	margin: 20px 0;
	}
	.sidepanel-price-box{
		background: #efefef;
		padding: 20px;
		font-size: 18px;
	    text-transform: uppercase;
	    font-weight: 600;
	    display: inline-block;
	    width: 100%;
	}
	.sidepanel-price-box span{
		display: inline-block;
	}
	.sidepanel-total{
		float: right;
	}

	.sidepanel-btn button{
		width: 100%;
		margin: 5px 0;
		text-transform: uppercase;
		font-size: 14px;
    	font-weight: 600;
	}
	.btn-continue{
		background: #fff;
		border: 1px solid #000;
		color: #000;
	}
	.btn-continue:hover{
		background: #ddd;
	}

</style>

<script type="text/javascript">
	jQuery(document).ready(function($){

		function updateCart(){
			$('.sidepanel-content').empty();
			var data = $.parseJSON($.cookie("product_cart"));
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
			var data = $.parseJSON($.cookie("product_cart"));
			var total = 0;
			$.each(data, function (index) {
				// console.log(data[index]['product_price']);
				var price = data[index]['product_price'];
				if(price == ''){
					price = 0;
				}
				total += parseFloat(price);
			});
			$('.sidepanel-total').text('$'+total);
		}

		$('.shopping-cart').click(function(){
			updatePrice();
			updateCart();
			$('#side-bar-wrap').addClass('is-visible');
			$('.is-visible .sidepanel').css('transform', 'none');
		});

		$('.btn-addBag').click(function(){

			var product_id 			= $(this).attr('data-id');
			var product_title 		= $(this).attr('data-title');
			var product_excerpt 	= $(this).attr('data-excerpt');
			var product_price 		= $(this).attr('data-price');
			var product_img 		= $(this).attr('data-img');

			// cookie product_cart not null
			if ($.cookie("product_cart") != null) {
				// prevert cookie json
				var product_cart = $.parseJSON($.cookie("product_cart"));
				// merge items to list
				product_cart.push(
				    { product_id, product_title,  product_excerpt, product_price, product_img }
				);
				// push cookie json list
				$.cookie("product_cart", JSON.stringify(product_cart));
				// console.log($.cookie("product_cart"));
			// cookie product_cart null
			}else{
				var product_cart = [
				   { product_id, product_title,  product_excerpt, product_price, product_img }
				];
				$.cookie("product_cart", JSON.stringify(product_cart));
				// console.log($.cookie("product_cart"));
			}
			updatePrice();
			updateCart();
			$('#side-bar-wrap').addClass('is-visible');
			$('.is-visible .sidepanel').css('transform', 'none');

		});


		$('.btn-close').click(function(){

			// $.removeCookie("product_cart");

			// var data = $.cookie("product_cart").split(",");

			// console.log($.cookie("product_cart"));


			$('.is-visible .sidepanel').css('transform', 'translateX(100%)');
			setTimeout(function(){
				$('#side-bar-wrap').removeClass('is-visible');
			},700);
		});


		// var data = $.parseJSON($.cookie("product_cart"));
		// $.each(data, function (index) {
		// 	console.log(data[index]['product_title']);
		// });
		// console.log(data);

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
					<button class="btn-checkout">Review Bag & Checkout</button>
					<button class="btn-continue">Continue shopping</button>
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

		<div class="shopping-cart">
			<span><i class="fa fa-shopping-bag"></i></span>
		</div>

	</header><!-- #masthead -->

	<?php

	/*
	 * If a regular post or page, and not the front page, show the featured image.
	 * Using get_queried_object_id() here since the $post global may not be set before a call to the_post().
	 */
	if ( ( is_single() || ( is_page() && ! twentyseventeen_is_frontpage() ) ) && has_post_thumbnail( get_queried_object_id() ) ) :
		echo '<div class="single-featured-image-header">';
		echo get_the_post_thumbnail( get_queried_object_id(), 'twentyseventeen-featured-image' );
		echo '</div><!-- .single-featured-image-header -->';
	endif;
	?>

	<div class="site-content-contain">
		<div id="content" class="site-content">
