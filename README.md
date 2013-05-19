NewSideSwiper
=============

An improved Side Swiper

This is an improvement to an earlier release and makes it easier to integrate into your existing project. 

Requirements
------------

1. ARC only
2. Portrait Mode only

Getting Started
---------------

- KKSwipeViewController.h
- KKSwipeViewController.m
- KKScrollView.h
- KKScrollView.m
- KKTransparentView.h
- KKTransparentView.m
- KKLeftViewController.h
- KKLeftViewController.m
- KKBaseViewController.h
- KKBaseViewController.m
- swipelist.png
- whiteglow.png

Once the files are added, extend your Home, Profile, Search and other view controllers from KKBaseViewController.

```objective-c
@interface KKHomeViewController : KKBaseViewController

```

After that, you initialize your Swipe Controller like so. This happens in your AppDelegate and is very similar to how you initialize a TabbarController.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    KKHomeViewController *homeController = [[KKHomeViewController alloc] initWithRowImage:[UIImage imageNamed:@"home.png"] andTitle:@"Home"];
    KKProfileViewController *profileController = [[KKProfileViewController alloc] initWithRowImage:[UIImage imageNamed:@"settings.png"] andTitle:@"Settings"];
    
    KKSwipeViewController *swipeController = [[KKSwipeViewController alloc] init];
    [swipeController setViewControllerItems:[NSArray arrayWithObjects:homeController, profileController, nil]];
    
    self.window.rootViewController = swipeController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
```

Note that the KKHomeViewController and KKProfileViewController above are classes that I've used in my example. 







