//
//  JoinSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//
import SwiftUI
import UIKit

struct JoinSessionView: View {
    @State private var showPINInput = false
    @State private var showQRScanner = false
    @State private var enteredPIN = "1234"
    @State private var isSessionJoined = false

    var body: some View {
        ZStack {
            Image("fondo3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(0)

            VStack {
                HStack {
                    Button(action: {
                        self.showPINInput = true
                        self.showQRScanner = false
                    }) {
                        Text("Ingresa PIN")
                            .frame(width: 150, height: 50)
                            .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .bold()
                    }
                    .padding()

                    Button(action: {
                        self.showPINInput = false
                        self.showQRScanner = true
                    }) {
                        Text("Escanea QR")
                            .frame(width: 150, height: 50)
                            .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .bold()
                    }
                    .padding()
                }
                Spacer()

                if showPINInput {
                    // Vista para ingresar el PIN
                    TextField("Ingresa el PIN", text: $enteredPIN)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)

                    Button(action: {
                        // Verificar el PIN y activar la navegación si es correcto
                        if enteredPIN == "1234" { // Reemplaza "PIN_CORRECTO" con el valor correcto
                            isSessionJoined = true
                        } else {
                            print("PIN Desconocido")
                        }
                    }) {
                        Text("Unirse a la Sesión")
                            .frame(width: 200, height: 50)
                            .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .bold()
                    }
                    .padding()
                    
                    .navigationDestination(isPresented: $isSessionJoined) {
                        LiveSession(classifier: ImageClassifier())
                    }
                    
                    } else if showQRScanner {
                  // Vista para escanear el código QR (necesitarás implementarlo utilizando UIKit)
                  QRScannerView()
              }
              Spacer()
          }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)
            .alignmentGuide(.top) { _ in 0 }
        }
        .navigationBarTitle("") // Oculta el título de navegación
        .navigationBarHidden(true) // Oculta la barra de navegación
    }
}

struct SessionView: View {
    var body: some View {
        // Contenido de la vista de sesión después de unirse
        Text("¡Te has unido a la sesión!")
    }
}


struct QRScannerView: View {
    var body: some View {
        // Aquí debes implementar la vista que abre la cámara y escanea el código QR utilizando UIKit
        // Puedes hacerlo en una representación UIViewControllerRepresentable
        Text("Escanea QR aquí")
            .font(.largeTitle)
            .onAppear {
                // Aquí debes abrir la cámara para escanear el código QR
            }
    }
}

struct JoinSession_Preview: PreviewProvider {
    static var previews: some View {
        JoinSessionView()
    }
}