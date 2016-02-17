//
//  Game.swift
//  Backlog
//
//  Created by Fabián on 06/11/15.
//  Copyright © 2015 Triolabs. All rights reserved.
//

import Foundation
import UIKit

class Game: AnyObject {
    var idGame:Int?
    var name:String = ""
    var smallImage: String?
    var smallImage_img: UIImage?
    var bigImage:String?
    var deck: String?
    var platforms:[Platforms]?
    var rating:[String]?
    var launchYear: String?
	
	/*
    var status:String?
	*/
	
	var status:String? = ""{
		didSet{
			status = statusGameDictionary[status!]
		}
	}
	
	var avg:Float? = 0 {
		didSet{
			self.avg = Float(round(Double(100*avg!))/100)
		}
	}
	
    init(name:String,smallImage:String?,bigImage:String?,deck:String?,platforms:[Platforms]?,rating:[String]?,launchYear:String?,idGame:Int?){
        
        self.idGame=idGame
        
        self.name = name
        self.smallImage = smallImage
        self.bigImage = bigImage
        self.deck = deck
        self.platforms = platforms
        self.rating = rating
        self.launchYear = launchYear
        self.smallImage_img = UIImage(named: "imagenNoDisponible")!
        
        dispatch_async(dispatch_get_main_queue(), {
            var url = NSURL(string: GameImageUrl+self.smallImage!)
            
            if (self.smallImage?.rangeOfString("http") != nil){
                url = NSURL(string: self.smallImage!)
            }
            
            if let data = NSData(contentsOfURL: url!){
                guard let imgNew = UIImage(data: data) else{
                    self.smallImage_img = UIImage(named: "imagenNoDisponible")
                    return
                }
                self.smallImage_img = imgNew
            }
        })
        
    }
	
	convenience init(name:String,smallImage:String?,bigImage:String?,deck:String?,platforms:[Platforms]?,rating:[String]?,launchYear:String?,idGame:Int?,status:String?,avg:Float?){
		
		self.init(name: name,smallImage: smallImage,bigImage: bigImage,deck: deck,platforms: platforms,rating: rating,launchYear: launchYear,idGame: idGame)
		
		self.status = calculateStatus(status)
		self.avg = Float(round(Double(100*avg!))/100)
	}
	
    func calculateStatus(resultset:AnyObject?)->String{
        if let error = resultset?["error"] as? Int{
			
            //151
            if error == 0{
                if let status = resultset?["data"]??["status"] as? String{
                    guard let statusVal = statusGameDictionary[status] else{return ""}
                    return statusVal
                }
            }
            else{
                return statusGameDictionary["AA"]!
            }
        }
        return ""
    }
	
	func calculateStatus2(status:String)->String{
		guard let statusVal = statusGameDictionary[status] else{return ""}
		return statusVal
	}
}

public struct Platforms{
    var name: String
    var abbreviation:String
    
    init(name:String,abb:String){
        self.name = name
        self.abbreviation = abb
    }
}

let statusGameDictionary = ["NJ":"No jugado","WL":"WishList","T":"Terminado","EP":"En proceso", "AA":"Agregar a...", "E":"Eliminar"]
let statusGameDictionaryInverse = ["No jugado":"NJ","WishList":"WL","Terminado":"T","En proceso":"EP", "Agregar a...":"AA", "Eliminar":"E"]

let GameImageUrl = "http://static.giantbomb.com"

