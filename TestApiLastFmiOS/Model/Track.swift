//
//  Track.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 22-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation

struct TrackRoot : Decodable {
    let tracks : Tracks?
    let toptracks : Tracks?
}

struct Tracks : Decodable{
    let track : [Track]
}

struct Track : Decodable {
    let name : String
    var playcount : String
    let listeners : String
    let artist : Artist
    let image : [TrackImage]
    
}

struct TrackImage: Codable {
    let text: String
    let size: String
    
    private enum CodingKeys : String, CodingKey {
        case text = "#text", size
    }
}

