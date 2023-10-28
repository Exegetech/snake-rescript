module Canvas = MyDocument.Canvas
module Context = Canvas.Context

type t = {
  context: Context.t,
  width: int,
  height: int,
}

let make = (canvas) => {
  context: Canvas.getContext(canvas, Canvas.TwoD),
  width: canvas.width,
  height: canvas.height,
}

let getWidth = (board) => board.width

let getHeight = (board) => board.height

let clear = (board) => {
  open Context

  let { context, width, height } = board

  context->clearRect(
    ~x=0,
    ~y=0,
    ~width,
    ~height,
  )
}

let drawFood = (board, food) => {
  open Context
  open Settings

  let { context } = board
  let rectSize = grid - 1

  context->set_fillStyle(foodColor)

  context->fillRect(
    ~x=Food.getX(food),
    ~y=Food.getY(food),
    ~width=rectSize,
    ~height=rectSize,
  )
}

let drawSnake = (board, snake) => {
  open Context
  open Settings

  let { context } = board
  let rectSize = grid - 1

  context->set_fillStyle(snakeColor)

  Snake.iterateCells(snake, (~x, ~y) => {
    context->fillRect(
      ~x,
      ~y,
      ~width=rectSize,
      ~height=rectSize,
    )
  })
}

