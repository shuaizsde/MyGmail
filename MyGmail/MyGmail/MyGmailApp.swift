/* * Copyright 2023 Simon Zhang. All rights reserved. */

import SwiftUI

@main
struct MyGmailApp: App {
    @StateObject private var slideInMenuService = SlideInMenuService()
    @StateObject private var showToolBarService = ShowToolBarService()
    @StateObject private var filterService = FilterService()
    @StateObject private var inboxViewModel = InboxMailsViewModel()
    @StateObject var gptViewModel = GPTViewModel(api: ChatGPTAPI(apiKey: "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"))
    var body: some Scene {
        WindowGroup {
            Group {
                Home()
            }.environmentObject(slideInMenuService)
                .environmentObject(showToolBarService)
                .environmentObject(filterService)
                .environmentObject(inboxViewModel)
                .slideInView(
                    isActive: $slideInMenuService.isPresented,
                    edge: .leading,
                    paddingPercentage: 0.3,
                    options:
                    SlideInViewOptions(
                        paddingColor: .gray,
                        paddingColorOpacity: 0.8))
            {
                SideBarMenuView(
                    model: SideMenuItemViewModel(filterService: filterService)
                )
                .environmentObject(slideInMenuService)
                .environmentObject(showToolBarService)
                .environmentObject(inboxViewModel)
                .environmentObject(gptViewModel)
            }
        }
    }
}
