module UnionTypes exposing (..)

{- type is made of the a type and a constructor -}


type Answer
    = Yes
    | No
    | Other String


type alias Player =
    { id : Int
    , name : String
    }


respond : Answer -> String
respond answer =
    case answer of
        Yes ->
            "Yes"

        No ->
            "No"

        Other str ->
            str
