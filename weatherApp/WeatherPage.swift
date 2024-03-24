//
//  WeatherPage.swift
//  weatherApp
//
//  Created by Harish Chaurasia on 11/25/23.
//

import SwiftUI

// Define a model to hold the weather information
struct WeatherData {
    var cityName: String = "Seattle"
    var currentTemp: Int = 18
    var minTemp: Int = 14
    var maxTemp: Int = 26
    var weatherCondition: String = "Clear"
}

// ViewModel to manage the weather data and date string
class WeatherViewModel: ObservableObject {
    @Published var weather = WeatherData()
    @Published var dateString: String = ""
    
    init() {
        updateDateString()
    }
    
    func updateDateString() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        dateString = dateFormatter.string(from: currentDate)
    }
   
    // Add functions here to fetch weather data from an API
}

struct WeatherPage: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("weatherPage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(1.0)
                    .offset(y: -12)
                
                VStack {
                    
                    Text(viewModel.weather.cityName)
                        .font(.custom("SFProDisplay-Semibold", size: 48))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("\(viewModel.weather.currentTemp)°")
                        .font(.custom("SFProDisplay-Medium", size: 148))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 100) {
                        Text("Max: \(viewModel.weather.maxTemp)°")
                            .font(.custom("SFProDisplay-Semibold", size: 16))
                            .foregroundColor(.black)
                        
                        Text("Min: \(viewModel.weather.minTemp)°")
                            .font(.custom("SFProDisplay-Semibold", size: 16))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    
                    Text(viewModel.weather.weatherCondition)
                        .font(.custom("SFProDisplay-Light", size: 32))
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    Text(viewModel.dateString)
                        .font(.custom("SFProDisplay-Regular", size: 16))
                        .foregroundColor(.black)
                        .padding(.top, 125)
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            viewModel.updateDateString()
            // Add call to fetch weather data from API here
        }
    }
}
#Preview {
    WeatherPage()
}
