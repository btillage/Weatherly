//
//  Welcome.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import Foundation
import SwiftUI
import CoreLocationUI



struct WelcomeView: View {
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                Image(systemName: "cloud")
                    .font(.system(size: 60))
                Text("Weather.ly")
                    .bold()
                    .font(.largeTitle)
                Text("Your minimal weather app")
                    .padding(.bottom, 50.0)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 1.0, saturation: 0.037, brightness: 0.073))
        .preferredColorScheme(.dark)

        
    }
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
