//
//  ObjectViewModel.swift
//  DiloenSenas
//
//  Created by Alumno on 16/10/23.
//

import Foundation
import SwiftUI

class ObjectViewModel : ObservableObject{
    @Published var objectsToScan: [ObjectModel] = []
    
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
