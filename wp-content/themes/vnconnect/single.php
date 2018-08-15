<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package WordPress
 * @subpackage Twenty_Seventeen
 * @since 1.0
 * @version 1.0
 */

get_header(); ?>

<style type="text/css">
	.product-slider{
		text-align: center;
	}
	.product-slider img{
		width: 300px;
	}
	.product-content{
		padding-top: 25px;
	    border-top: 1px solid #efefef;
	    margin-top: 50px;
	}
	.product-title{
		text-align: center;
	}
	@media (min-width: 1024px){
		.container{
			width: 1024px;
		}
	}
	@media (max-width: 767px){
		.product-title{
			font-size: 24px;
			text-align: center;
		}
	}
</style>

<div class="section-wrap">
	<?php while ( have_posts() ) : the_post(); /* Start the Loop */ ?>	
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<div class="product-slider">
						<?php
						if ( has_post_thumbnail() ) :
							echo the_post_thumbnail();
						endif;
						?>
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="product-sidebar">
						<a href="<?php echo get_permalink(); ?>">
							<h3><?php echo the_title(); ?></h3>
							<?php echo the_excerpt(); ?>
						</a>
						<p>
							<?php echo '$'.get_field('price'); ?>		
						</p>
						<button class="btn-addBag" data-id="<?php echo $post->ID; ?>" data-title="<?php echo the_title(); ?>" data-excerpt="<?php echo the_excerpt(); ?>" data-img="<?php echo get_the_post_thumbnail_url(); ?>" data-price="<?php echo get_field('price'); ?>">
								ADD TO BAG
						</button>
					</div>
				</div>
				<div class="col-xs-12 col-md-12">
					<div class="product-content">
						<h3 class="product-title">PRODUCT DESCRIPTION</h3>
						<?php the_content(); ?>
					</div>
				</div>
			</div>
		</div>
	<?php endwhile; /* End of the Loop */ ?>
</div>

<?php get_footer();
