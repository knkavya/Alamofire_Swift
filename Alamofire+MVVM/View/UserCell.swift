//
//  UserCell.swift
//  Alamofire+MVVM
//
//  Created by Kavya KN on 16/07/21.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    var userModel : UserModel?{
        didSet {
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func userConfiguration() {
        self.lblID.text = "ID : \(String(describing: userModel!.id!))"
        self.lblTitle.text = "Title : \(String(describing: userModel!.title!))"
        let status = userModel?.getStatusAndColor()
        self.lblStatus.text = "Status : \(String(describing: status!.0))"
        self.backgroundColor = status?.1
    }
}
