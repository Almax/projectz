<!-- TITLE/ -->

# ambi

<!-- /TITLE -->


<!-- BADGES/ -->

<a href="https://npmjs.org/package/ambi" title="View this project on NPM"><img src="https://img.shields.io/npm/v/ambi.svg" alt="NPM version" /></a>
<a href="https://npmjs.org/package/ambi" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/ambi.svg" alt="NPM downloads" /></a>
<a href="http://waffle.io/bevry/ambi" title="View this project's stories on Waffle.io"><img src="https://badge.waffle.io/bevry/ambi.png?label=ready" alt="Stories in Ready" /></a>
<a href="https://coveralls.io/r/bevry/ambi" title="View this project's coverage on Coveralls"><img src="https://img.shields.io/coveralls/bevry/ambi.svg" alt="Coverage Status" /></a><br/>
<a href="https://www.gratipay.com/bevry/" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/gratipay/bevry.svg" alt="Gratipay donate button" /></a>
<a href="http://flattr.com/thing/344188/balupton-on-Flattr" title="Donate monthly to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6" title="Donate once-off to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a>
<a href="http://amzn.com/w/2F8TXKSNAFG4V" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a>

<!-- /BADGES -->


<!-- DESCRIPTION/ -->

Execute a function ambidextrously (normalizes the differences between synchronous and asynchronous functions). Useful for treating synchronous functions as asynchronous functions (like supporting both synchronous and asynchronous event definitions automatically).

<!-- /DESCRIPTION -->


## Usage

### Example

``` javascript
// Import
var ambi = require('ambi');
var result;

// Sample methods
var syncMethod = function(x,y){
	return x*y;
};
var asyncMethod = function(x,y,next){
	return setTimeout(function(){
		next(null,x*y);
	},0);
};

// Call the synchronous function asynchronously
result = ambi(syncMethod, 5, 2, function(err,result){ // ambi adds support for this asynchronous callback automatically
	console.log(err, result); // null, 10
});
console.log(result); // 10 - just like normal

// Call the asynchronous function asynchronously
result = ambi(asyncMethod, 5, 2, function(err,result){ // ambi doesn't do anything special here
	console.log(err, result); // null, 10
});
console.log(result); // setTimeout - just like normal
```

### Notes

- Ambi accepts the arguments `(method, args...)`
	- `method` is the function to execute
	- `args...` is the arguments to send to the method
		- the last argument is expected to be the completion callback
		- the completion callback is optional, but if defined, is expected to have the signature of `(err, results...)`
- If the method has the same amount of arguments as those ambi received, then we assume it is an asynchronous method and let it handle calling of the completion callback itself
- If the method does not have the same amount of arguments as those ambi received, then we assume it is a synchronous method and we'll call the completion callback ourselves
	- If the synchronous method throws an error or returns an error, we'll try to call the completion callback with a single `err` argument
	- If the synchronous method executes without error, we'll try to call the completion callback with a `err` argument equal to null, and a `result` argument equal to the returned result of the synchronous method
- Ambi can also introspect a different method than the one it fires, by passing `[methodToFire, methodToIntrospect]` as the `method` argument



<!-- INSTALL/ -->

## Install



### [NPM](http://npmjs.org/)
- Use: `require('ambi')`
- Install: `npm install --save ambi`

### [Browserify](http://browserify.org/)
- Use: `require('ambi')`
- Install: `npm install --save ambi`
- CDN URL: `//wzrd.in/bundle/ambi@2.1.4`

### [Ender](http://enderjs.com)
- Use: `require('ambi')`
- Install: `ender add ambi`

### [Bower](http://bower.io/)
- Use: `require('ambi')`
- Install: `bower install ambi`

<!-- /INSTALL -->


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/undefined/ambi/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/undefined/ambi/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/ambi/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/ambi">view contributions</a></li></ul>

### Sponsors

No sponsors yet! Will you be the first?

<a href="https://www.gratipay.com/bevry/" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/gratipay/bevry.svg" alt="Gratipay donate button" /></a>
<a href="http://flattr.com/thing/344188/balupton-on-Flattr" title="Donate monthly to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6" title="Donate once-off to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a>
<a href="http://amzn.com/w/2F8TXKSNAFG4V" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a>

### Contributors

These amazing people have contributed code to this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/bevry/ambi/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository bevry/ambi">view contributions</a></li>
<li><a href="www.seanfridman.com">Sean Fridman</a> — <a href="https://github.com/bevry/ambi/commits?author=sfrdmn" title="View the GitHub contributions of Sean Fridman on repository bevry/ambi">view contributions</a></li></ul>

[Become a contributor!](https://github.com/undefined/ambi/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

<ul><li>Copyright &copy; <a href="http://bevry.me">Bevry Pty Ltd</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li>
<li>and</li>
<li><a href="http://spdx.org/licenses/CC-BY-4.0.html">Creative Commons Attribution 4.0</a></li></ul>

<!-- /LICENSE -->


