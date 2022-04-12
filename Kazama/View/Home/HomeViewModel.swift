//
//  HomeViewModel.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 07/04/22.
//

import Foundation
import UIKit
import SwiftUI
import UIImageColors


class HomeViewModel : ObservableObject{
    
    @Published var currentWeater : Weather?;
    
    @Published var isLoadingWeather : Bool = false;
    
    @Published var colorSchema : UIImageColors?
    
    @Published var unsplashImage: Result?
    
    @Published var backGroundImage : UIImage?
    
    @AppStorage("currentLat") var currentLat : Double = 0.0
    @AppStorage("currentLng") var currentLng : Double = 0.0
    @AppStorage("currentLocationName") var currentLocationName: String = ""
    
    
    let weatherApi : WeatherApi = WeatherApi(options: .dev)
    let unsplashApi  = UnsplashApi()
    private var unsplashResult : UnsplashSearchResult?
    
    
    @MainActor
    func getCurrentWeather() async{
        if(currentLat == 0 && currentLng == 0){
            return
        }
        
        do{
            currentWeater  = try await weatherApi.getCurrentWeather(lat:currentLat, lng:  currentLng)
         
            await getImages()
        }
        catch let error {
            print("error on result of request \(error)")
        }

        
    }
    
//    @MainActor
//    private func setWeatherStyleSchema(){
//
//           if(currentWeater == nil){
//          weatherSchema =  .clearDay
//
//           }
//
//
//        let isDay : Bool = currentWeater?.current.isDay == 1
//
//        switch currentWeater!.current.condition.code{
//               //clear
//           case 1003:
//
//               weatherSchema = isDay ? .partlyCloudyDay :  .partlyCloudyNight
//
//               break
//               //fog
//           case 1135:
//               weatherSchema =  isDay ? .fogDay : .fogNight
//               break;
//               //Patchy light rain
//           case 1180:
//               weatherSchema =  isDay ? .dayLightRain : .nightLightRain
//
//           break
//           default:
//               weatherSchema = .clearDay
//               break
//           }
//
//
//    }
//
    @MainActor
 private func   getImages() async -> Void{
     if(currentWeater != nil){
       var  hourName :  String = "day"
         
         
         if (currentWeater?.current.isDay == 0) {
             hourName = "night"
         }
         do{
             
         unsplashResult = try await   unsplashApi.searchImages(query: "\(hourName) \(currentWeater!.current.condition.text) weather")
             
             unsplashImage = unsplashResult?.results.first
             
           let (data,_) =  await try!  URLSession.shared.data(from: URL(string: unsplashImage!.urls.raw)!)
             backGroundImage = UIImage(data: data)
             colorSchema = backGroundImage?.getColors()
             
             
             
             
             print(unsplashImage?.urls.full ?? "error")
             print("get unsplash")
         }catch let error {
             print("get erro on unsplash get\(error)")
         }
             
             
         }
     
    }
    
}
