//
//  Tweet.swift
//  
//
//  Created by Murilo Araujo on 20/10/20.
//

import Foundation

/// Tweet object
class Tweet {
    var createdAt: Date
    var text: String
    var language: String
    var hashtags: [Hashtag]
    
    init(text: String, created: Date, language: String, hashtags: [Hashtag]) {
        self.text = text
        self.createdAt = created
        self.language = language
        self.hashtags = hashtags
    }
}
