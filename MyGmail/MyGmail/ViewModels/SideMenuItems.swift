//
//  SideMenuItems.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/13/23.
//

import SwiftUI

struct SideMenuItems {
    private(set) var cells: [CellItem] = {
        var cells = [CellItem]()
        // Section 1
        cells.append(CellItem(id: 0, profilePicture: "tray", title: "All Inboxes", unreads: 5))
        cells.append(CellItem(id: 1, profilePicture: "timelapse", title: "Primary"))
        cells.append(CellItem(id: 2, profilePicture: "person.2", title: "Social", unreads: 3))
        cells.append(CellItem(id: 3, profilePicture: "tag", title: "Promotions", unreads: 1))

        // Section 2
        cells.append(CellItem(id: 4, profilePicture: "star", title: "Starred"))
        cells.append(CellItem(id: 5, profilePicture: "timer", title: "Snoozed", unreads: 24))
        cells.append(CellItem(id: 6, profilePicture: "flag", title: "Important"))
        cells.append(CellItem(id: 7, profilePicture: "paperplane", title: "Sent", unreads: 123))
        cells.append(CellItem(id: 8, profilePicture: "calendar", title: "Scheduled"))
        cells.append(CellItem(id: 9, profilePicture: "square.and.pencil", title: "Drafts"))
        cells.append(CellItem(id: 10, profilePicture: "mail.stack", title: "All mail", unreads: 528))
        cells.append(CellItem(id: 11, profilePicture: "xmark.bin", title: "Spam", unreads: 20))
        cells.append(CellItem(id: 12, profilePicture: "trash", title: "Trash"))
        cells.append(CellItem(id: 13, profilePicture: "archivebox", title: "Archive"))
        // Section 3
        cells.append(CellItem(id: 14, profilePicture: "plus", title: "Create new"))
        cells.append(CellItem(id: 15, profilePicture: "gear", title: "Settings"))
        cells.append(CellItem(id: 16, profilePicture: "character.bubble", title: "Send feedback"))
        cells.append(CellItem(id: 17, profilePicture: "questionmark.circle", title: "Help"))
        return cells
    }()

    var chosenCellIndex: Int? {
        get { cells.indices.filter { cells[$0].isSelected }.oneAndOnly }
        set { cells.indices.forEach { cells[$0].isSelected = ($0 == newValue) } }
    }

    mutating func select(_ cell: CellItem) {
        guard let selected = cells.firstIndex(where: { $0.id == cell.id }) else {
            return
        }
        if chosenCellIndex == nil {
            chosenCellIndex = selected
            cells[selected].isSelected = true
            return
        } else if chosenCellIndex != selected {
            cells[chosenCellIndex!].isSelected = false
            chosenCellIndex = selected
            cells[selected].isSelected = true
        }
    }
}

struct CellItem: Identifiable {
    let id: Int

    let profilePicture: String
    let title: String
    var unreads: Int?
    var isSelected: Bool = false
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
