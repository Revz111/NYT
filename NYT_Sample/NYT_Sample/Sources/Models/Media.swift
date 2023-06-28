//
//  Media.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import Foundation

struct Media: Decodable {
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    var type: MediaType?
    var subtype: Subtype?
    var caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [MediaMetaData]?

    init(
        type: MediaType?,
        subtype: Subtype?,
        caption: String?,
        copyright: String?,
        approvedForSyndication: Int?,
        mediaMetadata: [MediaMetaData]?
    )
    {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
    
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try? container.decode(MediaType.self, forKey: .type)
        self.subtype = try? container.decode(Subtype.self, forKey: .subtype)
        self.caption = try? container.decode(String.self, forKey: .caption)
        self.copyright = try? container.decode(String.self, forKey: .copyright)
        self.approvedForSyndication = try? container.decode(Int.self, forKey: .approvedForSyndication)
        self.mediaMetadata = try? container.decode([MediaMetaData].self, forKey: .mediaMetadata)
    }
}

