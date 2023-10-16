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
                        .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                        .cornerRadius(20)
                        .frame(width: 700, height: 150)
                    
                    VStack(spacing: 10) {
                        Spacer()
                        Text("Objeto: \(objectName)")
                            .font(Font.custom("JungleHope", size: 20)) 
                        Spacer(minLength: 15)
                        HStack(spacing:30){
                            VStack{
                                Text("Selecciona el nivel de dificultad")
                                Picker("Nivel", selection: $selectedLevel) {
                                    Text("Fácil").tag("Fácil")
                                    Text("Intermedio").tag("Intermedio")
                                    Text("Avanzado").tag("Avanzado")
                                }
                                .pickerStyle(SegmentedPickerStyle()).frame(width: 300)
                            }
                            Text("o sube tu propia URL")
                            
                        }
                        Spacer()
                    }
                }
            }
        }
}
