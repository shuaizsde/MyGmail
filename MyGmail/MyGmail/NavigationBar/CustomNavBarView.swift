//
//  CustomNavBarView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/14/23.
//

import SwiftUI

struct CustomNavBarView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var showBackButton: Bool = true

    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }

            Spacer()

            titleSection

            Spacer().frame(width: 0)

            if showBackButton {
                backButton.opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(GmailColor.gray)
        .font(.headline)
        .background(Color.white.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            GmailIcons.backButtonIcon
        })
    }

    private var titleSection: some View {
        HStack(spacing: 20) {
            Button(action: {}, label: { GmailIcons.swipeDownIcon })

            Button(action: {}, label: { GmailIcons.trashIcon })

            Button(action: {}, label: { GmailIcons.envelopeIcon })

            Button(action: {}, label: { GmailIcons.ellipsisIcon })
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView()
    }
}
