//
//  Album.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 26-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
struct AlbumRoot : Codable{
    let topalbums :Albums
}

struct Albums : Codable {
    let album: [Album]
}

struct Album: Codable {
    let name: String
    let image: [AlbumImage]
}

struct AlbumImage: Codable{
    let text: String
    let size: String
    
    private enum CodingKeys : String, CodingKey {
        case text = "#text", size
    }
}
