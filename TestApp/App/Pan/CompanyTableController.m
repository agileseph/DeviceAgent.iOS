#import "CompanyTableController.h"

@interface CompanyTableController ()

@property(strong, nonatomic, readonly) NSArray *logoNames;
@property(strong, nonatomic, readonly) NSMutableArray *logoImages;
@property(strong, nonatomic, readonly) NSMutableArray *companyNames;

@end

@implementation CompanyTableController

@synthesize logoNames = _logoNames;
@synthesize logoImages = _logoImages;
@synthesize companyNames = _companyNames;

- (NSArray *) logoNames {
    if (_logoNames) { return _logoNames; }

    _logoNames =
    @[
      @"amazon",
      @"android",
      @"apple",
      @"basecamp",
      @"blogger",
      @"digg",
      @"dropbox",
      @"evernote",
      @"facebook",
      @"fancy",
      @"flickr",
      @"foursquare",
      @"github",
      @"google-plus",
      @"google",
      @"icloud",
      @"instagram",
      @"linkedin",
      @"paypal",
      @"pinterest",
      @"quora",
      @"rdio",
      @"reddit",
      @"skype",
      @"spotify",
      @"steam",
      @"twitter",
      @"windows",
      @"wordpress",
      @"youtube"
      ];
    
    return _logoNames;
}

- (NSMutableArray *)logoImages {
    if (_logoImages) { return _logoImages; }

    _logoImages = [[NSMutableArray alloc] initWithCapacity:[self.logoNames count]];

    for (NSString *name in self.logoNames) {
        NSString *imageName = [NSString stringWithFormat:@"logo-%@", name];
        UIImage *image = [UIImage imageNamed:imageName];
        [_logoImages addObject:image];
    }
    return _logoImages;
}

- (NSMutableArray *)companyNames {
    if (_companyNames) { return _companyNames; }

    _companyNames = [[NSMutableArray alloc] initWithCapacity:[self.logoNames count]];

    for (NSString *name in self.logoNames) {
        NSString *companyName = nil;
        if ([name isEqualToString:@"google-plus"]) {
            companyName = @"Google +";
        } else if ([name isEqualToString:@"icloud"]) {
            companyName = @"iCloud";
        } else if ([name isEqualToString:@"youtube"]) {
            companyName = @"YouTube";
        } else {
            companyName = [name capitalizedString];
        }

        [_companyNames addObject:[companyName copy]];
    }
    return _companyNames;
}


#pragma mark - <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *) tableView
  numberOfRowsInSection:(NSInteger) aSection {
    return self.logoImages.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"
                                           forIndexPath:indexPath];
    NSString *name = [self.companyNames objectAtIndex:indexPath.row];

    UILabel *label = (UILabel *)[cell.contentView viewWithTag:3030];
    label.text = name;

    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:3031];
    imageView.image = [self.logoImages objectAtIndex:indexPath.row];

    cell.accessibilityIdentifier = [NSString stringWithFormat:@"%@ row",
                                    [name lowercaseString]];

    return cell;
}

- (BOOL)tableView:(UITableView *) tableView
canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.logoImages removeObjectAtIndex:indexPath.row];
        [self.companyNames removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        NSLog(@"Unhandled editing style! %@", @(editingStyle));
    }
}

#pragma mark - Orientation / Rotation

- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (BOOL) shouldAutorotate {
    return YES;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.accessibilityIdentifier = @"table page";
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _logoImages = nil;
    _companyNames = nil;
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

@end
