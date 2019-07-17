//
//  ViewController.swift
//  iconfontTest
//
//  Created by Supernova SanDick SSD on 2019/7/17.
//  Copyright © 2019 Seven. All rights reserved.
//

import UIKit
//MARK: 注意iconfont虽然可以随意改变颜色，但是只支持单色，不支持多色的icon，所以如果是多色的icon还是只能切图
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
        updateImageView()
    }


}
//PS: font name 可以写成 “IconFont” 也可以写成 “iconFont”
extension ViewController {
    //MARK： label里面显示iconfont
    func updateLabel() -> () {
        label.font = UIFont.init(name: "iconFont", size: 22)
        /* OC语言：@"U0000e645"
         * 注意：编码查看点击下载文件夹中的demo_index.html查看
         * demo_index.html 里面一般会卸载图标下方 如 ：“&#xe612;”
         */
        label.text = "\u{e612}"
        label.textColor = UIColor.red
    }
}
extension ViewController {
    //MARK： imageView里面显示iconfont
    func updateImageView() -> () {
        //计算文本rect
        let code = "\u{e613}"
        let nscode = code as NSString
        let fontSize = CGFloat(22)
        guard let font = UIFont.init(name: "IconFont", size: fontSize) else { return }
        let rect = nscode.boundingRect(with:CGSize(width: 0.0, height: 0.0) , options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font :  font], context: nil)
        let size = rect.size
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        label.font = font
        label.textAlignment = .center
        label.text = code
        label.textColor = UIColor.purple
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        imageView.image = image
    }
}
