module LogoUtil exposing (getLogoParts, sipString)

import Debug exposing (log)


sipString : String -> List String
sipString ogString =
    List.repeat (String.length ogString) ogString
        |> List.indexedMap (\i s -> String.repeat i " " ++ String.dropLeft i s)
        |> List.reverse
        |> (\l -> List.take (List.length l - 1) l)


sipStringOffEnd : String -> List String
sipStringOffEnd ogString =
    List.repeat (String.length ogString) ogString
        |> List.indexedMap (\i s -> String.dropRight i s ++ String.repeat i " ")
        |> List.reverse
        |> (\l -> List.take (List.length l - 1) l)


getLogoParts : String -> List String
getLogoParts s =
    let
        breakPt =
            String.length s // 2
    in
    List.concat
        [ sipString (String.left breakPt s)
            |> List.map (\str -> String.append str (String.repeat breakPt " "))
        , [ s ]
        , sipStringOffEnd (String.right breakPt s)
            |> List.reverse
            |> List.map (String.append (String.repeat breakPt " "))
        ]
