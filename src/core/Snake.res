module Cell = {
  type t = {
    x: int,
    y: int,
  }

  let make = (x, y) => { x, y }
}

type t = {
  x: int,
  y: int,
  dx: int,
  dy: int,
  cells: array<Cell.t>,
  maxCells: int,
}

let make = () => {
  x: 160,
  y: 160,
  dx: Settings.grid,
  dy: 0,
  cells: [],
  maxCells: 4
}

let getDx = (snake) => snake.dx

let getDy = (snake) => snake.dy

let setSpeedLeft = (snake) => {
  ...snake,
  dx: -Settings.grid,
  dy: 0,
}

let setSpeedUp = (snake) => {
  ...snake,
  dy: -Settings.grid,
  dx: 0,
}

let setSpeedRight = (snake) => {
  ...snake,
  dx: Settings.grid,
  dy: 0,
}

let setSpeedDown = (snake) => {
  ...snake,
  dy: Settings.grid,
  dx: 0,
}

let increaseMaxCells = (snake) => {
  ...snake,
  maxCells: snake.maxCells + 1
}

let iterateCells = (snake, callback) => {
  Array.forEach(snake.cells, (cell) => callback(~x=cell.x, ~y=cell.y))
}

let wrapX = (snakeX, width) => {
  if snakeX < 0 {
    width - Settings.grid
  } else if snakeX >= width {
    0
  } else {
    snakeX
  }
}

let wrapY = (snakeY, height) => {
  if snakeY < 0 {
    height - Settings.grid
  } else if snakeY >= height {
    0
  } else {
    snakeY
  }
}

let extendCells = (x, y, cells, maxCells) => {
  let cells = Array.copy(cells)
  let newCell = Cell.make(x, y)

  Array.unshift(cells, newCell)

  if Array.length(cells) > maxCells {
    Array.pop(cells)
    -> ignore
  }

  cells
}

let move = (snake, ~boardWidth, ~boardHeight) => {
  let newX = wrapX(snake.x + snake.dx, boardWidth)
  let newY = wrapY(snake.y + snake.dy, boardHeight)
  let newCells = extendCells(newX, newY, snake.cells, snake.maxCells)

  {
    ...snake,
    x: newX,
    y: newY,
    cells: newCells,
  }
}


let eatFood = (snake, food) => {
  let found = Array.findIndexOpt(snake.cells, (cell) => {
    if cell.x === Food.getX(food) && cell.y === Food.getY(food) {
      true
    } else {
      false
    }
  })

  switch found {
    | None => false
    | Some(_) => true
  }
}

let eatSelf = (snake) => {
  Array.reduceWithIndex(snake.cells, false, (acc, cell, index) => {
    let found = ref(false)
    let i = ref(index + 1)

    while found.contents === false && i.contents < Array.length(snake.cells) - 1 {
      let snakeCell = Option.getExn(snake.cells[i.contents])

      if cell.x === snakeCell.x && cell.y === snakeCell.y {
	found := true
      } else {
	found := false
      }

      i := i.contents + 1
    }

    acc || found.contents
  })
}
