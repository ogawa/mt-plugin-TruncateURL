# MTTruncateURL plugin by Hirotaka Ogawa (http://as-is.net/blog/)
#
# Release 0.01 (Sep 29, 2004)
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2004 Hirotaka Ogawa

use strict;
use MT::Template::Context;
use MT::ConfigMgr;

if (MT->can('add_plugin')) {
    require MT::Plugin;
    my $plugin = new MT::Plugin();
    $plugin->name("MTTruncateURL Plugin, v.0.01");
    $plugin->description("Truncate URL Plugin");
    $plugin->doc_link("http://as-is.net/blog/archives/000915.html");
    MT->add_plugin($plugin);
}
MT::Template::Context->add_container_tag(TruncateURL => \&truncate_url);

sub truncate_url {
    my ($ctx, $args, $cond) = @_;
    my ($base_url, $path);
    my $RE = '<[^>]+\s(src|href|action)\s*=\s*\"';
    defined(my $html = $ctx->stash('builder')->build($ctx, $ctx->stash('tokens'), $cond)) or return;
    defined(my $site_url = $ctx->stash('blog')->site_url) or return;
    $site_url .= '/' unless $site_url =~ m!/$!;
    if ($site_url =~ m!^(https?://[^/]+)(/.*)$!) {
	$base_url = $1;
	$path = $2;
	$html =~ s/($RE)$site_url/$1$path/g;
    }
    if (defined $base_url) {
	defined(my $cgi_url = MT::ConfigMgr->instance->CGIPath) or return $html;
	$cgi_url .= '/' unless $cgi_url =~ m!/$!;
	if ($cgi_url =~ m!^$base_url(/.*)$!) {
	    $path = $1;
	    $html =~ s/($RE)$cgi_url/$1$path/g;
	}
	defined(my $sta_url = MT::ConfigMgr->instance->StaticWebPath) or return $html;
	$sta_url .= '/' unless $sta_url =~ m!/$!;
	if ($sta_url =~ m!^$base_url(/.*)$!) {
	    $path = $1;
	    $html =~ s/($RE)$sta_url/$1$path/g;
	}
    }
    return $html;
}
