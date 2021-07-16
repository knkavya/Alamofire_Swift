//
//  UserViewModel.swift
//  Alamofire+MVVM
//
//  Created by Kavya KN on 16/07/21.
//

import UIKit
import Alamofire

class UserViewModel {
    
    weak var vc: ViewController?
    var userArray = [UserModel]()
    
    // MARK: API call using Alamofire.
    func getAllUserDataUsingAlamofire(){
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
            if let data = response.data {
                do {
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    self.userArray.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.userListTableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: API call using URLSession.
    func getAllUsersData() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { data, responce, error in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.userArray.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.userListTableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
