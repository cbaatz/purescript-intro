Extensible records
==================

PureScript has *extensible records* to represent JavaScript objects. We've
already seen examples of these, but it's worth looking at them and their types
in more detail.

### Example: Define and access members of a simple record

Extensible records are native to PureScript and defined using a similar syntax
to JavaScript:

```purescript
foo = { bar: "quux", baz: { a: 1, b: 2} }
```

PureScript lets you access members of a record using `.` notation:

    > foo.bar
    "quux"
    > foo.baz.a
    1

### Example: Specify a strict record type

The type for a record can be defined like this:

```purescript
type Foo = { bar :: String, baz :: { a :: Int, b :: Int } }
```

This type matches a record that has exactly the form specified -- a record
value that had an additional `c` member in the `baz` subrecord would not match
for example.

Note that even though the syntax looks similar to Haskell record syntax, it has
a different meaning. First of all, this is simply a type *alias*. Secondly, no
accessor functions (for `bar` and `baz` for example) are created.

### Example: Access record members

As we saw, we can use dot-notation to access record members:

```purescript
fullName person = person.firstName ++ " " ++ person.lastName
```

We can also use pattern matching to extract the members:

```purescript
fullName { firstName: a, lastName: b } = a ++ " " ++ b
```

### Example: Extensible record types

Let's say we define a function that expects a record and uses its members:

```purescript
fullName person = person.firstName ++ " " ++ person.lastName
```

We could give this a precise type:

```purescript
{ firstName :: String, lastName :: String } -> String
```

This would reject any person record that doesn't have *exactly* a first name
and a last name that are strings. Sometimes we'd like to say that that the
record must have *at least* `firstName :: String` and `lastName :: String` and
that's what *extensible* records allow us to do:

```purescript
fullName :: forall a. { firstName :: String, lastName :: String | a } -> String
```

That is also the type that PureScript infers for both the `fullName`
definitions in the example above.

The kind of record types
------------------------

`{ a :: String }` is actually syntactic sugar for `Object ( a :: String )`
where `Object` is a type constructor.

That looks a bit odd compared with what we're familiar with from Haskell. Most
type constructors have a kind that looks like `* -> *`, where `*` is a type.
That's not expressive enough for extensible records however, since `Object` can
be given a varying number of labelled types to construct a type. So what is the
kind of `Object`?

    > :k Object
    # * -> *

`#` is the kind constructor for a *row*. A row is an unordered set of labelled
fields. The `*` in `# *` indicates that the row fields are types. That means
`Object` is a type constructor that takes a row of labelled types and returns a
type. (Note that in GHC `#` instead denotes the kind for unboxed types.)

A function like `foo :: forall a. Object ( bar :: Int | a )` is said to be
polymorphic in the row `a` of record fields -- it can take any record type
whose row has at least a `bar :: Int`.
