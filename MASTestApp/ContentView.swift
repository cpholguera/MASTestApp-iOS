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

                Spacer()

                Button(action: {
                    // Simulate calling a function and updating displayText
                    MastgTest.mastgTest { result in
                        self.displayText = result
                    }
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(10)
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
