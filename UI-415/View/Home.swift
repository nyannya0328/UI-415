//
//  Home.swift
//  UI-415
//
//  Created by nyannyan0328 on 2022/01/07.
//

import SwiftUI

struct Home: View {
    @State var barColor : Color = .init(white: 0)
    @State var barTextColor : Color = .primary
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:15){
                    
                    
                    Text("Navigaition Bar Color")
                        .font(.title2.bold())
                        .foregroundColor(.gray)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                    Picker(selection: $barColor) {
                        
                        Text("Clear")
                            .tag(Color.clear)
                        
                        Text("Purple")
                            .tag(Color.purple)
                        
                        Text("Red")
                            .tag(Color.red)
                        
                        
                        Text("Orange")
                            .tag(Color.orange)
                        
                        
                        Text("Cyan")
                            .tag(Color.cyan)
                        
                        
                        
                        
                        
                    } label: {
                    
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    
                    
                    Text("Navigation Bar Color")
                        .font(.title2.bold())
                        .foregroundColor(.gray)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                    
                    Picker(selection: $barTextColor) {
                        
                        
                        
                        Text("Primary")
                            .tag(Color.primary)
                        
                        Text("White")
                            .tag(Color.white)
                        
                        Text("Blue")
                            .tag(Color.blue)
                        
                        
                        Text("Gray")
                            .tag(Color.gray)
                        
                        
                        Text("Green")
                            .tag(Color.green)
                        
                        
                    } label: {
                        
                        
                        
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    
                    
                    ForEach(1...12,id:\.self){image in
                        
                        
                        NavigationLink {
                            
                        } label: {
                            
                            GeometryReader{proxy in
                                
                                
                                let size = proxy.size
                                
                                Image("p\(image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .cornerRadius(10)
                                  
                                
                                
                                
                            }
                            .frame(height:200)
                        }

                        
                        
                        
                    }

                    
                    
                    
                    
                    


                    
                    
                    
                }
                .padding()
                .padding(.vertical,10)
                
                
                
                
            }
            .navigationTitle("Navigation View")
            .toolbar {
                
                Button("RESET"){
                    
                    barColor = .init(white: 0)
                    barTextColor = .primary
                    
                  reset()
            
                    
                    
                    
                }
            }
            .onChange(of: barColor) { newValue in
                
                
                if barColor == Color.init(white: 0){return}
                
                setNavBarColor(color: barColor)
                
                barTextColor = .primary
                
            }
            .onChange(of: barTextColor) { newValue in
                
                
                setNavBarTitleColor(color: barTextColor)
                
                
            }
            
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
