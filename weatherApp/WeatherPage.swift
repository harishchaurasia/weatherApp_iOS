//
//  WeatherPage.swift
//  weatherApp
//
//  Created by Harish Chaurasia on 11/25/23.
//

import SwiftUI

var cityName = "Seattle"
var currentTemp = 18
var minTemp = 14
var maxTemp = 24
var weatherCondition = "Clear"

struct WeatherPage: View {
    @State private var dateString: String = getCurrentDateString()
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("weatherPage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 750)
                    .opacity(1.0)
                
                ZStack{
                    Text(cityName)
                        .font(Font.custom("SFProDisplay-Semibold", size: 48))
                        .position(CGPoint(x: 200.0, y: 40.0))
                        .foregroundColor(.black)
                    
                    Text("\(currentTemp)°")
                        .font(Font.custom("SFProDisplay-Medium", size: 148))
                        .position(CGPoint(x: 200.0, y: 220))
                        .foregroundColor(.black)
                    
                    Text("Max: \(maxTemp)°")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .position(CGPoint(x: 150, y: 330))
                        .foregroundColor(.black)
                    
                    Text("Min: \(minTemp)°")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .position(CGPoint(x: 250, y: 330))
                        .foregroundColor(.black)
                    
                    Text("\(weatherCondition)")
                        .font(Font.custom("SFProDisplay-Light", size: 32))
                        .position(CGPoint(x: 200, y: 400))
                        .foregroundColor(.black)
                    
                    Text(dateString)
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .position(CGPoint(x: 200, y: 525))
                        .foregroundColor(.black)
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.dateString = Self.getCurrentDateString()
            }
        }
    }
    static func getCurrentDateString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return dateFormatter.string(from: currentDate)
    }
}

#Preview {
    WeatherPage()
}
