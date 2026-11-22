# Foxberry: specyfikacja palety

Foxberry to jasny wariant palety Nord. Dokument opisuje, jak powstał każdy kolor,
i jest przeznaczony także dla osób oraz agentów, którzy dodają motyw do
kolejnego programu. W tabelach kolumna „Nord” to oryginalny (ciemny) Nord,
z którego dany kolor Foxberry pochodzi.

Stan: paleta w wersji 2.4 (2026-11-13). Wszystkie wartości
są w tabelach poniżej.

## Zasady nadrzędne

1. **Rola decyduje o kolorze.** Ten sam kolor Nord ma w Foxberry różne odpowiedniki
   zależnie od tego, czy jest tekstem, tłem, czy plakietką (patrz „Mapowanie
   Nord → Foxberry").
2. **Kontrast na tle terminala `#E5E9F0`.** Tekst bazowy ma co najmniej 7:1.
   Akcenty tekstowe mają około 3.8:1 (4.0:1 na `#ECEFF4`, dla którego były
   dobierane); przy foncie terminala ok. 18 pt próg WCAG AA dla dużego tekstu
   wynosi 3:1. Kolory „bright" (wykresy, znaczniki, paski) mają około 3.0:1.
3. **Żółć to brąz.** Ciemna i czytelna żółć na jasnym tle zawsze wpada w brąz,
   więc od 2.3 nord13 w Foxberry to stonowany brąz „Bronze” `#967044` (3.7:1 na
   `#E5E9F0`) z jasnością i nasyceniem pozostałych akcentów (OKLCH L 0.57,
   C 0.077, jak oryginalny nord13). Wcześniejsze złoto `#AE7500` (2.1–2.2) było
   najjaśniejszym i najbardziej nasyconym akcentem i odstawało od palety.
   Ciemny tekst na brązie ma tylko 2.3:1, więc jako tło podświetleń używaj
   plakietki nord13 albo jasnego tekstu na brązie.

## Powierzchnie i tekst

  | Rola                                                                           | Nord                                                         | Foxberry                          |
  | ------------------------------------------------------------------------------ | ------------------------------------------------------------ | --------------------------------- |
  | Tło terminala (Ghostty, kitty; programy w terminalu dziedziczą je)             | `#2E3440`                                                    | `#E5E9F0`                         |
  | Zed, VS Code: edytor i aktywna karta / panele i pasek kart / pasek tytułu, stanu (i aktywności) (od 2026-11-13) | `#2E3440` | `#EFF2F6` / `#DFE3EA` / `#D1D6E0` |
  | Panel, sekcja C lualine, nieaktywna zakładka, zaznaczenie                      | `#3B4252` / `#434C5E`                                        | `#D8DEE9`                         |
  | Sekcja B lualine, pasek zakładek kitty, linie, separatory, puste części pasków | `#4C566A`                                                    | `#C9D0DC`                         |
  | Tekst podstawowy                                                               | `#BFC5D2`                                                    | `#3B4252`                         |
  | Tekst mocny, nagłówki                                                          | `#ECEFF4`                                                    | `#2E3440`                         |
  | Tekst przygaszony (np. sekcja C lualine, zegar w promptcie)                    | —                                                            | `#4C566A`                         |
  | Komentarze w kodzie                                                            | `#616E88`                                                    | `#6A7488`                         |
  | Podpowiedzi, numery linii, bardzo przygaszone                                  | `#4C566A`                                                    | `#8E97A8`                         |
  | Kursor                                                                         | `#FF9E64` (Ghostty), `#81A1C1` (kitty)                       | `#A35E75` (foxberry)              |
  | Tekst na zaznaczeniu                                                           | Ghostty `#4C566A` na `#ECEFF4`, kitty `#ECEFF4` na `#4C566A` | `#2E3440` na `#D8DEE9`            |

**Zed i VS Code: hierarchia jak One Light / Ayu Light.** Trzy poziomy co ok. 0.045
OKLCH L (edytor 0.960, panele 0.915, chrome 0.875), szarości w odcieniu Norda.
Hover `#D7DDE6`, zaznaczenie `#C6CCD9`, ramki `#C8CEDA` / `#D8DDE5`, numery
linii `#AAB1BE`, aktywny numer `#3B4252`. Akcent interfejsu (`text.accent`) to
nord9 `#5374B3`, ramka fokusu `#A7BDD4`. Wbudowany terminal zostaje na
`#E5E9F0`, jak Ghostty. W VS Code plakietki, przyciski i liczniki mają
`#A7BDD4` (wcześniej nord8 `#ACD3DE`), aktywne ramki i pasek postępu `#658ACD`;
zaznaczenie na liście jest neutralne `#C6CCD9`. 

## Akcenty

Kolumna „tekst" zawiera kolory tekstu i ikon na tle głównym. Kolumna „bright"
zawiera kolory wykresów, znaczników i ANSI 9--15. Kolumna „plakietka" zawiera
tło etykiet z ciemnym tekstem `#2E3440`, na przykład segmentów prompta, trybów
lualine i aktywnych pól.

  | Nord   | Rola typowa                | Nord      | tekst       | bright       | plakietka       |
  | ------ | -------------------------- | --------- | ----------- | ------------ | --------------- |
  | nord7  | typy, klasy                | `#8FBCBB` | `#36816F`   | `#489784`    | `#B6D3D2`       |
  | nord8  | funkcje, katalogi          | `#88C0D0` | `#287F92`   | `#3B95A9`    | `#ACD3DE`       |
  | nord9  | słowa kluczowe, operatory  | `#81A1C1` | `#5374B3`   | `#658ACD`    | `#A7BDD4`       |
  | nord10 | linki, akcent głęboki      | `#5E81AC` | `#3F79A8`   | `#5E81AC`    | `#96ADC9`       |
  | nord11 | błędy, usunięte            | `#BF616A` | `#BE525A`   | `#DA656D`    | `#D5989E`       |
  | nord12 | liczby, adnotacje          | `#D08770` | `#B15E37`   | `#CC7248`    | `#DEAB9B`       |
  | nord13 | ostrzeżenia, zmodyfikowane | `#EBCB8B` | `#967044`   | `#AD8455`    | `#E5C4A1`       |
  | nord14 | stringi, dodane, sukces    | `#A3BE8C` | `#4E8044`   | `#619756`    | `#AAC396`       |
  | nord15 | stałe, liczby, specjalne   | `#B48EAD` | `#986393`   | `#B077AB`    | `#CAB0C6`       |
  | foxberry | tryb visual (lualine)    | `#C68B9D` | `#A35E75`   | `#BC7890`    | `#DEC0CC`       |

**foxberry** (od 2026-11-12) to akcent spoza Nordu: przygaszony róż, który leży
między nord11 a nord15. W OKLCH ma H ≈ 359° (nord11 18°, nord15 330°) i tę
samą jasność co reszta akcentów (L ≈ 0.57). Kontrast na `#E5E9F0`: tekst
3.9:1, bright 2.8:1 (tyle co nord15 bright). Plakietka z tekstem `#2E3440`
ma 7.4:1. Kolor bazowy `#C68B9D` (do ciemnego tła) ma ten sam odcień, jasność nord12/nord15
(L ≈ 0.70) i kontrast 4.5:1 na `#2E3440`.
Pierwsza rola (2026-11-13): plakietka trybu visual w lualine. Od 2026-11-22
także kursor (terminal, Zed, VS Code, bat, yazi): `#A35E75` ma 3.9:1 na tle
terminala, a jasny znak pod kursorem `#ECEFF4` ma na nim 4.1:1.
W lualine insert ma ciemną plakietkę `#4C566A` z tekstem `#ECEFF4`
(odbicie białej plakietki nord4 z ciemnego Norda).

Polecenia w zsh (fast-syntax-highlighting) mają w ciemnym motywie kolor
`#77C2D2`, a w Foxberry `#068092`.

## Paleta ANSI terminala

Ghostty (`themes/ghostty/Foxberry`) i kitty (`themes/kitty/foxberry.conf`)
mają identyczne wartości. Kolumna „Nord” to motyw Nord dla Ghostty.

  | ANSI      | Nord      | Foxberry  | ANSI              | Nord                        | Foxberry  |
  | --------- | --------- | --------- | ----------------- | --------------------------- | --------- |
  | 0 black   | `#3B4252` | `#3B4252` | 8 bright black    | `#596377` (kitty `#4C566A`) | `#4C566A` |
  | 1 red     | `#BF616A` | `#BE525A` | 9 bright red      | `#BF616A`                   | `#DA656D` |
  | 2 green   | `#A3BE8C` | `#4E8044` | 10 bright green   | `#A3BE8C`                   | `#619756` |
  | 3 yellow  | `#EBCB8B` | `#967044` | 11 bright yellow  | `#EBCB8B`                   | `#AD8455` |
  | 4 blue    | `#81A1C1` | `#5374B3` | 12 bright blue    | `#81A1C1`                   | `#658ACD` |
  | 5 magenta | `#B48EAD` | `#986393` | 13 bright magenta | `#B48EAD`                   | `#B077AB` |
  | 6 cyan    | `#88C0D0` | `#287F92` | 14 bright cyan    | `#8FBCBB`                   | `#489784` |
  | 7 white   | `#E5E9F0` | `#6A7488` | 15 bright white   | `#ECEFF4`                   | `#8E97A8` |

**Kolory bright w Nord.** W Nordzie ANSI 9–13 są identyczne z 1–5, a slot
cyjanu jest wyjątkiem: ANSI 6 to nord8, ANSI 14 to inny Frost, nord7. Foxberry
musi rozjaśnić bright (na jasnym tle identyczne kolory nie dałyby różnicy),
ale zasada brzmi: bright = jaśniejsza wersja koloru, który ten slot ma w Nordzie.
Dlatego ANSI 14 w Foxberry to jasny nord7 `#489784`, nie jasny nord8. Wersja 2.3
miała tu `#3B95A9` (jasny nord8) i 2.4 to cofnęła. Bliskość 14 i 10 (ΔE 0.064)
jest cechą Norda: w oryginale nord7 i nord14 dzieli ΔE 0.069.

**ANSI 4 to nord9, nie nord10.** Tak mapuje Nord (nord10 ma w oryginale tylko
3.1:1). W Foxberry oba mają 3.8:1, ale nord10 jest bliżej cyjanu (ΔE do ANSI 6:
0.047 zamiast 0.079).

Programy, które rysują nazwanymi kolorami ANSI (`yellow`, `white`, `darkgray`),
dostają w Foxberry ciemne odcienie. Połączenia typu „white na darkgray" albo „black
na yellow" robią się wtedy ciemne na ciemnym. W motywie Foxberry takie miejsca
trzeba nadpisać kolorami hex (przykład: własny pasek
w `init.lua` yazi).

## Mapowanie Nord → Foxberry

Gdy program ma już motyw Nord (ciemny), motyw Foxberry powstaje przez przekształcenie
każdego koloru według jego roli.

- **Akcent jako tekst lub ikona** → kolumna „tekst".
- **Akcent jako tło plakietki z ciemnym tekstem** → pastelowy oryginał Nord
  zostaje albo przechodzi w kolumnę „plakietka"; tekst na nim to `#2E3440`.
- **Akcent jako wykres, pasek lub obramowanie** → kolumna „bright".
- **Powierzchnie Polar Night** (`#2E3440`, `#3B4252`, `#434C5E`, `#4C566A`) jako
  tło → Snow Storm według tabeli powierzchni.
- **Snow Storm jako tekst** (`#D8DEE9`, `#E5E9F0`, `#ECEFF4`) → `#3B4252` lub
  `#2E3440`.
- **Polar Night jako tekst** (separatory, prowadnice) → `#C9D0DC`; przygaszone →
  `#8E97A8`.
- **Drabina szarości:** każdy panel ma być co najmniej o stopień (`#E5E9F0` →
  `#D8DEE9` → `#C9D0DC`) ciemniejszy od tła, na którym leży. Panel w kolorze tła
  znika.
- **Gradacja chrome:** w ciemnym Nordzie titlebar jest najjaśniejszy, a edytor
  najciemniejszy. W Foxberry odwrotnie: titlebar i karty `#D8DEE9`, panele
  `#DFE3EB`, edytor i aktywna karta `#E5E9F0`.
- **Kolory półprzezroczyste** (np. tła diagnostyki) mieszamy z `#ECEFF4`, a nie
  z `#2E3440`.

## Gdzie co leży

Gotowe pliki są w `themes/` (instalacja w `README.md`), motyw slajdów w `reveal/`,
a strona poglądowa w `site/`.

## Wersje

  | Wersja        | Różnica                                                                                         |
  | ------------- | ----------------------------------------------------------------------------------------------- |
  | 1.0           | akcenty 4.5:1, odcienie 1:1 z Nordem; ciemna, typy, funkcje i słowa kluczowe prawie się zlewają |
  | 2.0           | akcenty ~4.0:1, odcienie rozsunięte w OKLCH                                                     |
  | 2.1           | jak 2.0, żółć `#AE7500` / `#C68A12` zamiast `#976D16` / `#AF822A`                               |
  | 2.2           | jak 2.1, tło terminala szare `#E5E9F0` zamiast `#ECEFF4`; panele i paski o stopień ciemniej     |
  | 2.3           | jak 2.2, żółć Bronze `#967044` / `#AD8455` / plakietka `#E5C4A1`; ANSI 14 `#3B95A9` (nord8 bright) zamiast `#489784` |
  | 2.4 (bieżąca) | jak 2.3, ale ANSI 14 z powrotem `#489784` (jasny nord7, zgodnie z Nordem); Zed też `#489784` |
