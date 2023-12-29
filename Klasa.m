#import "Klasa.h"
@implementation Klasa

@synthesize liczba;
@synthesize jakisNapis;

+ (int) metodaJakbyStatycznaZwracajacaLiczbeCalkowita {
   NSLog(@"[i] metodaJakbyStatycznaZwracajacaLiczbeCalkowita() wywołana na klasie Klasa:");
   return 789;
}

- (void) metodaBezParametrow {
   NSLog(@"[i] metodaBezParametrow() wywołana przez metodaZJednymParametrem():");
}

- (void) metodaZJednymParametrem:(NSString *)napis {
   NSLog(@"[i] metodaZJednymParametrem() wywołana na obiekcie klasy Klasa:");
   NSLog(@"    Przekazany metodzie napis: %@", napis);
   NSLog(@"\n");
    
   [self metodaBezParametrow];
   [self metodaZParmetremPierwszym:5 iParametremDrugim:10];
}

- (void) metodaZParmetremPierwszym:(int)p1 iParametremDrugim:(int)p2 {
   NSLog(@"    [i] metodaZParmetremPierwszymiParametremDrugim() wywołana przez metodaZJednymParametrem():");
   NSLog(@"        Parametr pierwszy: %i", p1);
   NSLog(@"        Parametr drugi: %i", p2);
   NSLog(@"        Wynik dodawania obu parametrów: %i", p1 + p2);
}

@end
