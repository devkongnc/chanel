<?php
/* Template Name: Cart */

get_header();
?>
<div class="page-section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div id="cart-wrap">
					<h3 class="page-title">Your Order</h3>
					<div id="cart-product">
					<!-- append text -->
					</div>
					<div class="cartpage-sub-price">
						<div class="cartpage-price-box">
							<span>Subtotal</span>
							<span class="cartpage-subtotal">$0</span>
						</div>
						<div class="cartpage-price-box">
							<span>Shipping fee</span>
							<span class="cartpage-shippingfee">_ _</span>
						</div>
						<div class="cartpage-price-box">
							<span>Total</span>
							<span class="cartpage-total">$0</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="checkout-form-wrap">
					<h3 class="page-title">Your Infomation</h3>
					<form id="contact-form">
						<div class="input-product"></div>
						<div class="form-group">
							<input type="text" name="f_fullname" class="f_fullname form-control" placeholder="Họ & tên" required="">
						</div>
						<div class="form-group">
							<input type="tel" name="f_phone" class="f_phone form-control" placeholder="Số điện thoại" required="">
						</div>
						<div class="form-group">
							<input type="email" name="f_email" class="f_email form-control" placeholder="Email" required="">
						</div>
						<div class="form-group">
							<textarea name="f_message" class="form-control" rows="4" placeholder="Lời nhắn"></textarea>
						</div>
						<div class="form-group err_message" style="display: none; color: red">
							<p>Vui lòng nhập đầy đủ thông tin trước khi xác nhận!</p>
						</div>
						<button id="btn-submit" type="button" name="submit" class="btn btn-dark">Xác nhận</button>
					</form>
				</div>	
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	jQuery(document).ready(function($){

		function show_mess_success() {
			$('#mess-waiting').hide(); // hide waiting text
			$('#loader').hide(); // hide loading icon
			$('#mess-success').show(); // show mess success
		}

		$('#btn-submit').click(function(){
			if ($('.f_fullname').val() != '' && $('.f_phone').val() != '' && $('.f_email').val() != '') {
				$('.popup-mess').show();

				var datapost = $('#contact-form').serialize();
				$.ajax({
					type: "POST",
					url: "<?php echo get_stylesheet_directory_uri();?>/checkout.php",
					data: datapost,

					success: function(result) {
						console.log(result);
						if(result == 'Success'){
							removeCarts();
							show_mess_success();
						}
					}
				});
			}else{
				$('.err_message').show();
				setTimeout(function(){
					$('.err_message').hide();
				}, 3000);
				return false;
			}
		});

		function updateCart(){
			$('#cart-product').empty();
			var data = JSON.parse($.cookie("product_cart"));
			// console.log(data);
			$.each(data, function (index) {
				// console.log(data[index]['product_title']);
				$('#cart-product').prepend(
					'<div class="sp-product">'+
						'<div class="sp-product-left">'+
							'<img src="'+data[index]["product_img"]+'" alt="">'+
						'</div>'+
						'<div class="sp-product-content">'+
							'<h6>'+data[index]["product_title"]+'</h6>'+
							data[index]["product_excerpt"]+
							'<p class="product-price">$'+data[index]["product_price"]+'</p>'+
							'<span class="product-remove" value="'+index+'" title="Remove"><i class="flaticon-empty-cart"></i></span>'+
						'</div>'+
					'</div>'
				);
			});
		}

		function updatePrice(){
			var data = JSON.parse($.cookie("product_cart"));
			var subtotal = 0;
			$.each(data, function (index) {
				var price = data[index]['product_price'];
				if(price == ''){
					price = 0;
				}
				subtotal += parseFloat(price);
			});
			$('.cartpage-subtotal').text('$'+subtotal);
			$('.cartpage-total').text('$'+subtotal);
		}

		function removeCartItem(index){
			var data = JSON.parse($.cookie("product_cart"));
		  	data.splice(index,1);
		  	$.cookie("product_cart", JSON.stringify(data), { expires: 365, path: '/chanel' });
		}

		function removeCarts(){
			// $.cookie("product_cart", null, { expires: 365, path: '/chanel' });
			$.removeCookie('product_cart', { expires: 365, path: '/chanel' });
		}


		$('#cart-product').delegate('.sp-product .product-remove', 'click', function(){
			try{
				var index = $(this).attr('value');
				removeCartItem(index);
				updateCart();
				updatePrice();

				$('.input-product').empty();
				var data = JSON.parse($.cookie("product_cart"));
				if (data['length'] > 0) {
					$.each(data, function (index) {
						$('.input-product').prepend(
						'<input type="hidden" name="product[]" value="'+data[index]["product_title"]+'">');
					});
				}
			}catch(err){
				console.log(err);
			}
		});

		if ($.cookie("product_cart")) {
			updatePrice();
			updateCart();
		}

		if ($.cookie("product_cart")) {
			var data = JSON.parse($.cookie("product_cart"));
			if (data['length'] > 0) {
				$.each(data, function (index) {
					// console.log(data[index]['product_title']);
					$('.input-product').prepend(
						'<input type="hidden" name="product[]" value="'+data[index]["product_title"]+'">');
				});
			}
		}
	});
