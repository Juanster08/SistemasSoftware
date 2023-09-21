//
//  Questions.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var image: UIImage?  // Cambia Image por UIImage
    var icon: Image?
}
