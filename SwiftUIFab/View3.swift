//
//  View3.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

struct View3: View {
    @State var play = 0
    var body: some View {
        ZStack {
            VStack {
                LottieView(name: "black-lives-matter", play: $play)
            }
        }.onAppear(){
            self.play = 1
        }
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
