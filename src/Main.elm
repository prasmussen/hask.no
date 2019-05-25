module Main exposing (main)

import Browser
import Color
import Html exposing (Html)
import Html.Attributes as HtmlAttrs
import Html.Events as Events
import TypedSvg
import TypedSvg.Attributes as SvgAttrs
import TypedSvg.Types as SvgTypes


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { padding : Float
    }


initialModel : Model
initialModel =
    { padding = 0
    }


type Msg
    = SetPadding Float


init : () -> ( Model, Cmd Msg )
init flags =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetPadding n ->
            ( { model | padding = n }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.div
        [ HtmlAttrs.class "logo"
        ]
        [ viewSvgLogo model ]


viewSvgLogo : Model -> Html Msg
viewSvgLogo { padding } =
    TypedSvg.svg
        [ SvgAttrs.width (SvgTypes.px svgWidth)
        , SvgAttrs.height (SvgTypes.px svgHeight)
        , SvgAttrs.viewBox (negate maxPadding) 0 svgWidth svgHeight
        , Events.onMouseEnter (SetPadding maxPadding)
        , Events.onMouseLeave (SetPadding 0)
        ]
        [ TypedSvg.polyline
            [ SvgAttrs.fill (SvgTypes.Fill (Color.rgb255 53 41 80))
            , SvgAttrs.transform
                [ SvgTypes.Translate (negate padding) 0
                ]
            , SvgAttrs.points
                [ ( 0, 340 )
                , ( 113, 170 )
                , ( 0, 0 )
                , ( 85, 0 )
                , ( 198, 170 )
                , ( 85, 340 )
                , ( 0, 340 )
                ]
            ]
            []
        , TypedSvg.polyline
            [ SvgAttrs.fill (SvgTypes.Fill (Color.rgb255 74 58 116))
            , SvgAttrs.points
                [ ( 113, 340 )
                , ( 226, 170 )
                , ( 113, 0 )
                , ( 198, 0 )
                , ( 425, 340 )
                , ( 340, 340 )
                , ( 269, 234 )
                , ( 198, 340 )
                , ( 113, 340 )
                ]
            ]
            []
        , TypedSvg.polyline
            [ SvgAttrs.fill (SvgTypes.Fill (Color.rgb255 124 54 121))
            , SvgAttrs.transform [ SvgTypes.Translate padding 0 ]
            , SvgAttrs.points
                [ ( 387, 241 )
                , ( 350, 184 )
                , ( 482, 184 )
                , ( 482, 241 )
                , ( 387, 241 )
                ]
            ]
            []
        , TypedSvg.polyline
            [ SvgAttrs.fill (SvgTypes.Fill (Color.rgb255 124 54 121))
            , SvgAttrs.transform [ SvgTypes.Translate padding 0 ]
            , SvgAttrs.points
                [ ( 331, 156 )
                , ( 293, 99 )
                , ( 482, 99 )
                , ( 482, 156 )
                , ( 331, 156 )
                ]
            ]
            []
        ]


logoWidth : Float
logoWidth =
    482


logoHeight : Float
logoHeight =
    340


maxPadding : Float
maxPadding =
    10


svgWidth : Float
svgWidth =
    logoWidth + (maxPadding * 2)


svgHeight : Float
svgHeight =
    logoHeight


negate : Float -> Float
negate n =
    abs n * -1
