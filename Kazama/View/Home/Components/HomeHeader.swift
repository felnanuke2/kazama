//
//  HomeHeader.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/04/22.
//

import SwiftUI
import UIImageColors

struct HomeHeader: View {
    let chanceOfRain: Double
    let humity: Double
    let  localizedWeatherText: String
    
    
    
    var body: some View {
        
        ZStack{
            Color.main.opacity(0.3).cornerRadius(18).blur(radius: 2)
            
            VStack {
                HStack{
                    Text("Barcelona, Spain").font(.title2)
                    Spacer()
                    Image(systemName: "ellipsis").font(.title).foregroundColor(.accentColor)
                }
                
                Spacer()
                HStack{
                    VStack( alignment: .leading,spacing: 8){
                        
                        Text("24°").font(.largeTitle)
                        
                        Text(localizedWeatherText)
                        
                        Text("ChanceOfRain \("\(chanceOfRain.formatted())%")")
                        
                        Text(LocalizedStringKey.humity(value: humity))
                        
                        
                    }
                    
                    Spacer(minLength: 30)
                    Image(systemName: "sun.max").resizable().scaledToFit().padding(30)
                    
                }
                
                
                
            }.padding(30)
            
            
            
        }.frame(height: 300)
        
        
        
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.cyan
            HomeHeader(chanceOfRain: 24,humity: 45 ,localizedWeatherText: "Sunny")
                .preferredColorScheme(.dark)
        }
    }
}

extension UIColor{
    var color : Color {
        Color(uiColor: self)
    }
    
}

extension Color {
    
    static var main : Color{
       Color("PrimaryColor")
    }
}
