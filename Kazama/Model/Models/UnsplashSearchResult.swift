//
//  UnsplashSearchResult.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 12/04/22.
//




// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let unsplashSearchResult = try? newJSONDecoder().decode(UnsplashSearchResult.self, from: jsonData)

import Foundation

// MARK: - UnsplashSearchResult
class UnsplashSearchResult: Codable {
    let total, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }

    init(total: Int, totalPages: Int, results: [Result]) {
        self.total = total
        self.totalPages = totalPages
        self.results = results
    }
}

// MARK: - Result
class Result: Codable {
    let id: String
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case id
        case urls
    }

    init(id: String, urls: Urls) {
        self.id = id
      
        self.urls = urls
    
    }
}

// MARK: - ResultLinks
class ResultLinks: Codable {
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }

    init(linksSelf: String, html: String, download: String, downloadLocation: String) {
        self.linksSelf = linksSelf
        self.html = html
        self.download = download
        self.downloadLocation = downloadLocation
    }
}

// MARK: - Tag
class Tag: Codable {
    let type: TypeEnum
    let title: String
    let source: Source?

    init(type: TypeEnum, title: String, source: Source?) {
        self.type = type
        self.title = title
        self.source = source
    }
}

// MARK: - Source
class Source: Codable {
    let ancestry: Ancestry
    let title, subtitle, sourceDescription, metaTitle: String
    let metaDescription: String
    let coverPhoto: CoverPhoto

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle
        case sourceDescription = "description"
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }

    init(ancestry: Ancestry, title: String, subtitle: String, sourceDescription: String, metaTitle: String, metaDescription: String, coverPhoto: CoverPhoto) {
        self.ancestry = ancestry
        self.title = title
        self.subtitle = subtitle
        self.sourceDescription = sourceDescription
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.coverPhoto = coverPhoto
    }
}

// MARK: - Ancestry
class Ancestry: Codable {
    let type, category: Category
    let subcategory: Category?

    init(type: Category, category: Category, subcategory: Category?) {
        self.type = type
        self.category = category
        self.subcategory = subcategory
    }
}

// MARK: - Category
class Category: Codable {
    let slug, prettySlug: String

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }

    init(slug: String, prettySlug: String) {
        self.slug = slug
        self.prettySlug = prettySlug
    }
}

// MARK: - CoverPhoto
class CoverPhoto: Codable {
    let id: String
    let createdAt, updatedAt: Date
    let promotedAt: Date?
    let width, height: Int
    let color, blurHash: String
    let coverPhotoDescription, altDescription: String?
    let urls: Urls
    let links: ResultLinks
    let categories: [JSONAny]
    let likes: Int
    let likedByUser: Bool
    let currentUserCollections: [JSONAny]
    let sponsorship: JSONNull?
    let topicSubmissions: CoverPhotoTopicSubmissions
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case coverPhotoDescription = "description"
        case altDescription = "alt_description"
        case urls, links, categories, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case sponsorship
        case topicSubmissions = "topic_submissions"
        case user
    }

    init(id: String, createdAt: Date, updatedAt: Date, promotedAt: Date?, width: Int, height: Int, color: String, blurHash: String, coverPhotoDescription: String?, altDescription: String?, urls: Urls, links: ResultLinks, categories: [JSONAny], likes: Int, likedByUser: Bool, currentUserCollections: [JSONAny], sponsorship: JSONNull?, topicSubmissions: CoverPhotoTopicSubmissions, user: User) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.promotedAt = promotedAt
        self.width = width
        self.height = height
        self.color = color
        self.blurHash = blurHash
        self.coverPhotoDescription = coverPhotoDescription
        self.altDescription = altDescription
        self.urls = urls
        self.links = links
        self.categories = categories
        self.likes = likes
        self.likedByUser = likedByUser
        self.currentUserCollections = currentUserCollections
        self.sponsorship = sponsorship
        self.topicSubmissions = topicSubmissions
        self.user = user
    }
}

