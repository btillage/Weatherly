//
//  WeatherView.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import SwiftUI

struct WeatherView: View {
    var weather:  ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather.name)
                            .bold()
                            .font(.system(size: 40))
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                            .font(.system(size: 20))
                        
                    }
                    .padding(.trailing, 80.0)
                    VStack {
                        Image(systemName: weatherSymbol(weather: weather))
                            .font(.system(size: 60))
                        
                        Text(weather.weather[0].main)
                    }
               
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather Currently")
                            .bold()
                            .padding(.bottom)
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                        }
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + "mph")
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: String(weather.main.humidity) + "%")
                        }
                        HStack {
                            WeatherRow(logo: "cloud", name: "Cloudiness", value: String(weather.clouds.all) + "%")
                            Spacer()
                            WeatherRow(logo: "eyeglasses", name: "Visibility", value: String(weather.visibility / 100) + "%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.037, brightness: 0.073))
                    .background(.white)
                    .cornerRadius(15)
                    
                }
                Spacer()
                VStack {
                    Text(weather.main.feelsLike
                        .roundDouble() + "°")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .padding()
                
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 1.0, saturation: 0.037, brightness: 0.073))
        .preferredColorScheme(.dark)

    }
}

func weatherSymbol(weather: ResponseBody) -> String {
     
    if weather.weather[0].main == "Thunderstorm" {
        return "cloud.bolt"
    }
    if weather.weather[0].main == "Drizzle"{
        return "cloud.drizzle"
    }
    if weather.weather[0].main == "Rain"{
        return "cloud.rain"
    }
    if weather.weather[0].main == "Snow"{
        return "cloud.snow"
    }
    if weather.weather[0].main == "Clear"   {
        return "sun.min"
    }
    if weather.weather[0].main == "Clouds"{
        return "cloud"
    }
    return ""
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
