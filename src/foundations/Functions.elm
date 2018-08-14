module Functions exposing (..)

import Html exposing (text)


{-
   Functions -
    -- Are curried by default
-}
{- anonymous functions -}


func2 =
    \x y -> x + y


func1 =
    \x -> x + 1



-- Named Functions


addOne : Int -> Int
addOne x =
    x + 1


add x y =
    x + y



-- constants = function that takes no arguments


name =
    "Jose"


main : Html.Html msg
main =
    text "Hello world"
