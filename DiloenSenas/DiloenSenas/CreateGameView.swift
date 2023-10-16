//
//  CreateGameView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//


import SwiftUI
import UIKit

struct CreateGameView: View {
    @State private var isOn = false
    @ObservedObject var createGameModel: CreateGameModel
    @ObservedObject var objectsToggle = ObjectsToggle()
    @State private var selectedSegment = 0
    @State private var selectedImage: Image? // Para seleccionar una Image
    @State private var selectedUIImage: UIImage? // Para almacenar el UIImage
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("fondosolo")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .zIndex(0)
            ScrollView{
                VStack {
                    //¡Crea tu propio  Escape!
                    Text("¡CREA TU PROPIO ESCAPE!").font(Font.custom("Rowdies", size: 45)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
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
                                Text("Seleccionar Imagen").font(.custom("JungleHope", size: 15)).foregroundColor(Color.black)
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
                    Text("Título del Escape").font(.custom("Rowdies", size: 25)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                    
                    TextField("Título", text: $createGameModel.titulo)
                        .font(.custom("Rowdies-Bold", size: 15))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 500) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField}
                        .cornerRadius(10)
                    
                    // Descripción
                    Text("Descripción").font(.custom("Rowdies-Regular", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                    Spacer()
                    TextField("Descripción", text: $createGameModel.descripcion).font(.custom("Rowdies-Bold", size: 15)).foregroundColor(Color.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 500) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                        .cornerRadius(10)
                    
                    
                    // Visibilidad (usando Picker para seleccionar entre "Pública" y "Privada")
                    Text("Visibilidad").font(.custom("Rowdies", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255)).bold()
                    Picker("Visibilidad", selection: $createGameModel.visibilidad) {
                        Text("Pública").tag("Pública")
                        Text("Privada").tag("Privada")
                            .multilineTextAlignment(.center)
                            .font(.custom("Rowdies-Regular", size: 22))
                            // Centra el texto dentro del TextField
                    }
                    
                    .pickerStyle(SegmentedPickerStyle()).frame(width: 500).cornerRadius(10)
                    Spacer()
                }
                // Categoría (usando Picker para seleccionar entre "Escolar" y "En casa")
                Text("Categoría").font(.custom("Rowdies-Regular", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255)).bold()
                Picker("Categoría", selection: $createGameModel.categoria) {
                    Text("Escolar").tag("Escolar")
                    Text("En casa").tag("En casa")
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                }
                .pickerStyle(SegmentedPickerStyle()).frame(width: 500).cornerRadius(10)
                Spacer()
                
                VStack {
                    Text("Selecciona los objetos que utilizarás en el ESCAPE")
                        .font(.custom("Rowdies-Regular", size: 22))
                        .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                        .bold()
                    Spacer(minLength: 20)
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]) {
                        Toggle("Lápiz", isOn: $objectsToggle.lapizToggle)          .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Pluma", isOn: $objectsToggle.plumaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Libreta", isOn: $objectsToggle.libretaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Libro", isOn: $objectsToggle.libroToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Borrador", isOn: $objectsToggle.borradorToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Regla", isOn: $objectsToggle.reglaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Crayola", isOn: $objectsToggle.crayolaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Sacapuntas", isOn: $objectsToggle.sacapuntasToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Pegamento", isOn: $objectsToggle.pegamentoToggle)     .font(.custom("Rowdies-Regular", size: 22))

                        
                    }
                }
                Spacer(minLength: 30)
                //TOGGLE ON
                VStack(spacing:20){
                   //Lapiz
                   if objectsToggle.lapizToggle {
                       ObjectPickerView(objectName: "Lápiz")
                   }
                   //Pluma
                   if objectsToggle.plumaToggle {
                       ObjectPickerView(objectName: "Pluma")
                   }

                   //Libreta
                   if objectsToggle.libretaToggle {
                       ObjectPickerView(objectName: "Pluma")
                   }
                   //Libro
                   if objectsToggle.libroToggle {
                       ObjectPickerView(objectName: "Libreta")
                   }
                   
                   //borrador
                   if objectsToggle.borradorToggle {
                       ObjectPickerView(objectName: "Borrador")
                   }
                   //Crayola
                   if objectsToggle.crayolaToggle {
                       ObjectPickerView(objectName: "Crayola")
                   }
                   //Sacapuntas
                   if objectsToggle.sacapuntasToggle {
                       ObjectPickerView(objectName: "Sacapuntas")
                   }
                   //Regla
                   else if objectsToggle.reglaToggle {
                       ObjectPickerView(objectName: "Regla")
                   }
                   //Pegamento
                   else if objectsToggle.pegamentoToggle {
                       ObjectPickerView(objectName: "Pegamento")
                   }
                   //BorradorPizarra
                   else if objectsToggle.borradorPizarronToggle {
                       ObjectPickerView(objectName: "Borrador de Pizarron")
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)
            .alignmentGuide(.top) { _ in 0 }
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

