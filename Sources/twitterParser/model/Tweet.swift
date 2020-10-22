//
//  Tweet.swift
//  
//
//  Created by Murilo Araujo on 20/10/20.
//

import Foundation

/// Tweet object
class Tweet {
    var text: String
    var language: String
    var hashtags: [Hashtag]
    
    init(text: String, language: String, hashtags: [Hashtag]) {
        self.text = text
        self.language = language
        self.hashtags = hashtags
    }
}
