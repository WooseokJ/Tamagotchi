

import UIKit

class SelectCollectionViewController: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰 레이아웃 설정
        layoutSetting()
        
        // 네비게이션뷰
        navigationItem.navItemDesign()
        
        //타마고치 타이틀,확인버튼 이름 설정
        tamaNameSetting()
        
    }
    //MARK: 컬렉션뷰 레이아웃 설정
    func layoutSetting() {
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 0
        let layoutwidth = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: (layoutwidth / 3), height: (layoutwidth / 3) * 1.1)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    //MARK: 타마고치 타이틀,확인버튼 이름 설정
    func tamaNameSetting() {
        let startbutton = UserDefaults.standard.bool(forKey: "startbutton") ? "변경하기" : "시작하기"
        UserDefaults.standard.set(startbutton,forKey: "startbutton")
        let navTitle = UserDefaults.standard.bool(forKey: "changed") ? "타마고치 변경하기" : "타마고치 시작하기"
        UserDefaults.standard.set(navTitle,forKey: "changed")
        navigationItem.title = navTitle
    }
    
    //MARK: 컬렉션뷰 item 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TamaInfo().TamaAttribute.count
    }
    //MARK: item에 삽입
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        let TamaData = TamaInfo().TamaAttribute[indexPath.row]
        cell.DesignTama(data: TamaData)
        cell.backgroundColor = ColorName.backgroundcolor
        return cell
    }
    //MARK: item 클릭시
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let next = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = next.instantiateViewController(withIdentifier: DetailViewController.reuseIdentifier) as? DetailViewController else {
            return
        }
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overCurrentContext // fullScreen+뒤에투명
        let tamaName = TamaInfo().TamaAttribute[indexPath.item].name
        vc.takeimage = TamaInfo().TamaAttribute[indexPath.item].imageName
        UserDefaults.standard.set(tamaName,forKey:"tamaSelectName")
        UserDefaults.standard.set(indexPath.row+1, forKey: "foreimage")
        
        guard TamaInfo().TamaAttribute[indexPath.item].name != "준비중이에요" else{
            view.makeToast("준비중입니다.")
            return
        }
        present(nav, animated: true, completion: nil)

    }
    
}





