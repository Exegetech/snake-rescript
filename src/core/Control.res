let changeDirection = (snakeRef, event) => {
  open MyDocument.Event

  let snake: Snake.t = snakeRef.contents
  let data = (event.which, Snake.getDx(snake), Snake.getDy(snake))

  switch data {
    | (Left, 0, _) => snakeRef := Snake.setSpeedLeft(snake)
    | (Up, _, 0) => snakeRef := Snake.setSpeedUp(snake)
    | (Right, 0, _) => snakeRef := Snake.setSpeedRight(snake)
    | (Down, _, 0) => snakeRef := Snake.setSpeedDown(snake)
    | _ => ()
  }
}

let makeControl = (snakeRef) => {
  () => {
    MyDocument.addEventListener(MyDocument.KeyDown, (event) => {
      changeDirection(snakeRef, event)
    })
  }
}

