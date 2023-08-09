//
//  gameViewController.swift
//  Yakala
//
//  Created by Emre Gürbüz on 7.08.2023.
// Udemy.com Atıl samancıoğlu Swift kursu kanny'ı yakala Ödevi

// 09,08,2023 tarihinde sabah 06:20 bitmiiştir üç günlük bu süreçte pek çok şey öğrendim.

import UIKit

// gerekli arayüz elemanlarını tanımladım
class gameViewController: UIViewController {
    @IBOutlet weak var topScore: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scorLabel: UILabel!
    
    @IBOutlet weak var StartTimeLabel: UILabel!
    @IBOutlet weak var ken1İmageview: UIImageView!
    @IBOutlet weak var ken2İmageview: UIImageView!
    @IBOutlet weak var ken3İmageview: UIImageView!
    @IBOutlet weak var ken4İmageview: UIImageView!
    @IBOutlet weak var ken5İmageview: UIImageView!
    @IBOutlet weak var ken6İmageview: UIImageView!
    @IBOutlet weak var ken7İmageview: UIImageView!
    @IBOutlet weak var ken8İmageview: UIImageView!
    @IBOutlet weak var ken9İmageview: UIImageView!
    
    // gerekli değişkenlerş tanımlanıyor
    var userName = ""
    var StartTime = 15.0
    var timeObj : Timer? = nil
    var imageAry : [UIImageView] = []
    var scorSay = 0
    var imageİndex = 0
    var getUserName = ""
    var getUserScor = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageviewlar rasgele olarak çağırabilmek için bunları bir imageviewlardan oluşan bir liste oluşturmak için önce imageviewlara boş bir png tanmlayarak initialize ediyorum
        ken1İmageview.image = UIImage(named: "empty")
        ken2İmageview.image = UIImage(named: "empty")
        ken3İmageview.image = UIImage(named: "empty")
        ken4İmageview.image = UIImage(named: "empty")
        ken5İmageview.image = UIImage(named: "empty")
        ken6İmageview.image = UIImage(named: "empty")
        ken7İmageview.image = UIImage(named: "empty")
        ken8İmageview.image = UIImage(named: "empty")
        ken9İmageview.image = UIImage(named: "empty")
        imageAry = [ken1İmageview,
                    ken2İmageview,
                    ken3İmageview,
                    ken4İmageview,
                    ken5İmageview,
                    ken6İmageview,
                    ken7İmageview,
                    ken8İmageview,
                    ken9İmageview]
        
