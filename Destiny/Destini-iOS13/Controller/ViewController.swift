//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.currentTitle!
        storyBrain.checkStory(title)
        updateUi()
    }
    
    func updateUi(){
        let getStory = storyBrain.getStory()
        contentLabel.text = getStory.title
        buttonOne.setTitle(getStory.choice1, for: .normal)
        buttonTwo.setTitle(getStory.choice2, for: .normal)
    }
    
}

