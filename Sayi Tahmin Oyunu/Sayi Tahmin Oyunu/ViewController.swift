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
    
    //Ekranda 5 tane yıldızı dizi halinde tutar.
    var yildizlar : [UIImageView] = [UIImageView]() //Yızldızları değişkenlere tanımlarken tipi img oldugundan bu sekilde belirttik.
    // Kullanıcının yapabileceği max deneme sayısıı
    let maxDenemeSayisi : Int = 5
    //Kullanıcı kaç tane deneme yaptı
    var denemeSayisi : Int = 0
    //Tahmin edilmesi gerekn sayı
    var hedefSayi : Int = -1
    //Oyun başarılı bir şekilde sona erirse burası true oalcak.
    var oyunBasarili : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yildizlar = [imgYildiz1,imgYildiz2,imgYildiz3,imgYildiz4,imgYildiz5] //ViewdidLoad da görünür olması için yıldızları tanımladık.
        imgKaydet.isHidden = true // ViewDidLoad göründüğünde "isHidden" imgKaydet i görünmez yaptı.
        imgTahminDurum.isHidden = true
        btnDene.isEnabled = false // Sayı yukarıya henüz girilmediğinden "Dene Buttonu" ilk başta çalışmayacak. Bunun için "isEnable" kullandık.
        txtTahminEdilecekSayi.isSecureTextEntry = true //Kullanıcı değer girdiğinde, değerler gizli kalacak.
        lblSonuc.text = ""
        
        
        
        
        
        
        
        
        
        
    }
    @IBAction func btnKaydetClicked(_ sender: UIButton) {
        imgKaydet.isHidden = false
        if let t = Int(txtTahminEdilecekSayi.text!) {
            hedefSayi = t
            btnDene.isEnabled = true
            txtTahminEdilecekSayi.isEnabled = false
            btnKaydet.isEnabled = false
            imgKaydet.image = UIImage(named: "onay")
        }else{
            imgKaydet.image = UIImage(named: "hata")
        }
    }
    
    @IBAction func btnDeneClicked(_ sender: UIButton) {
        //Kullanıcı oyunu bitirmişse herhangi bir şey yapma geri dön.
        if oyunBasarili == true || denemeSayisi > maxDenemeSayisi {
            return
        }
        if let girilenSayi = Int(txtTahminSayisi.text!) {
            //eğer kullanıcı düzgün bir değer girdiyse
            denemeSayisi += 1
            yildizlar[denemeSayisi-1].image = UIImage(named: "beyazYildiz")
            imgTahminDurum.isHidden = false
            if girilenSayi > hedefSayi {
                imgTahminDurum.image = UIImage(named: "asagi")
                txtTahminSayisi.backgroundColor = UIColor.red
            }else if girilenSayi < hedefSayi {
                imgTahminDurum.image = UIImage(named: "yukari")
                txtTahminSayisi.backgroundColor = UIColor.red
            }else {
                //İki sayı birbirine eşittir.
                   //oyun başarılı bir şekilde tahmin edildi.
                   imgTahminDurum.image = UIImage(named: "tamam")
                   btnKaydet.isEnabled = false
                   btnDene.isEnabled = false
                   lblSonuc.text = "DOĞRU TAHMİN! Tebrikler :))"
                   txtTahminSayisi.backgroundColor = UIColor.green
                   txtTahminEdilecekSayi.isSecureTextEntry = false
                oyunBasarili = true
                showPlayAgainAlert()
                
                return
                   
               }
          
        }else{
            //Eğer kullanıcının girdiği değer düzgün değilse
            imgTahminDurum.isHidden = false
            imgTahminDurum.image = UIImage(named: "hata")
        }
        
        if denemeSayisi == maxDenemeSayisi {
            //buraya gelindiyse oyun başarısız bir şekilde sona ermiştir.
            btnDene.isEnabled = false
            imgTahminDurum.image = UIImage(named: "hata")
            lblSonuc.text = "OYUN BAŞARISIZ! \nArkadaşın \(hedefSayi) Sayısını Girdi."
            txtTahminEdilecekSayi.isSecureTextEntry = false
            showGamePlayAgainAlert()
            return
        }
    }
    func showPlayAgainAlert() {
           let alertController = UIAlertController(title: "TAHMİN DOĞRU!", message: "TEBRİKLER! Yeniden başlamak istiyor musunuz?", preferredStyle: .alert)
           
           let yesAction = UIAlertAction(title: "Evet", style: .default) { (_) in
               self.resetGame()
           }
           alertController.addAction(yesAction)
           
           let noAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
           alertController.addAction(noAction)
           
           present(alertController, animated: true, completion: nil)
       }
    func showGamePlayAgainAlert() {
           let alertController = UIAlertController(title: "TAHMİN YANLIŞ", message: "Girilen Sayı \(hedefSayi). Yeniden başlamak istiyor musunuz?", preferredStyle: .alert)
           
           let yesAction = UIAlertAction(title: "Evet", style: .default) { (_) in
               self.resetGame()
           }
           alertController.addAction(yesAction)
           
           let noAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
           alertController.addAction(noAction)
           
           present(alertController, animated: true, completion: nil)
       }
    func resetGame() {
          denemeSayisi = 0
          hedefSayi = -1
          oyunBasarili = false
          lblSonuc.text = ""
          txtTahminEdilecekSayi.text = ""
          txtTahminSayisi.text = ""
          for imageView in yildizlar {
              imageView.image = UIImage(named: "sariYildiz")
          }
          imgKaydet.isHidden = true
          imgTahminDurum.isHidden = true
          btnKaydet.isEnabled = true
          btnDene.isEnabled = false
          txtTahminEdilecekSayi.isEnabled = true
          txtTahminEdilecekSayi.isSecureTextEntry = true
          txtTahminSayisi.backgroundColor = UIColor.white
      }
}
