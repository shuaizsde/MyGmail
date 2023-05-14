//
//  MyGmailSideMenuItems.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/13/23.
//

import SwiftUI

class SideMenuItemViewModel: ObservableObject {
    
    @Published private var model = SideMenuItems()
    
    var cells: Array<CellItem> {
        return model.cells
    }
      
    func select(_ cell:  CellItem) {
        model.select(cell)
        print("ViewModel: \(cell.title) is selected")
        print(model.chosenCellIndex ?? -1)
    }
}
