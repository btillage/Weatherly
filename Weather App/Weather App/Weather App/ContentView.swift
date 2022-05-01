//
//  ContentView.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Environment(\.openURL) var openURL
    @StateObject var viewModel: WeatehrViewModelImpl = WeatehrViewModelImpl(service: WeatherServiceImpl())
    
    var body: some View {
        
        Group {
            switch viewModel.state {
            case .success(let content):
                
                
            }
        }
    }
}


