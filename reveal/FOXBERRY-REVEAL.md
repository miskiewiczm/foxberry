# Foxberry: motyw kolorystyczny dla prezentacji Reveal.js (Quarto)

Instrukcja dla agenta, który przygotowuje wykłady. Foxberry to jasny wariant palety Nord z dodatkowym akcentem marki **foxberry** (przygaszony róż). Motyw dostarcza kolory, typografię bazową i słownik klas układu. Treść, strukturę i język określają osobne wytyczne (`quarto-markdown`, `wytyczne-jazykowe`).

## 1. Pliki

Katalog źródłowy: `reveal/` w repozytorium Foxberry. Nie zmieniaj kolorów w tych plikach. Poprawki umieszczaj w osobnym pliku (sekcja 2).

| Plik | Do czego |
|---|---|
| `foxberry.scss` | motyw slajdów |
| `foxberry.theme` | podświetlanie składni kodu |

Skopiuj potrzebne pliki do katalogu wykładu, np. `themes/`. Nie linkuj do katalogu repozytorium, bo prezentacja ma się kompilować także na innym komputerze.

## 2. Konfiguracja

```yaml
format:
  revealjs:
    theme: [themes/foxberry.scss, themes/wyklad.scss]   # drugi plik opcjonalny
    highlight-style: themes/foxberry.theme
    slide-number: true
```

- Poprawki specyficzne dla wykładu (rozmiary, nowe układy) umieść w **osobnym** pliku `wyklad.scss`, podanym jako drugi na liście `theme`. Zmienne Foxberry mają `!default`, więc możesz je nadpisać w sekcji `/*-- scss:defaults --*/` tego pliku, np. `$fb-accent: $fb-deep;`.

## 3. Zasady kolorów (najważniejsze)

Każdy akcent występuje w **trzech rolach**. Wybieraj rolę według tego, co kolor robi na slajdzie:

| Rola | Zmienna | Zastosowanie | Nie używaj do |
|---|---|---|---|
| **tekst** | `$fb-X` | słowa, linki, ikony na tle slajdu | dużych teł |
| **bright** | `$fb-X-bright` | paski, ramki, punktory, linie wykresów | drobnego tekstu |
| **plakietka** | `$fb-X-badge` | tło etykiety lub pasa, **zawsze z ciemnym tekstem** | tekstu na tle slajdu (za jasne) |

Reguły:

1. **Nigdy nie wpisuj szesnastkowych kolorów Nord (`#88C0D0`, `#8FBCBB`, `#EBCB8B`, …) jako koloru tekstu na jasnym tle.** Te pastele mają na `#ECEFF4` kontrast poniżej 2:1. W wariancie jasnym tekst ma zawsze kolor z kolumny „tekst”.
2. Kolory wybieraj przez zmienne `$fb-*` albo klasy z sekcji 5, nie przez kody hex. Wtedy zmiana palety nic nie psuje.
3. Na slajdzie używaj **najwyżej 2–3 akcentów**. Główny akcent to **niebieski (nord9)**. Foxberry to kolor marki: slajd tytułowy, pasek postępu, pojedyncze wyróżnienie na slajdzie.
4. Kolor niesie znaczenie, więc trzymaj je w całym wykładzie:
   - czerwony: zagrożenie, błąd, atak
   - zielony: dobra praktyka, zabezpieczenie
   - brązowy (yellow): ostrzeżenie, uwaga
   - pomarańczowy: scenariusz, przykład
   - fioletowy: definicja, cytat, wzór
   - niebieski: informacja, nawigacja
5. Nie przekazuj informacji **wyłącznie** kolorem. Dodaj słowo, ikonę albo etykietę, bo część odbiorców nie rozróżnia czerwieni i zieleni.
6. Pogrubienie (`**…**`) zostaje w kolorze tekstu, nie w kolorze akcentu. Akcentem wyróżniaj oszczędnie: `[…]{.fb-red}`.

### Powierzchnie

| Zmienna | Kolor | Rola |
|---|---|---|
| `$fb-bg` | `#ECEFF4` | tło slajdu |
| `$fb-surface` | `#E5E9F0` | karty, bloki kodu, co drugi wiersz tabeli |
| `$fb-surface-2` | `#DFE3EA` | nagłówek tabeli, pasek `h3`, kod w linii |
| `$fb-frame` | `#D1D6E0` | najmocniejsze odcięcie |
| `$fb-border` | `#C8CEDA` | linie, obramowania |
| `$fb-text` | `#2E3440` | tekst główny |
| `$fb-text-2` | `#3B4252` | tekst drugorzędny |
| `$fb-muted` | `#6A7488` | źródła, przypisy |
| `$fb-inverse-bg` | `#3B4252` | slajdy rozdziałów (ciemne) |

### Akcenty

| Nazwa (`X`) | Nord | tekst `$fb-X` | bright `$fb-X-bright` | plakietka `$fb-X-badge` |
|---|---|---|---|---|
| `frost` | nord7 | `#36816F` | `#489784` | `#B6D3D2` |
| `cyan` | nord8 | `#287F92` | `#3B95A9` | `#ACD3DE` |
| `blue` (akcent) | nord9 | `#5374B3` | `#658ACD` | `#A7BDD4` |
| `deep` | nord10 | `#3F79A8` | `#3F79A8` | `#96ADC9` |
| `red` | nord11 | `#BE525A` | `#DA656D` | `#D5989E` |
| `orange` | nord12 | `#B15E37` | `#CC7248` | `#DEAB9B` |
| `yellow` (brąz) | nord13 | `#967044` | `#AD8455` | `#E5C4A1` |
| `green` | nord14 | `#4E8044` | `#619756` | `#AAC396` |
| `purple` | nord15 | `#986393` | `#B077AB` | `#CAB0C6` |
| `fox` (marka) | foxberry | `#A35E75` | `#BC7890` | `#DEC0CC` |

