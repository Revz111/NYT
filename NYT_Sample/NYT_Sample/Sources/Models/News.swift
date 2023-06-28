//
//  News.swift
//  NYT_Sample
//
//  Created by Revathy Vinod on 27/06/2023.
//

import Foundation

struct News: Decodable {
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
    
	var uri: String?
	var url: String?
	var id, assetID: Int?
	var source: Source?
	var publishedDate, updated, section: String?
	var subsection: Subsection?
	var nytdsection, adxKeywords: String?
	var byline: String?
	var type: NewsType?
	var title, abstract: String?
	var desFacet, orgFacet, perFacet, geoFacet: [String?]
	var media: [Media]?
	var etaID: Int?
    
    init(
        uri: String?,
        url: String?,
        id: Int?,
        assetID: Int?,
        source: Source?,
        publishedDate: String?,
        updated: String?,
        section: String?,
        subsection: Subsection?,
        nytdsection: String?,
        adxKeywords: String?,
        byline: String?,
        type: NewsType?,
        title: String?,
        abstract: String?,
        desFacet: [String?],
        orgFacet: [String?],
        perFacet: [String?],
        geoFacet: [String?],
        media:  [Media]?,
        etaID: Int?
    )
    {
        self.uri = uri
        self.url = url
        self.id = id
        self.assetID = assetID
        self.source = source
        self.publishedDate = publishedDate
        self.updated = updated
        self.section = section
        self.subsection = subsection
        self.nytdsection = nytdsection
        self.adxKeywords = adxKeywords
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.desFacet = desFacet
        self.orgFacet = orgFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
        self.media = media
        self.etaID = etaID
    }
    
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.uri = try? container.decode(String.self, forKey: .uri)
        self.url = try? container.decode(String.self, forKey: .url)
        self.id = try? container.decode(Int.self, forKey: .id)
        self.assetID = try? container.decode(Int.self, forKey: .assetID)
        self.source = try? container.decode(Source.self, forKey: .source)
        self.publishedDate = try? container.decode(String.self, forKey: .publishedDate)
        self.updated = try? container.decode(String.self, forKey: .updated)
        self.section = try? container.decode(String.self, forKey: .section)
        self.subsection = try? container.decode(Subsection.self, forKey: .subsection)
        self.nytdsection = try? container.decode(String.self, forKey: .nytdsection)
        self.adxKeywords = try? container.decode(String.self, forKey: .adxKeywords)
        self.adxKeywords = try? container.decode(String.self, forKey: .adxKeywords)
        self.byline = try? container.decode(String.self, forKey: .byline)
        self.type = try? container.decode(NewsType.self, forKey: .type)
        self.title = try? container.decode(String.self, forKey: .title)
        self.abstract = try? container.decode(String.self, forKey: .abstract)
        self.desFacet = try container.decode([String?].self, forKey: .desFacet)
        self.orgFacet = try container.decode([String?].self, forKey: .orgFacet)
        self.perFacet = try container.decode([String?].self, forKey: .perFacet)
        self.geoFacet = try container.decode([String?].self, forKey: .geoFacet)
        self.media = try? container.decode([Media].self, forKey: .media)
        self.etaID = try? container.decode(Int.self, forKey: .etaID)
    }
}
