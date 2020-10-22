//
//  File.swift
//  
//
//  Created by Murilo Araujo on 21/10/20.
//

import Foundation

class HashtagService {
    static let shared = HashtagService()
    
    func getMostPopularHashtag(in tweets: [Tweet]) -> [(hashtag: String, timesUsed: Int)] {
        var hashtagsDict: [String: Int] = [:]
        
        for tweet in tweets {
            for hashtag in tweet.hashtags {
                hashtagsDict[hashtag.text.uppercased()] = (hashtagsDict[hashtag.text.uppercased()] ?? 0) + 1
            }
        }
        
        let touplesArray = hashtagsDict.map { (item) -> (hashtag: String, timesUsed: Int) in
            return (hashtag: item.key, timesUsed: item.value)
        }
        
        return touplesArray.sorted { (item1, item2) -> Bool in
            return item2.timesUsed < item1.timesUsed
        }
    }
    
    func amountOfTweetsWithOnePlushHashtagsinLanguages(tweets: [Tweet]) -> Int {
        let items = tweets.filter { (tweet) -> Bool in
            return tweet.hashtags.count > 0 && isValidLanguage(tweet)
        }
        return items.count
    }
    
    func hashTagsSorted(_ tweets: [Tweet]) -> [(hashTag: Hashtag, idioma: String)] {
        var items: [(hashTag: Hashtag, idioma: String)] = []
        for tweet in tweets {
            for hashtag in tweet.hashtags {
                items.append((hashTag: hashtag, idioma: tweet.language))
            }
        }
        return items.sorted { (item1, item2) -> Bool in
            return item1.hashTag.text.count < item2.hashTag.text.count
        }
    }
    
    private func isValidLanguage(_ tweet: Tweet) -> Bool {
        switch tweet.language {
        case "en":
            return true
        case "es":
            return true
        case "fr":
            return true
        case "pt":
            return true
        default:
            return false
        }
    }
}
