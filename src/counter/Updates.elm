module Updates exposing (..)

import Types exposing (..)


updateList : CounterListMsg -> CounterListModel -> CounterListModel
updateList msg counterList =
    case msg of
        AddCounter ->
            let
                lastValue =
                    List.head <| List.reverse <| counterList
            in
            case lastValue of
                Just { id } ->
                    counterList ++ [ { id = id + 1, value = 0 } ]

                Nothing ->
                    counterList

        RemoveCounter ->
            List.take (List.length counterList - 1) counterList

        ModifyCount msg counter ->
            List.map (modifyCounter ( msg, counter )) counterList


modifyCounter : ( CounterMsg, CounterModel ) -> CounterModel -> CounterModel
modifyCounter ( msg, model ) next =
    if model.id == next.id then
        updateCounter msg model
    else
        next


updateCounter : CounterMsg -> CounterModel -> CounterModel
updateCounter msg model =
    case msg of
        Increment ->
            { model | value = model.value + 1 }

        Decrement ->
            { model | value = model.value - 1 }
