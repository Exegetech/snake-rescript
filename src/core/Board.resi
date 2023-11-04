module Canvas = Bindings.Canvas

type t

let make: (Canvas.t) => t

let getWidth: (t) => int

let getHeight: (t) => int

let clear: (t) => ()

let drawFood: (t, Food.t) => ()

let drawSnake: (t, Snake.t) => ()
