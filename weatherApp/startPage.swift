//
//  StartPage.swift
//  weatherApp
//
//  Created by Harish Chaurasia on 11/25/23.
//

import SwiftUI

struct StartPage: View {
    @State private var isActive = false
    @State private var size = 0.0
    @State private var opacity = 0.5
    var body: some View {
        
        if isActive {
            WeatherPage()
        }
        else
        {
            VStack{
                ZStack{
                    GeometryReader { geo in
                        Image("startPage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 750)
                            .opacity(1.0)
                    }
                    ZStack{
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 260, height: 260)
//                            .offset(x: 0, y: -120)
                            .position(CGPoint(x: 200.0, y: 275))
                            .shadow(color: Color(hex: "274654"), radius: 20, x: 10, y: 10)
                        
                        
                        Text("SkyWand")
                            .foregroundColor(Color(hex: "274654"))
                            .position(x: 200, y: 550)
                            .font(Font.custom("SFProDisplay-Medium", size: 64))
                            .shadow(color: Color(hex: "274654"), radius: 25, x: 10, y: 10)
                        
                        Text("Your favorite Weather app")
                            .foregroundColor(Color(hex: "055E68"))
                            .position(CGPoint(x: 200.0, y: 610))
                            .font(Font.custom("SFProDisplay-Medium", size: 18))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 1.0
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        self.isActive = true
                    }
                }
            }
        }
    }
}

//#Preview {
//    StartPage()
//}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}


// Extension to create a Color from a hex code
extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
