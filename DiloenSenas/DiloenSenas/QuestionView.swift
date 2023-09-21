//
//  QuestionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 21/9/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    @State private var isShowingImagePicker = false

    var body: some View {
        Form { // Utiliza Form para organizar las vistas en secciones
            Section(header: Text("Título de la Pregunta")) {
                TextField("Ingresa el título de la pregunta", text: $question.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Section(header: Text("Descripción de la Pregunta")) {
                TextField("Ingresa la descripción de la pregunta", text: $question.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Button(action: {
                self.isShowingImagePicker = true
            }) {
                Text("Seleccionar Imagen")
            }
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView(selectedImage: $question.image, isPresented: $isShowingImagePicker)
            })

            // Mostrar la imagen seleccionada si existe
            if let selectedImage = question.image {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            } else {
                Text("No se ha seleccionado una imagen")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
