//
//  ListView.swift
//  Moonshot
//
//  Created by Adam Sayer on 2/8/2024.
//

import SwiftUI

struct ListView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List (missions) { mission in
            NavigationLink(value: mission) {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                    VStack (alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
        .preferredColorScheme(.dark)
}