        // topskor verilerini çekip yazdırıyorum
        getUserName = UserDefaults.standard.object(forKey: "name") as? String ?? ""
        getUserScor =  UserDefaults.standard.object(forKey: "puan") as? Int ?? 0
        topScore.text = "UserName \(getUserName) Scor: \(getUserScor)"
        
    }
    
    // bir oyun loop'u için gerekli olan zamanı saydırmak için bir time objesi oluşturup bunu foksiyona alıyorum
    func ref(){
        timeObj = Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(startTimeAlert), userInfo: nil, repeats: true)
        
        
    }
    
    // ekran yükledikten sonra bu zamanı saydırmak için çağırıyorum
    override func viewDidAppear(_ animated: Bool) {
        self.ref()
    }
    
    // imageviewlara tıklandığında olacak olaylar fonksyonu
    @objc func yakala(){
        scorSay += 10
        scorLabel.text = "Scor \(scorSay)"
        imageAry[imageİndex].isUserInteractionEnabled = false
        
        
    }
    
    // zaman saymaya başladığında olacak olaylar
    @objc func startTimeAlert(){
        // geri sayım işlemleri
        if StartTime >= 13 && StartTime <= 15{
            StartTimeLabel.text = String(Int(StartTime - 12))
        }else if StartTime - 12.5 == 0{
            StartTimeLabel.text = "Start"
        }
        else {
            StartTimeLabel.isHidden = true
        }
        StartTime -= 0.5
        // geri sayım bitince oyunu başlatmak için gerekli fonksyonunu çağırıyoruz zamanın bitmesiyle oyunu durdurma fonkyonunu çağırıyoruz
        if StartTime <= 10{
            timeLabel.text = "Time: \(Int(StartTime))"
            if StartTime <= 10{
                StartGame()
            }else if StartTime == 0{
                StopGame()
            }
        }}
    
    
    
    
    func randoImage(){
        // ekrana rasgele resinler gelmesi ve bunların tıklandığında tepki vermesi fonkyonu
        let denem = randomint()
        for xex in imageAry{
            xex.image = UIImage(named: "empty")
            xex.isUserInteractionEnabled = false            }
        let jest = UITapGestureRecognizer(target: self, action: #selector(yakala))
        
        imageAry[denem].isUserInteractionEnabled = true
        imageAry[denem].image = UIImage(named: "kanny")
        imageAry[denem].addGestureRecognizer(jest)
        imageİndex = denem
        
        
    }
    
    
    func StartGame(){
        // zamana göre resimlerin gösterimi ve resimler arası zamanın ayarlanması
        // bu bölüm pek güzel gelmedi ama 3 gündür uğraşmamdan dolayı daha sonra düzeltmeyi umuyorum.
        if StartTime == 10{
            imageAry[randomint()].image = UIImage(named: "kanny")
        }else if StartTime == 9.5{
            randoImage()
        }else if StartTime == 9{
            randoImage()
        }else if StartTime == 8.5{
            randoImage()
        }else if StartTime == 8{
            randoImage()
        }else if StartTime == 7.5{
            randoImage()
        }else if StartTime == 7{
            randoImage()
        }else if StartTime == 6.5{
            randoImage()
        }else if StartTime == 6{
            randoImage()
        }else if StartTime == 5.5{
            randoImage()
        }else if StartTime == 5{
            randoImage()
        }else if StartTime == 4.5{
            randoImage()
        }else if StartTime == 4{
            randoImage()
        }else if StartTime == 3.5{
            randoImage()
        }else if StartTime == 3{
            randoImage()
        }else if StartTime == 2.5{
            randoImage()
        }else if StartTime == 2{
            randoImage()
        }else if StartTime == 1.5{
            randoImage()
        }else if StartTime == 1{
            randoImage()
        }else if StartTime == 0.5{
            randoImage()
        }else{
            StopGame()
        }
    }
    
    
    
    func StopGame(){
        // oyun dögüsü bittiğinde olacak olaylar
        timeObj?.invalidate()
        StartTimeLabel.isHidden = false
        StartTimeLabel.text = ""
        StartTime = 15
        scorLabel.text = "Scor: 0"
        saveF(scor: scorSay, name: userName)
        let alertGame = UIAlertController(title: "Game over", message: "Oyun bitti Puanınız: \(scorSay)", preferredStyle: UIAlertController.Style.alert)
        
        let tryBut = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { UIAlertAction in
            self.ref()
            self.scorSay = 0
        }
        alertGame.addAction(tryBut)
        
        self.present(alertGame, animated: true ,completion: nil)
        scorSay = 0
        for xex in imageAry{
            xex.image = UIImage(named: "empty")
        }}
        
        
    func randomint() -> Int {
        // rasgele Integer üreten fonksyon
            let randomInt = Int.random(in: 0..<9)
            return randomInt
        }
        
        
    func saveF(scor : Int, name : String){
        // alınan puanların sorgulaması ve kaydedilmesi
            getUserName = UserDefaults.standard.object(forKey: "name") as? String ?? ""
            getUserScor =  UserDefaults.standard.object(forKey: "puan") as? Int ?? 0
            if getUserScor < scor {
                UserDefaults.standard.set(scor, forKey: "puan")
                UserDefaults.standard.set(name, forKey: "name")
                topScore.text = "UserName \(name) Scor: \(scor)"
                
            }
            
        }
        
        
        
        
    }
    
    
    
    
    

