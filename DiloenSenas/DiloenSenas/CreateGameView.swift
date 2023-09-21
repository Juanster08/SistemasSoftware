//
//  CreateGameView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI
import UIKit

struct CreateGameView: View {
    @ObservedObject var createGameModel: CreateGameModel
    @State private var selectedImage: Image? // Para seleccionar una Image
    @State private var selectedUIImage: UIImage? // Para almacenar el UIImage

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .cornerRadius(10)
                    .frame(width: 350, height: 220)
                
                VStack(spacing: 0) {
                    Image(systemName: "photo.fill") // aca va el video imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100) // Tamaño de la imagen/video
                    
                    Text("Instrucciones")
                        .font(.headline)
                        .padding()
                }
                
            }
            Spacer()
            VStack{
                // Título
                TextField("Título", text: $createGameModel.titulo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Descripción
                TextField("Descripción", text: $createGameModel.descripcion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Visibilidad (usando Picker para seleccionar entre "Pública" y "Privada")
                Picker("Visibilidad", selection: $createGameModel.visibilidad) {
                    Text("Pública").tag("Pública")
                    Text("Privada").tag("Privada")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // Categoría (usando Picker para seleccionar entre "Escolar" y "En casa")
                Picker("Categoría", selection: $createGameModel.categoria) {
                    Text("Escolar").tag("Escolar")
                    Text("En casa").tag("En casa")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // Preguntas (tendrás que definir cómo manejar esto)
                // Esto puede ser una lista de preguntas, botones para agregar preguntas, etc.
                
                if let selectedImage = selectedImage {
                    // Mostrar la Image seleccionada
                    selectedImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                }
                
                Button(action: {
                    // Presentar el selector de imágenes
                    createGameModel.isShowingImagePicker = true
                }) {
                    Text("Seleccionar Imagen")
                }
                .sheet(isPresented: $createGameModel.isShowingImagePicker, content: {
                    // Presentar el ImagePicker
                    ImagePickerView(selectedImage: $selectedUIImage, isPresented: $createGameModel.isShowingImagePicker)
                })
                Spacer()
            }
            Spacer()

            // Resto de la vista CreateGameView
        }
        .padding()
    }
}
    

// Modelo para almacenar datos relacionados con la creación de juegos
class CreateGameModel: ObservableObject {
    @Published var isShowingImagePicker = false
    @Published var selectedImage: UIImage?
    @Published var titulo = ""
    @Published var descripcion = ""
    @Published var visibilidad = "Pública" // Valor predeterminado
    @Published var categoria = "Escolar" // Valor predeterminado
    
    // Otras propiedades y funciones relacionadas con la creación de juegos
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(createGameModel: CreateGameModel())
    }
}
