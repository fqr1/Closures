//
//  Comment.swift
//  Closures
//
//  Created by Fabián on 08/01/16.
//  Copyright © 2016 Triolabs. All rights reserved.
//

import Foundation
import UIKit

class Comment {
	let name:String
	let comment:String
	let rating:String
	
	init(name:String,comment:String,rating:String){
		self.name = name
		self.comment = comment
		self.rating = rating
	}
}