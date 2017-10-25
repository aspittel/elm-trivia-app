module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Questions exposing (..)


main : Program Never Model Msg
main = 
    Html.beginnerProgram 
        { model = model
        , view = view
        , update = update
        }


-- model


type alias Model = 
    { index : Int
    , questions : List Question
    , score : Int
    }



model : Model
model = 
    { index = 0
    , questions = Questions.question
    , score = 0
    }


-- update

type Msg =
    CheckAnswer String

update : Msg -> Model -> Model
update msg model = 
    case msg of
        CheckAnswer answer ->
            let
                question = currentQuestion (List.head model.questions)
            in
                { model | index = model.index + 1
                , questions = List.drop 1 model.questions
                , score = if answer == question.correctAnswer then model.score + 1 else model.score
                }

-- view


currentQuestion : Maybe Question -> Question
currentQuestion question =
    case question of
        Just question ->
            question
        Nothing ->
            { question = ""
            , answers = []
            , correctAnswer = ""
            }

answer : String -> Html Msg
answer answer = 
    button [ onClick (CheckAnswer answer) ] [ text answer ]

view : Model -> Html Msg
view model =
    let
        question = currentQuestion (List.head model.questions)
    in
        if question.question /= ""
            then 
                div [] 
                    [ h1  [ class "title" ] [ text "Trivia!" ]
                    , div [ class "question" ] [ text question.question ]
                    , div [] (List.map answer question.answers) 
                    ]
            else
                div []
                    [ h1  [ class "title" ] [ text "Trivia!" ]
                    , h3  [class "title score"][ text ("You Got " ++ (toString model.score) ++ " Points!") ]
                    ]