import ArgumentParser
import Foundation

public var isVerbose = false

struct TwitterParser: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Parseia um arquivo json contentdo Tweets e retorna os dados definidos")
    
    @Argument(help: "Arquivo json a ser parseado")
    var file: String
    
    @Flag(help: "Include error descriptions")
    var verbose = false
    
    init() {}
    
    func run() throws {
        isVerbose = verbose
        let tweets = try TweetParser.shared.parseArray(tweetArrayFileName: file)
        if verbose {
            print("Existem \(tweets.count) tweets")
        }
        let amountOfTweetsByLanguage = LanguageService.shared.amoutOfTweetsByLanguage(tweets: tweets)
        let maxLanguageAmount = amountOfTweetsByLanguage.filter { (item) -> Bool in
            item.quantidade == amountOfTweetsByLanguage.last?.quantidade
        }
        let minLanguageAmount = amountOfTweetsByLanguage.filter { (item) -> Bool in
            item.quantidade == amountOfTweetsByLanguage.first?.quantidade
        }
        for maxLang in maxLanguageAmount {
            print("tweets_max|\(maxLang.lingua)|\(String(format: "%.2f", LanguageService.shared.getPercentage(quantidade: maxLang.quantidade, total: tweets.count)))")
        }
        
        for minLang in minLanguageAmount {
            print("tweets_min|\(minLang.lingua)|\(String(format: "%.2f", LanguageService.shared.getPercentage(quantidade: minLang.quantidade, total: tweets.count)))")
        }
        print("tweets_media|\(LanguageService.shared.getAverageFor(tweets: amountOfTweetsByLanguage, total: tweets.count))")
    }
}

TwitterParser.main()
