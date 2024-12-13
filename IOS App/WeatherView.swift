//
//  WeatherView.swift
//  -WeAttire-
//
//  Created by CoopStudent on 8/1/22.
//

import SwiftUI


struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center) {
                VStack(alignment: .center, spacing: 4.0) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                VStack{
                    HStack {
                        VStack(spacing:10) {
                            if ((weather.weather[0].main) == "Clear") || (weather.weather[0].main) == "Sunny" {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                            } else if ((weather.weather[0].main) == "Drizzle") || ((weather.weather[0].main) == "Rain") {
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            }else if ((weather.weather[0].main) == "Snow") {
                                Image(systemName: "cloud.snow")
                                    .font(.system(size: 40))
                            } else {
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                            }
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 120, alignment: .center)
                        
                        Spacer()
                        VStack{
                        Text("Feels like :")
                            .fontWeight(.light)
                            .font(.system(size: 24))
                            
                        Spacer()
                                .frame(height:0)
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                        }
                    }
                    Spacer()
                        .frame(height: 0)
                    ZStack {
                        
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.926, opacity: 0.818))
                            .font(.system(size: 330))
                            
                        
                        Circle()
                            .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.875))
                            .frame(width: 100, height:100)
                            .offset(x:60, y:70)
                        
                        Circle()
                            .fill(Color(hue: 1.0, saturation: 0.02, brightness: 0.612, opacity: 0.34))
                            .frame(width: 130, height:130)
                            .offset(x:-70, y:50)
                        
                        Circle()
                            .fill(Color(hue: 1.0, saturation: 0.02, brightness: 0.612, opacity: 0.34))
                            .frame(width: 120, height:120)
                            .offset(x:70, y:-60)
                        
                        Circle()
                            .fill(Color(hue: 1.0, saturation: 0.02, brightness: 0.612, opacity: 0.34))
                            .frame(width: 100, height:100)
                            .offset(x:-60, y:-80)
                        
                        if (weather.main.feelsLike >= 17) {
                            Image(systemName: "tshirt.fill")
                                .font(.system(size: 55))
                                .offset(x:-60, y:-80)
                                //.frame(width: 130, height:130)
                        } else {
                            Image("Longsleev")
                                .offset(x:-60, y:-80)
                               
                        }
                        
                        if (weather.main.feelsLike >= 21) {
                            Image("Shorts")
                                .offset(x:-70, y:50)
                        } else {
                            Image("Pants")
                                .offset(x:-70, y:50)
                        }
                        
                        if ((weather.weather[0].main) == "Drizzle") || ((weather.weather[0].main) == "Rain") {
                            Image(systemName: "umbrella.fill")
                                .font(.system(size: 55))
                                .offset(x:70, y:-60)
                        } else if ((weather.weather[0].main) == "Snow") {
                            Image("Mittin")
                                .offset(x:70, y:-60)
                        } else if ((weather.weather[0].main) == "Sunny") {
                            Image("Glasses")
                                .offset(x:70, y:-60)
                        } else {
                            Image("Cap")
                                .offset(x:70, y:-60)
                        }
                       
                        Image("Coar")
                            .offset(x:60, y:70)
                        if (weather.main.feelsLike >= 9) {
                            
                            Image(systemName: "xmark")
                               // .fill(.gray)
                                .font(.system(size: 70))
                                .offset(x:60, y:70)
                                .foregroundColor(Color(.systemGray))
                        }
                       
                        
  
                    
                }
                Spacer()
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Details:")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.sun.fill", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                            .frame(width: 80)
                        WeatherRow(logo: "thermometer.sun.fill", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                            .frame(width: 70)
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(red: 0.523, green: 0.852, blue: 0.969))
                .background(.white)
                
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Image("Background2 (1)")
            .resizable()
            .scaledToFill()
            .clipped())
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
