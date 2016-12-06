//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 小林光太郎 on 2016/12/03.
//  Copyright © 2016年 kotarou.kobayashi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var dousa:UIImage = UIImage()
    @IBOutlet weak var imageView: UIImageView!
    func displayImage(){
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = dousa

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
