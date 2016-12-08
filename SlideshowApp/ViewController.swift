//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小林光太郎 on 2016/11/29.
//  Copyright © 2016年 kotarou.kobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var Backbotan2: UIButton!
    @IBOutlet weak var Nextbotan2: UIButton!
    @IBAction func Backbotan(_ sender: AnyObject) {
        dispImageNo -= 1
        displayImage()
    }
    
    @IBAction func Nextbotan(_ sender: AnyObject) {
        dispImageNo += 1
        displayImage()
    }
    
    
    var dispImageNo = 0
    func displayImage() {
        let imageNameArray = [
            "川を流れる魂",
            "スクリーンショット 2016-11-30 17.25.56",
            "スクリーンショット 2016-11-30 17.27.56",
            ]
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named:"川を流れる魂")
        imageView.image = image
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTap(sender:)))
        
        // viewにタップを登録
        self.imageView.addGestureRecognizer(tap)
    }
    func viewTap(sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "toResultViewController", sender: nil)
        timer.invalidate()
        (Start as AnyObject).setTitle("Start Timer", for: UIControlState.normal)
    }
    
    //ボタン挿入
    
    @IBOutlet weak var Start: UIButton!
    @IBAction func Saisei(_ sender: Any) {
        Start.setTitle("テスト", for: .normal)
        //ボタンが押された時に呼ばれるメソッド.
        //func onMyButtonClick(sender : UIButton){
        
        //timerが動いてるなら.
        if timer.isValid == true {
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
            (sender as AnyObject).setTitle("Start Timer", for: UIControlState.normal)
        }
        else{
            
            //timerを生成する.
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer), userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            (sender as AnyObject).setTitle("Stop Timer", for: UIControlState.normal)
        }
        if timer.isValid == true {
            Backbotan2.isEnabled = false
            Nextbotan2.isEnabled = false
        }else{
            Backbotan2.isEnabled = true
            Nextbotan2.isEnabled = true
        }
    }
    
    func onTimer(timer: Timer) {
        print("onTimer")
        dispImageNo += 1
        displayImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //ファイル名を引き継ぐ方法・画像そのものを引き継ぐ方法がある
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.dousa = imageView.image!
        
    }
    
    
}

