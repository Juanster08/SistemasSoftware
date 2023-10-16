//
//  LiveSessionViewModel.swift
//  DiloenSenas
//
//  Created by Alumno on 16/10/23.
//

import Foundation
import SwiftUI

class LiveSessionViewModel: ObservableObject {
    @Published var imageClassifier: ImageClassifier = ImageClassifier()
    @StateObject var ObjectVM = ObjectViewModel()
    @Published var objectsToScan: [ObjectModel] = []
    
    
    // Lista de objetos a escanear y sus instruciones
    
    @Published var currentObjectIndex: Int = 0
    
    init() {
        // Configuración inicial del ViewModel si es necesario
        fetchObjectsToScanFromAPI()
    }
    
    func objectDetectedSuccessfully() {
        // Cuando se detecta el objeto correcto, incrementa el índice para cambiar al siguiente objeto
        currentObjectIndex += 1
        
        // Verifica si se han escaneado todos los objetos, en cuyo caso puedes mostrar un mensaje de victoria o reiniciar el juego
        if currentObjectIndex >= objectsToScan.count {
            // Puedes implementar acciones de finalización del juego aquí
            // Por ejemplo, mostrar un mensaje de victoria o reiniciar el juego
            currentObjectIndex = 0
        }
    }
    
    func fetchObjectsToScanFromAPI() {
            if let url = URL(string: "https://api-senas.onrender.com/objects") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let apiResponse = try decoder.decode(APIResponse.self, from: data)
                            self.objectsToScan = apiResponse.users
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }.resume()
            }
        }
}
