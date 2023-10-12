//
//  Objects.swift
//  DiloenSenas
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

class ObjectsToggle: ObservableObject {
    @Published var lapizToggle = false
    @Published var plumaToggle = false
    @Published var libretaToggle = false
    @Published var libroToggle = false
    @Published var borradorToggle = false
    @Published var reglaToggle = false
    @Published var crayolaToggle = false
    @Published var sacapuntasToggle = false
    @Published var pegamentoToggle = false
    @Published var borradorPizarronToggle = false
    
}


struct ObjectPickerView: View {
    let objectName: String
    @State private var selectedLevel: String = "Fácil"
    
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 159/255, green: 211/255, blue: 86/255))
                        .cornerRadius(20)
                        .frame(width: 1000, height: 150)
                    
                    VStack(spacing: 10) {
                        Spacer()
                        Text("Objeto: \(objectName)")
                            .font(Font.custom("JungleHope", size: 20)) 
                        
                        Picker("Nivel", selection: $selectedLevel) {
                            Text("Fácil").tag("Fácil")
                            Text("Intermedio").tag("Intermedio")
                            Text("Avanzado").tag("Avanzado")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        Spacer()
                    }
                }
            }
        }
}
