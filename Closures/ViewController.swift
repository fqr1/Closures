//
//  ViewController.swift
//  Closures
//
//  Created by Fabián on 28/12/15.
//  Copyright © 2015 Triolabs. All rights reserved.
//

import UIKit

//MARK: - Frameworks
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

	//MARK: - Outlets
	@IBOutlet weak var image1: UIImageView!
	@IBOutlet weak var text1: UITextView!
	
	//MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		text1.layer.borderWidth = 2
		text1.layer.borderColor = UIColor.grayColor().CGColor
	}
	
	//MARK: - First method, 1 parameter
	
	func applyMutliplication(value: Int, multFunction: Int -> Int) -> Int {
		return multFunction(value)
	}
	
	@IBAction func multiplicate(sender: AnyObject) {
		
//		let result = applyMutliplication(2, multFunction: {(value:Int)-> Int in
//			return value * value
//		})
		
		
//		let result = applyMutliplication(2, multFunction: {value in
//			value * value
//		})
		
		
//		let result = applyMutliplication(2, multFunction: {
//			$0 * $0
//		})

		
		let result = applyMutliplication(2){ $0 * $0 }
		
		//let result2 = applyMutliplication(2, multFunction: *)

		
		let alert = UIAlertController(title: "Result", message: "\(result)", preferredStyle: UIAlertControllerStyle.Alert)
		
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
		
		alert.addAction(UIAlertAction(title: "Re calculate", style: UIAlertActionStyle.Default, handler: {
			(action: UIAlertAction!) in
			print("Calculating...")
			self.multiplicate(sender)
		}))
		
		self.presentViewController(alert, animated: true, completion:{
				print("Completed showing alert")
			})
		
	}
	
	//MARK: - Second method, 2 parameters
	
	func secondOperation(first:Int,second:Int, operation:(Int, Int)->Int)->Int{
		return operation(first, second)
	}
	
	@IBAction func multipicate2(sender: AnyObject) {
		
//		let result = secondOperation(4, second: 5, operation: {
//			(firstP:Int, secondP:Int) in
//			return firstP * secondP
//		})

		
//		let result = secondOperation(4, second: 5, operation: {
//			firstP, secondP in
//			return firstP * secondP
//		})
		
		
//		let result = secondOperation(4, second: 5, operation: {
//			return $0 * $1
//		})

		
//		let result = secondOperation(4, second: 5, operation: {
//			$0 * $1
//		})
		
		
//		let result = secondOperation(4, second: 5) {$0 * $1}
		
		
		let result = secondOperation(4, second: 5,operation: *)
		
		
		let alert = UIAlertController(title: "Result", message: "\(result)", preferredStyle: UIAlertControllerStyle.Alert)
		
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
		
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	//MARK: - Loading with Alamofire
	
	@IBAction func loadImage(sender: AnyObject) {
		let urlImage = "http://static.giantbomb.com/uploads/square_avatar/9/93770/2362272-nes_supermariobros3_4.jpg"
		
		Alamofire
			.request(.GET, urlImage)
			
			.response{
				requestAlamo, responseAlamo, dataAlamo, errorAlamo in
				
				if let _ = errorAlamo{
					return
				}
				
				guard let data = dataAlamo else{return}
				
				self.image1.image = UIImage(data: data)
			}
	}
	
	@IBAction func loadInfo(sender: AnyObject) {
		let urlSession = "http://localhost/Backlog/session/isLogged"
		
		Alamofire
			.request(.GET, urlSession)
			.responseJSON{
				data in
				
				self.text1.text = ""
				self.text1.text.appendContentsOf("Total response: \(data)")
				self.text1.text.appendContentsOf("\n\n\n")
				self.text1.text.appendContentsOf("Request: \(data.request)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Response \(data.response)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Data no-json: \(data.data)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Result: \(data.result)")
				self.text1.text.appendContentsOf("\n\n")
				
				let json = JSON(data: data.data!)
				
				self.text1.text.appendContentsOf("DATA: \(self.getJsonFromRequest(data.data!))")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("DATA Swifty: \(json)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("----------------------------")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Code: \(json["code"])")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Error: \(json["error"])")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Message: \(json["mensaje"])")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Data: \(json["data"])")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf(".-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Result: \(data.result.value!)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Code: \(data.result.value!["code"]!!)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Error: \(data.result.value!["error"]!!)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Message: \(data.result.value!["mensaje"]!!)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Data: \(data.result.value!["data"]!!)")
				self.text1.text.appendContentsOf("\n\n")
				
				
			}
			/*
			.response{
				requestAlamo, responseAlamo, dataAlamo, errorAlamo in
				self.text1.text = ""
				self.text1.text.appendContentsOf("Request: \(requestAlamo)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Response \(responseAlamo)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Data no-json: \(dataAlamo)")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("Error: \(errorAlamo)")
				self.text1.text.appendContentsOf("\n\n")
				
				//self.text1.text = "Request: \(requestAlamo) \n\n Response \(responseAlamo)"
				
				
				
				if let _ = errorAlamo{
					return
				}
				
				let json = JSON(dataAlamo!)
				
				self.text1.text.appendContentsOf("DATA: \(self.getJsonFromRequest(dataAlamo!))")
				self.text1.text.appendContentsOf("\n\n")
				self.text1.text.appendContentsOf("DATA Swifty: \(json)")
				self.text1.text.appendContentsOf("\n\n")
				
		}*/
	}
	
	@IBAction func login(sender: AnyObject) {
		let title = sender.currentTitle
		let button = sender as! UIButton
		
		var URL = "http://localhost/Backlog/session/"
		
		var parameters:[String:AnyObject] = ["email":"","pass":""]
		
		if title == "Login"{
			URL+="login"
			
			parameters["email"] = "a@aa"
			parameters["pass"] = "a"
		}
		else if title == "Logout"{
			URL+="logout"
		}
		
		Alamofire.request(.POST, URL, parameters: parameters)
			.responseJSON{
				data in
				let response = JSON(data: data.data!)
				self.text1.text = "\(response)"
				
				if response["error"] == false{
					if title == "Login"{
						URL+="login"
						button.setTitle("Logout", forState: UIControlState.Normal)
						
						parameters["email"] = "a@aa"
						parameters["pass"] = "a"
					}
					else if title == "Logout"{
						URL+="logout"
						button.setTitle("Login", forState: UIControlState.Normal)
					}
				}
			}
	}
	
	//MARK: - REST calls
	
	@IBAction func restCall(sender: AnyObject) {
		
		var requestType = Method.GET
		var parameters = [String:AnyObject]()
		
		switch sender.currentTitle!!{
			case "GET":
				
				parameters["idGame"] = 4
				
				break;
			case "POST":
				
				requestType = Method.POST
				parameters["idGame"] = 5
				parameters["name"] = "Un juego mas"
				parameters["deck"] = "Un juego mas que jugar"
				
				break;
			case "PUT":
				
				requestType = Method.PUT
				parameters["idGame"] = 6
				parameters["name"] = "jaja"
				
				break;
			case "DELETE":
				
				requestType = Method.DELETE
				parameters["idGame"] = 8
				
				break;
		default:
			break;
		}
		
		Alamofire.request(requestType, "http://localhost/Backlog/prueba/tipoConsulta", parameters: parameters)
			.responseJSON(completionHandler: {
				response in
				
				self.text1.text = "\(response.request)\n\n\(response)"
			})
	}
	
	
	func getJsonFromRequest(data:NSData)->AnyObject?{
		do{
			return try NSJSONSerialization.JSONObjectWithData(data, options: [])
		}catch let error as NSError{
			let e = "Error:"+error.localizedDescription
			print(e)
			return e
		}
		
	}
}


