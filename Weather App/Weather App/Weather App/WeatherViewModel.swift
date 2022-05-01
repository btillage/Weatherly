//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Berry Tillage on 4/16/22.
//

import Foundation
import Combine

protocol WeatherViewModel {
    func getWeather()
}

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Forecast])
}

class WeatehrViewModelImpl: ObservableObject, WeatherViewModel {
    
    private let service: WeatherService
    
    private(set) var weather = [Forecast]()
    @Published private(set) var state: ResultState = .loading
    
    private var cancellable = Set<AnyCancellable>()
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func getWeather() {
        
        self.state = .loading
        
        let cancellable = self.service
            .request(from: .getWeather)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.state = .failed(error: error)
                case .finished:
                    self.state = .success(content: self.weather)
                }
            } receiveValue: { res in
                self.weather = res.forecast
            }
            self.cancellable.insert(cancellable)
        }
    }

