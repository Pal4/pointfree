//
//  ContentView.swift
//  PFTest
//
//  Created by a.polunin on 18.02.2021.
//

import SwiftUI
import FunctionalUtility

func incr(x: Int) -> Int {
    return x + 1
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        printTest()
        ContentView()
    }
}
