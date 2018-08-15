<?php
/**
 * The front page template file
 *
 * If the user has selected a static page for their homepage, this is what will
 * appear.
 * Learn more: https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WordPress
 * @subpackage Twenty_Seventeen
 * @since 1.0
 * @version 1.0
 */

get_header(); ?>

<div class="home-banner-wrap">
	<picture>
		<source media="(min-width: 640px)" srcset="<?php echo get_stylesheet_directory_uri(); ?>/assets/images/banner/banner.png">
  		<img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/images/banner/banner-drop.png" alt="banner" style="width:auto;">
	</picture>
</div>

<div class="home-product-wrap">
	<div class="container">
		<div class="row">
			<?php $data = new WP_Query( array( 'post_type' => 'product' ) ); ?>
			<?php if($data->have_posts()) : ?>
				<?php while ( $data->have_posts() ) : $data->the_post(); ?>
					<div class="col-md-4">
						<div class="product-box">
							<a href="<?php echo get_permalink(); ?>">
								<div class="product-img"><?php echo the_post_thumbnail(); ?></div>
								<h3><?php echo the_title(); ?></h3>
								<?php echo the_excerpt(); ?>
							</a>
							<p>
								<?php
								if(!empty(get_field('price'))):
									echo '$'.get_field('price');
								else :
									echo '0';
								endif;
								?>		
							</p>
							<button class="btn-addBag" data-id="<?php echo $post->ID; ?>" data-title="<?php echo the_title(); ?>" data-excerpt="<?php echo the_excerpt(); ?>" data-img="<?php echo get_the_post_thumbnail_url(); ?>" data-price="<?php echo get_field('price'); ?>">
								ADD TO BAG
							</button>
						</div>
					</div>
				<?php endwhile; ?>
				<?php //echo do_shortcode('[ajax_pagination post_type="product" posts_per_page="2" paged="1"]'); ?>
			<?php endif; ?>
		</div>
	</div>
</div>

<style type="text/css">
	.product-box{
		text-align: center;
	}
	.product-box h3{
		padding-top: 0;
		font-size: 16px;
	}
</style>

<?php get_footer();
