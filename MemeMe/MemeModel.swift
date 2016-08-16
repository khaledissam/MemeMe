//
//  MemeModel.swift
//  MemeMe
//
//  Created by Minjie Zhu on 8/16/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import Foundation
import UIKit

struct MemeModel{
    var topStr : String = ""
    var bottomStr : String = ""
    var originalImage : UIImage?
    var memeImage : UIImage?
    
    init(top : String, bottom : String, original : UIImage?, meme : UIImage?) {
        self.topStr = top
        self.bottomStr = bottom
        self.originalImage = original
        self.memeImage = meme
    }
}