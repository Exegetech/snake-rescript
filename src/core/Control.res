let changeDirection = (snakeRef, event) => {
  open Bindings

  let snake: Snake.t = snakeRef.contents
  let data = (event.Event.which, Snake.getDx(snake), Snake.getDy(snake))

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
    Bindings.addEventListener(Bindings.KeyDown, (event) => {
      changeDirection(snakeRef, event)
    })
  }
}

