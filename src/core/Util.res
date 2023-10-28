// https://stackoverflow.com/a/1527820/2124254
let getRandomInt = (~min, ~max) => {
  let max = Float.fromInt(max)
  let min = Float.fromInt(min)
  let diff = max -. min
  let rand = Math.floor(Math.random() *. diff) +. min

  Int.fromFloat(rand)
}
