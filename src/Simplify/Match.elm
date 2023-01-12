module Simplify.Match exposing
    ( Match(..)
    , map
    , maybeAndThen
    , toDetermined
    )

{-|

@docs Match
@docs map
@docs maybeAndThen
@docs toDetermined

-}


type Match a
    = Determined a
    | Undetermined


map : (a -> b) -> Match a -> Match b
map mapper match =
    case match of
        Determined a ->
            Determined (mapper a)

        Undetermined ->
            Undetermined


maybeAndThen : (a -> Match b) -> Maybe a -> Match b
maybeAndThen fn maybe =
    case maybe of
        Just a ->
            fn a

        Nothing ->
            Undetermined


toDetermined : Match determined -> Maybe determined
toDetermined match =
    case match of
        Undetermined ->
            Nothing

        Determined determined ->
            Just determined
