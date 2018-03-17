module Main exposing (..)

import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (style)
import Types exposing (CounterListModel, CounterListMsg, CounterModel)
import Updates exposing (updateList)
import Views exposing (buttons, counter)


counterList : CounterListModel
counterList =
    [ { id = 0, value = 1 }, { id = 1, value = 2 } ]


counterView : CounterModel -> Html CounterListMsg
counterView model =
    counter
        { value = model.value
        , onPlusClick = Types.ModifyCount Types.Increment model
        , onMinusClick = Types.ModifyCount Types.Decrement model
        }


counters : CounterListModel -> Html CounterListMsg
counters model =
    div [] (List.map counterView model)


view : CounterListModel -> Html CounterListMsg
view counterList =
    div [ style [ ( "margin", "8px" ) ] ]
        [ counters counterList
        , buttons Types.AddCounter Types.RemoveCounter
        ]


main =
    Html.beginnerProgram
        { model = counterList
        , view = view
        , update = updateList
        }
