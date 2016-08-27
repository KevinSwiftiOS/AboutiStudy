//
//  ViewController.swift
//  alamofrie带参数
//
//  Created by hznucai on 16/2/23.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webView:UIWebView!
    var tempArray = ["a","b","c","d","e"]
    var newHeight:CGFloat = 0.0
    var dic = [String:AnyObject]()
    var mainWebView = UIWebView()
    var optionWebView = UIWebView()
    var webViewArray = NSMutableArray()
    var authDic = [String:AnyObject]()
    var newWebView = UIWebView()
    var array = NSArray()
    var qus = NSArray()
             override func viewDidLoad() {
        super.viewDidLoad()
            self.mainWebView = UIWebView(frame: CGRectMake(0,0,400,1))
               //self.mainWebView.delegate = self
     
        // Do any additional setup after loading the view, typically from a nib.
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startNetWork(sender:UIButton){
        let mainDic  = ["username":"2015001001",
            "password":"1",
            "devicetoken":"",
            "os":"",
            "clienttype":"1"]
        Alamofire.request(.POST, "http://dodo.hznu.edu.cn/api/login", parameters: mainDic, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) -> Void in
            switch response.result{
            case .Success(let data):
                let json = JSON(data)
            print(json)
           //     print(json["info"]["name"].string)
                let authtoken = json["authtoken"].string
                self.dic = [
                    "authtoken":authtoken!,
//                   "count":"100",
//                    "page":"1",
//                    "type":"2",
//                    "courseId":"9"
                    
              
                ]
                                case .Failure(_):
                print("shibai")
            }
        }
           }
    @IBAction func net(sender:UIButton) {
     
        Alamofire.request(.POST, "http://dodo.hznu.edu.cn/api/messagecontact", parameters: self.dic, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            switch response.result{
            case .Success(let Value):
                
                let json = JSON(Value)
                print(json)
            
//                dispatch_async(dispatch_get_main_queue(), {
//                    let items = json["items"].arrayObject! as NSArray
//                    let total = (items[0].valueForKey("content") as! String) + "学生答案:" + "<br>" + (items[0].valueForKey("answer") as! String)
//                    self.webView.loadHTMLString(total, baseURL: nil)
//                })
            case .Failure(let Error):
                print(Error.code)
            }
            
        
        }
    }
}



