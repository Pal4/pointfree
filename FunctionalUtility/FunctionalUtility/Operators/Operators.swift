import Foundation

// MARK: -
precedencegroup ForwardApplication {
  associativity: left
}

infix operator |>: ForwardApplication

public func |> <A, B>(a: A, f: (A) -> B) -> B {
  return f(a)
}

// MARK: -
precedencegroup ForwardComposition {
  associativity: left
  higherThan: EffectfulComposition
}

infix operator >>>: ForwardComposition

public func >>> <A, B, C>(
  f: @escaping (A) -> B,
  g: @escaping (B) -> C
) -> ((A) -> C) {
  
  return { g(f($0)) }
}

// MARK: -
precedencegroup EffectfulComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator >=>: EffectfulComposition

public func >=> <A, B, C>(
  _ f: @escaping (A) -> (B, [String]),
  _ g: @escaping (B) -> (C, [String])
  ) -> ((A) -> (C, [String])) {

  return { a in
    let (b, logs) = f(a)
    let (c, moreLogs) = g(b)
    return (c, logs + moreLogs)
  }
}

// MARK: -
precedencegroup SingleTypeComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
  return f >>> g
}

func <> <A>(f: @escaping (inout A) -> Void, g: @escaping (inout A) -> Void) -> (inout A) -> Void {
  return { a in
    f(&a)
    g(&a)
  }
}

func |> <A>(a: inout A, f: (inout A) -> Void) {
  f(&a)
}
