//
//  View1.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

struct View1: View {
    @State var play = 0

    var body: some View {
        ZStack {
            Color.white
            VStack {
                LottieView(name: "together", play: $play)
            }
        }.onAppear(){
            self.play = 1
        }
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
