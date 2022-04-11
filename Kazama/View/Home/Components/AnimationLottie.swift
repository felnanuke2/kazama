//
//  AnimationLottie.swift
//  Kazama
//
//  Created by LUIZ FELIPE ALVES LIMA on 09/04/22.
//

import SwiftUI
import Lottie



struct AnimationLottie : UIViewRepresentable{
    let name : String
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIView{
     let uiView = UIView()
        
        
        let view =  AnimationView(name: name )
        view.play( toFrame: AnimationFrameTime.infinity, loopMode: LottieLoopMode.repeat(200), completion: nil)
        view.contentMode = .scaleAspectFit
        view.layer.speed = 0.4
        view.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(view)
        NSLayoutConstraint.activate([
               view.widthAnchor.constraint(equalTo: uiView.widthAnchor),
                view.heightAnchor.constraint(equalTo: uiView.heightAnchor)
            ])
        return uiView
        
       
    }

 
    
}
