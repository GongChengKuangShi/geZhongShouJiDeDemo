# Harpy

## Notify users that a new version of your app is available in the AppStore

### About
**Harpy** is a utility that checks a user's currently installed version of your iOS application against the version that is currently available in the AppStore. If a new version is available, an instance of UIAlertView is presented to the user informing them of the newer version, and giving them the option to update the application.
//* *鸟身女妖* *是一个实用程序,检查用户的当前安装的版本iOS应用程序对应用商店中当前可用的版本。如果一个新版本可用,UIAlertView的实例提出了新版本的用户通知他们,并给予他们更新应用程序的选项。

### Screenshots

- The **left picture** forces the user to update the app.
- The **right picture** gives the user the option to update the app.
- This option is configurable in **Harpy.h**.
//——此选项在* * Harpy.h * *是可配置的。
 
![Forced Update](https://github.com/ArtSabintsev/Harpy/blob/master/picForcedUpdate.png?raw=true "Forced Update") 
![Optional Update](https://github.com/ArtSabintsev/Harpy/blob/master/picOptionalUpdate.png?raw=true "Optional Update")

### Installation Instructions:

1. Copy the 'Harpy' folder into your Xcode project. The following files will be added:
	1. Harpy.h
	1. Harpy.m

1. Import **Harpy.h** into your AppDelegate or Pre-Compiler Header (.pch)
		
1. Configure the **5** static variables in **HarpyConstants.h**
	- You can remove the ***#warning*** in **Harpy.h** after customizing those variables. 
//1。配置* * 5 * * * * HarpyConstants.h * *静态变量
　　——你可以把* * * * * *在* *鸟身女妖#警告。自定义这些变量后h * *。

1.  In your **AppDelegate.m**, add ***[Harpy checkVersion]*** after calling ***makeKeyAndVisible***:
1。在你的AppDelegate * *。m .,* * * * *[nacken级潜艇checkVersion该宣言之后]* * * * * * * * *:makeKeyAndVisible

<pre>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Customization on application launch
	
	…
	
	// Present Window
	[self.window makeKeyAndVisible]
	
	/*  
		Check AppStore for your application's current version. If newer version exists, prompt user.
		Declare immediatley after you call makeKeyAndVisible on your UIWindow iVar
	*/
	[Harpy checkVersion] 
}

</pre>

And you're all set!

### Important Note on AppStore Submissions//重要的注意在应用商店提交
- As of 2.0.0, no extra configuraiton needs be performed to avoid having the AppStore reviewer see the alert.
//- 2.0.0,没有额外configuraiton需要被执行,以避免应用商店评论家警告。

###  Release Notes (v2.0.1):
- Moved customizable strings to new file, ***HarpyConstants.h***
//可自定义的字符串搬到新文件,* * * HarpyConstants.h * * *

### Contributors
- [Aaron Brager](http://www.github.com/getaaron) in v1.5.0
- [Claas Lange](https://github.com/claaslange) in v2.0.0
- [Josh T. Brown](https://github.com/joshuatbrown) in v2.0.0
- [Pius Uzamere](https://github.com/pius) in v1.0.1

### Recognition:

Created by [Arthur Ariel Sabintsev](http://www.sabintsev.com)  
//Sabintsev Ariel的[](阿瑟·http://www.sabintsev.com)
