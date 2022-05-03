//
//  ContentView.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import Foundation
import SwiftUI
import MapKit


struct ContentView: View {
    
    @StateObject private var viewModel = LocationViewModel()
    var weatherManager = WeatherAPI()
            
    
    var body: some View {
        NavigationView {
            ZStack {
                WelcomeView()
                VStack {
                    Spacer()
                        .padding(.bottom, 100.0)
                    NavigationLink(destination: MapView()
                        .navigationBarTitle(Text("Home"))
                        .navigationBarHidden(true)) {
                        Text("Ready for your forecast?")
                    }
                    
                    .buttonStyle(GrowingButton())
                }
            }
        }
    }
}




struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
