//
//  Operators.swift
//  FunctionalHelpers
//
//  Created by a.polunin on 18.02.2021.
//

import Foundation

infix operator |>

func |> <A, B>(a: A, f: (A) -> B) -> B {
  return f(a)
}

func printTest() {
    print("PrintTest")
}
