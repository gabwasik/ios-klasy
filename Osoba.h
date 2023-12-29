#import <Foundation/Foundation.h>
#import "Data.h"

@interface Osoba : NSObject {
    @private NSString *imie;
    @private NSString *nazwisko;
    @private Data *dataUrodzenia;
    @private int adres;
    @private int miasto;
    @private int wojewodztwo;
}

@property(retain) NSString *imie;
@property(retain) NSString *nazwisko;
@property(retain) Data *dataUrodzenia;
@property(assign) int adres;
@property(assign) int miasto;
@property(assign) int wojewodztwo;


+ (NSArray *)adresy;
+ (NSArray *)miasta;
+ (NSArray *)wojewodztwa;
    
- (instancetype) stworzOsobeZImieniem:(NSString *)noweImie iNazwiskiem:(NSString *)noweNazwisko iDataUrodzenia:(Data *)nowaDataUrodzenia iAdresem:(int)nowyAdres iMiastem:(int)noweMiasto iWojewodztwem:(int)noweWojewodztwo;
- (void) zmienImie:(NSString *)noweImie iNazwisko:(NSString *)noweNazwisko;
- (void) zmienDateUrodzenia:(Data *)nowaDataUrodzenia;
- (void) zmienAdres:(int)nowyAdres iMiasto:(int)noweMiasto iWojewodztwo:(int)noweWojewodztwo;
- (void) wypiszOsobe;

@end
