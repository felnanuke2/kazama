//
//  UnsplashApi.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 12/04/22.
//

import Foundation

class UnsplashApi{
    private let clientId = "9PXMzYiOoNb81yhX0pKIBQTf8GrrVOEty1a85Q7z0E0"
    
    func  searchImages(query : String ) async throws -> UnsplashSearchResult {
        
        let url = "https://api.unsplash.com/search/photos?query=\(query.replacingOccurrences(of: " ", with: "%20"))&client_id=\(clientId)&page=1&per_page=1&orientation=portrait"
        print("start api with \(url)")
        
        
        let (data,response) = try await URLSession.shared.data(from: URL(string:url)!)
        let responseValue =  response as? HTTPURLResponse
        if(responseValue?.statusCode == 200){
            do{
                let result = try JSONDecoder().decode(UnsplashSearchResult.self, from: data)
                return result;
            }catch let error {
                print("error on decode data \(error)")
            }
            
            
        }
        
      
        if(responseValue != nil ){
            print("response \(String(describing: responseValue?.statusCode))")
        }
        throw URLError(URLError.badURL)
    }
    
    
}



