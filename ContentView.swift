//
//  ContentView.swift
//  Triangle Calculator 2
//
//  Created by Sabiq Sabry on 22/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            CalculatorView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Calculation")
                }
            HistoryView()
                .tabItem{
                    Image(systemName: "sum")
                    Text("History")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
