import UIKit
import FunctionalUtility

func incr(_ x: Int) -> Int {
  return x + 1
}

func square(_ x: Int) -> Int {
  return x * x
}

1 * 4 |> incr >>> square
