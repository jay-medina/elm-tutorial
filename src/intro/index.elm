module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural



-- update action model =


type alias Model =
    { shelves : Int
    }


model : Model
model =
    { shelves = 4 }


view model =
    div
        [ class "content"
        , style
            [ ( "margin", "1rem" )
            ]
        ]
        [ h1 [] [ text "Pluralizer" ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Decrement ] [ text "-" ]
        , text (toString model.shelves ++ " ")
        , text (pluralize "shelf" "shelves" model.shelves)
        ]


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            { model | shelves = model.shelves + 1 }

        Decrement ->
            { model | shelves = model.shelves - 1 }


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
