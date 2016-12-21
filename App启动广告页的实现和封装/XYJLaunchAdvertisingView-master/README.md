## XYJLaunchAdvertisingView

XYJLaunchAdvertisingView是封装的一个很好用的APP启动广告显示的组件，通过很少的代码就可以将启动广告集成到你的App中。

## 效果演示

[请点击这里查看演示视频](http://v.youku.com/v_show/id_XMTcxNzQyMzg4NA==.html?)

## 如何集成

*  1.下载或Clone `XYJLaunchAdvertisingView`到你的本地文件中。
*  2.将`XYJLaunchAdvertisingView`目录下的所有文件添加到你的项目中。

## 如何联系我

-  如果你需要我的帮助，可以在我的博客[muhlenXi](http://muhlenxi.com/)中留言给我。
-  如果你有问题需要咨询我，同样可以在我的博客留言给我。
-  如果你发现程序中的bug，你可以 open an issue，修复好bug，可以给我提交一个 request
-  如果你想参与这个项目，同样可以给我提交一个 request

## 详细使用

* 1、添加文件后，在`AppDelegate`文件中`XYJADDataManager.h` 。
* 2、在`didFinishLaunchingWithOptions`方法中加入如下代码即可。

```objc
//添加启动广告
[XYJADDataManager addXYJAdvertisementView];
```

* 3、打开`XYJADDataManager.m`文件，根据实际项目完善`UpdateAdvertisementDataFromServer`方法。

* 4、如果你需要获取广告点击事件，则需要进行如下操作。

在主界面ViewController的`viewDidLoad`方法中添加：

```objc
//添加广告点击的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToADVC) name:pushToADNotiName object:nil];
```

同时实现事件响应方法：

```objc
- (void) pushToADVC
{
    //TODO 在这里处理广告事件响应
    NSLog(@"广告点击了");
    XYJADWebViewController * webVC = [[XYJADWebViewController alloc] init];
    webVC.url = [[NSUserDefaults standardUserDefaults] objectForKey:pushToADUrl];
    [self.navigationController pushViewController:webVC animated:YES];
}
```

## 提示

集成完成后，首次运行程序，会发现不显示广告。这是正常的，因为我们是通过下载本地化存储广告页的图片和跳转链接的。再次运行，就会出现广告页面的。通过大量观察，我们发现许多App也是采用这样的方法。

**欢迎去访问我的博客：[muhlenXi](http://muhlenxi.com/)**

