module Functions exposing (..)

-- lambdas


f1 =
    \x -> x + 1


f2 =
    \x y -> x + y



-- named


addOne : Int -> Int
addOne x =
    x + 1



-- named with a tuple


add x y =
    x + y



-- named with curried


add2 x y =
    x + y


multiply x y =
    x * y



-- constants are func that take no arguments


name =
    "sam"


divide x y =
    x / y


ans1 =
    divide 5 6



-- ans1 is really ((divide 5) 6)
-- pipe operator


ans2 =
    add 1 (multiply 2 3)



-- same as


ans3 =
    3
        |> multiply 2
        |> add 1



-- Type aliases


type alias PlayerId =
    Int


type alias PlayerName =
    String


label : PlayerId -> PlayerName
label x =
    "Same"


label2 : { id : Int, name : String } -> String
label2 { id, name } =
    name


-- type aliases
type alias Player =
    { id : PlayerId
    , name : PlayerName
    }


-- constructor
label3 : Player -> String
label3 { id, name } = name

ans4 = label3 (Player 1 "Jose")
