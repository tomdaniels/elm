module Main exposing (..)

import Html exposing (text)

-- functionName : argumentType -> returnType
-- functionName arg1 arg 2 = {...function body...}
politely : String -> String
politely phrase =
  "Excuse me, " ++ phrase

-- '++' string concatenation
ask : String -> String -> String
ask thing place =
  "is there a "
    ++ thing
    ++ "in the "
    ++ place
    ++ "?"

-- '<<' is used in elm to compose functions with compatible arguments
askPolitelyAboutFish : String -> String
askPolitelyAboutFish = politely << (ask "fish") -- partial application

------------------------------------------------------------------------------------
{- define types for your variables aka 'records' -}

type alias Dog =
    { name : String
    , age : Int
    }

-- object syntax in Elm
myDog = 
    { name = "Spock"
    , age = 3
    }

renderDog : Dog -> String
renderDog dog = 
    dog.name
    ++ ", "
    ++ (String.fromInt dog.age) -- String.fromInt === toString() in js


main =
  text <| renderDog myDog