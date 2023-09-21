//
//  CreateGameView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct CreateGameView: View {
    @State private var gameTitle = ""
    @State private var gameDescription = ""
    @State private var category = "Escolar"
    @State private var visibility = "Pública"
    @State private var questions: [Question] = [Question(title: "", description: "", image: Image(systemName: "photo"))]

    var body: some View {
        ScrollView {
            VStack {
                Text("Crear Juego")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                
                Section(title: "Título", icon: "pencil", content: {
                    TextField("Ingresa el título", text: $gameTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                })
                
                Section(title: "Descripción", icon: "doc.text", content: {
                    TextField("Ingresa la descripción", text: $gameDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                })

                Section(title: "Categoría", icon: "tag", content: {
                    Picker("Categoría", selection: $category) {
                        Text("Escolar").tag("Escolar")
                        Text("En casa").tag("En casa")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                })
                
                Section(title: "Visibilidad", icon: "eye", content: {
                    Picker("Visibilidad", selection: $visibility) {
                        Text("Pública").tag("Pública")
                        Text("Privada").tag("Privada")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                })

                Text("Preguntas (\(questions.count))")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()

                ForEach(0..<questions.count, id: \.self) { index in
                    QuestionsView(question: $questions[index])
                }

                Button(action: {
                    // Acción para agregar una nueva pregunta
                    questions.append(Question(title: "", description: "", image: Image(systemName: "photo")))
                }) {
                    Text("Agregar Pregunta")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    // Acción para guardar el juego
                }) {
                    Text("Guardar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
}

struct Section<Content: View>: View {
    let title: String
    let icon: String
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            .padding(.bottom, 4)
            content()
        }
        .padding(.vertical)
    }
}
