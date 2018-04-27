//
//  Meal
//  CacheImage
//
//  Created by NgocAnh on 4/24/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class Meal{
    var dateTime: String
    var photo: String
    
    init?(dateTime: String, photo: String) {
        self.dateTime = dateTime
        self.photo = photo
    }
}
