{ name = "tagged"
, dependencies =
    [ "control"
    , "foldable-traversable"
    , "identity"
    , "invariant"
    , "newtype"
    , "prelude"
    , "profunctor"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
