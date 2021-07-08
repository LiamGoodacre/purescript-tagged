{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "tagged"
, dependencies =
  [ "identity"
  , "foldable-traversable"
  , "profunctor"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
