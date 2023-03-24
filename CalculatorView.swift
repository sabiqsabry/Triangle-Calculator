//
//  CalculatorView.swift
//  Triangle Calculator 2
//
//  Created by Sabiq Sabry on 22/03/2023.
//

import SwiftUI
import Foundation

enum edgeStyle: String, CaseIterable{
    case hypotenuse = "Hypotenuse"
    case base = "Base"
    case altitude = "Altitude"
}

struct CalculatorView: View {
    
    @AppStorage("a") private var a = ""
    @AppStorage("b") private var b = ""
    @AppStorage("c") private var c = ""
    @AppStorage("aSend") private var aSend = ""
    @AppStorage("bSend") private var bSend = ""
    @AppStorage("cSend") private var cSend = ""
    @AppStorage("area") private var area: Double = 0
    @AppStorage("perimeter") private var perimeter: Double = 0
        
    @State public var edgeChosen = edgeStyle.hypotenuse
    
    @State private var isInputAvailable = true
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image("right_triangle")
                    HStack{
                        Text("Choose the \nunknown edge:")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Picker("Choose a Side: ", selection: $edgeChosen){
                            Text(edgeStyle.base.rawValue).tag(edgeStyle.base)
                            Text(edgeStyle.altitude.rawValue).tag(edgeStyle.altitude)
                            Text(edgeStyle.hypotenuse.rawValue).tag(edgeStyle.hypotenuse)
                        }
                        .pickerStyle(.wheel)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Text("Enter Unknown Values: ")
                        .font(.system(size: 16, weight: .semibold))
                    
                    switch edgeChosen{
                    case.hypotenuse:
                        TextField("Base", text: $a)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Altitude", text: $b)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    case.altitude:
                        TextField("Base", text: $a)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Hypotenuse", text: $b)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    case.base:
                        TextField("Hypotenuse", text: $a)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Altitude", text: $b)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Button{
                        
                        calculateRemaining()
                        calculateArea()
                        calculatePerimiter()
                        
                    } label: {
                        Text("Calculate")
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 100, height: 25)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
                    switch edgeChosen{
                    case.hypotenuse:
                        finalPrintView(operrator: "Hypotenuse:",
                                       finalvalue: "\(c)",
                                       finalArea: "\(area)",
                                       finalPerimeter: "\(perimeter)")
                    case.altitude:
                        finalPrintView(operrator: "Altitude:",
                                       finalvalue: "\(c)",
                                       finalArea: "\(area)",
                                       finalPerimeter: "\(perimeter)")
    
                    case.base:
                        finalPrintView(operrator: "Base:",
                                       finalvalue: "\(c)",
                                       finalArea: "\(area)",
                                       finalPerimeter: "\(perimeter)")
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading)
                
            }
            .navigationTitle(Text("Triangle Calculator"))
        }
    }
    
    func calculateRemaining(){
        
        guard let value1 = Double(a), let value2 = Double(b) else{
            isInputAvailable = false
            return
        }
        
        switch edgeChosen{
        case .hypotenuse:
            let value3 = pow(value1, 2) + pow(value2, 2)
            c = "\(value3)"
            aSend = edgeStyle.base.rawValue
            bSend = edgeStyle.altitude.rawValue
            cSend = edgeStyle.hypotenuse.rawValue
        case .base:
            let value3 = pow(value1, 2) - pow(value2, 2)
            c = "\(value3)"
            aSend = edgeStyle.hypotenuse.rawValue
            bSend = edgeStyle.altitude.rawValue
            cSend = edgeStyle.base.rawValue
        case .altitude:
            let value3 = pow(value1, 2) - pow(value2, 2)
            c = "\(value3)"
            aSend = edgeStyle.base.rawValue
            bSend = edgeStyle.hypotenuse.rawValue
            cSend = edgeStyle.altitude.rawValue
        }
    }
    
    func calculateArea(){
        
        guard let value1 = Double(a),
              let value2 = Double(b)
        else{
            isInputAvailable = false
            return
        }
        
        let areaa = (value1 * value2)/2
        area = areaa
    }
    
    func calculatePerimiter(){
        
        guard let value1 = Double(a),
              let value2 = Double(b)
        else{
            isInputAvailable = false
            return
        }
        
        let perimeterr = value1 + value2 + sqrt(pow(value1, 2) + pow(value2, 2))
        perimeter = perimeterr
    }
}



struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

struct finalPrintView: View {
    
    var operrator: String
    var finalvalue: String
    var finalArea: String
    var finalPerimeter: String
    
    var body: some View {
        
        VStack{
            HStack{
                Text(operrator)
                Spacer()
                Text(finalvalue)
            }
            
            HStack{
                Text("Area:")
                Spacer()
                Text(finalArea)
            }
            
            HStack{
                Text("Perimeter: ")
                Spacer()
                Text(finalPerimeter)
            }
        }.padding()
    }
}
