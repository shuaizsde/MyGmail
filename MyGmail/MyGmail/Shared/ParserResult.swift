//
//  ParserResult.swift
//  XCAChatGPT
//
//  Created by Shuai Zhang on 05/23/23.
//

import Foundation

struct ParserResult: Identifiable {

    let id = UUID()
    let attributedString: AttributedString
    let isCodeBlock: Bool
    let codeBlockLanguage: String?

}
