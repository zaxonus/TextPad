//
//  ViewController.swift
//  TextPad
//
//  Created by Michel Bouchet on 2017/11/15.
//  Copyright © 2017 Michel Bouchet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setLabels() {
        let labelOne = LuxLabel(padding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)),
        labelTwo = LuxLabel(padding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)),
        labelThree = LuxLabel(padding: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)),
        sideMargin:CGFloat = 23.0
        labelOne.text = "It has a square shape and a blue color."
        labelTwo.text = "I want to go to the Metropolitan Museum of Art tomorrow. Can I use your computer to look up the opening times on the website?"
        labelThree.text = "- Can you tell me the way to the train station?\n- Just go straight on this road and you will see it on the left."
        var firstLoop = true, topView = view
        
        for label in [labelOne,labelTwo,labelThree] {
            label.numberOfLines = 0
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.yellow
            view.addSubview(label)
            view.addConstraints([
                NSLayoutConstraint(item: label,
                                   attribute: .left,
                                   relatedBy: .equal,
                                   toItem: view,
                                   attribute: .left,
                                   multiplier: 1.0,
                                   constant: sideMargin),
                NSLayoutConstraint(item: label,
                                   attribute: .right,
                                   relatedBy: .lessThanOrEqual,
                                   toItem: view,
                                   attribute: .right,
                                   multiplier: 1.0,
                                   constant: sideMargin * -2),
                NSLayoutConstraint(item: label,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: topView,
                                   attribute: firstLoop ? .top : .bottom,
                                   multiplier: 1.0,
                                   constant: sideMargin)])
            topView = label
            if firstLoop {firstLoop = false}
        }
    }
}

