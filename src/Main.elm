module Main exposing (Model, Msg(..), Store, init, main, update, view)

import Browser
import Html exposing (Html, div, h1, img, text, input)
import Html.Attributes exposing (..)



---- MODEL ----


type alias Store =
    { location : String
    , id : String
    }


type alias Model =
    { query : String
    , activeStore : Store
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" (Store "Rose Street" "54") , Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ],
         [input [placeholder "Enter Search Query" , value model.query] ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
