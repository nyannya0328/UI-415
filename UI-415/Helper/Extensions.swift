//
//  Extensions.swift
//  UI-415
//
//  Created by nyannyan0328 on 2022/01/07.
//

import SwiftUI

extension View{
    
    func setNavBarColor(color : Color){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
            
            
                "color" : color
            
            
            ])
            
            
        }
        
        
        
    }
    
    func reset(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            
            
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
            
            
        }
        
        
        
        
    }
    
    
    func setNavBarTitleColor(color : Color){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            
            
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
            
            
                
                    "color" : color,
                    "forTitle" : true
                    
                    
            
            
            ])
            
            
        }
        
        
        
    }
    
}

extension UINavigationController{
    
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateNavBar(notification:)), name: NSNotification.Name("UPDATENAVBAR"), object: nil)
    }
    
    
    @objc
    func updateNavBar(notification : Notification){
        
        
        if let info = notification.userInfo{
            
            
            let color = info["color"] as! Color
            
            if let _ = info["forTitle"]{
                
                
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor:UIColor(color)]
                
                navigationBar.standardAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.compactAppearance?.titleTextAttributes = [.foregroundColor:UIColor(color)]
                navigationBar.compactAppearance?.largeTitleTextAttributes = [.foregroundColor:UIColor(color)]
                
                
                
                return
            }
            
            
            if color == .clear{
                
                let trasApp = UINavigationBarAppearance()
                
                trasApp.configureWithTransparentBackground()
                
                
                navigationBar.standardAppearance = trasApp
                navigationBar.scrollEdgeAppearance = trasApp
                navigationBar.compactAppearance = trasApp
                
                
                return
                
                
                
            }
            
            let apparence = UINavigationBarAppearance()
            
            
            apparence.backgroundColor  = UIColor(color)
            
            navigationBar.standardAppearance = apparence
            navigationBar.scrollEdgeAppearance = apparence
            navigationBar.compactAppearance = apparence
            
            
            
        }
        
        
        else{
            
            
            let apparence = UINavigationBarAppearance()
            
            let trans = UINavigationBarAppearance()
            
            trans.configureWithTransparentBackground()
            
            
            navigationBar.standardAppearance = apparence
            navigationBar.scrollEdgeAppearance = trans
            navigationBar.compactAppearance = apparence
            
        
            
            
        }
        
        
        
        
        
        
    }
}
