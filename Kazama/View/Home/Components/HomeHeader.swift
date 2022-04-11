//
//  HomeHeader.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 06/04/22.
//

import SwiftUI

struct HomeHeader: View {
    let  localName : String
    let colorSchema: WeatherStyleSchema
    
    
    
    var body: some View {
    
            HStack{
                NavigationLink(destination: SearchView() ){
                HStack{
                    Image("location-dot-solid")
                        
                        .resizable().renderingMode(.template)
                    
                        .scaledToFit()
                        .frame(height: 18).padding(.trailing,8)
            
                        
                       
                    
                    Text(localName).font(.system(size: 18).bold())
              
                    
                    Image(systemName: "chevron.down").font(.caption.bold()).padding(.leading,8)
                    Spacer()
                }
                }
                
                Image(systemName: "calendar").resizable().scaledToFit().frame(height: 18)
            }.padding(.horizontal,16).foregroundColor(colorSchema.foregroundColorPrimary)
    
}
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader(localName: "Presidente Franco",colorSchema: .clearDay)
    }
}
