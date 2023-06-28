//
//  MediaMetaData.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import Foundation

struct MediaMetaData: Codable {
    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }

	let url: String?
	let format: Format?
	let height, width: Int?
    
    init(
        url: String?,
        format: Format?,
        height: Int?,
        width: Int?
    )
    {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
    
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.url = try? container.decode(String.self, forKey: .url)
        self.format = try? container.decode(Format.self, forKey: .format)
        self.height = try? container.decode(Int.self, forKey: .height)
        self.width = try? container.decode(Int.self, forKey: .width)
    }
}

enum Format: String, Codable {
	case mediumThreeByTwo210 = "mediumThreeByTwo210"
	case mediumThreeByTwo440 = "mediumThreeByTwo440"
	case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
	case empty = ""
	case photo = "photo"
}

enum MediaType: String, Codable {
	case image = "image"
}

enum Source: String, Codable {
	case newYorkTimes = "New York Times"
}

enum Subsection: String, Codable {
	case eat = "Eat"
	case empty = ""
	case europe = "Europe"
	case politics = "Politics"
}

enum NewsType: String, Codable {
	case article = "Article"
	case interactive = "Interactive"
}
