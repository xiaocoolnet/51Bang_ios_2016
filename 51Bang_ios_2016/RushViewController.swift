//
//  RushViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit

class RushViewController: UIViewController {

    @IBOutlet weak var selector: UIButton!
    var kai = false
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startAndEnd(sender: UIButton) {
        if kai == true {
            sender.setImage(UIImage(named: "ic_kai"), forState: .Normal)
            kai = false
        }else{
            sender.setImage(UIImage(named: "ic_guan"), forState: .Normal)
            kai = true
        }
        
    }
    @IBAction func nowToCertification(sender: AnyObject) {
        print("立即认证")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("CertificationView")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.title = "身份认证"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
