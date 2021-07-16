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
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let user = viewModelUser.userArray[indexPath.row]
        cell.lblID.text = "ID : \(String(describing: user.id!))"
        cell.lblTitle.text = "Title : \(String(describing: user.title!))"
        let status = user.getStatusAndColor()
        cell.lblStatus.text = "Status : \(String(describing: status.0))"
        cell.backgroundColor = status.1
        return cell
        
    }
    
}
