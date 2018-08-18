module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Player)
import Msgs exposing (Msg)


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Players" ] ]


playerHeader : Html Msg
playerHeader =
    tr []
        [ th [] [ text "Id " ]
        , th [] [ text "Name " ]
        , th [] [ text "Level " ]
        , th [] [ text "Actions " ]
        ]


playerRow : Player -> Html Msg
playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text (toString player.level) ]
        , td [] []
        ]


list : List Player -> Html Msg
list players =
    div [ class "p2" ]
        [ table []
            [ thead [] [ playerHeader ]
            , tbody [] (List.map playerRow players)
            ]
        ]


view : List Player -> Html Msg
view players =
    div []
        [ nav
        , list players
        ]