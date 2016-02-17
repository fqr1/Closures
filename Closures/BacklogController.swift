//
//  BacklogController.swift
//  Closures
//
//  Created by Fabián on 06/01/16.
//  Copyright © 2016 Triolabs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BacklogController: UIViewController {
	
	//MARK: - Outlets
	@IBOutlet weak var field1: UITextField!
	@IBOutlet weak var field2: UITextField!
	@IBOutlet weak var field3: UITextField!
	@IBOutlet weak var field4: UITextField!
	
	@IBOutlet weak var text: UITextView!
	
	//MARK: - connection constants
	let baseUrlBL = "http://localhost/Backlog"
	
	//MARK: - func
	@IBAction func button(sender: AnyObject) {
		print("Selected \(sender.currentTitle)")
		
		switch sender.currentTitle!!{
			
		case "Login":
			login(field1.text!,pass: field2.text!)
			break;
		case "Logout":
			logout();
			break;
		case "Register":
			register(field1.text!,pass: field2.text!)
			break;
		case "Edit name and email":
			editUser(field1.text!,email: field2.text!)
			break;
		case "Edit name, email and pass":
			editUser(field1.text!, email: field2.text!, oldPass: field3.text!, newPass: field4.text!)
			break;
			
			
		case "Search":
			searchGame(field1.text!, page: field2.text!)
			break;
		case "Search by User":
			searchGamesByUser(field1.text!)
			break;
		case "Get games by WL":
			searchGamesByStatus("WL")
			break;
		case "Get games by T":
			searchGamesByStatus("T")
			break;
		case "Get games by NJ":
			searchGamesByStatus("NJ")
			break;
		case "Get games by EP":
			searchGamesByStatus("EP")
			break;
			
			
		case "Get following/Followers":
			getFollowingAndFollowers()
			break;
		case "Search users":
			searchUsers(field1.text!)
			break;
		case "Follow":
			followUser(field1.text!)
			break;
		case "UnFollow":
			unfollowUser(field1.text!)
			break;
			
		case "Get comments for game":
			getComment(field1.text!)
			break;
		case "Set comment for game":
			setComment(field1.text!, comment: field2.text!, rating: field3.text!)
			break;
			
		case "Search by platforms":
			print("search began")
			searchGameByPlatform(field1.text!,page: field2.text!,platforms: field3.text!)
			break;
		default:
			break;
		}
	}
	
	//MARK: - First section
	func login(email:String,pass:String){
		Alamofire.request(.POST, baseUrlBL+"/session2/login", parameters: ["email":email,"pass":pass]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
			
				return
			}
			
			//TODO
			
			
		}
	}
	
	func logout(){
		Alamofire.request(.POST, baseUrlBL+"/session2/logout").responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO
			
		}
	}
	
	func register(email:String,pass:String){
		Alamofire.request(.POST, baseUrlBL+"/session2/register", parameters: ["email":email,"pass":pass]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO
		}
	}
	
	func editUser(name:String,email:String){
		Alamofire.request(.PUT, baseUrlBL+"/user2/changeName", parameters: ["name":name,"email":email]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO
		}
	}
	
	func editUser(name:String,email:String,oldPass:String,newPass:String){
		Alamofire.request(.PUT, baseUrlBL+"/user2/changeNameAndPass", parameters: ["name":name,"email":email,"oldPass":oldPass,"pass":newPass]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO
		}
	}
	
	//MARK: - Second section
	func searchGame(query:String,page:String){
		Alamofire.request(.GET, baseUrlBL+"/game2/searchGames", parameters: ["query":query,"page":page]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			var games = [Game]()
			for i in 0 ..< responseJson["data"].count{
				let gameJson = responseJson["data"][i]

				/*
				guard let idGame = gameJson["idGame"].int else{continue}
				guard let name = gameJson["name"].string else{continue}
				
				let smallImage = gameJson["smallImage"].string
				let bigImage = gameJson["bigImage"].string
				let deck = gameJson["deck"].string
				
				
				//platforms
				var plats = [Platforms]()
				for j in 0 ... gameJson["platforms"].count{
					let platformJson = gameJson["platforms"][j]
					
					guard let namePlat = platformJson["name"].string else{continue}
					guard let abbreviation = platformJson["abb"].string else{continue}
					
					let newPlat = Platforms(name: namePlat, abb: abbreviation)
					plats.append(newPlat)
				}
				
				//ratings
				var ratings = [String]()
				for k in 0 ... gameJson["ratings"].count{
					let ratingJson = gameJson["ratings"][k]
					
					guard let nameRating = ratingJson["name"].string else{continue}

					ratings.append(nameRating)
				}
				
				let launchYear = gameJson["launchYear"].string
				
				let status = gameJson["status"].string
				let avg = gameJson["avg"].float
				
				let newGame = Game(name: name, smallImage: smallImage, bigImage: bigImage, deck: deck, platforms: plats, rating: ratings, launchYear: launchYear, idGame: idGame, status: status, avg: avg)
				*/
				
				guard let newGame = Game.getOneGame(gameJson) else{continue}
				games.append(newGame)
				

			}
			
			//DELETE
			for game in games{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(game.idGame)\n")
				self.text.text.appendContentsOf("name: \(game.name)\n")
				self.text.text.appendContentsOf("small image: \(game.smallImage)\n")
				self.text.text.appendContentsOf("big image: \(game.bigImage)\n")
				self.text.text.appendContentsOf("deck: \(game.deck)\n")
				self.text.text.appendContentsOf("launch year: \(game.launchYear)\n")
				self.text.text.appendContentsOf("status: \(game.status)\n")
				self.text.text.appendContentsOf("avg: \(game.avg)\n")
				self.text.text.appendContentsOf("platforms...\n")
				for platform in game.platforms!{
					self.text.text.appendContentsOf("\n\tname: \(platform.name)\n")
					self.text.text.appendContentsOf("\tabbreviation: \(platform.abbreviation)\n")
				}
				
				self.text.text.appendContentsOf("Ratings...\n")
				for rating in game.rating!{
					self.text.text.appendContentsOf("\tname: \(rating)\n")
				}
			}
			
			//TODO
			
		}
	}
	
	func searchGamesByUser(idUser:String){
		Alamofire.request(.GET, baseUrlBL+"/game2/gamesByUser", parameters: ["idUser":idUser]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			var games = [Game]()
			for i in 0 ..< responseJson["data"].count{
				let gameJson = responseJson["data"][i]
				guard let newGame = Game.getOneGame(gameJson) else{continue}
				games.append(newGame)
			}
			
			//DELETE
			for game in games{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(game.idGame)\n")
				self.text.text.appendContentsOf("name: \(game.name)\n")
				self.text.text.appendContentsOf("small image: \(game.smallImage)\n")
				self.text.text.appendContentsOf("big image: \(game.bigImage)\n")
				self.text.text.appendContentsOf("deck: \(game.deck)\n")
				self.text.text.appendContentsOf("launch year: \(game.launchYear)\n")
				self.text.text.appendContentsOf("status: \(game.status)\n")
				self.text.text.appendContentsOf("avg: \(game.avg)\n")
				self.text.text.appendContentsOf("platforms...\n")
				for platform in game.platforms!{
					self.text.text.appendContentsOf("\tname: \(platform.name)\n")
					self.text.text.appendContentsOf("\tabbreviation: \(platform.abbreviation)\n")
				}
				
				self.text.text.appendContentsOf("Ratings...\n")
				for rating in game.rating!{
					self.text.text.appendContentsOf("\tname: \(rating)\n")
				}
			}
			
			//TODO
			
		}
	}
	
	func searchGamesByStatus(status:String){
		Alamofire.request(.GET, baseUrlBL+"/game2/gamesByStatus", parameters: ["status":status]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}

			
			var games = [Game]()
			for i in 0 ..< responseJson["data"].count{
				let gameJson = responseJson["data"][i]
				guard let newGame = Game.getOneGame(gameJson) else{continue}
				games.append(newGame)
			}
			
			//DELETE
			for game in games{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(game.idGame)\n")
				self.text.text.appendContentsOf("name: \(game.name)\n")
				self.text.text.appendContentsOf("small image: \(game.smallImage)\n")
				self.text.text.appendContentsOf("big image: \(game.bigImage)\n")
				self.text.text.appendContentsOf("deck: \(game.deck)\n")
				self.text.text.appendContentsOf("launch year: \(game.launchYear)\n")
				self.text.text.appendContentsOf("status: \(game.status)\n")
				self.text.text.appendContentsOf("avg: \(game.avg)\n")
				self.text.text.appendContentsOf("platforms...\n")
				for platform in game.platforms!{
					self.text.text.appendContentsOf("\tname: \(platform.name)\n")
					self.text.text.appendContentsOf("\tabbreviation: \(platform.abbreviation)\n")
				}
				
				self.text.text.appendContentsOf("Ratings...\n")
				for rating in game.rating!{
					self.text.text.appendContentsOf("\tname: \(rating)\n")
				}
			}
			
			//TODO
			
		}
	}
	
	//MARK: - Third section
	func getFollowingAndFollowers(){
		Alamofire.request(.GET, baseUrlBL+"/user/getFollowingAndFollowers").responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			
			var followingUsers = [User]()
			for i in 0 ..< responseJson["data"]["following"].count{
				let userJson = responseJson["data"]["following"][i]
				guard let fUser = User.getOneUser(userJson) else{continue}
				followingUsers.append(fUser)
			}
			
			var followerUsers = [User]()
			for i in 0 ..< responseJson["data"]["followers"].count{
				let userJson = responseJson["data"]["followers"][i]
				guard let fUser = User.getOneUser(userJson) else{continue}
				followerUsers.append(fUser)
			}
			
			//DELETE
			self.text.text.appendContentsOf("\nFollowing...")
			for user in followingUsers{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(user.idUser)\n")
				self.text.text.appendContentsOf("name: \(user.name)\n")
				self.text.text.appendContentsOf("email: \(user.email)\n")
				self.text.text.appendContentsOf("following: \(user.following)\n")

			}
			self.text.text.appendContentsOf("\nFollowers...")
			for user in followerUsers{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(user.idUser)\n")
				self.text.text.appendContentsOf("name: \(user.name)\n")
				self.text.text.appendContentsOf("email: \(user.email)\n")
				self.text.text.appendContentsOf("following: \(user.following)\n")
				
			}
			
			//TODO
			
		}
	}
	
	func searchUsers(query:String){
		Alamofire.request(.GET, baseUrlBL+"/user2/find", parameters: ["query":query]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			
			var users = [User]()
			for i in 0 ..< responseJson["data"].count{
				let userJson = responseJson["data"][i]
				guard let fUser = User.getOneUser(userJson) else{continue}
				users.append(fUser)
			}
			
			
			//DELETE
			self.text.text.appendContentsOf("\nUsers...")
			for user in users{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(user.idUser)\n")
				self.text.text.appendContentsOf("name: \(user.name)\n")
				self.text.text.appendContentsOf("email: \(user.email)\n")
				self.text.text.appendContentsOf("following: \(user.following)\n")
			}
			
			//TODO
		}
	}
	
	func followUser(idUser:String){
		Alamofire.request(.POST, baseUrlBL+"/user2/follow", parameters: ["idFollowing":idUser]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO ?
		}
	}
	
	func unfollowUser(idUser:String){
		Alamofire.request(.DELETE, baseUrlBL+"/user2/unFollow", parameters: ["idFollowing":idUser]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO ?
		}
	}
	
	
	//MARK: - Fourth section
	func setComment(idGame:String,comment:String,rating:String){
		Alamofire.request(.POST, baseUrlBL+"/game2/comment", parameters: ["idGame":idGame,"comment":comment,"rating":rating]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			//TODO
		}
	}
	
	func getComment(idGame:String){
		Alamofire.request(.GET, baseUrlBL+"/game2/comment", parameters: ["idGame":idGame]).responseJSON{
			response in
			
			//DELETE
			self.text.text = "\(response)"
			
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			
			guard error != true else{
				
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			
			// 26 839
			var comments = [Comment]()
			for i in 0 ..< responseJson["data"].count {
				let commentJson = responseJson["data"][i]
				
				print("Comment json: \(commentJson)")
				guard let rating = commentJson["rating"].string else{continue}
				print("NO CONTINUE......")
				let name = commentJson["name"].string
				let comment = commentJson["comment"].string
				print("Adding name:\(name), comment:\(comment), rating:\(rating)")
				let newComment = Comment(name: name!, comment: comment!, rating: rating)
				
				comments.append(newComment)
			}
			
			//DELETE
			self.text.text.appendContentsOf("\n Comments...")
			for comment in comments{
				self.text.text.appendContentsOf("\n\n Name: \(comment.name)\n")
				self.text.text.appendContentsOf("Rating: \(comment.rating)\n")
				self.text.text.appendContentsOf("Comment: \(comment.comment)\n")
			}
			
			//TODO
		}
	}
	
	func searchGameByPlatform(query:String,page:String,platforms:String){
		let platformsVec=platforms.componentsSeparatedByString(",")
		Alamofire.request(.GET, baseUrlBL+"/game2/searchGamesByPlatforms", parameters: ["query":query,"page":page,"platforms":platformsVec]).responseJSON{
			response in
			
			print("search done")
			
			//DELETE
			self.text.text = "\(response.request)"
			print("1")
			let responseJson = JSON(data: response.data!)
			let error = responseJson["error"]
			print("2")
			//DELETE
			self.text.text.appendContentsOf("\n\n Error: \(error)")
			print("3")
			guard error != true else{
				print("3.1")
				var message = responseJson["mensaje"]
				
				if message == nil || message == "" {
					message = "Error desconocido"
				}
				
				let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
				return
			}
			print("4")
			
			var games = [Game]()
			for i in 0 ..< responseJson["data"].count{
				let gameJson = responseJson["data"][i]
				guard let newGame = Game.getOneGame(gameJson) else{continue}
				games.append(newGame)
			}
			print("5")
			
			//DELETE
			for game in games{
				self.text.text.appendContentsOf("\n\n\n")
				self.text.text.appendContentsOf("id: \(game.idGame)\n")
				self.text.text.appendContentsOf("name: \(game.name)\n")
				self.text.text.appendContentsOf("small image: \(game.smallImage)\n")
				self.text.text.appendContentsOf("big image: \(game.bigImage)\n")
				self.text.text.appendContentsOf("deck: \(game.deck)\n")
				self.text.text.appendContentsOf("launch year: \(game.launchYear)\n")
				self.text.text.appendContentsOf("status: \(game.status)\n")
				self.text.text.appendContentsOf("avg: \(game.avg)\n")
				self.text.text.appendContentsOf("platforms...\n")
				for platform in game.platforms!{
					self.text.text.appendContentsOf("\tname: \(platform.name)\n")
					self.text.text.appendContentsOf("\tabbreviation: \(platform.abbreviation)\n")
				}
				
				
				self.text.text.appendContentsOf("Ratings...\n")
				for rating in game.rating!{
					self.text.text.appendContentsOf("\tname: \(rating)\n")
				}
			}
			print("6")
			
			//TODO
			
			
			
		}
	}
	

}

