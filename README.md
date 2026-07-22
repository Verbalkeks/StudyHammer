# StudyHammer

StudyHammer ist eine Flutter-App zum Lernen mit digitalen Lernkarten und
Fragen. Die App ist auf einen einfachen Lernfluss ausgelegt: Inhalte ansehen,
filtern, im Lesemodus durchgehen und es soll einen Quizmodus geben der 
die Fragen in einem Karteikartensystem verwaltet und mit dem Lernfortschritt
entsprechend die Zeiträume bis zur nächsten Wiederhoolung vergrößert um so
die Antworten so langfristig zu festigen. Stichwort: **Leitner-System**

## Was aktuell funktioniert

- Startbildschirm mit Navigation zu Editor, Quizmodus und Lesemodus
- Lesemodus mit Fragenliste und Detailansicht
- Filter für Fragen nach Kategorie, Unterkategorie, Fragetyp und Lernfach
- Detailansicht mit Vor- und Zurück-Navigation
- Darstellung von Single-Choice-, Multiple-Choice-, Wahr/Falsch- und
  Textfragen
- Kategorie-Editor zum Erstellen, Bearbeiten und Löschen von Kategorien
- Lokale Speicherung der App-Daten als JSON-Dateien

## Noch in Arbeit

- Der Quizmodus ist vorbereitet, aber noch nicht umgesetzt.
- Der Fragen-Editor zeigt aktuell noch eine Coming-Soon-Ansicht.
- Unterkategorien können in der Oberfläche noch nicht gepflegt werden.
- CRUD-Funktionen für Fragen und Unterkategorien sind im lokalen Repository
  noch offen.
- Ein automatischer Erstimport von Beispieldaten ist noch nicht eingebaut.

## Technik

Die App ist ein Flutter-Projekt und nutzt:

- `flutter_bloc` für State Management
- `get_it` als Service-Locator für Dependency Injection
- `path_provider` für lokale App-Dateien
- `uuid` für neue IDs

Der Einstiegspunkt liegt in `lib/main.dart`. Dort werden die Dependencies
registriert, die Portrait-Ausrichtung gesetzt und die Routen der App definiert.

## App starten

Voraussetzungen:

- Flutter SDK
- Dart SDK passend zu `pubspec.yaml`
- Ein eingerichtetes Zielgerät, zum Beispiel Chrome, Android Emulator oder
  Windows Desktop
- um zu überprüfen ob alle Vorraussetzungen erfüllt sind folgenden Befehl absetzen
```powershell
flutter doctor
```


Abhängigkeiten installieren:

```powershell
flutter pub get
```

App starten:

```powershell
flutter run
```

Tests ausführen:

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
stabilsten Teil der App. der nächste Sinvolle Schritt ist es weitere Editor-Screens
zu implementieren (Subkategorie, Fragen und Antworten) sowie der den Quizmodus.

## Problematik und Learning

Momentan arbeitet die App mit einem großen Context-Objekt, das alle Kategorien,
Fragen, Antworten und den Lernstand bereithält. Problematisch kann dieses Konzept
werden, wenn ein Nutzer nicht nur Hunderte oder Tausende, sondern Hunderttausende Fragen
und Antworten speichert. Dadurch steigt nicht nur der lokale Speicherbedarf, sondern auch
die Menge der Daten, die bei Dateizugriffen verarbeitet werden muss. Besonders bemerkbar macht
sich das beim Start der App, da zunächst alle Daten geladen und in Objekte umgewandelt werden.

Diese Erkenntnis nehme ich als Learning für zukünftige Projekte mit. Statt ein großes
Context-Objekt dauerhaft bereitzustellen, kann es sinnvoller sein, über das Repository
nur die Daten zu laden, die aktuell benötigt werden. Dieser Ansatz kann allerdings
zusätzlichen Boilerplate-Code und eine komplexere Datenverwaltung mit sich bringen.

Ich habe mich gegen einen grundlegenden Umbau der bestehenden Architektur entschieden,
da das Speichern einer derart großen Menge an Lernstoff nicht dem eigentlichen
Anwendungsfall der App entspricht.
