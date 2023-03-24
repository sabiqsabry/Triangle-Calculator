//
//  HistoryView.swift
//  Triangle Calculator 2
//
//  Created by Sabiq Sabry on 22/03/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @AppStorage("a") private var a = ""
    @AppStorage("b") private var b = ""
    @AppStorage("c") private var c = ""
    @AppStorage("aSend") private var aSend = ""
    @AppStorage("bSend") private var bSend = ""
    @AppStorage("cSend") private var cSend = ""
    @AppStorage("area") private var area: Double = 0
    @AppStorage("perimeter") private var perimeter: Double = 0
            
    var body: some View {
        NavigationStack{
            ScrollView{
                Spacer()
                VStack(alignment: .leading){
                    Text("Last Calculation")
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                    
                    HStack{
                        Text(aSend)
                        Spacer()
                        Text("\(a)")
                    }
                    
                    HStack{
                        Text(bSend)
                        Spacer()
                        Text("\(b)")
                    }
                    
                    HStack{
                        Text(cSend)
                        Spacer()
                        Text("\(c)")
                    }
                    
                    HStack{
                        Text("Area: ")
                        Spacer()
                        Text("\(area)")
                    }
                    
                    HStack{
                        Text("Perimeter: ")
                        Spacer()
                        Text("\(perimeter)")
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(Text("History View"))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