## 4. Kontrast

- Tekst akcentu ma około 4:1 na `#ECEFF4`. To wystarcza dla tekstu slajdu (≥ 24 px, próg WCAG dla dużego tekstu to 3:1). Do drobnego tekstu (< 20 px, np. `.source`) używaj `$fb-text` albo `$fb-muted`, nie akcentów.
- Bright ma około 2,5–3:1, więc nadaje się na elementy graficzne, nie na tekst.
- Na rzutniku kontrast spada. Gdy sala jest jasna, zostań przy wariancie jasnym i nie zmniejszaj tekstu poniżej 22 px.

## 5. Klasy gotowe do użycia

Nazwy są zgodne z wcześniejszymi motywami kursów (`nord-reveal.scss`), więc istniejące `.qmd` działają bez zmian.

**Kolor w tekście** (span Pandoc):
```markdown
[atak]{.fb-red}  [zabezpieczenie]{.fb-green}  [Foxberry]{.fb-fox}
[zakreślenie]{.fb-yellow-mark}
[TOTP]{.badge .fb-green}  [nowe]{.badge .fb-fox}   ← plakietka: pastelowe tło, ciemny tekst
[przypis]{.muted}
```
Dostępne nazwy: `frost cyan blue deep red orange yellow green purple fox`.
Klasa `.bar-X` zmienia kolor ramki lub paska dowolnego bloku (np. `.concept-card .bar-red`).

**Pasy wyróżnień** (div `::: {.klasa}`):

| Klasa | Kolor | Znaczenie |
|---|---|---|
| `.takeaway` | niebieski | główna myśl slajdu |
| `.control-band` | zielony | zabezpieczenie, dobra praktyka |
| `.scenario-intro` | pomarańczowy | scenariusz, przykład |
| `.note-band` | brąz | uwaga, ostrzeżenie |
| `.fox-band` | foxberry | wyróżnienie marki, podsumowanie wykładu |

**Układy:**
- `.card-grid` z `.concept-card`: siatka 3 kart; dodaj `.two-cards` dla 2. Pierwsze zdanie w karcie jako `**Tytuł**`. Paski kolejnych kart: niebieski, foxberry, zielony.
- `.map-grid` z `.map-item`: mapa wykładu, numerowana automatycznie (01, 02, …).
- `.layer-stack` z `.layer-item`: do 4 warstw, schodkowo (np. model warstwowy).
- `.chapter-design` na slajdzie (`## Tytuł {.chapter-design}`): ciemny slajd rozdziału; wewnątrz `.eyebrow`, `.chapter-lead`, `.chapter-trail`.
- `.section-slide`: wyśrodkowany przerywnik.
- `.figure-slide`: slajd z ilustracją.
- `.compact`: mniejszy tekst.
- `.source`: źródła na dole slajdu.
- `.eyebrow`: mała etykieta nad tytułem.
- `.question-band`: pytanie do sali.

**Callouty Quarto** mają kolory palety: `note` niebieski, `tip` zielony, `warning` brąz, `caution` pomarańczowy, `important` czerwony.

**Mermaid** dziedziczy kolory: węzły `$fb-surface`, krawędzie w akcencie. Nie ustawiaj `%%{init: {'theme': …}}%%`.

## 6. Wykresy i ilustracje

- Seria danych (matplotlib, Plotly, ggplot, SVG): kolejność kolorów **bright**:
  `#658ACD` blue, `#BC7890` fox, `#619756` green, `#CC7248` orange, `#B077AB` purple, `#489784` frost, `#AD8455` yellow, `#DA656D` red.
  Czerwień zostaw na koniec albo na „złe” wartości.
- Tło wykresu: przezroczyste albo `#ECEFF4`. Siatka: `#C8CEDA`. Opisy osi: `#3B4252`.
- Wypełnienia obszarów i słupki o dużej powierzchni: kolory **plakietek**, obrys w kolorze bright.
- Ilustracje SVG rysowane od zera: te same zmienne (tekst `#2E3440`, powierzchnie `#E5E9F0`/`#DFE3EA`, linie `#C8CEDA`).

## 7. Typografia

- Zmienne: `$fb-font-sans` (Fira Sans → Inter → systemowy) i `$fb-font-mono` (**Iosevka SS04** → Iosevka SS02 → Iosevka → JetBrains Mono → Menlo).
- Iosevka jest wąska, więc w bloku kodu mieści się więcej znaków w linii. Nie zmniejszaj kodu poniżej 0.7em.
- Fonty są lokalne, nie osadzone. Iosevka ma licencję SIL OFL, więc wolno ją dołączyć do prezentacji jako webfont (`@font-face` w `wyklad.scss`), gdy wykład ma działać na obcym komputerze.
- Rozmiar bazowy: 30 px. Nagłówek `h2` ma podkreślenie w kolorze akcentu, a `h3` to szary pasek z lewą krawędzią w kolorze akcentu.

## 8. Lista kontrolna przed oddaniem wykładu

- [ ] `theme` to `foxberry.scss`, a `highlight-style` to `foxberry.theme`
- [ ] żaden hex pastelowego Nord nie jest kolorem tekstu na slajdzie
- [ ] najwyżej 3 akcenty na slajdzie; znaczenia kolorów spójne w całym wykładzie
- [ ] tekst na plakietkach i pasach jest ciemny (`#2E3440`)
- [ ] informacja nie jest przekazana samym kolorem
- [ ] własne reguły w `wyklad.scss`, nie w plikach Foxberry
