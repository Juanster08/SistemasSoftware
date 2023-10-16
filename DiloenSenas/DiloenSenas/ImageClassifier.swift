//
//  ImageClassifier.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 21/9/23.
//

import SwiftUI

class ImageClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
        
    }
        
}

//LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]) {
//Toggle("Lápiz", isOn: $objectsToggle.lapizToggle)
  //  Toggle("Pluma", isOn: $objectsToggle.plumaToggle)
 //   Toggle("Libreta", isOn: $objectsToggle.libretaToggle)
    //Toggle("Libro", isOn: $objectsToggle.libroToggle)
   // Toggle("Borrador", isOn: $objectsToggle.borradorToggle)
   // Toggle("Regla", isOn: $objectsToggle.reglaToggle)
    //Toggle("Crayola", isOn: $objectsToggle.crayolaToggle)
   // Toggle("Sacapuntas", isOn: $objectsToggle.sacapuntasToggle)
   // Toggle("Pegamento", isOn: $objectsToggle.pegamentoToggle)
