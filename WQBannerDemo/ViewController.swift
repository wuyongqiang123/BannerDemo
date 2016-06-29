
//
//  ViewController.swift
//  WQBannerDemo
//
//  Created by mac on 16/4/15.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bannerView: WQBannerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let dataArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        var dic = NSDictionary.init(objects: ["http://pic01.babytreeimg.com/foto3/photos/2014/0211/68/2/4170109a41ca935610bf8_b.png","12"], forKeys: ["image_url","image_id"], count: 2)


        dataArray.addObject(dic)

        dic = NSDictionary.init(objects: ["http://pic01.babytreeimg.com/foto3/photos/2014/0127/19/9/4170109a267ca641c41ebb_b.png","13"], forKeys: ["image_url","image_id"],count: 2)
        dataArray.addObject(dic)

        dic = NSDictionary.init(objects: ["http://pic02.babytreeimg.com/foto3/photos/2014/0207/59/4/4170109a17eca86465f8a4_b.jpg","14"], forKeys: ["image_url","image_id"],count: 2)
        
        dataArray.addObject(dic)
        print(dataArray)


        if (self.bannerView != nil) {
            self.bannerView?.reloadBannerWithData(dataArray)
        }
        else {
            //创建方式一(普通创建方法)
            self.bannerView = WQBannerView.init(frame: CGRectMake(0, 50, self.view.frame.size.width, 140), direction: BannerViewScrollDirection.ScrollDirectionLandscape, images: dataArray)
            self.bannerView?.backgroundColor = UIColor.clearColor()
            self.bannerView!.rollingDelayTime = 4.0
            self.bannerView?.defaultpageColor = UIColor.redColor()
            self.bannerView?.selectpageColor = UIColor.blueColor()
            self.bannerView?.imageKey = "image_url"
            self.bannerView?.imageId = "image_id"
            self.bannerView?.setSquare(0)
            self.bannerView!.setPageControlStyle(BannerViewPageStyle.PageStyle_Middle)
            self.bannerView!.startDownloadImage()
            self.bannerView!.startRolling()
            self.bannerView?.showClose(false)
            self.bannerView?.didSelectImageView = { (bannerView, index, bannerData, imageid) in
                                print("\(index)+\(bannerData)+\(imageid)")
                            }
            self.bannerView?.bannerViewdidClosed = { (bannerView) in
                                if ((bannerView.superview) != nil)
                                {
                                    bannerView.removeFromSuperview()
                                }
                            }
            self.view.addSubview(self.bannerView!)

            //创建方式二(链式创建方法)
//            self.bannerView = WQBannerView.setInit(CGRectMake(0, 50, self.view.frame.size.width, 140), direction: BannerViewScrollDirection.ScrollDirectionLandscape, images: dataArray).addRollingDelayTime(4.0).addDefaultpageColor(UIColor.redColor()).addSelectpageColor(UIColor.blueColor()).addImageKey("image_url").addImageId("imageId").addSquare(0).addPageControlStyle(BannerViewPageStyle.PageStyle_Middle).addStartDownloadImage().addShowClose(false).addStartRolling().addDidSelectImageViewEvent({ (bannerView, index, bannerData, imageid) in
//                print("\(index)+\(bannerData)+\(imageid)")
//            }).addBannerViewdidClosed({ (bannerView) in
//                if ((bannerView.superview) != nil)
//                {
//                    bannerView.removeFromSuperview()
//                }
//            })
//            self.view.addSubview(self.bannerView!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

