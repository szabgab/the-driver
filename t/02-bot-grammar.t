use v6;

BEGIN {	@*INC.unshift('lib'); }
# assume PERL6LIB to point to RAKUDO_DIR 
use Test;

plan 1;

use Bot::Grammar;
ok(1);

Bot::Grammar.parse('');
ok(!$/, 'empty string is not a program');

#Bot::Grammar.parse('abc');
#say $/;

Bot::Grammar.parse('GO 100;');
say $/<statement>;
#say $/<param>;

#Bot::Grammar.parse('LEFT 20');
#Bot::Grammar.parse('RIGHT 30');

#Bot::Grammar.parse('GO;'); #missing param
