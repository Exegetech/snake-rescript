let make = (board, snakeRef, foodRef) => {
  let countRef = ref(0)

  let rec loop = () => {
    MyWindow.requestAnimationFrame(loop)

    let count = countRef.contents
    let snake = snakeRef.contents
    let food = foodRef.contents

    if count < Settings.countPerUpdate {
      countRef := count + 1
    } else {
      countRef := 0

      snakeRef := Snake.move(
	snake,
	~boardWidth=Board.getWidth(board),
	~boardHeight=Board.getHeight(board),
      )

      if Snake.eatFood(snake, food) {
	snakeRef := Snake.increaseMaxCells(snake)
	foodRef := Food.make()
      } else if Snake.eatSelf(snake) {
	snakeRef := Snake.make()
	foodRef := Food.make()
      }

      Board.clear(board)
      Board.drawFood(board, food)
      Board.drawSnake(board, snake)
    }
  }

  loop
}

