//
//  QuestionsView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var isPresented: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView

        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.isPresented = false
        }
    }
}

struct QuestionsView: View {
    @Binding var question: Question
    @State private var isShowingImagePicker = false

    var body: some View {
        VStack {
            Section(title: "Título de la Pregunta", icon: "pencil", content: {
                TextField("Ingresa el título de la pregunta", text: $question.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            })

            Section(title: "Descripción de la Pregunta", icon: "doc.text", content: {
                TextField("Ingresa la descripción de la pregunta", text: $question.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            })

            Button(action: {
                self.isShowingImagePicker = true
            }) {
                Text("Seleccionar Imagen")
            }
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView(selectedImage: $question.image, isPresented: $isShowingImagePicker)
            })

            // Mostrar la imagen seleccionada si existe
            if let selectedImage = question.image {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }

            Divider()
        }
        .padding()
    }
}

struct QuestionSection<Content: View>: View{
    let title: String
    let icon: String
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            .padding(.bottom, 4)
            content()
        }
        .padding(.vertical)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(question: .constant(Question(title: "", description: "", image: nil)))
    }
}
