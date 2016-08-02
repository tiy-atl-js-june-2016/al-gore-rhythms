var fib = function (n) {
  if (n == 1 || n == 0) {
    return n;
  } else {
    return fib(n-1) + fib(n-2);
  }
};

var fastFib = function (n) {
  return fibIter(1, 0, n);
};

var fibIter = function (a, b, count) {
  if (count == 1) {
    return a;
  } else {
    return fibIter(a + b, a, count - 1);
  }
};

Function.prototype.memoize = function(){
  var self = this, cache = {};
  return function( arg ){
    if(arg in cache) {
      return cache[arg];
    } else {
      return cache[arg] = self( arg );
    }
  };
};

var memoizedFib = fib.memoize();
var otherMemoFib = fib.memoize();

