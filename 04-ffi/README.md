Import functions
================

JavaScript functions can be imported and used from PureScript via the Foreign
Function Interface. This is done by writing special "foreign modules". A
foreign module is a CommonJS module that:

1. Includes a `// module ModuleName` line where `ModuleName` is the name of the
   module.
2. Has all its exports in the form `exports.name = value;`.

These are imported into a PureScript module and given a type using the special
`foreign import`. This is unsafe in the sense that you are responsible for the
function adhering to the type signature.

    foreign import name :: TheTypeSignature

Remember from before that we need to tell the compiler where to find these
files with the `--ffi` argument.

Example: Import simple value
----------------------------

Example: Import curried function
--------------------------------

Example: Import uncurried function
----------------------------------
