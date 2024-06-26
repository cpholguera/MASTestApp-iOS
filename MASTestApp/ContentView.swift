//
//  ContentView.swift
//  MASTestApp
//
//  Created by Charlie on 28.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var displayText: String = "" // Initial text

    var body: some View {
        VStack {
            HStack {
                Text("OWASP MAS")
                    .font(.title)
                    .fontWeight(.bold)
                    .font(.custom("Helvetica Neue", size: 24))

                Spacer()

                Button(action: {
                    // Simulate calling a function and updating displayText
                    MastgTest.mastgTest { result in
                        self.displayText = result
                    }
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .font(.custom("Helvetica Neue", size: 14))
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [
                        Color(red: 2/255, green: 214/255, blue: 169/255),
                        Color(red: 71/255, green: 159/255, blue: 255/255)
                    ]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(30)
                .padding(.horizontal)
            }
            .padding()

            // Text area with console style
            ScrollView {
                Text(displayText)
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.darkGray))
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
}
