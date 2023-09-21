//
//  LiveSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//
import SwiftUI

struct LiveSession: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .cornerRadius(10)
                    .frame(width: 350, height: 300)
                
                VStack(spacing: 0) {
                    Image(systemName: "video.fill") // aca va el video imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 190) // Tamaño de la imagen/video
                    
                    Text("Instrucciones")
                        .font(.headline)
                        .padding()
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                }) {
                    Text("Escanear")
                        .frame(width: 200, height:.infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
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
        LiveSession()
    }
}
