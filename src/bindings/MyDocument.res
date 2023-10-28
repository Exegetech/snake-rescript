module Canvas = {
  module Context = {
    type t

    @send
    external clearRect: (t, ~x: int, ~y: int, ~width: int, ~height: int) => () = "clearRect"

    @send
    external fillRect: (t, ~x: int, ~y: int, ~width: int, ~height: int) => () = "fillRect"

    @set
    external set_fillStyle: (t, string) => () = "fillStyle"
  }

  type t = {
    width: int,
    height: int,
  }

  type context =
    | @as("2d") TwoD

  @send
  external getContext: (t, context) => Context.t = "getContext"
}

@val
@scope(("document"))
external getElementById: (string) => MyNull.t<Canvas.t> = "getElementById"

module Event = {
  type arrowKey =
    | @as(37) Left
    | @as(38) Up
    | @as(39) Right
    | @as(40) Down

  type t = {
    which: arrowKey
  }
}

type eventType =
  | @as("keydown") KeyDown

@val
@scope(("document"))
external addEventListener: (eventType, (Event.t) => ()) => () = "addEventListener"
