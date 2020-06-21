//
//  SabView.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

struct SabView: View {
    @State var isActivated  = false
    @ObservedObject var menuVM = MenuViewModel()
    @State private var animationAmount: CGFloat = 1
    @State var value: Double = 0.0
    @State private var currentPosition = CGSize.zero
    @State private var newPosition: CGSize = .zero

    let letters = Array("Hello SwiftUI")
       @State private var enabled = false
    
    var range: (Double, Double) = (0, 1)
    @State var position: CGFloat = 0.0

    var body: some View {
        
         return GeometryReader { geometry in
                   self.view(geo: geometry) // function below
        }
            
    }
    
    private func view(geo: GeometryProxy) -> some View {
        let frame = geo.frame(in: .global) // get frame
        
        return  ZStack {
                           
            ZStack{
                self.menuVM.selected.color
                self.menuVM.selected.menumView.foregroundColor(.white)

                Color.black.opacity(self.isActivated ? 0.2 : 0)
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            ZStack{
                                ForEach(0..<self.menuVM.menus.count){ index in
                                    SabButton(isActivated: self.$isActivated, menuVM: self.menuVM, currentIndex: index)
                                }.offset(x: self.currentPosition.width, y: self.currentPosition.height)
                                .animation(.springer())
                                MainMenuButton(isActivated: self.$isActivated)
                                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                                .animation(Animation.default.delay(Double(1) / 20))                   .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                        }
                                    .onEnded { value in
                                            print("onEnded: \(value.location.x)")
                                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                            print(self.newPosition.width)
                                            self.currentPosition.height = 0.0
                                            self.newPosition = self.currentPosition
                                            self.position = value.location.x

                                            self.enabled.toggle()
                                        print("x = \(geo.size.width + self.newPosition.width + -20)")
                                        print("newPosition: \(self.newPosition)")
                                        print("location: \(value.location)")
                                        print("translation: \(value.translation)")

                                        }
                                )

                            }
                        }
                    }
            }

            }.animation(.spring())
        }.edgesIgnoringSafeArea(.all)
          
    }
}

struct SabView_Previews: PreviewProvider {
    static var previews: some View {
        SabView().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
