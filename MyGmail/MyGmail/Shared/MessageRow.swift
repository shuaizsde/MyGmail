//
//  MessageRow.swift
//  XCAChatGPT
//
//  Created by Shuai Zhang on 05/23/23.
//

import SwiftUI

struct AttributedOutput {
    let string: String
    let results: [ParserResult]
}

enum MessageRowType {
    case attributed(AttributedOutput)
    case rawText(String)

    var text: String {
        switch self {
        case .attributed(let attributedOutput):
            return attributedOutput.string
        case .rawText(let string):
            return string
        }
    }
}

struct MessageRow: Identifiable {

    let id = UUID()

    var isInteractingWithChatGPT: Bool

    let sendImage: String
    var send: MessageRowType
    var sendText: String {
        send.text
    }

    let responseImage: String
    var response: MessageRowType?
    var responseText: String? {
        response?.text
    }

    var responseError: String?

}
