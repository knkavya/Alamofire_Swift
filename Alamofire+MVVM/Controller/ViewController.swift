//
//  ViewController.swift
//  Alamofire+MVVM
//
//  Created by Kavya KN on 16/07/21.
//

import UIKit

class ViewController: UIViewController {

    var viewModelUser = UserViewModel()
    
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUserDataUsingAlamofire()
        self.userListTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelUser.userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.userModel = viewModelUser.userArray[indexPath.row]
        return cell
        
    }
    
}
