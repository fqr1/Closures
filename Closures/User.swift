//
//  User.swift
//  Backlog
//
//  Created by Fabián on 07/12/15.
//  Copyright © 2015 Triolabs. All rights reserved.
//

import Foundation
import UIKit

class User: AnyObject {
	var idUser:String?
	var name:String?
	var email: String?
	var following:Int?
	
	init(idUser:String?, name:String?,email:String, following:Int?){
		self.idUser = idUser
		self.name = name
		self.email = email
		self.following = following
	}
}


