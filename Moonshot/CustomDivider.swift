//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Adam Sayer on 2/8/2024.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
