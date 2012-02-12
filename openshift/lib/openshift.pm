package openshift;
use strict;
use HTML::ContentExtractor;
use LWP::UserAgent;
use Regexp::Common qw /URI/;
use HTML::ResolveLink;
use Dancer ':syntax';

our $VERSION = '0.3';

get '/' => sub {
    template 'index';
};

get '/extract' => sub {
    my $extractor = HTML::ContentExtractor->new;
    my $agent = LWP::UserAgent->new;

    my $url = params->{'url'};

    if ($url =~ /$RE{URI}{HTTP}/) {
        my $base = request->uri_base;
        my $res = $agent->get($url);
        $extractor->extract($url, $res->decoded_content());
        my $html = $extractor->as_html();
        # make relative links absolute
        my $resolver = HTML::ResolveLink->new(base => $url);
        return $resolver->resolve($html);
    }
    return 'Error fetching url';
};

get '/test' => sub {
    use Data::Dumper;
    return Dumper request;
};

true;
