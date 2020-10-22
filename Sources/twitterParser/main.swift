import ArgumentParser
import Foundation

public var isVerbose = false

struct Tweetparser: ParsableCommand {
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
        print("tweets_media|\(String(format: "%.2f", LanguageService.shared.getAverageFor(tweets: amountOfTweetsByLanguage, total: tweets.count)))")
        
        let mostPopularHashtags = HashtagService.shared.getMostPopularHashtag(in: tweets)
        
        if mostPopularHashtags.count >= 1 {
            print("hashtags_primeiro|\(mostPopularHashtags[0].hashtag)")
            if verbose {
                print("Hashtag used \(mostPopularHashtags[0].timesUsed) times")
            }
        }
        
        if mostPopularHashtags.count >= 2 {
            print("hashtags_segundo|\(mostPopularHashtags[1].hashtag)")
            if verbose {
                print("Hashtag used \(mostPopularHashtags[1].timesUsed) times")
            }
        }
        
        if mostPopularHashtags.count >= 3 {
            print("hashtags_terceiro|\(mostPopularHashtags[2].hashtag)")
            if verbose {
                print("Hashtag used \(mostPopularHashtags[2].timesUsed) times")
            }
        }
        
        let amountOfTweetsWithOnePlushHashtagsinLanguages = HashtagService.shared.amountOfTweetsWithOnePlushHashtagsinLanguages(tweets: tweets)
        let porcentagem = Double(amountOfTweetsWithOnePlushHashtagsinLanguages)/Double(tweets.count)*100
        print("tweets_selecionados|\(String(format: "%.2f", porcentagem))|\(amountOfTweetsByLanguage.count)")
        
        let hashtagsSorted = HashtagService.shared.hashTagsSorted(tweets)
        
        let maioresHashtags = hashtagsSorted.filter { (item) -> Bool in
            return item.hashTag.text.count == hashtagsSorted.last?.hashTag.text.count
        }
        for hashtag in maioresHashtags {
            print("hashtag_maior|\(hashtag.hashTag.text.uppercased())|\(hashtag.idioma)|\(hashtag.hashTag.text.count)")
        }
        
        let menoresHashtags = hashtagsSorted.filter { (item) -> Bool in
            return item.hashTag.text.count == hashtagsSorted.first?.hashTag.text.count
        }
        for hashtag in menoresHashtags {
            print("hashtag_menor|\(hashtag.hashTag.text.uppercased())|\(hashtag.idioma)|\(hashtag.hashTag.text.count)")
        }
    }
}

Tweetparser.main()
