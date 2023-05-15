//
//  FilterService.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

class FilterService: ObservableObject {
    @Published var currentFilter: (InboxMailsViewModel.Mail)-> Bool = {_ in true }
}
