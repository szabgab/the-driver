use v6;

BEGIN {	@*INC.unshift('lib'); }
# assume PERL6LIB to point to RAKUDO_DIR 
use Test;

plan 21;

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

ok($bot.go(20), 'can go 20');
is($bot.x, 0, 'x is 0') or diag($bot.x);
is($bot.y, 20, 'y is 20') or diag($bot.y);

ok($bot.right(100), 'can turn right 100');
is($bot.direction, 100, 'turned right 100');
ok($bot.left(10), 'can turn left 10');
is($bot.direction, 90, 'correctly in 90');

ok($bot.go(20), 'can go 20');
is($bot.x, 20, 'x is 20') or diag($bot.x);
is($bot.y, 20, 'y is 20') or diag($bot.y);

