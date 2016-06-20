//
//  MainViewController.swift
//  51Bang_ios_2016
//
//  Created by apple on 16/6/18.
//  Copyright © 2016年 校酷网络科技公司. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController,CityViewControllerDelegate,CLLocationManagerDelegate {
    private var locationView = MKMapView()

    @IBOutlet weak var scrollView: UIScrollView!
    var cityController:CityViewController!

    @IBOutlet var location: UIButton!
    @IBOutlet weak var topView: UIView!
    let nameArr:[String] = ["帮我","我帮","同城互动"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...2 {
            let helpBtn = UIButton(frame: CGRectMake(WIDTH/6-25+WIDTH/3*CGFloat(i), 15, 50, 50))
            helpBtn.layer.cornerRadius = 25
            helpBtn.backgroundColor = UIColor.orangeColor()
            helpBtn.tag = i
            helpBtn.addTarget(self, action: #selector(self.helpWithWho(_:)), forControlEvents: .TouchUpInside)
            topView.addSubview(helpBtn)
            let nameLab = UILabel(frame: CGRectMake(WIDTH/6-25+WIDTH/3*CGFloat(i), 70, 50, 20))
            nameLab.textAlignment = .Center
            nameLab.font = UIFont.systemFontOfSize(12)
            nameLab.text = nameArr[i]
            topView.addSubview(nameLab)
            
            
        }
        
        locationView = MKMapView(frame: CGRectMake(0, 100, WIDTH, HEIGHT-214))
        self.view.addSubview(locationView)
        locationView.mapType = .Standard
        let latdelta = 0.01
        let longdelta = 0.01
        var currentLocationSpan = MKCoordinateSpan()
        currentLocationSpan = MKCoordinateSpanMake(latdelta, longdelta)
        //        位置坐标
        let center:CLLocation = CLLocation(latitude: 37.528502, longitude: 121.365593)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
        
        //        设置显示区域
        locationView.setRegion(currentRegion, animated: true)
        
        //        创建大头针
        let objectAnnotation = MKPointAnnotation()
        //        设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 37.528502, longitude: 121.365593).coordinate
        
        //        设置点击大头针之后的提示
        objectAnnotation.title = "我的位置"
        //        大头针描述
        //        objectAnnotation.subtitle = "最新"
        
        
        //        添加大头针
        locationView.addAnnotation(objectAnnotation)
        
            // Do any additional setup after loading the view.
    }
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("=========\(newLocation.coordinate.latitude)")
        print(newLocation.coordinate.longitude)
        manager.stopUpdatingLocation()
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }

    func helpWithWho(btn:UIButton) {
        print(nameArr[btn.tag])
        
        
    }
    @IBAction func goToLocation(sender: AnyObject) {
        print("定位")
        cityController = CityViewController(nibName: "CityViewController", bundle: nil)
        cityController.delegate = self
        self.navigationController?.pushViewController(cityController, animated: true)

        cityController.title = "定位"
    }
    func selectCity(city: String) {
        location.setTitle(city, forState: UIControlState.Normal)
        location.sizeToFit()
    }

    @IBAction func goToFriendList(sender: AnyObject) {
        print("好友列表")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("FriendView")
        self.navigationController?.pushViewController(vc, animated: true)
        vc.title = "好友列表"
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
