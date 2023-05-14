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
    @State private var title: String = ""
    @State private var subtitle: String = ""
    
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
        .padding(5)
        .accentColor(.white)
        .foregroundColor(Color("gmailGray"))
        .font(.headline)
        .background(Color.white.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    private var titleSection: some View {
        HStack(spacing: 20) {
            Button(action: {
        
            }, label: {
                Image(systemName: "square.and.arrow.down")
            })
            
            Button(action: {
        
            }, label: {
                Image(systemName: "trash")
            })
            Button(action: {
        
            }, label: {
                Image(systemName: "envelope")
            })
            Button(action: {
        
            }, label: {
                Image(systemName: "ellipsis")
            })
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarView()
    }
}
