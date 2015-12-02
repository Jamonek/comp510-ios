//
//  Recommendations.swift
//  COMP510 - RE
//
//  Created by Jamone Alexander Kelly on 12/2/15.
//  Copyright © 2015 COMP510. All rights reserved.
//

import UIKit

class Recommendations: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recommendationCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "Hi \(fullName), check out your recommendations below"
    }
}
