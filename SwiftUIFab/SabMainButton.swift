//
//  SabMainButton.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

struct MainMenuButton: View {
    @Binding var isActivated: Bool
    var position: SabPostion = .right
    @State private var degrees = 0.0

    var body: some View {
     
         return
            Circle()
                .fill(Color.blue)
            .overlay(Image(systemName: "plus"))
                .foregroundColor(.white)
                .frame(width: self.isActivated ? ButtonSizes.medium.rawValue * 0.90 : ButtonSizes.medium.rawValue, height: self.isActivated ? ButtonSizes.medium.rawValue * 0.90 : ButtonSizes.medium.rawValue)
            .rotationEffect(.degrees(self.degrees))
                .offset(x: -20, y: -20)
                .onTapGesture {
                    self.isActivated.toggle()
                    withAnimation {
                        self.degrees += 360
                    }
                }
    }

}
struct MainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButton(isActivated: .constant(false)).previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}

