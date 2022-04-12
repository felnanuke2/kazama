//
//  HourCard.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 12/04/22.
//

import SwiftUI
import UIImageColors




struct HourCard<IconType> : View where IconType: View {
    let schema : UIImageColors
    let tempC : Double
    let date: Date
   @ViewBuilder let icon: () -> IconType
    
    
    private let dateFormater = DateFormatter()
    private var formatedDate: String {
        dateFormater.dateFormat = "HH:mm"
       return  dateFormater.string(from: date)
        
        
    }
 
  
    
    
    var body: some View {
       
        
        
       return  ZStack{
           
          
           schema.background.color.opacity(0.6)
            VStack{
                Text(formatedDate).foregroundColor(schema.detail.color)
                Spacer(minLength: 12)
                icon()
                Spacer(minLength: 12)
                Text(String(format: "%.0f °", arguments: [tempC])).font(.title.bold()).foregroundColor(schema.detail.color)
                
            }.padding()
            
       }.aspectRatio(3/4,contentMode: .fit).frame(height: 190).cornerRadius(12).shadow(color: .black .opacity(0.8), radius: 32, x: 2, y:4)
    }
}

struct HourCard_Previews: PreviewProvider {
    static var previews: some View {
        HourCard(schema: .init(background: .clear, primary: .brown, secondary: .label, detail: .cyan), tempC: 32.0,date:  .now){
            VStack{
                AsyncImage(url: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/113.png") ).frame( height: 35)
                Text("Sol").font(.caption)
            }
        }
    }
}


struct GreenGroup<Content>: View where Content: View {
    var views: Content

    init(@ViewBuilder content: () -> Content) {
        self.views = content()
    }

    var body: some View {
        Group {
            views.foregroundColor(.green)
        }
    }
}
