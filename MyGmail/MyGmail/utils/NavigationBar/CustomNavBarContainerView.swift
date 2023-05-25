/* * Copyright 2023 Simon Zhang. All rights reserved. */

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView()
            content.frame(
                maxWidth: .infinity,
                maxHeight: .infinity)
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                Text("Hello")
                    .foregroundColor(.white)
            }
        }
    }
}
