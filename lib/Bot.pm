
use v6;

class Bot {
	has Str $.name;
	has Int $.x   = 0;
	has Int $.y   = 0;
	has Int $.direction = 0;
	
	method right(Int $degrees) {
		self.turn($degrees);
	}
	method left(Int $degrees) {
		self.turn(-$degrees);
	}

# make this method private?
	method turn(Int $degrees) {
		$!direction += $degrees;
		$!direction += 360 if $.direction < 0;
		$!direction -= 360 if $.direction > 360;
		return 1;
	}

	
	method go(Int $distance) {
		# trigonometry!
		$!x += int(sin(2 * pi * $.direction / 360) * $distance);
		$!y += int(cos(2 * pi * $.direction / 360) * $distance);
		return 1;
	}

}

