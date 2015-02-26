# MMDrawerController-issue-searchbar
This repo demonstrates some potential problems and solutions in MMDrawerController 0.5.7 which relates to combining it with UINavigationController, UITableViewController with UISearchBar (UISearchDisplayController or new UISearchController) and using container views.

This repo includes few branches, each of them demostrates some approach how to use MMDrawerController. Also, some examples itself will works with issues, for such of them there always one more branch with _fix suffix, which contains possible solution to the problem.

The motivation for this project is one case as usually. I've faced a lot of problems when tried to use the complex view controllers hierachy which includes UINavigationController -> MMDrawerController -> UINavigationController again and then UIViewController with ContainerView for other UITableViewController with UISearchBar. 

# Example_01

The simplest example, MMDrowerController (futher on MMDC) is the root of your view controllers hierachy. Then for each sub controller (left, center, right) used a pair UINavigationController + UITableViewController with old UISearchDisplayController. Everything just works.

# Example_02

MMDC is the root of your view controllers hierachy. Then for each sub controller (left, center, right) used a pair UINavigationController + UITableViewController with new UISearchController. An example of how to setup searchController given. Everything just works.

# Example_03 and Example_03_fix.

The following hierarchy used here: UINavigationController -> MMDC, then for each sub controller (left, center, right) used a pair UINavigationController + UITableViewController with old UISearchDisplayController. This approach gives as an unwilling shadows at the navigation bar of center view controller. Example_03_fix branch contains possible solution:

```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationController.navigationBar.translucent = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
}
```

for each of your UITableViewControllers.

# Example_04 and Example_04_fix.

The same as previous, but for new UISearchController instead of the old one. Same problem, same search setuo example given, same solution.

# Example_05 and Example_05_fix (master).

The mostly complex example. It repeats hierarchy from Example_04, but now for each sub controller (left, center, right) used a UINavigationController -> UIViewController+ContainerView -> UITableViewController with modern UISearchController. Here again we have shadows in navigation bar but moreover animation for search bar differs depending on ContainerView position. (animation differences relates to distance to statisbar). Example_05_fix gives a solution to all this problems.
