//
//  ContentView.swift
//  ListNavDemopr
//
//  Created by 김종웅 on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carStore : CarStore = CarStore(cars: carData)
    @State private var stackPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<carStore.cars.count, id: \.self) { i in
                    NavigationLink(value: i){
                        ListCell(car: carStore.cars[i])
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationDestination(for: Int.self) { i in
                CarDetail(selectedCar: carStore.cars[i])
            }
            .navigationDestination(for: String.self) { _ in
                AddNewCar(carStore: self.carStore, path: $stackPath)
            }
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(value: "Add Car") {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing:  EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 60)
            Text(car.name)
        }
    }
}

#Preview {
    ContentView()
}
