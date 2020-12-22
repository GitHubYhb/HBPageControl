iOS14 更新也有一段时间了，在iOS14以前，很多人都通过重写`UIPageControl`来自定义自己的`UIPageControl`。
但是在iOS14到来时，就都不好使了。
由于公司项目之前也是用的重写，现在亦不可用，在使用原生`UIPageControl`样式先顶着用了一段时间，最近业务上的需求总算是结束了，空闲时间就自己撸了一个`HBPageControl`，也算是提供一种思路给大家。可以根据各自的业务要求做不同的样式。
样式如下。
![图像.gif](https://upload-images.jianshu.io/upload_images/2395731-3852915c6fd726ef.gif?imageMogr2/auto-orient/strip)

## 安装
```
pod 'HBPageControl'
```

## Demo地址
https://github.com/GitHubYhb/HBPageControl

## 可修改样式
```
dotColor:UIColor  点的颜色
dotSelectedColor:UIColor  选中点颜色
spacing:CGFloat  间距
dotWidth:CGFloat  点宽度
dotHeight:CGFloat  点高度
```

### 实现很简单
```
import UIKit
public class HBPageControl: UIView {

    public var dotColor:UIColor
    public var dotSelectedColor:UIColor
    public var spacing:CGFloat
    public var dotWidth:CGFloat
    public var dotHeight:CGFloat
    public var numberOfPages:Int {
        didSet {
            resetDots()
        }
    }
    
    public var currentPage:Int{
        didSet{
            if currentPage > numberOfPages-1 {
                fatalError("currentPage can not bigger than numberOfPages")
            }
            if dots.count > 0 {
                let preView = dots[oldValue]
                preView.backgroundColor = dotColor
                let preWidth = widths[oldValue]
                preWidth.constant = dotWidth
                
                let view = dots[currentPage]
                view.backgroundColor = dotSelectedColor
                let width = widths[currentPage]
                width.constant = dotWidth + 5

                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                    self.layoutIfNeeded()
                } completion: { finish in
                    
                }
            }
        }
    }
    private var bgView:UIView!
    private var dots = [UIView]()
    private var widths = [NSLayoutConstraint]()
    
    public override init(frame: CGRect) {
        
        self.dotColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        self.dotSelectedColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        self.spacing = 5
        self.dotWidth = 10
        self.dotHeight = 10
        self.numberOfPages = 5
        self.currentPage = 0
        super.init(frame: frame)
        setupDots()
    }
    
    public override func layoutSubviews() {
        superview?.layoutSubviews()
        resetDots()
    }
    
    private func resetDots(){
        for v in dots {
            v.removeFromSuperview()
        }
        bgView.removeFromSuperview()
        dots.removeAll()
        widths.removeAll()
        currentPage = 0
        setupDots()
    }
    
    private func setupDots()  {
        if numberOfPages <= 0 {
            return
        }
        let viewWidth = CGFloat(numberOfPages)*(dotWidth+spacing)-spacing
        bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(viewWidth), height: Int(frame.size.height)))
        bgView.center = CGPoint.init(x: frame.midX, y: frame.size.height/2)
        addSubview(bgView)
        
        for i in 0..<numberOfPages {
            let v = UIView.init()
            v.layer.cornerRadius = dotHeight / 2
            v.translatesAutoresizingMaskIntoConstraints = false
            var dWidth:CGFloat = dotWidth
            if i == currentPage {
                dWidth = dotWidth + 5
                v.backgroundColor = dotSelectedColor
            }else{
                dWidth = dotWidth
                v.backgroundColor = dotColor
            }
            bgView.addSubview(v)
            dots.append(v)
            
            //宽度约束
            let width:NSLayoutConstraint = NSLayoutConstraint(item: v, attribute: .width, relatedBy:.equal, toItem:nil, attribute: .notAnAttribute, multiplier:0.0, constant:dWidth)
            v.addConstraint(width)//自己添加约束
            widths.append(width)
            
            //高度约束
            let height:NSLayoutConstraint = NSLayoutConstraint(item: v, attribute: .height, relatedBy:.equal, toItem:nil, attribute: .notAnAttribute, multiplier:0.0, constant:dotHeight)
            v.addConstraint(height)//自己添加约束
            
            var pre = bgView
            var leftSpacing:CGFloat = 0
            if i > 0 {
                pre = dots[i-1]
                leftSpacing = spacing
                //右边约束
                let right:NSLayoutConstraint = NSLayoutConstraint(item: v, attribute: .left, relatedBy:.equal, toItem:pre, attribute:.right, multiplier:1.0, constant: leftSpacing)
                
                v.superview!.addConstraint(right)//父控件添加约束
            }else{
                //右边约束
                let right:NSLayoutConstraint = NSLayoutConstraint(item: v, attribute: .left, relatedBy:.equal, toItem:pre, attribute:.left, multiplier:1.0, constant: leftSpacing)
                
                v.superview!.addConstraint(right)//父控件添加约束
            }
            //下边约束
            let centerY:NSLayoutConstraint = NSLayoutConstraint(item: v,attribute: .centerY, relatedBy:.equal, toItem: pre, attribute:.centerY, multiplier:1.0, constant: 0)
            
            v.superview!.addConstraint(centerY)//父控件添加约束
            
        }
    }
 
    required init?(coder: NSCoder) {
        fatalError("HBPageControl Error")
    }
    

}
```

# 结束
