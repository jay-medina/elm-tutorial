module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model)
import Msgs exposing (Msg)
import Players.List


page : Model -> Html Msg
page { players } =
    Players.List.view players


view : Model -> Html Msg
view model =
    div [] [ page model ]
