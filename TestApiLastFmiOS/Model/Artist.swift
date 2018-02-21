//
//  Artist.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 21-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
struct Artist {
    let name: String
    let playcount: Int
    let listeners: Int
    let artistImages: [ArtistImage]
}

struct ArtistImage {
    let text: String
    let size: String
}
