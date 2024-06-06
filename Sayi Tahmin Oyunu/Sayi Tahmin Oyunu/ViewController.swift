//
//  ViewController.swift
//  Sayi Tahmin Oyunu
//
//  Created by Merve Çalışkan on 6.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTahminEdilecekSayi: UITextField!
    @IBOutlet weak var imgKaydet: UIImageView!
    @IBOutlet weak var btnKaydet: UIButton!
    @IBOutlet weak var txtTahminSayisi: UITextField!
    @IBOutlet weak var imgTahminDurum: UIImageView!
    @IBOutlet weak var btnDene: UIButton!
    @IBOutlet weak var lblSonuc: UILabel!
    @IBOutlet weak var imgYildiz1: UIImageView!
    @IBOutlet weak var imgYildiz2: UIImageView!
    @IBOutlet weak var imgYildiz3: UIImageView!
    @IBOutlet weak var imgYildiz4: UIImageView!
    @IBOutlet weak var imgYildiz5: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnKaydetClicked(_ sender: UIButton) {
    }
    @IBAction func btnDeneClicked(_ sender: UIButton) {
    }

}

