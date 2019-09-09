module Main exposing (main)

import Browser
import Html exposing (Html, input, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


type alias Model =
    { content : String }


initialModel : Model
initialModel =
  { content = "" }


type Msg =
  Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


peel str = String.slice 1 -1 str


view : Model -> Html Msg
view model =
  div []
    [ Html.p [] [ Html.text "String peeler:" ]
    , Html.input [ placeholder "String to peel here", value model.content, onInput Change ] []
    , Html.div [] [ Html.text (peel model.content) ]
    ]


main : Program () Model Msg
main =
  Browser.sandbox
    { init = initialModel
    , view = view
    , update = update
    }
