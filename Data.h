#import <Foundation/Foundation.h>

@interface Data : NSObject {
    @private int dzien;
    @private NSString *miesiac;
    @private int rok;
}

@property(assign) int dzien;
@property(retain) NSString *miesiac;
@property(assign) int rok;

- (instancetype) stworzDateZDniem:(int)dzien iMiesiacem:(NSString *)miesiac iRokiem:(int)rok;
- (void) zmienDzien:(int)dzien iMiesiac:(NSString *)miesiac;
- (void) zmienMiesiac:(NSString *)miesiac iRok:(int)rok;
- (void) zmienDzien:(int)dzien iMiesiac:(NSString *)miesiac iRok:(int)rok;
- (void) wypiszDateUrodzenia:(BOOL)czyUrodzenia;

@end
