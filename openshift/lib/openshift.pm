package openshift;
use HTML::ContentExtractor;
use LWP::UserAgent;
use Regexp::Common qw /URI/;
use Dancer ':syntax';

our $VERSION = '0.2';

get '/' => sub {
    template 'index';
};

get '/extract' => sub {
    my $extractor = HTML::ContentExtractor->new;
    my $agent = LWP::UserAgent->new;

    my $url = params->{'url'};

    if ($url =~ /$RE{URI}{HTTP}/) {
        my $res = $agent->get($url);
        my $HTML = $res->decoded_content();
        $extractor->extract($url, $HTML);
        return $extractor->as_html();
    }
    return 'Error fetching url';
};

get '/test' => sub {
    use Data::Dumper;
    return Dumper request;
};

true;
