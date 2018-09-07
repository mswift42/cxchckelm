module Main exposing (Model, Msg(..), Store, init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



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
    ( Model "" (Store "Rose Street" "54"), Cmd.none )

type ActiveStore = RoseStreet | CameronToll | Leith

---- UPDATE ----


type Msg
    = SwitchActiveStore ActiveStore


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "searchapp" ]
        [ h3 [] [ text "Enter Search query" ]
        ,  input [ placeholder "Enter Search query", value model.query ] []
        , div [] [radio (SwitchTo model.activeStore.location) model.activeStore.location]
        ]

radio : msg -> String -> Html msg
radio msg name =
    label []
        [ input [type_ "radio" onClick msg ] []
        , text name
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
