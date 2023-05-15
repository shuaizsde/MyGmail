//
//  FilterService.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

class FilterService: ObservableObject {
    @Published var currentFilter: (InboxMailsViewModel.Mail) -> Bool = {!$0.isSent && !$0.isArchived && !$0.isSpam && !$0.isTrash }
}
