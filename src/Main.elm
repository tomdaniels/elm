module Main exposing (..)

import Html exposing (text)

import List exposing (..)
import Debug exposing (toString)


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

{-
render HTML:
main =
  text <| askPolitelyAboutFish "shop"
-}

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

{-
main =
  text <| renderDog myDog
-}

------------------------------------------------------------------------------------
{- lists -}

type alias Person =
    { name : String
    , age : Int
    }

people =
    [ { name = "boy", age = 8 }
    , { name = "girl", age = 12}
    ]

names : List Person -> List String
names peeps =
    List.map (\peep -> peep.name) peeps
    -- (\x -> x) anonymous function/callback syntax
    -- in js this would be: peeps.map((peep) => peep.name);

-- Maybe is a library in the core of Elm to define values that may not exist
-- used like null in js
findPerson : String -> List Person -> Maybe
    Person
findPerson name peeps =
  -- List.foldl or foldr for all intents and purposes is Array.reduce or Array.reduceRight
  List.foldl
    (\peep memo ->
        case memo of
            -- memo will be the first item in the list
            -- so lets just return if its a match, no need to continue
            Just _ ->
                memo

            -- otherwise if we haven't already found
            -- go through the list and return the matching item
            -- ....or nothing
            Nothing ->
                if peep.name == name then
                      Just peep
                else Nothing
    )
    Nothing
    peeps

main =
  text <| toString <| findPerson "boy"
      people