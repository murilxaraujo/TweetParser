//
//  TweetParser.swift
//  
//
//  Created by Murilo Araujo on 20/10/20.
//

import Foundation

/// Tweet parser service
class TweetParser {
    let fileService = FileService()
    static let shared = TweetParser()
    
    /// Get a tweet object from string
    /// - Parameter tweetString: String including tweet json
    /// - Returns: Tweet Objec
    private func parse(tweetString: String) throws -> Tweet {
        guard let data = tweetString.data(using: .utf8),
              let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw MAError(title: "Erro de serialização", description: "Não foi possível parsear o objeto", code: 1)
        }
        
        guard let language = json["lang"] as? String else {
            throw MAError(title: "Erro de serialização", description: "Não foi possível obter a lingua do tweet", code: 2)
        }
        
        guard let content = json["text"] as? String else {
            throw MAError(title: "Erro de serialização", description: "Não foi possível obter o conteúdo do tweet", code: 3)
        }
        
        guard let entities = json["entities"] as? [String:Any],
              let hashtagsString = entities["hashtags"] as? Array<Dictionary<String, Any>> else {
            throw MAError(title: "Erro de serialização", description: "Não foi possível obter as hashtags do tweet", code: 3)
        }
        
        
        var hashtags = [Hashtag]()
        
        for hashtagString in hashtagsString {
            do {
                let hashtag = try parseHashtag(hashtagString)
                hashtags.append(hashtag)
            } catch let e {
                if isVerbose {
                    print("Erro: \(e.localizedDescription) em hashtag \(hashtagString)")
                }
            }
        }
        return Tweet(text: content, language: language, hashtags: hashtags)
    }
    
    func parseHashtag(_ json: [String: Any]) throws -> Hashtag {
        guard let hashtagText = json["text"] as? String else  {
            throw MAError(title: "Erro de serialização", description: "Não foi possível obter o texto da hashtag", code: 5)
        }
        
        return Hashtag(text: hashtagText)
    }
    
    /// Get a tweet array from json array string
    /// - Parameter tweetArray: json array containing tweets
    /// - Returns: Tweet array object
    func parseArray(tweetArrayFileName: String) throws -> [Tweet] {
        let fileURL = try fileService.getFileURL(for: tweetArrayFileName)
        
        let fileContent = try String(contentsOf: fileURL, encoding: .utf8)
        let tweetStrings = fileContent.components(separatedBy: .newlines)
        var tweets = [Tweet]()
        for tweetString in tweetStrings {
            do {
                let tweet = try parse(tweetString: tweetString)
                tweets.append(tweet)
            } catch let e {
                if isVerbose {
                    print("Erro: \(e.localizedDescription) em ítem \(tweetString)")
                }
            }
        }
        return tweets
    }
}
