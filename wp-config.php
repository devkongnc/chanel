<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'chanel');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'l98[0qc1b)!k7&h{l|^c=<jQ:=LEJwPPaTuNZ(Ps_^#<eC~oz/QmOZ,g+y>j[(+ ');
define('SECURE_AUTH_KEY',  'zfT.Nm<C4:g0:XZPWOrJFPh|`?]CnN9`hdB.D!~9<(}5M6ld!r3(0cmFpoy_HOl ');
define('LOGGED_IN_KEY',    'E_!!&|)t%y,ORl%xM-:EPmfZeVwakUU@J[||t6_0e>g`o2+Z .lj*SkZ&j!pfmE^');
define('NONCE_KEY',        'kvY.(gk=!S/Zes2kvPSbXAC:$D|PVguKyS7dkAS[v6Jv^AFUoP@>CMgx[u?uBlwd');
define('AUTH_SALT',        'QJ}QhqZWvIl$cX}s=K,Vu}6rfyzY)bl=WYYnDWp#NZ|f9{%Qh;;Po*3?`mxa|p@3');
define('SECURE_AUTH_SALT', 'l{WBgCV#X^XLie[}W%r-G,#vVI[_!aGj#.1EYk66(CZo-<Y5XrhhPC:HK>`/@)5#');
define('LOGGED_IN_SALT',   'Zm!vq*upTsM3G53;K7:JZvAT3iS`fLa&*s;IJM[`#DX2dc,l:2$xD>*HTe:S`}?i');
define('NONCE_SALT',       '_5O.Fy4=o9m 04Cuc(ooX%8oCjIjXI(-N3^p)f5YD),3*0ENt;LO?<L`<:kB[Le@');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'chanel_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);


/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
