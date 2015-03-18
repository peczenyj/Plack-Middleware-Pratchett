package Plack::Middleware::GNUTerryPratchett;

# ABSTRACT: Adds automatically an X-Clacks-Overhead header.

use strict;
use warnings;
use Plack::Util;

our $VERSION = '0.01';

use parent qw/Plack::Middleware/;

sub call {
  my $self = shift;
  my $res  = $self->app->(@_);  

  $self->response_cb( 
    $res, 
    sub {   
      my $res     = shift;
      my $headers = $res->[1]; 
      return if ( Plack::Util::header_exists( $headers, 'X-Clacks-Overhead' ) );
      Plack::Util::header_set( $headers, 'X-Clacks-Overhead', 'GNU Terry Pratchett' );
      return;
    }
  );
}

1;
