open Settings

type t = {
  x: int,
  y: int
}

let make = () => {
  let min = 0
  let max = 25

  {
    x: Util.getRandomInt(~min, ~max) * grid,
    y: Util.getRandomInt(~min, ~max) * grid
  }
}

let getX = (food) => food.x

let getY = (food) => food.y
