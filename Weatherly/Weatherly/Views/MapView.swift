//
//  MapView.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = LocationViewModel()
    var weatherManage = WeatherAPI()
    @State var forecast: ResponseBody?
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemGray2))
                .onAppear {
                    viewModel.checkServices()
                }
                .preferredColorScheme(.dark)
                .task {
                    do {
                        forecast = try await
                        weatherManage.getWeather(latitude: viewModel.lat, longitude: viewModel.long)
                    } catch {
                        print("Error getting weather: \(error)")
                    }
                }
               
                VStack {
                    Spacer()
                        .padding(.bottom, 100.0)
                    NavigationLink(destination: WeatherView(weather: forecast ?? previewWeather)
                        .navigationBarTitle(Text("Home"))
                        .navigationBarHidden(true)) {
                        Text("Todays forecast")
                    }
                    .buttonStyle(GrowingButton())
                }

        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
