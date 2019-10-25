module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import LogoUtil exposing (getLogoParts)



---- MODEL ----


type alias Model =
    { word : String }


init : ( Model, Cmd Msg )
init =
    ( { word = "NEVERAPART" }, Cmd.none )



---- UPDATE ----


type Msg
    = EditWord String



--= NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EditWord s ->
            ( { model | word = s }, Cmd.none )



--( model, Cmd.none )
---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ div [ class "logo" ]
            (List.map
                (\t -> h1 [] [ text t ])
                (getLogoParts model.word)
            )
        , div [ class "input" ]
            [ input [ value model.word, onInput EditWord ] [] ]
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
