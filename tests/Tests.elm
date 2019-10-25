module Tests exposing (all)

import Expect
import LogoUtil exposing (..)
import Test exposing (..)



-- Check out https://package.elm-lang.org/packages/elm-explorations/test/latest to learn more about testing in Elm!


all : Test
all =
    describe "NeverApart Logo App Test"
        [ test "Addition" <|
            \_ ->
                Expect.equal 10 (3 + 7)
        , test "sipString produces array sipping word letter by letter" <|
            \_ ->
                Expect.equal
                    [ "   t"
                    , "  st"
                    , " est"
                    ]
                    (sipString "test")
        , test "getLogoParts split string" <|
            \_ ->
                Expect.equal
                    [ "   t    "
                    , "  st    "
                    , " est    "
                    , "testword"
                    , "    wor "
                    , "    wo  "
                    , "    w   "
                    ]
                    (getLogoParts "testword")
        ]



--, test "This test should fail" <|
--\_ ->
--Expect.fail "failed as expected!"
