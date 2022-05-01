//
//  WeatherService.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import Foundation
import Combine

protocol WeatherService {
    func request(from endpoint: WeatherAPI) -> AnyPublisher<WeatherResponse, APIError>
}

struct WeatherServiceImpl: WeatherService {
    
    func request(from endpoint: WeatherAPI) -> AnyPublisher<WeatherResponse, APIError> {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in .unknown}
            .flatMap{ data, response -> AnyPublisher<WeatherResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                        .eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                        return Just(data)
                        .decode(type: WeatherResponse.self, decoder: jsonDecoder)
                        .mapError{ _ in .decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .errorCode(response.statusCode))
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
