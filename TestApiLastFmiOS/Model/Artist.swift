//
//  Artist.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 21-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
struct ArtistRoot: Decodable {
    let artists : Artists
}
struct Artists : Decodable{
    let artist: [Artist]
}
struct Artist : Codable {
    let name: String
    let playcount: String?
    let listeners: String?
    let bio: Bio?
    let stats: Stats?
    let tags: Tags?
    let image: [ArtistImage]?
    
}

struct ArtistImage: Codable {
    let text: String
    let size: String
    
    private enum CodingKeys : String, CodingKey {
        case text = "#text", size
    }
}

struct DetailArtist : Codable {
    let detailArtist: Artist
    
    private enum CodingKeys : String, CodingKey {
        case detailArtist = "artist"
    }
}

struct Bio: Codable {
    let content: String
}

struct Stats: Codable {
    let listeners: String
    let playcount: String
}

struct RootTag : Codable {
    let tags: Tags
}
struct Tags : Codable {
    let tag: [Tag]
}
struct Tag: Codable {
    let name:String
}






















