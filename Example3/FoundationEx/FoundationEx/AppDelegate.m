//
//  AppDelegate.m
//  FoundationEx
//
//  Created by CrowDroid on 2013. 12. 11..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

typedef enum : unsigned char {Red, Green, Blue} Color;

enum
{
    enumTest1,
    enumTest2,
    enumTest3,
};


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    
#pragma mark -
#pragma mark NSString Example
    
    ////////////////////////////////////////////////////////////
    //
    //        NSString
    //
    ////////////////////////////////////////////////////////////
    
    //할당
    NSString *string = @"string";
    string = [[NSString alloc] initWithString:string];
    string = [NSString stringWithString:string];
   
    string = [[NSString alloc] initWithFormat:@"%d, %@", 13, string];
    string = [NSString stringWithFormat:@"%d, %@", 13, string];
    
    string = [[NSString alloc] initWithCString:"CString, UTF8" encoding:NSUTF8StringEncoding];
    string = [NSString stringWithCString:"CString, UTF8" encoding:NSUTF8StringEncoding];
    
    string = [[NSString alloc] initWithUTF8String:"CStRING, UTF8"];
    string = [NSString stringWithUTF8String:"CStRING, UTF8"];
    
    string = @"str"@"붙임ㅋ"@"됨ㅋ";
    
    //비교
    NSString *ascending = @"a";
    NSString *descending = @"b";
    NSComparisonResult ascendingResult = [ascending compare:descending];
    NSComparisonResult sameResult = [ascending compare:ascending];
    NSComparisonResult descendingResult = [descending compare:ascending];
    
    NSLog(@"ascendingResult : %ld", ascendingResult);
    NSLog(@"sameResult : %ld", sameResult);
    NSLog(@"descendingResult : %ld", descendingResult);
    
    //NSStringCompareOptions - case insensitive
    NSLog(@"a ? A = %ld", [@"a" compare:@"A" options:NSCaseInsensitiveSearch]);
    NSLog(@"a ? A = %ld", [@"a" compare:@"A"]);
    //Force order - Strict로 같은 경우 아니면 Same리턴 절대 없음.
    NSLog(@"a ? A = %ld", [@"a" compare:@"A" options:NSCaseInsensitiveSearch | NSForcedOrderingSearch]);
    
    
    //Numeric?
    NSString *source = @"abcd20300";
    NSString *target = @"abcd800";
    //YES
    NSLog(@"[non-numeric]%@ is ascending %@? %@",source, target, [source compare:target]<0 ? @"YES":@"NO");
    //NO
    NSLog(@"[numeric]%@ is ascending %@? %@",source, target, [source compare:target options:NSNumericSearch]<0 ? @"YES":@"NO");
    
    
    //Search
    NSRange match = [@"abcd" rangeOfString:@"a"];
    if(match.location == NSNotFound) NSLog(@"NOT Founded!");
    else NSLog(@"location : %lu, length : %lu", match.location,match.length );
    
    
    //Regular Expressions Search
    match = [@"abcdabc" rangeOfString:@"[a-c]+" options:NSRegularExpressionSearch];
    if(match.location == NSNotFound) NSLog(@"NOT Founded!");
    else NSLog(@"location : %lu, length : %lu", match.location,match.length );

    //Literal Search - 대소문자 구분
    match = [@"abcdabc" rangeOfString:@"abcD" options:NSLiteralSearch];
    if(match.location == NSNotFound) NSLog(@"NOT Founded!");
    else NSLog(@"location : %lu, length : %lu", match.location,match.length );
    
    //뒤에서부터 검색
    match =[@"abcdef" rangeOfString:@"cdef" options:NSBackwardsSearch];
    if(match.location == NSNotFound) NSLog(@"NOT Founded!");
    else NSLog(@"location : %lu, length : %lu", match.location,match.length );
    
    //Anchored - 처음부터 같은지 아닌지 비교. BACKWARD랑 검색하면 뒤에서부터.. PREPIX, POSTPIX
    match =[@"abcdef" rangeOfString:@"bcd" options:NSAnchoredSearch];
    if(match.location == NSNotFound) NSLog(@"NOT Founded!");
    else NSLog(@"location : %lu, length : %lu", match.location,match.length );
    
    //그 외 옵션들
    //NSDiacriticInsensitiveSearch - 독일어자모 이상한거 무시
    //NSWidthInsensitiveSearch - full latin, half-latin 같이 취급
    // 'a'는 U+FF41 ( FULL ) , U+0061 두 가지인데 이거 두개 같이 취급하는 옵션. 인코딩 다를 때 사용..
    
    //분할
    string = @"123456789";
    NSLog(@"%@", [string substringToIndex:3]);
    NSLog(@"%@", [string substringFromIndex:3]);
    
    NSRange subRange;
    subRange.length = 4;
    subRange.location = 1;
    NSLog(@"%@", [string substringWithRange:subRange]);
    
    NSString *splitedSource = @"a  b  c  d  e  f  g";
