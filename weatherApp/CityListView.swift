//
//  CityListView.swift
//  weatherApp
//
//  Created by Harish Chaurasia on 3/21/24.
//

import SwiftUI



struct CityListView: View {
    @State var cities = ["Seattle", "New York", "London", "Chicago"]
    @State private var showingAddCityView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("weatherPage") // Replace "backgroundImage" with the name of your actual image
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Makes the image extend into the safe area

                // Your content overlay
                List(cities, id: \.self) { city in
                    HStack {
                        Text(city)
                        Spacer()
                        Text("18°") // Replace this with actual temperature
                    }
                    .contentShape(Rectangle()) // This ensures the tap gesture is recognized for the entire row
                    .onTapGesture {
                        // Handle city selection
                    }
                }
                .background(Color.clear) // Make the List background clear
            }
            .navigationTitle("Cities")
            .toolbar {
                Button(action: {
                    showingAddCityView.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddCityView) {
                AddCityView(cities: $cities)
            }
        }
    }
}

struct AddCityView: View {
    @Binding var cities: [String]
    @State private var newCityName: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter city name", text: $newCityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add City") {
                    let trimmedCity = newCityName.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !trimmedCity.isEmpty && !cities.contains(trimmedCity) {
                        cities.append(trimmedCity)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(newCityName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .navigationTitle("Add a City")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
