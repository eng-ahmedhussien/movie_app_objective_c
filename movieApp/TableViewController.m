#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *dataa;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        _data=[NSMutableData new];
        _dict=[NSDictionary new];
        _arrayOfData=[NSMutableArray new];
    
//        //download
//        _data = [NSData dataWithContentsOfURL:[NSURL URLWithString: @"https://api.androidhive.info/json/movies.json"]];
//        // Parse JSON
//        _arrayOfData = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];


    NSURL *url = [NSURL URLWithString:@"https://api.androidhive.info/json/movies.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}


#pragma mark - connection
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
     _arrayOfData = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingJSON5Allowed error:nil];
//
//    if(_arrayOfData!=nil)
//    {
//
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"data loaded succssfully" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
//        [alert addAction:action];
//        [self presentViewController:alert animated:YES completion:nil];
////
////        for (int i=0;i<_arrayOfData.count ; i++) {
////
////            _dObj = _arrayOfData[i];
////            //NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[dObj objectForKey:@"image"]]];
////            NSLog(@"%@\n",[_dObj objectForKey:@"image"]);
////        }
////
//    }
//    else{
//        NSLog(@"error");
//    }


}


#pragma mark - Table view data source
-(void)RemoveCell{
    
    NSLog(@"deletedes");
   // [_s removeObjectsAtIndexes:_rownumber];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayOfData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
     _dict = [_arrayOfData objectAtIndex:indexPath.row];
    cell.textLabel.text =  [_dict objectForKey:@"title"];
  //  cell.imageView.image = [UIImage imageNamed:@"download.jpeg"];
   // NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[_dict objectForKey:@"image"]]];
  //  cell.imageView.image = [UIImage imageWithData:imageData];
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *v= [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    _dict = [_arrayOfData objectAtIndex:indexPath.row];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[_dict objectForKey:@"image"]]];
             v.filmImage= [UIImage imageWithData: imageData];
    v.filmTitle =[_dict  objectForKey:@"title"];
    v.filmRating=[[_dict  objectForKey:@"rating"] stringValue];
    v.filmYera =[[_dict  objectForKey:@"releaseYear"] stringValue];
    v.filmGender =[_dict  objectForKey:@"genre"][0];
    v.p1=self;
    [self.navigationController pushViewController:v animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
      //  [_s removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
