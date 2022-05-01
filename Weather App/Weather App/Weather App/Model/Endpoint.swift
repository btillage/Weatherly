//
//  Endpoint.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import Foundation

// This protocol is what builds the API request. We are creating a protocol purely out of good practice in case we want to add in any other API’s. If we were to add in other API’s, we can reuse the protocol to build those requests as well
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

// This is the actual defined API
enum WeatherAPI {
    case getWeather
}

// This part is pretty self explanatory. Here we are just building the API. The base url is the url of the website we are pulling from. The path is the
extension WeatherAPI: APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getWeather:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "/weather?latitude=40.709335&longitude=-73.956558"
        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getWeather:
            return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
        }
    }
}



