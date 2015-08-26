"use strict";

// module Import.Function

exports.multiplyCurried = function(a) {
  return function(b) {
    return a * b;
  };
};

exports.multiplyUncurried = function(a, b) {
  return a * b;
};
