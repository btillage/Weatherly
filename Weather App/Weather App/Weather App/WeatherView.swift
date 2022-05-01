//
//  WeatherView.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import SwiftUI
import URLImage
import UIKit


struct WeatherView: View {
    
    let forecast: Forecast
    
    var body: some View {
        VStack {
            Text(forecast.name )
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
            HStack {
                Text(String(forecast.temperature) )
                    .font(.system(size: 20, weight: .bold))
                Text(forecast.forecastDescription )
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}
