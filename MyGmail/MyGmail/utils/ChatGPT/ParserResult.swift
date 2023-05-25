/* * Copyright 2023 Simon Zhang. All rights reserved. */

import Foundation

struct ParserResult: Identifiable {
    let id = UUID()
    let attributedString: AttributedString
    let isCodeBlock: Bool
    let codeBlockLanguage: String?
}