//    [NSCharacterSet whitespaceCharacterSet]
    NSArray *splitedByWhiteSpaceArray = [splitedSource componentsSeparatedByString:@"  "];
    NSLog(@"%@", splitedByWhiteSpaceArray);
    NSLog(@"%@", [splitedByWhiteSpaceArray componentsJoinedByString:@"  "]);
    
    splitedByWhiteSpaceArray = [splitedSource componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"%@", splitedByWhiteSpaceArray);
    
    //치환
    NSLog(@"%@", [string stringByReplacingCharactersInRange:subRange withString:@"바꿈"]);
    string = @"12341234";
    NSLog(@"%@", [string stringByReplacingOccurrencesOfString:@"123" withString:@"바꿈"]);
    
    
    //경로 조작
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", paths);
    
    NSString *pathString = paths[0];
    pathString = [pathString stringByAppendingPathComponent:@"test.txt"];
    NSLog(@"%@", [pathString lastPathComponent]);
    NSLog(@"%@", pathString);
    
    NSLog(@"%@", [pathString stringByDeletingLastPathComponent]);
    NSLog(@"%@", [pathString stringByDeletingPathExtension]);
    NSLog(@"%@", [pathString pathExtension]);

    NSArray *pathArrayTest = @[@"/", @"root", @"home", @"target", @"filename.file"];
    NSLog(@"%@", [NSString pathWithComponents:pathArrayTest]);
    NSString *tildaString = @"~/home/test";
    NSLog(@"%@", [tildaString stringByExpandingTildeInPath]);

    //파일 조작
    NSError *error = [[NSError alloc] init];
    NSString *fileString = [[NSString alloc] initWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@", fileString);
    NSStringEncoding encoding;
    fileString = [[NSString alloc] initWithContentsOfFile:pathString usedEncoding:&encoding error:&error];
    NSLog(@"%lu", encoding);

    fileString = [fileString stringByAppendingString:@"test++"];
    [fileString writeToFile:pathString atomically:YES encoding:encoding error:&error];
    
    
    //Mutable 조작
    //Append
    NSMutableString *mutableString = [NSMutableString string];
    [mutableString appendFormat:@"%@",@"MutableString"];
    [mutableString appendString:@"str"];
    
    //Mutable - Immutable 비교
    mutableString = [string mutableCopy];
    NSLog(@"%p", mutableString);
    [mutableString appendString:@"MutableString"];
    NSLog(@"%p", mutableString);
    NSLog(@"%@", mutableString);
    
    NSLog(@"%p", string);
    string = [string stringByAppendingString:@"AppendString"];
    NSLog(@"%p", string);
    
    //특정 위치 삽입
    mutableString = [@"123456789" mutableCopy];
    [mutableString insertString:@"99" atIndex:3];
    NSLog(@"%@", mutableString);

    //삭제
    mutableString = [@"123456789" mutableCopy];
    NSRange deleteRange;
    deleteRange.location = 0;
    deleteRange.length = 3;
    [mutableString deleteCharactersInRange:deleteRange];
    NSLog(@"%@", mutableString);

    //교체
    mutableString = [@"123456789" mutableCopy];
    [mutableString replaceCharactersInRange:deleteRange withString:@"바꿈"];
    NSLog(@"%@", mutableString);

    mutableString = [@"123456789" mutableCopy];
    [mutableString replaceOccurrencesOfString:@"123" withString:@"321" options:0 range:deleteRange];
    NSLog(@"%@", mutableString);

#pragma mark -
#pragma mark NSData Example
    
    ////////////////////////////////////////////////////////////
    //
    //        NSData
    //
    ////////////////////////////////////////////////////////////

    char *buffer = malloc(30);
    for(int i=0; i<30; i++)
    {
        buffer[i] = i + 'a';
    }
    
    //초기화 - Copy
    NSData *testData = [[NSData alloc] initWithBytes:buffer length:30];
    NSLog(@"%@", testData);
    NSLog(@"%@", [[NSString alloc] initWithData:testData encoding:NSUTF8StringEncoding]);
    //No Copy
    NSData *freedData = [[NSData alloc] initWithBytesNoCopy:buffer length:30 freeWhenDone:NO];
    free(buffer);
    NSLog(@"%@", freedData);
    NSLog(@"%@", [[NSString alloc] initWithData:freedData encoding:NSUTF8StringEncoding]);

    //URL Contents Load
    NSURL *dataURL = [[NSURL alloc] initWithString:@"http://aasdfsafsahfsdjkhkssdfa.com"];
    NSError *urlError = nil;

    //NSDataReadingOptions
    //NSDataReadingMappedAlways
    //NSDataReadingMappedIfSafe - Virtual Memory에 올림, 파일 맵핑..
    //NSDataReadingUncached - UnCached. 한번 읽으면 버림

    NSData *urlData = [NSData dataWithContentsOfURL:dataURL options:NSDataReadingUncached error:&urlError];
    if(!urlData)
    {
        NSLog(@"%lu",urlError.code);
        NSLog(@"%@",urlError.domain);
        NSLog(@"%@", urlError.userInfo);
    }
    else {
        NSLog(@"%@", [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding]);
    }
    
    //urlData Null로 변경됨.
    NSLog(@"%@", urlData);

    //Data 접근
    const void *constBuf = NULL;
    constBuf = [testData bytes];
    printf("%s", constBuf);
    
    //Data 복사
    char *buf = malloc([testData length]);
    [testData getBytes:buf];
    printf("%s", buf);
    [testData getBytes:buf length:[testData length]];
    printf("%s", buf);
    
    //subData
    NSRange subDataRange;
    subDataRange.length = 3;
    subDataRange.location = 3;
    
    NSData *subData = [testData subdataWithRange:subDataRange];
    NSLog(@"%@", [[NSString alloc] initWithData:subData encoding:NSUTF8StringEncoding]);
    
    //검색
    char *charBuf = "abc";
    NSRange searchedDataRange = [testData rangeOfData:[NSData dataWithBytes:charBuf length:3] options:0 range:NSMakeRange(0, 30)];
    NSLog(@"length : %lu, location : %lu", searchedDataRange.length, searchedDataRange.location);

    
    //파일 입출력
    NSArray *dataPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dataPathsString = dataPaths[0];
    dataPathsString = [dataPathsString stringByAppendingPathComponent:@"data.txt"];

    char *fileBuf = "DataFileWrite";
    NSData *fileData = [NSData dataWithBytes:fileBuf length:strlen(fileBuf)+1];
    [fileData writeToFile:dataPathsString atomically:YES];
    
    NSData *fileReadData = [[NSData alloc] initWithContentsOfFile:dataPathsString];
    NSLog(@"%@", [[NSString alloc] initWithData:fileReadData encoding:NSUTF8StringEncoding]);
    
    //Mutable 조작
    NSMutableData *mutableData = [testData mutableCopy];
    void *mutableBuf = [mutableData mutableBytes];
    printf("%s\n", mutableBuf);

    //Data Append
    [mutableData appendData:testData];
    printf("%s\n", [mutableData mutableBytes]);

    //Byte Append
    [mutableData appendBytes:"APPEND" length:strlen("APPEND")+1];
    printf("%s\n", [mutableData mutableBytes]);

    //교체
    subDataRange.location = 0;
    subDataRange.length = 10;
    [mutableData replaceBytesInRange:subDataRange withBytes:"바이트교환"];
    printf("%s\n", [mutableData mutableBytes]);
    
    [mutableData replaceBytesInRange:subDataRange withBytes:"바이트교환" length:strlen("바이트교환")];
    printf("%s\n", [mutableData mutableBytes]);
    
    //바이트 배열 길이
    [mutableData increaseLengthBy:[mutableData length]];
    printf("%s\n", [mutableData mutableBytes]);
    
    [mutableData setLength:[mutableData length]*2];
    printf("%s\n", [mutableData mutableBytes]);
    
    //Reset
    [mutableData resetBytesInRange:NSMakeRange(20, 10)];
    printf("%s\n", [mutableData mutableBytes]);
    
#pragma mark -
#pragma mark NSArray Example
    ////////////////////////////////////////////////////////////
    //
    //        NSArray
    //
    ////////////////////////////////////////////////////////////

    //할당
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    array = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    //리터럴!
    array = @[@"1", @"2", @"3"];
    
    //C-Style array로부터.
    id rawArray[] = {@"1", @"2", @"3"};
    array = [[NSArray alloc] initWithObjects:rawArray count:3];
    array = [[NSArray alloc] initWithArray:array copyItems:YES];
    
    //없으면 NSNotFound
    NSLog(@"%lu", [array indexOfObject:@"2"]);
    
    //접근
    NSLog(@"%@", [array objectAtIndex:0]);
    NSLog(@"%@", array[0]);
    NSLog(@"%lu", [array count]);
    NSLog(@"%@", [array lastObject]);
    NSLog(@"%@", [array firstObject]);
    
    //CSytle로 복사
    __unsafe_unretained id idBuffer[3];
    [array getObjects:idBuffer];
    NSLog(@"[%@][%@][%@]", idBuffer[0], idBuffer[1], idBuffer[2]);
    [array getObjects:idBuffer range:NSMakeRange(0, 3)];
    NSLog(@"[%@][%@][%@]", idBuffer[0], idBuffer[1], idBuffer[2]);
    
    //SubArray
    NSArray *subedArray = [array subarrayWithRange:NSMakeRange(0, 2)];
    NSLog(@"%@", subedArray);
    
    //Add ?!?!
    NSLog(@"%@",[array arrayByAddingObjectsFromArray:@[@"4", @"5"]]);
    NSLog(@"%@",[array arrayByAddingObject:@"999"]);

    //비교
    NSLog(@"%@", [@[@"1", @"2"] firstObjectCommonWithArray:@[@"2", @"2"]]);
    
    //Sorting, Message
    //Sorting, Message는 나중에 자세하게.
    NSLog(@"%@", [@[@"2",@"3",@"4",@"5",@"1"] sortedArrayUsingSelector:@selector(compare:)]);
    //makeObjectsPerformSelector:
    
    //File 입출력
    NSString *arrayPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"test.plist"];
    [@[@"2",@"2",@"2"] writeToFile:arrayPath atomically:YES];
    
    NSArray *fileArray = [[NSArray alloc] initWithContentsOfFile:arrayPath];
    NSLog(@"%@", fileArray);
    
    NSArray *components = @[@"User", @"Time", @"123"];
    NSLog(@"%@", [components componentsJoinedByString:@"/"]);
    
    NSArray *fileNames = @[@"User.txt", @"Time.txt", @"123.rtf", @"123.exe"];
    NSLog(@"%@", [fileNames pathsMatchingExtensions:@[@"txt", @"exe"]]);
    
    //Mutable 조작
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    mutableArray = [NSMutableArray array];
    
    //추가, 치환
    [mutableArray addObject:@"1"];
    [mutableArray insertObject:@"0" atIndex:0];
    NSLog(@"%@", mutableArray);
    
    [mutableArray replaceObjectAtIndex:0 withObject:@"3"];
    NSLog(@"%@", mutableArray);
    [mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
    NSLog(@"%@", mutableArray);
    
    [mutableArray replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:@[@"Changed", @"Change"]];
    NSLog(@"%@", mutableArray);
    
    //개체 삭제
    [mutableArray removeObject:@"Change"];
    NSLog(@"%@", mutableArray);
    
    [mutableArray removeLastObject];
    [mutableArray removeAllObjects];
    
    mutableArray = [@[@0,@1,@2,@3,@4] mutableCopy];
    [mutableArray removeObjectAtIndex:0];
    NSLog(@"%@", mutableArray);
    
    //고속 열거
    for(id obj in mutableArray)
    {
        NSLog(@"%@", obj);
    }
    
    //Enumerator?
    NSEnumerator *reversePrint = [mutableArray reverseObjectEnumerator];
    for(id obj in reversePrint)
    {
        NSLog(@"%@", obj);
    }
    
    //다른 Mutable Array 이용
    [mutableArray addObject:@"123"];
    NSLog(@"%@", mutableArray);
    NSMutableArray *removedArray = [NSMutableArray array];
    for(id obj in mutableArray)
    {
        if([obj isKindOfClass:[NSString class]])
        {
            [removedArray addObject:obj];
        }
    }
    [mutableArray removeObjectsInArray:removedArray];
    NSLog(@"%@", mutableArray);
    
    //고속 열거 시 삭제는 어떻게?
    //IndexSet 이용
    [mutableArray addObject:@"123"];
    NSLog(@"%@", mutableArray);
    NSMutableIndexSet *removedIndex = [NSMutableIndexSet indexSet];
    for(id obj in reversePrint)
    {
        if([obj isKindOfClass:[NSString class]])
        {
            [removedIndex addIndex:[mutableArray indexOfObject:obj]];
        }
    }
    [mutableArray removeObjectsAtIndexes:removedIndex];
    NSLog(@"%@", mutableArray);

    
    //그냥 뒤에서부터 index로 제거..
    [mutableArray addObject:@"123"];
    NSLog(@"%@", mutableArray);
    for(NSUInteger i = [mutableArray count]-1; i > 0 ; i --)
    {
        id obj = mutableArray[i];
        //[mutableArray objectAtIndex:i];
        if([obj isKindOfClass:[NSString class]])
        {
            [mutableArray removeObjectAtIndex:i];
        }
    }
    NSLog(@"%@", mutableArray);
    

#pragma mark -
#pragma mark NSDictionary Example
    ////////////////////////////////////////////////////////////
    //
    //        NSDictionary
    //
    ////////////////////////////////////////////////////////////
    
    //할당
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"OBJ" forKey:@"Key"];
    NSLog(@"%@", dict);
    dict = [NSDictionary dictionaryWithObjects:@[@"OBJ1", @"OBJ2", @"OBJ3"] forKeys:@[@"K1", @"K2", @"K3"]];
    NSLog(@"%@", dict);
    dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"OBJ1", @"K1", @"OBJ2", @"K2", nil];
    NSLog(@"%@", dict);
    
    //Literal!
    dict = @{@"K1" : @"OBJ1",@"K2" : @"OBJ2",@"K3" : @"OBJ3"};
    NSLog(@"%@", dict);
    
    //접근
    NSLog(@"%@", [dict allKeys]);
    NSLog(@"%@", [dict allValues]);
    NSLog(@"%@", [dict objectForKey:@"K3"]);
    
    //File 입출력
    
    NSString *dictPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"dictTest.plist"];
    [dict writeToFile:dictPath atomically:YES];
    
    NSDictionary *fileDict = [[NSDictionary alloc] initWithContentsOfFile:dictPath];
    NSLog(@"%@", fileDict);
    
    //Mutable 조작
    NSMutableDictionary *mutableDict = [fileDict mutableCopy];
    [mutableDict setObject:@"OBJ4" forKey:@"K4"];
    NSLog(@"%@", mutableDict);

    //Obj값이 update.
    [mutableDict setObject:@"OBJ4" forKey:@"K3"];
    NSLog(@"%@", mutableDict);

    [mutableDict removeObjectsForKeys:@[@"K1",@"K2"]];
    NSLog(@"%@", mutableDict);
    
    [mutableDict addEntriesFromDictionary:@{@"K6" : @"OBJ6", @"K7" : @"OBJ7"}];
    NSLog(@"%@", mutableDict);
    
