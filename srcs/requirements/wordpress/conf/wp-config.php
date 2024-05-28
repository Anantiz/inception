<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'ABaGx{u-J86Dv8hIxYPut.6Zm;=);}h;;5Pdz-{tNro3vhl-Y7zFi1b;dlvdZjkE' );
define( 'SECURE_AUTH_KEY',   '4$F`k!d?L5,B-|phm&%L|DtlQ:ZuH#:Xx<3& GDt%kpn#),_%}h0e>u[vqa]+KS)' );
define( 'LOGGED_IN_KEY',     '&YyiXyRQ-~/ MsD,=2Kb,m!_ug.ifwu(7&7p0U` S !Vsb6c|sQ}V4mof,_D2.L_' );
define( 'NONCE_KEY',         '2@w<m,Ir98oZ3Q})FE|-i8 $!{XY_@GVm9S_B(T$|KpcZOQ>[}>Q>?|[zrhWxrfA' );
define( 'AUTH_SALT',         'W_QO`Jo.d2RLRevu:;nGSnF)5ReQur2{-BaO]){p>n#6<E]=ub&f,pF:,gQpF^E$' );
define( 'SECURE_AUTH_SALT',  'aaH$R/,`i=yK!K1]UpuZA;<wh,{}A[X+r L rz9`>OI0a`2Zb[o!x: j  L,1(! ' );
define( 'LOGGED_IN_SALT',    'W~eXf G+}@V([:iaRdaTAdx(>lMxo&wuW%e`n6VGdDf|=Eyb9xRMMJd&#B$X--3a' );
define( 'NONCE_SALT',        'm!FsSPTuv]qM(H*oDeRm`@LF|wWL@zypV4W8*&E.^>|hahRaTMH`msRMabUo|0NJ' );
define( 'WP_CACHE_KEY_SALT', '[c3Wx/PZvA[t:LBL]s_IdS?Nl]O(4$2YA1+aTOmz)+*ghdNaIBuSAE iOjp?mn#7' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', true );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';