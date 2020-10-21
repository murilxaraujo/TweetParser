//
//  MAError.swift
//  
//
//  Created by Murilo Araujo on 20/10/20.
//

import Foundation


/// Custom error protocol
protocol ErrorProtocol: LocalizedError {
    var title: String? {get}
    var code: Int {get}
}

/// Custom error struct that allows the developer to create an error at runtime
struct MAError: ErrorProtocol {
    var title: String?
    var code: Int
    var errorDescription: String? {
        return _description
    }
    var failureReason: String? {
        return _description
    }
    private var _description: String
    
    init(title: String?, description: String, code: Int) {
        self.title = title
        self._description = description
        self.code = code
    }
}
