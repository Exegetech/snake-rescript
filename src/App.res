let snakeRef = ref(Snake.make())
let foodRef = ref(Food.make())

let canvas = Bindings.getElementById(Settings.boardId)

switch canvas {
  | Null => Console.log(`Cannot find element with id ${Settings.boardId}`)
  | Present(canvas) => {
    let board = Board.make(canvas)
    let loop = Game.make(board, snakeRef, foodRef)

    let registerControls = Control.makeControl(snakeRef)
    registerControls()
    loop()
  }
}

