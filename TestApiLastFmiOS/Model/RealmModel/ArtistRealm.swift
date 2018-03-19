//
//  ArtistRealm.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 10-03-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class ArtistRealm: Object {
    dynamic var name: String = ""
    dynamic var isFavoriote: Bool = false
}
