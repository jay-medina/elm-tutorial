module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Player)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


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


maybeList : WebData (List Player) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success players ->
            list players

        RemoteData.Failure error ->
            text (toString error)


view : WebData (List Player) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]
