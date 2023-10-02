//
//  ContentView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var isJoinSessionActive = false
    @State private var isCreateSessionActive = false
    @State private var isCreateGameActive = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack {
                    Image("fondo1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        
                            .navigationDestination(isPresented: $isJoinSessionActive) {
                                JoinSessionView()
                            }
                        
                        
                        Button(action: {
                            isJoinSessionActive = true
                        }) {
                            Text("Unirse a Sesión")
                                .frame(width: 200, height: 50)
                                .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                                .bold()
                        }
                        
                        .navigationDestination(isPresented: $isCreateSessionActive) {
                            CreateSessionView()
                        }
                        
                        Button(action: {
                            isCreateSessionActive = true
                        }) {
                            Text("Crear Sesión")
                                .frame(width: 200, height: 50)
                                .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                                .bold()
                        }
                        
                        .navigationDestination(isPresented: $isCreateGameActive) {
                            CreateGameView(createGameModel:CreateGameModel())
                        }
                        
                        Button(action: {
                            isCreateGameActive = true
                        }) {
                            Text("Crear Nuevo Juego")
                                .frame(width: 200, height: 50)
                                .background(Color(red: 255/255, green: 87/255, blue: 50/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                                .bold()
                        }
                        
                        Spacer()
                    }
                    .background(Color.clear)
                }
            }
            .navigationBarTitle("") // Oculta el título de navegación
            .navigationBarHidden(true) // Oculta la barra de navegación
        }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
