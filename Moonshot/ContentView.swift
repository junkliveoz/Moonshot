//
//  ContentView.swift
//  Moonshot
//
//  Created by Adam Sayer on 31/7/2024.
//

import SwiftUI

struct ContentView: View {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    @AppStorage("showingGrid") var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid == true {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.3x3")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
