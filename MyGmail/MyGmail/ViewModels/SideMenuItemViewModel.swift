//
//  MyGmailSideMenuItems.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/13/23.
//

import SwiftUI

class SideMenuItemViewModel: ObservableObject {
    
    @Published private var model = SideMenuItems()
    @ObservedObject var filterService: FilterService
    
    @Published var filter: (()->Bool)? = nil
    
    init(model: SideMenuItems = SideMenuItems(), filterService: FilterService) {
        self.model = model
        self.filterService = filterService
    }
    
    var cells: Array<CellItem> {
        return model.cells
    }
      
    func select(_ cell:  CellItem) {
        model.select(cell)
        if cell.title == "Starred" {
            filterService.currentFilter = {$0.isStarred}
        }else{
            filterService.currentFilter = {_ in true}
        }
    }
    
}
