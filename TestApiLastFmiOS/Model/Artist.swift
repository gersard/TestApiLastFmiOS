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
struct Artist : Decodable {
    let name: String
    let playcount: String
    let listeners: String
    let image: [ArtistImage]
}

struct ArtistImage: Codable {
    let text: String
    let size: String
    
    private enum CodingKeys : String, CodingKey {
        case text = "#text", size
    }
}
