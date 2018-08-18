module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (Player, PlayerId)
import Msgs exposing (Msg)
import RemoteData


playerDecoder : Decode.Decoder Player
playerDecoder =
    decode Player
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.int


playersDecoder : Decode.Decoder (List Player)
playersDecoder =
    Decode.list playerDecoder


fetchPlayersUrl : String
fetchPlayersUrl =
    "http://localhost:4000/players"


fetchPlayers : Cmd Msg
fetchPlayers =
    Http.get fetchPlayersUrl playersDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPlayers
