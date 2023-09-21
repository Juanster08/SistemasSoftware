//
//  ContentView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Señas de Escape!")
                    .font(.largeTitle)
                    .padding()
                    .cornerRadius(10)
                    .padding(.top, 20)

                Spacer()

                VStack {
                    NavigationLink(destination: JoinSessionView()) {
                        Text("Unirse a Sesión")
                            .frame(width: 200, height: 50)
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    NavigationLink(destination: CreateSessionView()) {
                        Text("Crear Sesión")
                            .frame(width: 200, height: 50)
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: CreateGameView(createGameModel: CreateGameModel())) {
                        Text("Crear Nuevo Juego")
                            .frame(width: 200, height: 50)
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
