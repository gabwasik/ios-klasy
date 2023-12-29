#import <Foundation/Foundation.h>
#import "Klasa.h"

@interface Klasa : NSObject {
    @private int liczba;
    @private NSString *jakisNapis;
}

@property(assign) int liczba;
@property(retain) NSString *jakisNapis;

- (void) metodaBezParametrow;
- (void) metodaZJednymParametrem:(NSString *)napis;
- (void) metodaZParmetremPierwszym:(int)p1 iParametremDrugim:(int)p2;
+ (int) metodaJakbyStatycznaZwracajacaLiczbeCalkowita;

@end
