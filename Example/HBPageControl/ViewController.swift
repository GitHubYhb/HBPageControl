//
//  ViewController.swift
//  HBPageControl
//
//  Created by GitHubYhb on 12/22/2020.
//  Copyright (c) 2020 GitHubYhb. All rights reserved.
//

import UIKit
import HBPageControl

class ViewController: UIViewController {

    
    var currentIndex:Int = 0
    var timer:Timer!
    var pageControl:HBPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let pc = HBPageControl.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 30))
        pc.numberOfPages = 10
        pc.dotWidth = 8
        pc.dotHeight = 8
        pc.spacing = 5
        view.addSubview(pc)
        pageControl = pc
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] timer in
            self?.currentIndex = self!.currentIndex + 1
            if self!.currentIndex >= (self?.pageControl.numberOfPages)!{
                self?.currentIndex = 0
            }
            self?.pageControl.currentPage = self!.currentIndex
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

