//
//  Animation+Extensions.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI
import Foundation

extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(1)
    }
    static func springer() -> Animation {
        Animation.interpolatingSpring(stiffness: 45, damping: 10)
    }
    static func springerDelay() -> Animation {
        Animation.interpolatingSpring(stiffness: 45, damping: 10).delay(0.5)
    }
    static func easeInFast() -> Animation {
        Animation.easeIn(duration: 0.2).speed(2)
    }
}