</script>


<style type="text/css">
	.popup-mess{
		background-color: rgba(29,29,29,.8);
	    position: fixed;
	    height: 100%;
	    left: 0;
	    top: 0;
	    width: 100%;
    	z-index: 100;
    	display: none;
	}
	.popup-mess-wrap{
		width: 640px;
		min-height: 300px;
	    margin: 0 auto;
	    margin-top: 10%;
	    position: relative;
	    background: #fff;
	}
	#mess-waiting, #mess-success{text-align: center; padding: 30px}
	#loader {
		position: absolute;
		left: 45%;
		top: 50%;
		z-index: 1;
		border: 16px solid #f3f3f3;
		border-radius: 50%;
		border-top: 16px solid #3498db;
		width: 70px;
		height: 70px;
		-webkit-animation: spin 2s linear infinite;
		animation: spin 2s linear infinite;
	}

	@-webkit-keyframes spin {
		0% { -webkit-transform: rotate(0deg); }
		100% { -webkit-transform: rotate(360deg); }
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

	/* Add animation to "page content" */
	.animate-bottom {
		position: relative;
		-webkit-animation-name: animatebottom;
		-webkit-animation-duration: 1s;
		animation-name: animatebottom;
		animation-duration: 1s
	}

	@-webkit-keyframes animatebottom {
		from { bottom:-100px; opacity:0 } 
		to { bottom:0px; opacity:1 }
	}

	@keyframes animatebottom { 
		from{ bottom:-100px; opacity:0 } 
		to{ bottom:0; opacity:1 }
	}

	@media (max-width: 767px){
		.popup-mess-wrap{
			width: 350px;
		}
	}
	@media (max-width: 374px){
		.popup-mess-wrap{
			width: 100%;
		}
	}

</style>

<?php get_footer(); ?>

<div class="popup-mess">
	<div class="popup-mess-wrap">
		<div style="display:block;" id="loader"></div>
		<div style="display:block;" id="mess-waiting">
		  <h2>Xin chào!</h2>
		  <p>Yêu cầu của quý khách đang được sử lý. Vui lòng chờ đợi trong giây lát..</p>
		</div>
		<div style="display:none;" id="mess-success" class="animate-bottom">
		  <h2>Tada!</h2>
		  <p>Yêu cầu của quý khách đã được gửi đến bộ phận chăm sóc khách hàng. Chúng tôi sẽ liên hệ với quý khách trong thời gian sớm nhất có thể.</p>
		  <p>Vui lòng nhấn nút [ tiếp tục ] hoặc đợi trong giây lát để tiếp tục mua sắm.</p>
		  <a href="<?php echo site_url(); ?>" class="btn btn-dark" style="color: #fff !important">Tiếp tục</a>
		</div>
	</div>
</div>