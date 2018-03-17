module Radio exposing (..)

import Html exposing (Attribute, Html, div, fieldset, input, label, text)
import Html.Attributes exposing (name, style, type_)
import Html.Events exposing (onClick)
import Markdown


type alias Model =
    { fontSize : FontSize
    , content : String
    }


type FontSize
    = Small
    | Medium
    | Large


type Msg
    = SwitchTo FontSize


chapter1 : Model
chapter1 =
    Model Medium intro


intro : String
intro =
    """

# Anna Karenina

## Chapter 1

Happy families are all alike; every unhappy family is unhappy in its own way.

Everything was in confusion in the Oblonskys’ house. The wife had discovered
that the husband was carrying on an intrigue with a French girl, who had been
a governess in their family, and she had announced to her husband that she
could not go on living in the same house with him...

"""


radio : String -> msg -> Html msg
radio value msg =
    label
        [ style [ ( "padding", "20px" ) ]
        ]
        [ input [ type_ "radio", name "font-size", onClick msg ] []
        , text value
        ]


view : Model -> Html Msg
view model =
    div []
        [ fieldset []
            [ radio "Small" (SwitchTo Small)
            , radio "Medium" (SwitchTo Medium)
            , radio "Large" (SwitchTo Large)
            ]
        , Markdown.toHtml [ sizeToStyle model.fontSize ] model.content
        ]


sizeToStyle : FontSize -> Attribute msg
sizeToStyle fontSize =
    let
        size =
            case fontSize of
                Small ->
                    "0.8em"

                Medium ->
                    "1em"

                Large ->
                    "1.2em"
    in
    style [ ( "font-size", size ) ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        SwitchTo newFontSize ->
            { model | fontSize = newFontSize }
