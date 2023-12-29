#import "Data.h"
@implementation Data

// deklaracja metod dostępu do wszystkich pól
@synthesize dzien;
@synthesize miesiac;
@synthesize rok;

// metoda inicjalizująca
- (instancetype) stworzDateZDniem:(int)nowyDzien iMiesiacem:(NSString *)nowyMiesiac iRokiem:(int)nowyRok {
    self = [super init];
    if (self) {
        self.dzien = (nowyDzien >= 1 && nowyDzien <= 31) ? nowyDzien : -1;
        self.miesiac = ([nowyMiesiac length] >= 3) ? nowyMiesiac : nil;
        self.rok = (nowyRok > 0) ? nowyRok : -1;
    }
    
    return self;
}

// metoda z dwoma parametrami
- (void) zmienDzien:(int)nowyDzien iMiesiac:(NSString *)nowyMiesiac {
    NSLog(@"[i] zmienDzieniMiesiac() wywołana na obiekcie klasy Data:");
    
    self.dzien = (nowyDzien >= 1 && nowyDzien <= 31) ? nowyDzien : -1;
    self.miesiac = ([nowyMiesiac length] >= 3) ? nowyMiesiac : nil;
}

- (void) zmienMiesiac:(NSString *)nowyMiesiac iRok:(int)nowyRok {
    NSLog(@"[i] zmienMiesiaciRok() wywołana na obiekcie klasy Data:");
    
    self.miesiac = ([nowyMiesiac length] >= 3) ? nowyMiesiac : nil;
    self.rok = (nowyRok > 0) ? nowyRok : -1;
};

// metoda z trzema parametrami
- (void) zmienDzien:(int)nowyDzien iMiesiac:(NSString *)nowyMiesiac iRok:(int)nowyRok {
    NSLog(@"[i] zmienDzieniMiesiaciRok() wywołana na obiekcie klasy Data:");
    
    self.dzien = (nowyDzien >= 1 && nowyDzien <= 31) ? nowyDzien : -1;
    self.miesiac = ([nowyMiesiac length] >= 3) ? nowyMiesiac : nil;
    self.rok = (nowyRok > 0) ? nowyRok : -1;
}

// metoda wypisująca sfortmatowane dane obiektu
- (void) wypiszDateUrodzenia:(BOOL)czyUrodzenia {
    if (
        (self.miesiac == nil) || // bez miesiąca output nie miałby sensu (dd YYYY r.)
        (self.dzien == -1 && self.miesiac == nil && self.rok == -1) // ciężko wyświetlić datę bez daty
    ) {
        NSLog(@"    Data%@: -", (czyUrodzenia) ? @" urodzenia" : @"");
        return;
    }

    NSString *_dzien = (self.dzien != -1) ? [NSString stringWithFormat:@" %i", self.dzien] : @"";
    NSString *_miesiac = (self.miesiac != nil) ? [@" " stringByAppendingString:self.miesiac] : @"";
    NSString *_rok = (self.rok != -1) ? [NSString stringWithFormat:@" %i r.", self.rok] : @"";
    
    NSLog(@"    Data%@:%@%@%@", (czyUrodzenia) ? @" urodzenia" : @"", _dzien, _miesiac, _rok);
}

@end
