//
//  MenuViewModel.swift
//  SwiftUIFab
//
//  Created by Jameson Burroughs on 6/21/20.
//  Copyright © 2020 Jameson Burroughs. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    
    @Published var menus: [MenuItem] = [
        MenuItem(color: Color.red, text: "View 1", menumView: AnyView(View1()), isSelected: true),
        MenuItem(color: Color.orange, text: "View 2", menumView: AnyView(View2()), isSelected: false),
        MenuItem(color: Color.yellow, text: "View  3", menumView: AnyView(View3()), isSelected: false),
        MenuItem(color: Color.green, text: "View 4", menumView: AnyView(View4()), isSelected: false),

    ]
    
    var selected: MenuItem {
        guard let selected = menus.filter({ $0.isSelected }).first else {
            fatalError("You need to set atleast one of the MenuItems to  in MainViewModal as isSelected: true.")
        }
        return selected
    }
    
}