// MARK: - CoverPhotoTopicSubmissions
class CoverPhotoTopicSubmissions: Codable {
    let texturesPatterns, wallpapers, nature, currentEvents: Experimental?

    enum CodingKeys: String, CodingKey {
        case texturesPatterns = "textures-patterns"
        case wallpapers, nature
        case currentEvents = "current-events"
    }

    init(texturesPatterns: Experimental?, wallpapers: Experimental?, nature: Experimental?, currentEvents: Experimental?) {
        self.texturesPatterns = texturesPatterns
        self.wallpapers = wallpapers
        self.nature = nature
        self.currentEvents = currentEvents
    }
}

// MARK: - Experimental
class Experimental: Codable {
    let status: Status
    let approvedOn: Date?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }

    init(status: Status, approvedOn: Date?) {
        self.status = status
        self.approvedOn = approvedOn
    }
}

enum Status: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - Urls
class Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }

    init(raw: String, full: String, regular: String, small: String, thumb: String, smallS3: String) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
        self.smallS3 = smallS3
    }
}

// MARK: - User
class User: Codable {
    let id: String
    let updatedAt: Date
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool
    let social: Social

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }

    init(id: String, updatedAt: Date, username: String, name: String, firstName: String, lastName: String?, twitterUsername: String?, portfolioURL: String?, bio: String?, location: String?, links: UserLinks, profileImage: ProfileImage, instagramUsername: String?, totalCollections: Int, totalLikes: Int, totalPhotos: Int, acceptedTos: Bool, forHire: Bool, social: Social) {
        self.id = id
        self.updatedAt = updatedAt
        self.username = username
        self.name = name
        self.firstName = firstName
        self.lastName = lastName
        self.twitterUsername = twitterUsername
        self.portfolioURL = portfolioURL
        self.bio = bio
        self.location = location
        self.links = links
        self.profileImage = profileImage
        self.instagramUsername = instagramUsername
        self.totalCollections = totalCollections
        self.totalLikes = totalLikes
        self.totalPhotos = totalPhotos
        self.acceptedTos = acceptedTos
        self.forHire = forHire
        self.social = social
    }
}

// MARK: - UserLinks
class UserLinks: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }

    init(linksSelf: String, html: String, photos: String, likes: String, portfolio: String, following: String, followers: String) {
        self.linksSelf = linksSelf
        self.html = html
        self.photos = photos
        self.likes = likes
        self.portfolio = portfolio
        self.following = following
        self.followers = followers
    }
}

// MARK: - ProfileImage
class ProfileImage: Codable {
    let small, medium, large: String

    init(small: String, medium: String, large: String) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

// MARK: - Social
class Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
    let paypalEmail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
        case paypalEmail = "paypal_email"
    }

    init(instagramUsername: String?, portfolioURL: String?, twitterUsername: String?, paypalEmail: JSONNull?) {
        self.instagramUsername = instagramUsername
        self.portfolioURL = portfolioURL
        self.twitterUsername = twitterUsername
        self.paypalEmail = paypalEmail
    }
}

enum TypeEnum: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - ResultTopicSubmissions
class ResultTopicSubmissions: Codable {
    let spirituality: Experimental?
    let wallpapers: Wallpapers?
    let people, nature, texturesPatterns, experimental: Experimental?

    enum CodingKeys: String, CodingKey {
        case spirituality, wallpapers, people, nature
        case texturesPatterns = "textures-patterns"
        case experimental
    }

    init(spirituality: Experimental?, wallpapers: Wallpapers?, people: Experimental?, nature: Experimental?, texturesPatterns: Experimental?, experimental: Experimental?) {
        self.spirituality = spirituality
        self.wallpapers = wallpapers
        self.people = people
        self.nature = nature
        self.texturesPatterns = texturesPatterns
        self.experimental = experimental
    }
}

// MARK: - Wallpapers
class Wallpapers: Codable {
    let status: Status

    init(status: Status) {
        self.status = status
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
