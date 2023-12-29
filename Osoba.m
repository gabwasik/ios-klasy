#import <Foundation/Foundation.h>
#import "Data.h"
#import "Osoba.h"
@implementation Osoba

// deklaracja metod dostępu do wszystkich pól
@synthesize imie;
@synthesize nazwisko;
@synthesize dataUrodzenia;
@synthesize adres;
@synthesize miasto;
@synthesize wojewodztwo;

// deklaracja pomocniczych zmiennych statycznych...
static NSArray *_adresy;
static NSArray *_miasta;
static NSArray *_wojewodztwa;

// ...ich inicjalizacja...
+ (void) initialize {
    if (self == [Osoba class]) {
        _adresy = [NSArray arrayWithObjects:@"Łokietka 1", @"Plac Defilad 1", @"Słonimska 1", @"Wyzwolenia 30", nil];
        _miasta = [NSArray arrayWithObjects:@"Białystok", @"Lublin", @"Olsztyn", @"Warszawa", nil];
        _wojewodztwa = [NSArray arrayWithObjects:@"Lubelskie", @"Mazowieckie", @"Podlaskie", @"Warmińsko-Mazurskie", nil];
    }
}

// ...oraz przypisanie im getter'ów
+ (NSArray *)adresy { return _adresy; }
+ (NSArray *)miasta { return _miasta; }
+ (NSArray *)wojewodztwa { return _wojewodztwa; }

// metoda inicjalizująca
- (instancetype) stworzOsobeZImieniem:(NSString *)noweImie iNazwiskiem:(NSString *)noweNazwisko iDataUrodzenia:(Data *)nowaDataUrodzenia iAdresem:(int)nowyAdres iMiastem:(int)noweMiasto iWojewodztwem:(int)noweWojewodztwo {
    self = [super init];
    if (self) {
        self.imie = ([noweImie length] > 0) ? noweImie : @"";
        self.nazwisko = ([noweNazwisko length] > 0) ? noweNazwisko : @"";
        if (nowaDataUrodzenia != nil) self.dataUrodzenia = nowaDataUrodzenia;
        
        self.adres = (nowyAdres < 0 || nowyAdres > [_adresy count]) ? -1 : nowyAdres;
        self.miasto = (noweMiasto < 0 || noweMiasto > [_miasta count]) ? -1 : noweMiasto;
        self.wojewodztwo = (noweWojewodztwo < 0 || noweWojewodztwo > [_wojewodztwa count]) ? -1 : noweWojewodztwo;
    }

    return self;
}

// metoda z dwoma parametrami
- (void) zmienImie:(NSString *)noweImie iNazwisko:(NSString *)noweNazwisko {
    NSLog(@"[i] zmienImieiNazwisko() wywołana na obiekcie klasy Osoba:");
    self.imie = ([noweImie length] > 0) ? noweImie : @"";
    self.nazwisko = ([noweNazwisko length] > 0) ? noweNazwisko : @"";
}

- (void) zmienDateUrodzenia:(Data *)nowaDataUrodzenia {
    NSLog(@"[i] zmienDateUrodzenia() wywołana na obiekcie klasy Osoba:");
    if (nowaDataUrodzenia != nil) self.dataUrodzenia = nowaDataUrodzenia;
}

// metoda z trzema parametrami
- (void) zmienAdres:(int)nowyAdres iMiasto:(int)noweMiasto iWojewodztwo:(int)noweWojewodztwo {
    NSLog(@"[i] zmienAdresiMiastoiWojewodztwo() wywołana na obiekcie klasy Osoba:");
    self.adres = (nowyAdres < 0 || nowyAdres > [_adresy count]) ? -1 : nowyAdres;
    self.miasto = (noweMiasto < 0 || noweMiasto > [_miasta count]) ? -1 : noweMiasto;
    self.wojewodztwo = (noweWojewodztwo < 0 || noweWojewodztwo > [_wojewodztwa count]) ? -1 : noweWojewodztwo;
}

// metoda wypisująca sfortmatowane dane obiektu
- (void) wypiszOsobe {
    NSString *_adres = (self.adres == -1) ? @"-" : [@"ul. " stringByAppendingString:[_adresy objectAtIndex:self.adres]];
    NSString *_miasto = (self.miasto == -1) ? @", -" : [@", " stringByAppendingString:[_miasta objectAtIndex:self.miasto]];
    NSString *_wojewodztwo = (self.wojewodztwo == -1) ? @", -" : [@", " stringByAppendingString:[_wojewodztwa objectAtIndex:self.wojewodztwo]];

    NSLog(@"    Imię i nazwisko: %@%@", ([self.imie length] != 0) ? [self.imie stringByAppendingString:@" "] : @"- ", ([self.nazwisko length] != 0) ? self.nazwisko : @"-");
    (self.dataUrodzenia == nil) ? NSLog(@"    Data urodzenia: -") : [self.dataUrodzenia wypiszDateUrodzenia:YES];
    NSLog(@"    Adres zamieszkania: %@%@%@", _adres, _miasto, _wojewodztwo);
}

@end
