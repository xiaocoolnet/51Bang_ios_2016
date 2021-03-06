//
//  IdentityTableViewCell.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class IdentityTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var cityChoose: UIButton!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var presonId: UITextField!
    @IBOutlet weak var emergency: UITextField!
    @IBOutlet weak var emergencyPhone: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        name.delegate = self
        presonId.delegate = self
        emergency.delegate = self
        emergencyPhone.delegate = self
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
