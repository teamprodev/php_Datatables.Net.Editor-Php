<?php

// DataTables PHP library
include( "../../vendor/datatables.net/editor-php/DataTables.php" );

// Alias Editor classes so they are easy to use
use
	DataTables\Editor,
	DataTables\Editor\Field,
	DataTables\Editor\Format,
	DataTables\Editor\Mjoin,
	DataTables\Editor\Options,
	DataTables\Editor\Upload,
	DataTables\Editor\Validate,
	DataTables\Editor\ValidateOptions;

Editor::inst( $db, 'users' )
	->field( 
		Field::inst( 'users.first_name' ),
		Field::inst( 'users.last_name' ),
		Field::inst( 'users.phone' ),
		Field::inst( 'users.site' )
			->options( function($db) {
				return $db->select('sites', array('id', 'name', 'continent'))->fetchAll();
			} )
			->validator( Validate::dbValues(null, 'id', 'sites') ),
		Field::inst( 'sites.name' )
	)
	->leftJoin( 'sites', 'sites.id', '=', 'users.site' )
	->process($_POST)
	->json();
