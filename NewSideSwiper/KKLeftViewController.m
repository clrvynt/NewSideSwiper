//
//  KKLeftViewController.m
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "KKLeftViewController.h"
#import "KKBaseViewController.h"

@interface KKLeftViewController ()

@end

@implementation KKLeftViewController

-(id)initWithViewControllers:(NSArray *)viewControllers
{
    self = [self initWithStyle:UITableViewStylePlain];
    if ( self ) {
        _viewControllers = viewControllers;
        _selectedIndex = 0;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:(39.0/255.0) green:(39.0/255.0) blue:(39.0/255.0) alpha:1];
    self.tableView.separatorColor = [UIColor colorWithRed:(45.0/255.0) green:(45.0/255.0) blue:(45.0/255.0) alpha:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewControllers count];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    NSObject *obj = [_viewControllers objectAtIndex:indexPath.row];
    if ( [obj isKindOfClass:[KKBaseViewController class]]) {
        KKBaseViewController *baseController = (KKBaseViewController *)obj;
        cell.imageView.image = baseController.rowImage;
        cell.textLabel.text = baseController.rowTitle;
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        
        if ( _selectedIndex == indexPath.row ) {
            cell.textLabel.textColor = [UIColor colorWithRed:(27.0/255.0) green:(127.0/255.0) blue:(165.0/255.0) alpha:1.0];
            [cell setUserInteractionEnabled:NO];
        }
        else {
            cell.textLabel.textColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:1];
            [cell setUserInteractionEnabled:YES];
        }
        return cell;
    }
    
    cell.textLabel.text = @"Not Found";
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    _selectedIndex = indexPath.row;
    
    if ( _delegate && [_delegate respondsToSelector:@selector(selectedItemForRowNumber:)])
        [_delegate selectedItemForRowNumber:indexPath.row];
    [self.tableView reloadData];
}


@end
