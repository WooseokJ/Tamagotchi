

import UIKit

class SelectCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // 컬렉션뷰 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 0
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: (layoutwidth / 3), height: (layoutwidth / 3) * 1.1)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        // 네비게이션뷰
        navigationItem.titleView?.tintColor = ColorName.fontcolor
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance?.backgroundColor =  ColorName.backgroundcolor
        
        let startbutton = UserDefaults.standard.bool(forKey: "startbutton") ? "변경하기" : "시작하기"
        UserDefaults.standard.set(startbutton,forKey: "startbutton")
        let navTitle = UserDefaults.standard.bool(forKey: "changed") ? "타마고치 변경하기" : "타마고치 시작하기"
        UserDefaults.standard.set(navTitle,forKey: "changed")
        navigationItem.title = navTitle
       
    }

    // 컬렉션뷰 item 갯수 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TamaInfo().TamaAttribute.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as? SelectCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        let TamaData = TamaInfo().TamaAttribute[indexPath.row]
        cell.DesignTama(data: TamaData)
        cell.backgroundColor = ColorName.backgroundcolor
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let next = UIStoryboard(name: "Main", bundle: nil)
        let vc = next.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overCurrentContext // fullScreen+뒤에투명
       
        vc.takename = TamaInfo().TamaAttribute[indexPath.item].name
        vc.takeimage = TamaInfo().TamaAttribute[indexPath.item].imageName
      
        UserDefaults.standard.set(indexPath.row+1, forKey: "foreimage")
        
        guard TamaInfo().TamaAttribute[indexPath.item].name != "준비중이에요" else{
            view.makeToast("준비중입니다.")
            return
        }
        present(nav, animated: true, completion: nil)
        
        
        
        
        
        
        }
    
}
    
    
    
  

