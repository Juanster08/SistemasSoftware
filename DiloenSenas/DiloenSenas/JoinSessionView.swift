//
//  JoinSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct JoinSessionView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Text("JOIN SESSION")
                Color(red: 244/255, green: 240/255, blue: 236/255)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct JoinSession_Preview: PreviewProvider {
    static var previews: some View {
        JoinSessionView()
    }
}

