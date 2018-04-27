//
//  DataServices
//  CacheImage
//
//  Created by NgocAnh on 4/24/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class DataServices{
    static let shared: DataServices = DataServices()
    private var _meals: [Meal]?
    
    var meals: [Meal]{
        set{
            _meals = newValue
        }
        get{
            if _meals == nil {
                updateData()
            }
            return _meals ?? []
        }
    }
    
    func updateData(){
        _meals = []
        let meal1 = Meal(dateTime: "Thursday, April, 19, 2018 16:59 PM", photo: "http://blogcoc.com/wp-content/uploads/2016/03/anh-nen-thien-nhien-4k-thang-4-1.jpg")!
        let meal2 = Meal(dateTime: "Thursday, April, 19, 2018 15:59 PM", photo: "http://tiki.vn/tu-van/wp-content/uploads/2016/09/smartphone-man-hinh-4k-co-can-thiet-khong-3.png")!
        let meal3 = Meal(dateTime: "Thursday, April, 19, 2018 17:59 PM", photo: "http://game4v.com/g4v-content/uploads/2017/06/SPMPS4_Screen_PS4_Hero_E32017_1497330185.jpg")!
        
        _meals = [meal1, meal2, meal3]
    }
}
