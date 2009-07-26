use v6;

BEGIN {	@*INC.unshift('lib'); }
# assume PERL6LIB to point to RAKUDO_DIR 
use Test;

plan 11;

use Bot;

my $bot = Bot.new(name => 'Foo Bar');

isa_ok($bot, 'Bot');

is($bot.name, 'Foo Bar', 'name');
is($bot.x,    0, 'x defaults to 0');
is($bot.y,    0, 'y defaults to 0');
is($bot.direction,  0, 'direction defaults to 0');

eval_dies_ok('$bot.x = 23;', 'cannot assign to x directly');


my $anna = Bot.new(name => 'Anna', x => 20, y => 30, direction => 90);
isa_ok($anna,  'Bot',   'Anna Bot');
is($anna.name, 'Anna',  'name of Anna');
is($anna.x,    20,      'x of Anna');
is($anna.direction, 90, 'direction of Anna');


eval_dies_ok('Bot.new(direction => "abc")', 'direction is a number');
