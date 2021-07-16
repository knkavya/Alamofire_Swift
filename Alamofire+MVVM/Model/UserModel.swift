//
//  UserViewModel.swift
//  Alamofire+MVVM
//
//  Created by Kavya KN on 16/07/21.
//

import UIKit

// MARK: API Model 
struct UserModel : Codable {
	let userId : Int?
	let id : Int?
	let title : String?
	let completed : Bool?

	enum CodingKeys: String, CodingKey {

		case userId = "userId"
		case id = "id"
		case title = "title"
		case completed = "completed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
	}
    
    let greenColor = UIColor(red: 146/255, green: 213/255, blue: 175/255, alpha: 1.0)
    let redColor = UIColor(red: 237/255, green: 119/255, blue: 121/255, alpha: 1.0)
    
    func getStatusAndColor() -> (String, UIColor) {
        if completed ?? true {
            return ("Completed Task", greenColor)
        } else {
            return ("Incomplete Task", redColor)
        }
    }
}
