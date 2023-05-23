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
    let composeContent = ComposeMailInfo(sender: "You", receiver: "Susan", content: "How are you doing?")

    @EnvironmentObject var showToolBarService: ShowToolBarService

    private let composeButtonOffsetX = 320.0
    private let composeButtonOffsetY = 640.0

    @State var receiver: String = ""
    @State var sender: String = "test@gmail.com"
    @State var subject: String = ""
    @State var content: String = ""
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
            .onAppear(
                perform: { showToolBarService.showToolBar = false }
            )
            aiGeneratorButtonView()
        }
    }

    var chatListView: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(vm.messages) { message in
                            MessageRowView(message: message) { message in
                                Task { @MainActor in
                                    await vm.retry(message: message)
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        isTextFieldFocused = false
                    }
                }
                #if os(iOS) || os(macOS)
                    Divider()
                    bottomView(image: "profile", proxy: proxy)
                    Spacer()
                #endif
            }
            .onChange(of: vm.messages.last?.responseText) { _ in scrollToBottom(proxy: proxy)
            }
        }
        .background(colorScheme == .light ? .white : Color(red: 52 / 255, green: 53 / 255, blue: 65 / 255, opacity: 0.5))
    }

    func bottomView(image: String, proxy: ScrollViewProxy) -> some View {
        HStack(alignment: .top, spacing: 8) {
            if image.hasPrefix("http"), let url = URL(string: image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 30, height: 30)
                } placeholder: {
                    ProgressView()
                }

            } else {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
            }

            TextField("Send message", text: $vm.inputMessage, axis: .vertical)
            #if os(iOS) || os(macOS)
                .textFieldStyle(.roundedBorder)
            #endif
                .focused($isTextFieldFocused)
                .disabled(vm.isInteractingWithChatGPT)

            if vm.isInteractingWithChatGPT {
                #if os(iOS)
                    Button {
                        vm.cancelStreamingResponse()
                    } label: {
                        Image(systemName: "stop.circle.fill")
                            .font(.system(size: 30))
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.red)
                    }
                #else
                    DotLoadingView().frame(width: 60, height: 30)
                #endif
            } else {
                Button {
                    Task { @MainActor in
                        isTextFieldFocused = false
                        scrollToBottom(proxy: proxy)
                        await vm.sendTapped()
                    }
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .rotationEffect(.degrees(45))
                        .font(.system(size: 30))
                }
                #if os(macOS)
                .buttonStyle(.borderless)
                .keyboardShortcut(.defaultAction)
                .foregroundColor(.accentColor)
                #endif
                .disabled(vm.inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }

    func aiGeneratorButtonView() -> some View {
        Button(action: {}, label: { Image(systemName: "wand.and.stars") })
            .position(
                x: composeButtonOffsetX,
                y: composeButtonOffsetY
            )
    }

    private func scrollToBottom(proxy: ScrollViewProxy) {
        guard let id = vm.messages.last?.id else { return }
        proxy.scrollTo(id, anchor: .bottomTrailing)
    }
}

struct ComposeMailInfo {
    var sender: String
    var receiver: String
    var content: String
}

extension View {
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: hidden()
        case false: self
        }
    }
}
