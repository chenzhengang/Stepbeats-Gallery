//
//  clickView.swift
//  
//
//  Created by Chun Kong on 2018/9/12.
//

import UIKit

//重写hittest方法来防止Charts捕获点击而进入不了cell
class clickView: UIView {

    //要是点击了cell中的view 直接返回这个view 不再对子view进行hittest
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if(self.isHidden == false)  {
            if(self.point(inside: point, with: event)){
                return self
            }
        }
        return super.hitTest(point, with: event)
    }

}
