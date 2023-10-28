@unboxed
type t<'a> =
  | Present('a)
  | @as(null) Null
