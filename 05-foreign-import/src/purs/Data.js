// module Import.Data

exports.getValue = function(bool) {
  if (bool) {
    return {
      foo: 1,
      bar: "quux"
    };
  } else {
    return undefined;
  }
};
