//
//  ColorSchema.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 07/04/22.
//

import Foundation
import SwiftUI


struct WeatherStyleSchema{
    init(foregroundColorPrimary: Color, foregroundColorSecundary: Color, gradient: LinearGradient, image: Image){
        self.foregroundColorPrimary = foregroundColorPrimary
        self.foregroundColorSecundary = foregroundColorSecundary
        self.gradient = gradient
        self.image = image
        self.lottie = nil
    }
    
    init(foregroundColorPrimary: Color, foregroundColorSecundary: Color, gradient: LinearGradient, lottieName: String){
        self.foregroundColorPrimary = foregroundColorPrimary
        self.foregroundColorSecundary = foregroundColorSecundary
        self.gradient = gradient
        self.lottie = AnimationLottie(name: lottieName)
        self.image = nil
    }
   
    
    let foregroundColorPrimary : Color
    let foregroundColorSecundary: Color
    let gradient: LinearGradient
    let image: Image?
    let lottie: AnimationLottie?
    
    
    
    
}
extension  WeatherStyleSchema{

    static let  clearDay: WeatherStyleSchema = WeatherStyleSchema(
        foregroundColorPrimary: Color("CSForegoundPrimary"),
        foregroundColorSecundary: Color("CSForegroundSecundary"),
        gradient: LinearGradient(colors: [
            Color("CSGradientTop"),
            Color("CSGradientTop"),
            Color("CSGradientMiddle"),
            Color("CSGradientBottom")],
                                 startPoint: .top,
                                 endPoint: .bottom), lottieName: "ClearDay")
    
    static let partlyCloudyNight: WeatherStyleSchema = WeatherStyleSchema(foregroundColorPrimary : Color("NCForegroundPrimary") , foregroundColorSecundary: Color("NCForegroundSecundary"), gradient: LinearGradient(colors: [
    Color("NCGradientTop"),
    Color("NCGradientMiddle"),
    Color("NCGradientBottom"),
    
    ], startPoint: .top, endPoint: .bottom),lottieName: "NightCloudy")
    
    
    static let fogNight: WeatherStyleSchema = WeatherStyleSchema(foregroundColorPrimary : Color("NFForegroundPrimary") , foregroundColorSecundary: Color("NFForegroundSecundary"), gradient: LinearGradient(colors: [
    Color("NFGradientTop"),
    Color("NFGradientMiddle"),
    Color("NFGradientBottom"),
    
    ], startPoint: .top, endPoint: .bottom),lottieName:"FogNightLottie" )
    
    static let fogDay: WeatherStyleSchema = WeatherStyleSchema(foregroundColorPrimary : Color("DFForegroundPrimary") , foregroundColorSecundary: Color("DFForegroundSecundary"), gradient: LinearGradient(colors: [
    Color("DFGradientTop"),
    Color("DFGradientMiddle"),
    Color("DFGradientBottom"),
    
    ], startPoint: .top, endPoint: .bottom),lottieName:"FogDay" )
    
    
    static let partlyCloudyDay : WeatherStyleSchema =  WeatherStyleSchema(foregroundColorPrimary : Color("PCDForegroundPrimary") , foregroundColorSecundary: Color("PCDForegroundSecundary"), gradient: LinearGradient(colors: [
        Color("PCDGradientTop"),
        Color("PCDGradientMiddle"),
        Color("PCDGradientBottom"),
        
        ], startPoint: .bottom, endPoint: .top),lottieName:"DayPartlyCloud")
    
    static let dayLightRain : WeatherStyleSchema =  WeatherStyleSchema(foregroundColorPrimary : Color("DRForegroundPrimary") , foregroundColorSecundary: Color("DRForegroundSecundary"), gradient: LinearGradient(colors: [
        Color("DRGradientTop"),
        Color("DRGradientMiddle"),
        Color("DRGradientBottom"),
        
        ], startPoint: .top, endPoint: .bottom),lottieName:"LIghtRain")
    
    static let nightLightRain : WeatherStyleSchema =  WeatherStyleSchema(foregroundColorPrimary : Color("NRForegroundPrimary") , foregroundColorSecundary: Color("NRForegroundSecundary"), gradient: LinearGradient(colors: [
        Color("NRGradientTop"),
        Color("NRGradientMiddle"),
        Color("NRGradientBottom"),
        
        ], startPoint: .top, endPoint: .bottom),lottieName:"LIghtRain")
}


extension Weather{
   func localizedName(lng : String) -> String{
      
       do{
           let conditions = try JSONDecoder().decode([WeatherCondition].self, from:  NSDataAsset(name: "conditions")!.data)
     let currentCondition = conditions.filter {
               e in e.code == self.current.condition.code
     }.first
           let currentLng =  currentCondition!.languages.filter{
               language in
               language.langISO.rawValue == lng.lowercased()
           }.first
           return self.current.isDay == 1 ? currentLng!.dayText : currentLng!.nightText
           
       }catch let error {
           print(error)
       }

        
        
        return ""
    }
}
