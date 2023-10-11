//
//  LiveSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//


import SwiftUI

struct LiveSession: View {
    @State private var isPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .cornerRadius(10)
                    .frame(width: 350, height: 300)

                VStack(spacing: 0) {
                    Image(systemName: "video.fill") // aquí va la imagen o el video
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 190) // Tamaño de la imagen/video

                    Text("Instrucciones")
                        .font(.headline)
                        .padding()
                }
            }

            Spacer()

            VStack {
                Rectangle()
                    .strokeBorder(Color.yellow)
                    .overlay(
                        Group {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    )

                VStack {
                    Button(action: {
                        if let selectedImage = selectedImage {
                            classifier.detect(uiImage: selectedImage)
                        }
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                    }

                    if let imageClass = classifier.imageClass {
                        HStack {
                            Text("Categorías de la imagen:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                        .font(.subheadline)
                        .padding()
                    } else {
                        Text("Categorías de la imagen: NA")
                            .font(.caption)
                            .padding()
                    }
                }
                .padding()
            }
            .sheet(isPresented: $isPresented) {
                ImagePickerView(selectedImage: $selectedImage, isPresented: $isPresented, sourceType: $sourceType)
                    .onDisappear {
                        if let selectedImage = selectedImage {
                            classifier.detect(uiImage: selectedImage)
                        }
                    }
            }
            .padding()

            HStack {
                Button(action: {
                    isPresented = true
                    sourceType = .camera
                }) {
                    Text("Escanear")
                        .frame(width: 200, height: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    // Acción para el botón de estrella
                }) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.trailing)
            }
        }
    }
}

struct LiveSession_Previews: PreviewProvider {
    static var previews: some View {
        LiveSession(classifier: ImageClassifier())
    }
}
