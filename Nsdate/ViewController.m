//
//  ViewController.m
//  Nsdate
//
//  Created by 大碗豆 on 17/1/6.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    NSString *Date1 = [ViewController getCurrentDate];
    NSLog(@"~~~%@",Date1);
    
//    [self testNSDateTow];
//    [self testDateThree];
    [self testDateFour];
    
}

- (void)testNSDateTow{
    //设定时间
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    
    [compt setYear:2012];
    
    [compt setMonth:5];
    
    [compt setDay:11];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date = [calendar dateFromComponents:compt];
    
    //得到本地时间，避免时区问题
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate:date];
    
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    
    NSLog(@">>>>>>>%@",localeDate);
    
}
+(NSString *)getCurrentDate
{
    //获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    NSInteger year = [dateComponent year];
    NSInteger month = [dateComponent month];
    NSInteger day = [dateComponent day];
    NSInteger hour = [dateComponent hour];
    NSInteger minute = [dateComponent minute];
    NSInteger second = [dateComponent second];
    NSInteger weekDay = [dateComponent weekday];
    NSString * currentDate = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld %.2ld:%.2ld:%.2ld:%.2ld",year,month,day,hour,minute,second,weekDay];
    
    return currentDate;
    
}





- (void)testNsdateOne{
    
    NSDate *senddate = [NSDate date];
    
    NSLog(@"date1时间戳 = %ld",time(NULL));
    
    NSString *date2 = [NSString stringWithFormat:@"%ld", (long)[senddate timeIntervalSince1970]];
    
    NSLog(@"date2时间戳 = %@",date2);
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSString *date1 = [dateformatter stringFromDate:senddate];
    
    NSLog(@"获取当前时间   = %@",date1);
    
    // 时间戳转时间
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[senddate timeIntervalSince1970]];
    
    NSString *confromTimespStr = [dateformatter stringFromDate:confromTimesp];
    
    NSLog(@"时间戳转时间   = %@",confromTimespStr);
}

- (void)testDateThree{
    //    自己设定的形式来取得日期:
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
    
    
    
    NSDate *date = [NSDate date];
    
    //    返回日期时间:
    NSString *str = [date description];
    NSLog(@"%@",str);
    
    //设定时间
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    
    [compt setYear:2012];
    
    [compt setMonth:5];
    
    [compt setDay:11];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [calendar dateFromComponents:compt];

    
//    比较，取得更早或更晚的日期:
    
    NSDate *d = [date earlierDate: date1];
    
    NSDate *d1 = [date  laterDate: date1];
    
    
    
//    是否相同日期:
    
    BOOL b = [d  isEqualToDate: d1];
    NSLog(@"%d",b);
    
    
//两个时间对象（前面是对象，后面是参数）进行比较，如果相同，返回0(NSOrderedSame)；对象时间早于参数时间，返回-1(NSOrderedAscending)；对象时间晚于参数时间，返回1
    NSInteger result = [d compare:d1];
    NSLog(@"%ld~~~~~d比d1早",result);
    
//    取得从现在开始过某秒之后的日期时间:
    
    NSDate *d2 = [NSDate dateWithTimeIntervalSinceNow: 86400*7];
    NSString *str3 = [df stringFromDate:d2];
    
    NSLog(@"%@",str3);
    
//    *负数是指过去时间
    
    

    
//    或 [df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    
    
    
    
//    取得现在日期时间:(连接上面设定形式)
    
    NSString *str1 = [df stringFromDate:[NSDate date]];
    NSLog(@"%@",str1);
    
//    设定日期: (连接上面设定形式)
    
    NSDate *aDate = [df dateFromString: @"2000/03/01 00:00:00"];
    NSString *str2 = [df stringFromDate:aDate];
    
    NSLog(@"%@",str2);
}

//获取星期几
- (void)testDateFour{
    NSDate*date = [NSDate date];
//    NSCalendar*calendar = [NSCalendar currentCalendar];
//    NSDateComponents*comps;
//    comps =[calendar components:(NSCalendarUnitMonth | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
//                       fromDate:date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"EEEE"];
    
    NSString *str2 = [dateFormatter stringFromDate:date];
    
    NSLog(@"%@",str2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
