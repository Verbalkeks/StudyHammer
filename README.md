# StudyHammer

StudyHammer ist eine Flutter-App zum Lernen mit digitalen Lernkarten und
Fragen. Die App ist auf einen einfachen Lernfluss ausgelegt: Inhalte ansehen,
filtern, im Lesemodus durchgehen und es soll einen Quizmodus geben der 
die Fragen in einem Karteikartensystem verwaltet und mit dem Lernfortschritt
entsprechend die Zeitraeume bis zur naechsten Wiederholung vergroessert um so
die Antworten so langfristig zu festigen. Stichwort: **Leitner-System**

## Was aktuell funktioniert

- Startbildschirm mit Navigation zu Editor, Quizmodus und Lesemodus
- Lesemodus mit Fragenliste und Detailansicht
- Filter fuer Fragen nach Kategorie, Unterkategorie, Fragetyp und Lernfach
- Detailansicht mit Vor- und Zurueck-Navigation
- Darstellung von Single-Choice-, Multiple-Choice-, Wahr/Falsch- und
  Textfragen
- Kategorie-Editor zum Erstellen, Bearbeiten und Loeschen von Kategorien
- Lokale Speicherung der App-Daten als JSON-Dateien

## Noch in Arbeit

- Der Quizmodus ist vorbereitet, aber noch nicht umgesetzt.
- Der Fragen-Editor zeigt aktuell noch eine Coming-Soon-Ansicht.
- Unterkategorien koennen in der Oberflaeche noch nicht gepflegt werden.
- CRUD-Funktionen fuer Fragen und Unterkategorien sind im lokalen Repository
  noch offen.
- Ein automatischer Erstimport von Beispieldaten ist noch nicht eingebaut.

## Technik

Die App ist ein Flutter-Projekt und nutzt:

- `flutter_bloc` fuer State Management
- `get_it` als Service-Locator fuer Dependency Injection
- `path_provider` zum erstellen lokaler App-Dateien
- `uuid` fuer neue IDs

Der Einstiegspunkt liegt in `lib/main.dart`. Dort werden die Dependencies
registriert, die Portrait-Ausrichtung gesetzt und die Routen der App definiert.

## App starten

Voraussetzungen:

- Flutter SDK
- Dart SDK passend zu `pubspec.yaml`
- Ein eingerichtetes Zielgeraet, zum Beispiel Chrome, Android Emulator oder
  Windows Desktop
- um zu ueberpruefen ob alle Vorraussetzungen erfuellt sind folgenden Befehl absetzen
```powershell
flutter doctor
```


Abhaengigkeiten installieren:

```powershell
flutter pub get
```

App starten:

```powershell
flutter run
```

Tests ausfuehren:

```powershell
flutter test
```

Statische Analyse:

```powershell
flutter analyze
```

## Entwicklungsstand

StudyHammer ist noch kein fertiges Produkt, sondern ein wachsendes
Flutter-Projekt. Der Lesemodus und die Kategorieverwaltung bilden aktuell den
stabilsten Teil der App. der naechste Sinvolle Schritt ist es weitere Editor-Screens
zu implementieren (Subkategorie, Fragen und Antworten) sowie der den Quizmodus.

## Problematik und Learning

Momentan arbeitet die App mit einem grossen Context-Objekt, das alle Kategorien,
Fragen, Antworten und den Lernstand bereithaelt. Problematisch kann dieses Konzept
werden, wenn ein Nutzer nicht nur Hunderte oder Tausende, sondern Hunderttausende Fragen
und Antworten speichert. Dadurch steigt nicht nur der lokale Speicherbedarf, sondern auch
die Menge der Daten, die bei Dateizugriffen verarbeitet werden muss. Besonders bemerkbar macht
sich das beim Start der App, da zunaechst alle Daten geladen und in Objekte umgewandelt werden.

Diese Erkenntnis nehme ich als Learning fuer zukuenftige Projekte mit. Statt ein grosses
Context-Objekt dauerhaft bereitzustellen, kann es sinnvoller sein, ueber das Repository
nur die Daten zu laden, die aktuell benoetigt werden. Dieser Ansatz kann allerdings
zusaetzlichen Boilerplate-Code und eine komplexere Datenverwaltung mit sich bringen.

Ich habe mich gegen einen grundlegenden Umbau der bestehenden Architektur entschieden,
da das Speichern einer derart grossen Menge an Lernstoff nicht dem eigentlichen
Anwendungsfall der App entspricht.
