//
//  ResponseData.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import Foundation

struct ResponseData: Decodable {
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numNews = "num_results"
        case news = "results"
    }
    
    var status: String?
    var copyright: String?
    var numNews: Int?
    var news: [News]?

    init(
        status: String,
        copyright: String?,
        numNews: Int?,
        news: [News]?
    )
    {
        self.status = status
        self.copyright = copyright
        self.numNews = numNews
        self.news = news
    }
    
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.status = try? container.decode(String.self, forKey: .status)
        self.copyright = try? container.decode(String.self, forKey: .copyright)
        self.numNews = try? container.decode(Int.self, forKey: .numNews)
        self.news = try? container.decode([News].self, forKey: .news)
    }
}

