//
//  MenuItem.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

struct MenuItem {
    
    let id = UUID()
    let color: Color
    var icon: String?
    var text: String?
    let menumView: AnyView
    var isSelected: Bool
    
}
