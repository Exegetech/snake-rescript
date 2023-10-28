type t

let make: () => t

let getDx: (t) => int

let getDy: (t) => int

let setSpeedLeft: (t) => t

let setSpeedUp: (t) => t

let setSpeedRight: (t) => t

let setSpeedDown: (t) => t

let increaseMaxCells: (t) => t

let iterateCells: (t, (~x: int, ~y: int) => ()) => ()

let move: (t, ~boardWidth: int, ~boardHeight: int) => t

let eatFood: (t, Food.t) => bool

let eatSelf: (t) => bool
