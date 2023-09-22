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
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 240/255, blue: 236/255)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack {
                    //¡Crea tu propio  Escape!
                    Text("¡CREA TU PROPIO ESCAPE!").font(.custom("Concert One", size: 29)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255))
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(Color(red: 164/255, green: 164/255, blue: 255/255))
                            .cornerRadius(10)
                            .frame(width: 330, height: 200)
                        
                        VStack(spacing: 0) {
                            Image(systemName: "photo.fill") // aquí va la imagen o el video
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100) // Tamaño de la imagen/video
                                .padding()
                            
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
                                Text("Seleccionar Imagen").font(.custom("Concert One", size: 15)).foregroundColor(Color.black)
                                    .padding()
                                    .underline()
                            }
                            .sheet(isPresented: $createGameModel.isShowingImagePicker, content: {
                                // Presentar el ImagePicker
                                ImagePickerView(selectedImage: $selectedUIImage, isPresented: $createGameModel.isShowingImagePicker, sourceType: $sourceType)
                            })
                            
                        }
                    }
                    // Título
                    Text("Título del Escape").font(.custom("Concert One", size: 22)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()
                    
                    TextField("Título", text: $createGameModel.titulo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                    
                    // Descripción
                    Text("Descripción").font(.custom("Concert One", size: 22)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()
                    Spacer()
                    TextField("Descripción", text: $createGameModel.descripcion).font(.custom("Concert One", size: 15)).foregroundColor(Color.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                    
                    // Visibilidad (usando Picker para seleccionar entre "Pública" y "Privada")
                    Text("Visibilidad").font(.custom("Concert One", size: 22)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()}
                Picker("Visibilidad", selection: $createGameModel.visibilidad) {
                    Text("Pública").tag("Pública")
                    Text("Privada").tag("Privada")
                        .frame(width: 300) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                }
                
                .pickerStyle(SegmentedPickerStyle())
                
                // Categoría (usando Picker para seleccionar entre "Escolar" y "En casa")
                Text("Categoría").font(.custom("Concert One", size: 22)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()
                Picker("Categoría", selection: $createGameModel.categoria) {
                    Text("Escolar").tag("Escolar")
                    Text("En casa").tag("En casa")
                        .frame(width: 200) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
                
                VStack(){
                    HStack{
                        //Boton
                        Text("Preguntas").font(.custom("Concert One", size: 22)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()
                        Spacer()
                        //Ver todas
                        Text("Ver todas").font(.custom("Concert One", size: 16)).foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255)).bold()
                        Image(systemName: "arrowshape.forward").foregroundColor(Color(red: 200/255, green: 70/255, blue: 48/255))
                        
                    }
                    //PREGUNTAS
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(Color(red: 164/255, green: 164/255, blue: 255/255))
                            .cornerRadius(10)
                            .frame(width: 380, height: 120)
                        
                        HStack{
                            Image(systemName: "video.fill") // aquí va la imagen o el video
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 70) // Tamaño de la imagen/video
                                .padding()
                            
                            
                            Spacer()
                            
                            VStack{
                                Text("Pregunta")
                                TextField("Título", text: $createGameModel.titulo)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                            }
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Acción de guardar
                        }) {
                            Text("Guardar")
                                .frame(width: 150, height: 50)
                                .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Button(action: {
                            // Aquí debes agregar una nueva pregunta al arreglo de preguntas
                            let nuevaPregunta = Question(title: "", description: "", image: nil, icon: nil)
                            createGameModel.preguntas.append(nuevaPregunta)
                            print("Nueva pregunta agregada. Total de preguntas: \(createGameModel.preguntas.count)")

                        }) {
                            Text("Nueva Pregunta")
                                .frame(width: 200, height: 50)
                                .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        .padding()
                    }
                    Spacer()
                    
                }
                .padding()
            }
        }
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
    @Published var preguntas: [Question] = []  // Arreglo de preguntas

    // Otras propiedades y funciones relacionadas con la creación de juegos
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(createGameModel: CreateGameModel())
    }
}