#pragma mark -
#pragma mark NSNumber Example
    ////////////////////////////////////////////////////////////
    //
    //        NSNumber
    //
    ////////////////////////////////////////////////////////////

    
    NSNumber *number = nil;
    number = @(enumTest1);
    number = @11;
    number = [NSNumber numberWithInteger:11];
    NSLog(@"%@", number);
    NSLog(@"%ld", [number integerValue]);
    NSLog(@"%f", [number doubleValue]);
    
    number = @123.112;
    number = [NSNumber numberWithFloat:123.112];
    NSLog(@"%@", number);
    NSLog(@"%ld", [number integerValue]);
    NSLog(@"%f", [number doubleValue]);
    
    number = @-123.11;
    number = [NSNumber numberWithFloat:-123.112];
    NSLog(@"%@", number);
    NSLog(@"%ld", [number integerValue]);
    NSLog(@"%f", [number doubleValue]);
    
    number = @(Green);
    NSLog(@"Green : %@", number);
    
#pragma mark -
#pragma mark NSValue Example
    ////////////////////////////////////////////////////////////
    //
    //        NSValue
    //
    ////////////////////////////////////////////////////////////
    
    
    NSValue *rangeValue = [NSValue valueWithRange:NSMakeRange(3, 3)];
    NSLog(@"%@", rangeValue);
    NSValue *pointValue = [NSValue valueWithPoint:NSMakePoint(3.f, 3.f)];
    NSLog(@"%@", pointValue);
    NSValue *sizeValue = [NSValue valueWithSize:NSMakeSize(3.F, 3.F)];
    NSLog(@"%@", sizeValue);
    NSValue *rectValue = [NSValue valueWithRect:NSMakeRect(0.f, 0.f, 0.f, 0.f)];
    NSLog(@"%@", rectValue);
    
    void *temp = malloc(30);
    NSValue *pointerValue = [NSValue valueWithPointer:temp];
    NSLog(@"%@", pointerValue);
    
    
}

@end
