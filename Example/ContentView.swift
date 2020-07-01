//
//  ContentView.swift
//  Example
//
//  Created by george on 01/07/2020.
//  Copyright © 2020 George Nicolaou. All rights reserved.
//

import SwiftUI
import TestPodWithSPM

struct ContentView: View {
    var body: some View {
        Text(SomeClass.getText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
