/* * Copyright 2023 Simon Zhang. All rights reserved. */

import SwiftUI

class FilterService: ObservableObject {
    @Published var currentFilter: (InboxMailsViewModel.Mail) -> Bool = { !$0.isSent && !$0.isArchived && !$0.isSpam && !$0.isTrash }
}
