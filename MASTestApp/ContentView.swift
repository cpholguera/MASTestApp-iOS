//
//  ContentView.swift
//  MASTestApp
//
//  Created by Charlie on 28.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var displayText: String = "OWASP MAS" // Initial text

    var body: some View {
        VStack(spacing: 50) {
            Text(displayText)  // This Text will display the updated value
                .font(.title)
                .padding()

            Button(action: {
                // Call the function and update displayText with the result
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
            .padding()
        }
    }
}
