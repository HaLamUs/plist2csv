//
//  ViewController.m
//  lamha
//
//  Created by lamha on 10/2/19.
//  Copyright © 2019 zappasoft. All rights reserved.
//

#import "ViewController.h"
#import "CHCSVParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lam];
    // Do any additional setup after loading the view.
}

- (void)lam {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath  stringByAppendingPathComponent:@"lam.csv"];
    filePath = [filePath stringByExpandingTildeInPath];
    
    NSOutputStream *exportStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
    NSStringEncoding encodingA = NSUTF8StringEncoding;
    CHCSVWriter *csvExportWriter = [[CHCSVWriter alloc] initWithOutputStream:exportStream encoding:encodingA delimiter:','];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"search_videos" ofType:@"plist"];
    NSArray *commentArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    NSMutableArray *urls = [NSMutableArray new];
    for(NSDictionary *x in commentArray)
    {
        NSString *temp = x[@"name"];
        NSString *module = x[@"module"];
        NSString *description = x[@"description"];
        NSString *url = @"@";
        NSString *url1 = [url stringByAppendingString: x[@"url"]];
        NSString *thumbnail = x[@"thumbnail"];
        NSString *keywords = x[@"keywords"];
        NSString *url2 = [url1 stringByAppendingString:@"@"];
        [urls addObject: url2];
//        [csvExportWriter writeField:temp];
//        [csvExportWriter writeField:module];
//        [csvExportWriter writeField:description];
//        [csvExportWriter writeField:url];
//        [csvExportWriter writeField:thumbnail];
//        [csvExportWriter writeField:keywords];
//        [csvExportWriter finishLine];
    }
    
//    [csvExportWriter closeStream];
    NSLog(@"");
}


@end
