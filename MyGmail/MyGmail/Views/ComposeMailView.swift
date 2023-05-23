//
//  ComposeMailView.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/13/23.
//

import AVKit
import SwiftUI

struct ComposeMailView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: "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"))
    @FocusState var isTextFieldFocused: Bool

    @EnvironmentObject var showToolBarService: ShowToolBarService

    private let composeButtonOffsetX = 320.0
    private let composeButtonOffsetY = 640.0

    @State var receiver: String = ""
    @State var sender: String = "Simon"
    @State var subject: String = ""
    @State var content: String = ""

    @State var showText = ""
    @State var isAnimating = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("To")

                    TextField("", text: $receiver)
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                Divider()
                HStack {
                    Text("From")

                    TextField("", text: $sender)
                }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                Divider()
                TextField("Subject", text: $subject)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                Divider()

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $content)
                    Text("Compose mail").fontWeight(.light).foregroundColor(.black.opacity(0.25)).padding(8).hidden(!content.isEmpty)
                }
            }
            .font(GmailFont.defaultFont2)
            .foregroundColor(GmailColor.gray)

            VStack {
                Spacer()
                aiGeneratorButtonView()
                    .foregroundColor(Color.gray)
                Text(vm.messages.last?.responseText ?? "")
                    .onTapGesture {
                        withAnimation(.spring()){
                            content = vm.messages.last?.responseText ?? ""
                            vm.messages.removeAll()
                        }
                    }.padding(vm.messages.last?.responseText?.isEmpty ?? true ? 0 : 10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.8))
                
            }.padding()
        }
        .onAppear(
            perform: { showToolBarService.showToolBar = false }
        )
    }

    func aiGeneratorButtonView() -> some View {
        Button(action: {
            vm.composeContent.sender = sender
            vm.composeContent.receiver = receiver
            vm.composeContent.subject = subject
            vm.composeContent.content = content
            isAnimating = true
            Task { @MainActor in
                isTextFieldFocused = false
                await vm.sendTapped()
            }
            showText = vm.messages.last?.responseText ?? ""

        }, label: { Image(systemName: "wand.and.stars")
                .font(GmailFont.defaultLargeProfile)
                .foregroundColor(.white)
                .background(
                    Circle().fill(
                        LinearGradient(
                            gradient: 
                                .init(colors: 
                                        [Color.red.opacity(0.5),
                                         Color.blue,
                                         Color.yellow.opacity(0.5)]
                                     ), 
                            startPoint: .top, 
                            endPoint: .bottom
                        )
                    )
                ) 
                .shadow(color: Color(.gray).opacity(0.8), radius: 5, x: 5, y: 5)
        })
    }
    
}
extension View {
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: hidden()
        case false: self
        }
    }
}

struct ComposeMailView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeMailView()
    }
}

//
// func bottomView2(image: String) -> some View {
//    HStack(alignment: .top, spacing: 8) {
//        if image.hasPrefix("http"), let url = URL(string: image) {
//            AsyncImage(url: url) { image in
//                image
//                    .resizable()
//                    .frame(width: 30, height: 30)
//            } placeholder: {
//                ProgressView()
//            }
//
//        } else {
//            Image(image)
//                .resizable()
//                .frame(width: 30, height: 30)
//        }
//
//        TextField("Extra requirements", text: $vm.inputMessage, axis: .vertical)
//            .textFieldStyle(.roundedBorder)
//            .focused($isTextFieldFocused)
//            .disabled(vm.isInteractingWithChatGPT)
//
//        if vm.isInteractingWithChatGPT {
//                Button {
//                    vm.cancelStreamingResponse()
//                    content = ""
//                } label: {
//                    Image(systemName: "stop.circle.fill")
//                        .font(.system(size: 30))
//                        .symbolRenderingMode(.multicolor)
//                        .foregroundColor(.red)
//                }
//        } else {
//            Button {
//                vm.composeContent.sender = sender
//                vm.composeContent.receiver = receiver
//                vm.composeContent.content = content
//                Task { @MainActor in
//                    isTextFieldFocused = false
//                    await vm.sendTapped()
//                }
//                withAnimation() {
//                    showText = vm.messages.last?.responseText ?? ""
//                }
//            } label: {
//                Image(systemName: "paperplane.circle.fill")
//                    .rotationEffect(.degrees(45))
//                    .font(.system(size: 30))
//            }
//            .buttonStyle(.borderless)
//            .keyboardShortcut(.defaultAction)
//            .foregroundColor(.accentColor)
//            .disabled(vm.inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
//        }
//    }
//    .padding(.horizontal, 16)
//    .padding(.top, 12)
// }
//
// var chatListView: some View {
//    ScrollViewReader { proxy in
//        VStack(spacing: 0) {
//            ScrollView {
//                LazyVStack(spacing: 0) {
//                    ForEach(vm.messages) { message in
//                        MessageRowView(message: message) { message in
//                            Task { @MainActor in
//                                await vm.retry(message: message)
//                            }
//                        }
//                    }
//                }
//                .onTapGesture {
//                    isTextFieldFocused = false
//                }
//            }
//            #if os(iOS) || os(macOS)
//                Divider()
//                bottomView(image: "profile", proxy: proxy)
//                Spacer()
//            #endif
//        }
//        .onChange(of: vm.messages.last?.responseText) { _ in scrollToBottom(proxy: proxy)
//        }
//    }
//    .background(colorScheme == .light ? .white : Color(red: 52 / 255, green: 53 / 255, blue: 65 / 255, opacity: 0.5))
// }
//
// func bottomView(image: String, proxy: ScrollViewProxy) -> some View {
//    HStack(alignment: .top, spacing: 8) {
//        if image.hasPrefix("http"), let url = URL(string: image) {
//            AsyncImage(url: url) { image in
//                image
//                    .resizable()
//                    .frame(width: 30, height: 30)
//            } placeholder: {
//                ProgressView()
//            }
//
//        } else {
//            Image(image)
//                .resizable()
//                .frame(width: 30, height: 30)
//        }
//
//        TextField("Send message", text: $vm.inputMessage, axis: .vertical)
//        #if os(iOS) || os(macOS)
//            .textFieldStyle(.roundedBorder)
//        #endif
//            .focused($isTextFieldFocused)
//            .disabled(vm.isInteractingWithChatGPT)
//
//        if vm.isInteractingWithChatGPT {
//            #if os(iOS)
//                Button {
//                    vm.cancelStreamingResponse()
//                } label: {
//                    Image(systemName: "stop.circle.fill")
//                        .font(.system(size: 30))
//                        .symbolRenderingMode(.multicolor)
//                        .foregroundColor(.red)
//                }
//            #else
//                DotLoadingView().frame(width: 60, height: 30)
//            #endif
//        } else {
//            Button {
//                Task { @MainActor in
//                    isTextFieldFocused = false
//                    scrollToBottom(proxy: proxy)
//                    await vm.sendTapped()
//                }
//            } label: {
//                Image(systemName: "paperplane.circle.fill")
//                    .rotationEffect(.degrees(45))
//                    .font(.system(size: 30))
//            }
//            #if os(macOS)
//            .buttonStyle(.borderless)
//            .keyboardShortcut(.defaultAction)
//            .foregroundColor(.accentColor)
//            #endif
//            .disabled(vm.inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
//        }
//    }
//    .padding(.horizontal, 16)
//    .padding(.top, 12)
// }
//
// private func scrollToBottom(proxy: ScrollViewProxy) {
//    guard let id = vm.messages.last?.id else { return }
//    proxy.scrollTo(id, anchor: .bottomTrailing)
// }
