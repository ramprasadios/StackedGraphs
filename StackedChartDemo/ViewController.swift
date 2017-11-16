//
//  ViewController.swift
//  StackedChartDemo
//
//  Created by Ashok Kumar on 16/11/17.
//  Copyright © 2017 hss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var stackGraphView: UIView!
	
	let values = [0.2, 0.4, 0.1, 0.3]
	let colors = [UIColor.green, UIColor.red, UIColor.blue, UIColor.gray]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setGraphValues()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func setGraphValues() {
		
		let frameViewWidth = self.view.frame.width - 16.0
		self.stackGraphView.backgroundColor = UIColor.white
		//let yPosition = self.stackGraphView.frame.origin.y - 20.0
		var xPosition = CGFloat(0.0)
		for (index, value) in values.enumerated() {
			let percentage = "\(Int(value * 100))%"
			let viewWidth = frameViewWidth * CGFloat(value)
			
			let percentageBadge = UILabel(frame: CGRect(x: xPosition, y: -20.0, width: 50.0, height: 20.0))
			percentageBadge.text = percentage
			percentageBadge.font = UIFont.systemFont(ofSize: 13.0)
			self.stackGraphView.addSubview(percentageBadge)
			let unitView = UIView(frame: CGRect(x: xPosition, y: 0.0, width: viewWidth, height: self.stackGraphView.frame.height))
			unitView.backgroundColor = colors[index]
			self.stackGraphView.addSubview(unitView)
			xPosition += viewWidth
		}
	}
}

