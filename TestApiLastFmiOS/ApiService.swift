//
//  ApiService.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 21-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
import Alamofire
let urlBase = "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=5bc03e99dcc8b895ef71175b599ca5a5&format=json"
let pathApiVersion = "/2.0"
let pathMethod = "?method="
let pathMethodGetTopArtists = "chart.gettopartists"
let pathApiKey = "api_key="
let apiKey = "5bc03e99dcc8b895ef71175b599ca5a5"
let apiFormat = "ormat=json"

class ApiService {
   
    static let urlGetTopArtist = "\(urlBase)"
    
    
    static func getTopArtist(){
        Alamofire.request(URL(string: urlGetTopArtist)!).responseJSON { (response) in
            print(response)
        }
    }
    
}
