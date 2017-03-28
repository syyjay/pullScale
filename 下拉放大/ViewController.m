//
//  ViewController.m
//  下拉放大
//
//  Created by jay on 2017/3/13.
//  Copyright © 2017年 subo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];

    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,-200, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    imageView.image = [UIImage imageNamed:@"timg.jpeg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 101;
    
    [self.tableView addSubview:imageView];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text=[NSString stringWithFormat:@"----%2ld",(long)indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -200) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [self.tableView viewWithTag:101].frame = rect;
    }
    CGRect rect = [self.tableView viewWithTag:101].frame;
    
    NSLog(@"%@",[NSValue valueWithCGRect:rect]);
    NSLog(@"--contentOffset %f",point.y);
}
@end
