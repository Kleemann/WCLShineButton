//
//  ViewController.swift
//  Demo
//
//  Created by 王崇磊 on 2017/2/16.
//  Copyright © 2017年 王崇磊. All rights reserved.
//

import UIKit
import WCLShineButton

class ViewController: UIViewController {
    
    private var allButtons:[WCLShineButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var param1 = WCLShineParams()
        param1.bigShineColor = UIColor(rgb: (153,152,38))
        param1.smallShineColor = UIColor(rgb: (102,102,102))
        let bt1 = WCLShineButton(frame: .init(x: 100, y: 100, width: 60, height: 60), params: param1)
        bt1.isSelected = true
        bt1.fillColor = UIColor(rgb: (153,152,38))
        bt1.color = UIColor(rgb: (170,170,170))
        bt1.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
        view.addSubview(bt1)
        allButtons.append(bt1)
        
        var param2 = WCLShineParams()
        param2.bigShineColor = UIColor(rgb: (255,95,89))
        param2.smallShineColor = UIColor(rgb: (216,152,148))
        param2.shineCount = 15
        param2.smallShineOffsetAngle = -5
        let bt2 = WCLShineButton(frame: .init(x: 200, y: 100, width: 60, height: 60), params: param2)
        bt2.fillColor = UIColor(rgb: (255,95,89))
        bt2.color = UIColor(rgb: (170,170,170))
        bt2.image = .like
        bt2.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
        view.addSubview(bt2)
        allButtons.append(bt2)
        
        var param3 = WCLShineParams()
        param3.allowRandomColor = true
        let bt3 = WCLShineButton(frame: .init(x: 300, y: 100, width: 60, height: 60), params: param3)
        bt3.isSelected = true
        bt3.fillColor = UIColor(rgb: (255,41,1))
        bt3.color = UIColor(rgb: (170,170,170))
        bt3.image = .smile
        bt3.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
        view.addSubview(bt3)
        allButtons.append(bt3)
        
        var param4 = WCLShineParams()
        param4.enableFlashing = true
        let bt4 = WCLShineButton(frame: .init(x: 400, y: 100, width: 60, height: 60), params: param4)
        bt4.fillColor = UIColor(rgb: (167,99,154))
        bt4.color = UIColor(rgb: (170,170,170))
        bt4.image = .star
        bt4.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
        view.addSubview(bt4)
        allButtons.append(bt4)
        
        let toggleAllButton = UIButton(type: .custom)
        toggleAllButton.frame = .init(x: 100, y: 200, width: 100, height: 60)
        toggleAllButton.setTitleColor(.black, for: .normal)
        toggleAllButton.setTitle("Toggle All", for: .normal)
        toggleAllButton.backgroundColor = UIColor(rgb: (170,170,170))
        toggleAllButton.addTarget(self, action: #selector(clickAll), for: .touchUpInside)
        view.addSubview(toggleAllButton)
    }
    
    @objc private func clickAll() {
        var delay = 0.0
        for btn in allButtons {
            DispatchQueue.main.asyncAfter(deadline: .now()+delay, execute: {
                btn.setClicked(!btn.isSelected, animated: true)
            })
            delay += 0.25
        }
    }
    
    @objc private func action(_ sender: WCLShineButton) {
        print("Clicked \(sender.isSelected)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

