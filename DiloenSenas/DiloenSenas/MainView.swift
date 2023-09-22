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
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("inicio")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        Spacer()
                        
                        VStack {
                            NavigationLink(destination: JoinSessionView(), isActive: $isJoinSessionActive) {
                                EmptyView()
                            }
                            .opacity(0)
                            
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
                            
                            NavigationLink(destination: CreateSessionView(), isActive: $isCreateSessionActive) {
                                EmptyView()
                            }
                            .opacity(0)
                            
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
                            
                            NavigationLink(destination: CreateGameView(createGameModel: CreateGameModel()), isActive: $isCreateGameActive) {
                                EmptyView()
                            }
                            .opacity(0)
                            
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
                        }
                        .background(Color.clear)
                        
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("")
                }
            }
        }
    }
}


struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