extension Game{
	static func getOneGame(gameJson:JSON)->Game?{
		guard let idGame = gameJson["idGame"].int else{return nil}
		guard let name = gameJson["name"].string else{return nil}
		
		let smallImage = gameJson["smallImage"].string
		let bigImage = gameJson["bigImage"].string
		let deck = gameJson["deck"].string
		
		
		//platforms
		var plats = [Platforms]()
		for j in 0 ..< gameJson["platforms"].count{
			let platformJson = gameJson["platforms"][j]
			
			guard let namePlat = platformJson["name"].string else{continue}
			guard let abbreviation = platformJson["abb"].string else{continue}
			
			let newPlat = Platforms(name: namePlat, abb: abbreviation)
			plats.append(newPlat)
		}
		
		//ratings
		var ratings = [String]()
		for k in 0 ..< gameJson["ratings"].count{
			let ratingJson = gameJson["ratings"][k]
			
			guard let nameRating = ratingJson["name"].string else{continue}
			
			ratings.append(nameRating)
		}
		
		let launchYear = gameJson["launchYear"].string
		
		let status = gameJson["status"].string
		let avg = gameJson["avg"].float
		
		let newGame = Game(name: name, smallImage: smallImage, bigImage: bigImage, deck: deck, platforms: plats, rating: ratings, launchYear: launchYear, idGame: idGame, status: status, avg: avg)
		
		return newGame
	}
}

extension User{
	static func getOneUser(userJson:JSON)->User?{
		guard let idUser = userJson["id"].string else{return nil}
		guard let email = userJson["email"].string else{return nil}
		let following = userJson["following"].int
		let name = userJson["name"].string
		
		let newUser = User(idUser: idUser, name: name, email: email, following: following)
		
		return newUser
	}
}
