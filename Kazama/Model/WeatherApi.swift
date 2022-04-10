//
//  WeatherProto.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 07/04/22.
//

import Foundation
import UIKit



class WeatherApi{
    let options : WeatherApiOptions
    
    init(options: WeatherApiOptions){
        self.options = options
        
    }
    
    func getCurrentWeather(lat : Double, lng : Double)  async throws -> Weather {
        let url =  "\(options.host)/forecast.json?key=\(options.apiKey)&q=\(lat),\(lng)&days=1&aqi=no&alerts=no"
        print("start api request with \(url)")
        let (data,response) = try await URLSession.shared.data(from: URL(string:url)!)
        let responseValue =  response as? HTTPURLResponse
        if(responseValue != nil ){
            print("response \(String(describing: responseValue?.statusCode))")
        }
        let weather = try JSONDecoder().decode(Weather.self, from: data )
        return weather
        
        
        
    }
    
    func getAutoComplet(value: String) async throws -> [SearchResult]{
        
        let url =  "\(options.host)/search.json?key=\(options.apiKey)&q=\(value.urlEncoded ?? "null")"
        print("start api request with \(url)")
        let (data,response) = try await URLSession.shared.data(from: URL(string:url)!)
        let responseValue =  response as? HTTPURLResponse
        if(responseValue != nil ){
            print("response \(String(describing: responseValue?.statusCode))")
        }
        let results = try JSONDecoder().decode(SearchResults.self, from: data )
        return results
        
        
    }
    
    
    
    
    
    
    struct WeatherApiOptions{
        let host : String
        let apiKey : String
        
    }
    
    
    
}
extension WeatherApi.WeatherApiOptions{
    static let dev: WeatherApi.WeatherApiOptions = WeatherApi.WeatherApiOptions(host: "http://api.weatherapi.com/v1", apiKey: "357a11e184fd44d3ba822250220604")
}




// Store allowed character set for reuse (computed lazily).
private let urlAllowed: CharacterSet =
    .alphanumerics.union(.init(charactersIn: "-._~")) // as per RFC 3986

extension String {
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: urlAllowed)
    }
    
    var removeDiatrict : String {
        self.folding(options: .diacriticInsensitive, locale: .current)
    }
}


