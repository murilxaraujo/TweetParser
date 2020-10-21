//
//  File.swift
//  
//
//  Created by Murilo Araujo on 21/10/20.
//

import Foundation

class LanguageService {
    static let shared = LanguageService()
    
    func amoutOfTweetsByLanguage(tweets: [Tweet]) -> [(lingua: String, quantidade: Int)] {
        var quantidadeDict: [String: Int] = [:]
        for tweet in tweets {
            quantidadeDict[tweet.language] = (quantidadeDict[tweet.language] ?? 0) + 1
        }
        
        let touplesArray = quantidadeDict.map { (item) -> (lingua: String, quantidade: Int) in
            return (lingua: item.key, quantidade: item.value)
        }
        
        return touplesArray.sorted { (touple1, touple2) -> Bool in
            return touple1.quantidade < touple2.quantidade
        }
    }
    
    func getPercentage(quantidade: Int, total: Int) -> Double {
        let porcentagem = Double(quantidade)/Double(total)
        return porcentagem*100
    }
    
    func getAverageFor(tweets: [(lingua: String, quantidade: Int)], total: Int) -> Double {
        var soma: Double = 0
        for tweet in tweets {
            soma += getPercentage(quantidade: tweet.quantidade, total: tweets.count)
        }
        let average = soma/Double(total)
        return average
    }
}
