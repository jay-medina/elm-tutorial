module Views exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)


type alias CounterProps msg =
    { value : Int
    , onPlusClick : msg
    , onMinusClick : msg
    }


counter : CounterProps msg -> Html msg
counter { value, onPlusClick, onMinusClick } =
    div []
        [ h1 [] [ text (toString value) ]
        , button [ onClick onPlusClick ] [ text "+" ]
        , button [ onClick onMinusClick ] [ text "-" ]
        ]


buttons : msg -> msg -> Html msg
buttons onAddCounter onRemoveCounter =
    div []
        [ button [ onClick onAddCounter ] [ text "Add Counter" ]
        , button [ onClick onRemoveCounter ] [ text "Remove Counter" ]
        ]
