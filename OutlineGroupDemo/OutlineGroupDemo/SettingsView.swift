//
//  SettingsView.swift
//  OutlineGroupDemo
//
//  Created by 김종웅 on 12/4/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true
    
    @State private var filltersExoanded: Bool = true
    var body: some View {
        Form {
            DisclosureGroup(isExpanded: $filltersExoanded) {
                ToggleControl(title: "Hybrid Car", state: hybridState)
                ToggleControl(title: "Electric Car", state: electricState)
                ToggleControl(title: "FuelCell Car", state: fuelCellState)
            } label: {
                Label("Categories", systemImage: "car.2.fill")
            }
            
            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "ForegroundColor")
                ToggleControl(title: "Color Inversion", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
            
        }
    }
}


struct ColorControl: View {
    
    var color: Color
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
        .padding(.leading)
        .scaledToFill()
    }
}

struct ToggleControl: View {
    var title: String
    @State var state: Bool
    var body: some View {
        Toggle(title, isOn: $state)
            .padding()
    }
}

#Preview {
    SettingsView()
}
