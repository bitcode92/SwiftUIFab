//
//  SabButton.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI
import Foundation

struct SabButton: View {
    @Binding var isActivated: Bool
    @ObservedObject var menuVM: MenuViewModel
    @State var isButtonHidden = true

    var currentIndex: Int
    var body: some View {
        let menuItem = menuVM.menus[currentIndex]
        return Button(action: {

                self.isActivated.toggle()
                self.updateSelected()
            }, label: {
                ZStack(){
                    Text(menuItem.text ?? "Title").multilineTextAlignment(.trailing).foregroundColor(.white).opacity(self.isActivated ? 1 : 0)
                        .offset(x: -60, y: 0)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .animation( self.isActivated ? .springerDelay() : .easeInFast())
                        
                    Circle().fill(menuItem.color)
                    .overlay(Image(systemName: menuItem.icon ?? "plus"))
                    .foregroundColor(.white)
                    .frame(width: self.isActivated ? ButtonSizes.small.rawValue : 0, height: self.isActivated ? ButtonSizes.small.rawValue : 0)
                }
            })
            //.position(x: geo.size.width - 40, y: geo.size.height - 40)
            .offset(x: -20, y: CGFloat(self.isActivated ? -20 + calcOffsect().y : -20))
    }
    

   
    
    func calcOffsect() -> (x: CGFloat, y: CGFloat) {
        
        let mainButtonSize = -Double(ButtonSizes.medium.rawValue) * 0.90
        let initialYOffset = -20.0 //adjust to change button spacing
        
        let yStart = mainButtonSize + initialYOffset
        if currentIndex == 0{
            return (-20, CGFloat(yStart))
        }
        let mulIndex = initialYOffset * Double(currentIndex)
        let offset =  -Double(ButtonSizes.small.rawValue) * Double((currentIndex)) + mulIndex
        return (-20, CGFloat(yStart) + CGFloat(offset))
    }
    
    func updateSelected(){
        let menuItem = menuVM.menus[currentIndex]
        for i in 0..<self.menuVM.menus.count {
            self.menuVM.menus[i].isSelected = menuItem.id == menuVM.menus[i].id
        }
    }
}

struct SabButton_Previews: PreviewProvider {
    static var previews: some View {
        SabButton(isActivated: .constant(true), menuVM: MenuViewModel(), currentIndex: 0).previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
