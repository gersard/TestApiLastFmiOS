//
//  ApiService.swift
//  TestApiLastFmiOS
//
//  Created by Gerardo Mascayano on 21-02-18.
//  Copyright © 2018 Gerardo Mascayano. All rights reserved.
//

import Foundation
import Alamofire
//let urlBase = "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=5bc03e99dcc8b895ef71175b599ca5a5&format=json"
let urlBase = "http://ws.audioscrobbler.com/2.0/?method="
let methodTopArtists = "chart.gettopartists"
let methodTopTracks = "chart.gettoptracks"
let apiKeyPath = "api_key=5bc03e99dcc8b895ef71175b599ca5a5"
let formatPath = "format=json"

class ApiService {
    
    static let urlGetTopArtist = "\(urlBase)\(methodTopArtists)&\(apiKeyPath)&\(formatPath)"
    static let urlGetTopTracks = "\(urlBase)\(methodTopTracks)&\(apiKeyPath)&\(formatPath)"
    
    static func getTopArtist(onCompletion: @escaping (ArtistRoot?) -> Void){
        Alamofire.request(URL(string: urlGetTopArtist)!).responseJSON { (response) in
            //print("Response: ",response)
            
            do{
                let artistas = try JSONDecoder().decode(ArtistRoot.self, from: response.data!)
                onCompletion(artistas)
            }catch let jsonError {
                print(jsonError)
                onCompletion(nil)
            }
        }
    }
    
    static func getTopTracks(onCompletion: @escaping (TrackRoot?) -> Void){
        Alamofire.request(URL(string: urlGetTopTracks)!).responseJSON { (response) in
            print("Response: ",response)
            do{
                let tracks = try JSONDecoder().decode(TrackRoot.self, from: response.data!)
                onCompletion(tracks)
            }catch let jsonError {
                print(jsonError)
                onCompletion(nil)
            }
        }
    }
    
}
