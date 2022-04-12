//
//  Localizables.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 10/04/22.
//

import Foundation
import SwiftUI

extension LocalizedStringKey{
    static let seachPageTitle = LocalizedStringKey("SeachPageTitle")
    static let searchFielTitle = LocalizedStringKey("SearchFielTitle")
    static let currentLocation = LocalizedStringKey("CurrentLocation")
    static let chanceOfRain = "ChanceOfRain"
    
    static func humity (value :Double ) -> LocalizedStringKey{
        LocalizedStringKey("Humity \(String(format: "%.0f", arguments: [value]).appending("%"))")}
    
}
