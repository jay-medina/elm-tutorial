module Types exposing (..)


type alias CounterModel =
    { id : Int, value : Int }


type alias CounterListModel =
    List CounterModel


type CounterMsg
    = Increment
    | Decrement


type CounterListMsg
    = AddCounter
    | RemoveCounter
    | ModifyCount CounterMsg CounterModel
