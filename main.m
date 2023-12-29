#import <Foundation/Foundation.h>
#import "Klasa.h"
#import "Data.h"
#import "Osoba.h"

int main(int argc, const char *argv[]) {
    // usunięcie niepotrzebnych logów z konsoli
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // Klasa
    {
        NSLog(@"=== Klasa ===");
        Klasa *obiekt = [[Klasa alloc] init];
        
        [obiekt setLiczba:123];
        NSLog(@"    Ustawiliśmy liczbę w obiekcie na %i.", [obiekt liczba]);
        obiekt.liczba = 456;
        NSLog(@"    Zmieniliśmy liczbę w obiekcie na %i.", [obiekt liczba]);
        NSLog(@"\n");
        
        NSLog(@"    Wartość zwrócona przez metodę to %i.", [[Klasa class] metodaJakbyStatycznaZwracajacaLiczbeCalkowita]);
        NSLog(@"\n");
        
        [obiekt metodaZJednymParametrem:@"jakiś tekst"];
    }
    
    // Data
    Data *data;
    {
        NSLog(@"\n");
        NSLog(@"=== Data ===");
        
        // poprawna data
        data = [[Data alloc] stworzDateZDniem:31 iMiesiacem:@"grudnia" iRokiem:9999];
        [data wypiszDateUrodzenia:NO];
        
        // niepoprawny rok = dzień + miesiąc
        NSLog(@"\n");
        [data zmienMiesiac:@"lutego" iRok:-1];
        [data wypiszDateUrodzenia:NO];
        
        // niepoprawne wszystkie dane LUB niepoprawny miesiąc = brak poprawnej daty
        NSLog(@"\n");
        [data zmienDzien:-1 iMiesiac:@""];
        [data wypiszDateUrodzenia:NO];
        NSLog(@"\n");
        [data zmienDzien:11 iMiesiac:@"" iRok:2001];
        [data wypiszDateUrodzenia:NO];
        
        // niepoprawny dzień = miesiąc + rok
        NSLog(@"\n");
        [data zmienDzien:-1 iMiesiac:@"wrzesień"];
        [data wypiszDateUrodzenia:NO];
        
        // ponownie poprawna data (używana przy tworzeniu obiektu klasy Osoba)
        NSLog(@"\n");
        [data zmienDzien:1 iMiesiac:@"stycznia" iRok:1970];
        [data wypiszDateUrodzenia:NO];
    }
    
    // Osoba
    {
        NSLog(@"\n");
        NSLog(@"=== Osoba ===");
        Osoba *osoba = [[Osoba alloc] stworzOsobeZImieniem:@"Jan" iNazwiskiem:@"Kowalski" iDataUrodzenia:data iAdresem:2 iMiastem:0 iWojewodztwem:2];
        [osoba wypiszOsobe];
        NSLog(@"\n");
        
        // osoba bez znanego nazwiska
        [osoba zmienImie:@"Krzysiek" iNazwisko:@""];
        [osoba wypiszOsobe];
        NSLog(@"\n");
        
        // osoba bez znanej daty urodzenia
        [data zmienDzien:-1 iMiesiac:@"" iRok:-1];
        [data wypiszDateUrodzenia:NO];
        NSLog(@"\n");
        [osoba zmienDateUrodzenia:data];
        [osoba wypiszOsobe];
        NSLog(@"\n");
        
        // osoba bez znanej ulicy zamieszkania
        [osoba zmienAdres:-1 iMiasto:3 iWojewodztwo:1];
        [osoba wypiszOsobe];
    }
    
    [pool release];
    return 0;
}
