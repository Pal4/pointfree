import Foundation

precedencegroup ForwardApplication {
    associativity: left
    lowerThan: AdditionPrecedence
}

infix operator |>: ForwardApplication

public func |> <A, B>(a: A, f: (A) -> B) -> B {
  return f(a)
}


precedencegroup ForwardComposition {
    associativity: left
    higherThan: MultiplicationPrecedence
}

infix operator >>>: ForwardComposition

public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    func forward(_ a: A) -> C {
        return a |> f |> g
    }
    return forward
}
