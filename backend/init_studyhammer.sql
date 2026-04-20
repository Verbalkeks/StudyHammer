DROP TABLE IF EXISTS answer, question, question_type, subcategory, category CASCADE;

CREATE TABLE category (
    id                   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name        VARCHAR(50) NOT NULL,
    category_description VARCHAR
);

CREATE TABLE subcategory (
    id                      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cid                     INT,
    subcategory_name        VARCHAR(50) NOT NULL,
    subcategory_description VARCHAR,
    CONSTRAINT subcategory_fk_category FOREIGN KEY (cid) REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE question_type (
    id                       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_type_name       VARCHAR NOT NULL,
    question_type_description VARCHAR
);

CREATE TABLE question (
    id            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cid           INT,
    scid          INT,
    qtid          INT NOT NULL,
    question_text VARCHAR NOT NULL,
    CONSTRAINT question_fk_category    FOREIGN KEY (cid)  REFERENCES category(id)      ON DELETE SET NULL,
    CONSTRAINT question_fk_subcategory FOREIGN KEY (scid) REFERENCES subcategory(id)   ON DELETE SET NULL,
    CONSTRAINT question_fk_type        FOREIGN KEY (qtid) REFERENCES question_type(id) ON DELETE RESTRICT
);

CREATE TABLE answer (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    qid             INT NOT NULL,
    answer_text     VARCHAR NOT NULL,
    is_right_answer BOOLEAN,
    CONSTRAINT answer_fk_question      FOREIGN KEY (qid)  REFERENCES question(id)      ON DELETE CASCADE
);

INSERT INTO category (category_name, category_description) VALUES
    ('U-Form Lernkarten FIAE AP2 2026', 'Lernkarten zur Vorbereitung auf die FIAE Abschlussprüfung Teil 2 2026');


INSERT INTO question_type (question_type_name, question_type_description) VALUES
    ('multipleChoice', 'Mehrere Antworten können korrekt sein'),
    ('singleChoice',   'Genau eine Antwort ist korrekt'),
    ('boolean',        'Wahr/Falsch Frage'),
    ('shortAnswer',    'Kurze Freitextantwort'),
    ('essay',          'Ausführliche Freitextantwort');


INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen den Begriffen Datenschutz und Datensicherheit?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Beim Datenschutz geht es um den Schutz personenbezogener Daten von natürlichen Personen. Datenschutz zielt darauf ab, die Privatsphäre der Menschen zu schützen und Missbrauch von persönlichen Daten zu verhindern. Gesetze wie die DSGVO definieren, wie Unternehmen personenbezogene Daten behandeln müssen.
Der Bereich Datensicherheit umfasst den Schutz von Daten gegen Verlust, Manipulation, Beschädigung oder unautorisierten Zugriff, unabhängig davon, ob diese Daten einen Personenbezug aufweisen oder nicht.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Betroffenenrechte gibt es laut DSGVO?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die DSGVO nennt folgende Betroffenenrechte:
- Recht auf Information
- Recht auf Auskunft
- Recht auf Berichtigung
- Recht auf Löschung
- Recht auf Einschränkung der Verarbeitung
- Recht auf Datenübertragbarkeit
- Recht auf Widerspruch', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Das Datenschutzrecht basiert auf dem Verbotsprinzip mit Erlaubnisvorbehalt. Erklären Sie dieses Grundprinzip.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Jegliche Erhebung, Verarbeitung und Nutzung von personenbezogenen Daten ist grundsätzlich verboten, außer die Einwilligung des Betroffenen liegt vor oder eine gesetzliche Regelung ist in Kraft.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie den Zusammenhang zwischen dem Prinzip der Zweckbindung, dem Prinzip der Datenminimierung und Speicherbegrenzung im Datenschutz.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Grundprinzip der Zweckbindung besagt, dass personenbezogene Daten nur für den Zweck verwendet werden dürfen, für den sie erhoben worden sind. Hierbei dürfen nur die Daten erfasst werden, welche für den genannten Zweck benötigt werden (Datenminimierung). Wenn die Daten für den Zweck nicht mehr notwendig sind, müssen diese gelöscht werden (Speicherbegrenzung).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Grundsatz der Transparenz und den Grundsatz der Richtigkeit im Datenschutz.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Transparenz: Organisationen müssen jederzeit offen und klar darüber informieren, welche personenbezogene Daten durch wen und zu welchen Zwecken verarbeitet werden.
Richtigkeit: Personenbezogene Daten müssen korrekt sein. Personen haben das Recht, ungenaue oder veraltete Daten korrigieren zu lassen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche besonderen Kategorien personenbezogener Daten werden gemäß der DSGVO definiert?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Besondere Kategorien personenbezogener Daten:
- Ethnische Herkunft
- Politische Meinungen
- Religiöse oder philosophische Überzeugungen
- Gewerkschaftszugehörigkeit
- Genetische Daten
- Biometrische Daten
- Gesundheitsdaten
- Daten zur sexuellen Orientierung', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Hauptaufgaben und Verantwortlichkeiten von Datenschutzbeauftragten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Datenschutzbeauftragte beraten Unternehmen hinsichtlich der Einhaltung von Datenschutzgesetzen, überwachen die Einhaltung, sind Schnittstelle zu Datenschutzaufsichtsbehörden, bearbeiten Anfragen und Beschwerden von Betroffenen und beraten bei Datenschutzfolgenabschätzungen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Die Ziele der Datensicherheit sind Vertraulichkeit, Integrität, Verfügbarkeit und Authentizität. Erläutern Sie diese 4 Begriffe.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Vertraulichkeit: Daten und Systeme dürfen nur berechtigten Personen zugänglich sein.
Integrität: Daten müssen immer korrekt sein und dürfen nicht unbemerkt verändert werden.
Verfügbarkeit: Daten und IT-Systeme müssen für autorisierte Personen nutzbar sein.
Authentizität: Die Echtheit und Vertrauenswürdigkeit von Daten müssen gewährleistet sein.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie drei Aufgaben von IT-Sicherheitsbeauftragten.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Erstellung von Richtlinien zur Informationssicherheit
- Praktische Umsetzung von Maßnahmen der IT-Sicherheit
- Organisation von Schulungen und Trainings
- Bearbeitung von IT-Sicherheitsvorfällen
- Dokumentation und Überwachung der Sicherheitsmaßnahmen', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche gesetzlichen Bestimmungen regeln in der Bundesrepublik Deutschland den Umgang mit personenbezogenen Daten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die DSGVO ist eine europaweit gültige Verordnung für alle EU-Mitgliedsstaaten. Das BDSG-neu ergänzt und konkretisiert die DSGVO. Beide sind gemeinsam gültig, wobei die DSGVO Anwendungsvorrang vor dem BDSG hat.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Womit beschäftigen sich die Standards ISO 27001 und BSI IT-Grundschutz?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Beide sind Standards im Bereich der Informationssicherheit und geben Empfehlungen für den Aufbau eines ISMS. ISO 27001 ist ein internationaler Standard für Unternehmen jeglicher Größe. Der BSI IT-Grundschutz ist ein nationaler deutscher Standard, besonders geeignet für Behörden und KRITIS-Unternehmen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie werden Schutzbedarfskategorien wie "normal", "hoch" und "sehr hoch" verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '"Normal": Begrenzte und überschaubare Schadensauswirkung bei einem Sicherheitsvorfall.
"Hoch": Ein Sicherheitsvorfall würde zu erheblichen Schäden führen oder die Existenz der Organisation bedrohen.
"Sehr hoch": Ein Sicherheitsvorfall würde zu katastrophalen Schäden führen oder existentiell bedrohlich sein.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie jeweils drei Beispiele für geeignete technische und organisatorische Maßnahmen (TOM).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Technische Maßnahmen: Verschlüsselung, Anonymisierung/Pseudonymisierung, Komplexitätsanforderungen für Passwörter.
Organisatorische Maßnahmen: Richtlinien für IT-Nutzung, Verpflichtungserklärung auf das Datengeheimnis, Zugangs- und Zutrittskontrolle.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie was in der DSGVO unter dem Ausdruck "Stand der Technik" zu verstehen ist.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Gemäß Artikel 32 der DSGVO müssen Datenverantwortliche unter Berücksichtigung des Stands der Technik geeignete technische und organisatorische Maßnahmen treffen. Unternehmen müssen die neuesten und effektivsten Sicherheitsmaßnahmen einsetzen. Der "Stand der Technik" ist nicht statisch, sondern entwickelt sich mit dem Fortschritt der Technologie weiter.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den grundsätzlichen Unterschied zwischen der Anonymisierung und der Pseudonymisierung von personenbezogenen Daten.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Anonymisierung: Alle identifizierenden Merkmale werden entfernt, sodass eine Person nicht mehr identifizierbar ist. Irreversibler Prozess.
Pseudonymisierung: Identifizierende Merkmale werden durch ein Pseudonym ersetzt. Reversibler Prozess – mit der richtigen Information kann eine Person identifiziert werden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter dem Begriff Compliance?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Compliance bezieht sich auf die Einhaltung von gesetzlichen Bestimmungen, branchenspezifischen Standards, internen Richtlinien und ethischen Prinzipien durch Unternehmen. Nichteinhaltung kann zu rechtlichen Konsequenzen, finanziellen Verlusten und Reputationsschäden führen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie drei Komplexitätsanforderungen für Passwörter und erklären Sie, warum diese für eine höhere Passwortsicherheit sorgen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Anforderungen: Groß- und Kleinbuchstaben, Zahlen, Sonderzeichen, ausreichende Länge.
Die Verwendung eines großen Zeichenvorrates erhöht die Anzahl möglicher Variationen. Sonderzeichen verhindern die Nutzung von Wörterbuchwörtern. Eine große Länge erhöht den Aufwand bei Brute-Force-Angriffen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie Vorteile und Nachteile der Nutzung von Single Sign-On (SSO).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Vorteile: Einmalige Anmeldung für mehrere Anwendungen, reduziert vergessene Passwörter, zentrale Reaktion auf Sicherheitsvorfälle.
Nachteile: Ausfall des SSO-Dienstes beeinträchtigt alle Anwendungen, technisch komplex, Anbieterabhängigkeit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Unterschied zwischen Zugangskontrolle und Zugriffskontrolle.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Zugangskontrolle (Access Control): Steuert, wer physischen oder virtuellen Zugang zu einer Ressource erhält.
Zugriffskontrolle (Authorization Control): Regelt, was ein Benutzer nach dem Zugang auf einer Ressource machen darf.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist in Bezug auf die Systemsicherheit unter dem Begriff der "Betriebssystemhärtung" zu verstehen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Betriebssystemhärtung umfasst Maßnahmen zur Erhöhung der Sicherheit eines Betriebssystems: nur notwendige Software installieren, Patch-Management, Einschränkung von Zugriffsrechten, Aktivieren von Sicherheitsfunktionen, Nutzung von Firewall und Antivirensoftware, Verschlüsselung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Unter welchen Voraussetzungen ist es einem Spamfilter oder dem Administrator erlaubt, E-Mails auf unerwünschte Inhalte zu überprüfen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'E-Mails fallen unter das Briefgeheimnis. Mitarbeitende müssen über die mögliche Überwachung informiert werden. Eine Kontrolle ist nur zulässig, wenn E-Mail-Dienste ausschließlich beruflich genutzt werden. Bei erlaubter privater Nutzung ist eine Inhaltskontrolle in der Regel nicht zulässig.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist im Bereich der IT-Sicherheit unter einem Honeypot zu verstehen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Honeypot ist ein speziell präpariertes System, das gezielt Angreifer anlocken soll. Es simuliert z.B. einen Rechner oder Netzwerkdienst, um Angriffsmethoden zu studieren, von anderen Systemen abzulenken oder Angreifern eine Falle zu stellen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die Aufgabe einer Sandbox in Bezug auf die IT-Sicherheit.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Sandbox ist eine abgesicherte Umgebung, in der Software oder Code ausgeführt werden kann, ohne dass das umliegende System oder Netzwerk beeinflusst wird. Sie isoliert die Ausführung, damit schädlicher Code keinen Zugriff auf das zugrundeliegende System erhält.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Worin liegt der Unterschied zwischen Datensicherung und Archivierung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Datensicherung: Regelmäßige Kopien von Daten zur Wiederherstellung nach einem Datenverlust.
Archivierung: Langfristige Aufbewahrung von Daten, die nicht mehr aktiv verwendet werden, aber aus rechtlichen oder geschäftlichen Gründen aufbewahrt werden müssen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie anhand eines Beispiels, warum ein RAID keine Datensicherung ersetzt.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein RAID schützt nicht vor: Virenbefall, versehentlich gelöschten oder veränderten Daten, physikalischer Beschädigung durch Feuer, Wasser oder Vandalismus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie Lastenheft und Pflichtenheft hinsichtlich Verfasser, Verwendung und Inhalt.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Lastenheft: Verfasser: Auftraggeber. Verwendung: Grundlage beim Einholen von Angeboten. Inhalt: Alle Anforderungen hinsichtlich des Liefer- und Leistungsumfanges.
Pflichtenheft: Verfasser: Auftragnehmer. Verwendung: Basis für vertraglich festgehaltene Leistungen. Inhalt: Beschreibung der Umsetzung aller Anforderungen aus dem Lastenheft.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind Stakeholder eines Projektes?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Projekt-Stakeholder sind Personen oder Personengruppen, welche aktiv am Projekt beteiligt oder von der Durchführung bzw. dem Ergebnis betroffen sind. Beispiele: Kunden, Auftraggeber, Lieferanten, Mitarbeitende, Projektleitung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen einem Projektstrukturplan und einem Netzplan?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Projektstrukturplan: Zeigt ausschließlich Arbeitspakete hierarchisch als Baumdiagramm, ohne Chronologie und ohne Abhängigkeiten.
Netzplan: Zeigt Abhängigkeiten zwischen Vorgängen. Zeitpuffer und Projektdauer können ermittelt werden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist bei einem Netzplan der Unterschied zwischen dem Gesamtpuffer und dem freien Puffer?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Gesamtpuffer: Zeitspanne, um die ein Vorgang verschoben werden kann, ohne das Projektende zu verschieben.
Freier Puffer: Zeitspanne, um die ein Vorgang verschoben werden kann, ohne den frühesten Anfangszeitpunkt eines Nachfolgers zu verschieben.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welches Merkmal charakterisiert den kritischen Pfad?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Vorgänge auf dem kritischen Pfad haben einen Puffer von 0 Tagen. Die Verschiebung eines solchen Vorganges führt automatisch zur Verschiebung des Projektendes.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie was unter klassischen und agilen Vorgehensmodellen zu verstehen ist.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Klassische Vorgehensmodelle: Sequenziell und plangetrieben, klare Phasenabfolge, umfassende Vorab-Planung.
Agile Vorgehensmodelle: Iterativ und inkrementell, Fokus auf Zusammenarbeit und Flexibilität, kurze Sprints.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie jeweils ein Beispiel für ein klassisches und ein agiles Vorgehensmodell.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Klassisch: Wasserfallmodell, V-Modell, Spiralmodell.
Agil: Scrum, Extreme Programming.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist das Wasserfallmodell in der Softwareentwicklung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Wasserfallmodell ist ein lineares Vorgehensmodell mit aufeinanderfolgenden Phasen: Anforderungsanalyse, Systemdesign, Implementierung, Integration und Testen, Bereitstellung und Wartung. Jede Phase muss vollständig abgeschlossen sein, bevor die nächste beginnt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie unterscheidet sich das Spiralmodell vom Wasserfallmodell?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Wasserfallmodell: Linear, feste Phasen, Änderungen nach Abschluss einer Phase schwierig.
Spiralmodell: Iterativ, sich wiederholende Spirale, beinhaltet Risikomanagement, erlaubt Flexibilität. Geeignet für komplexe Projekte mit unsicheren Anforderungen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die Grundelemente von Scrum.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Scrum ist ein agiles Framework basierend auf Sprints (2-4 Wochen). Rollen: Product Owner (priorisiert), Scrum Master (überwacht Prozess), Entwicklungsteam (führt aus). Nach jedem Sprint wird das Erreichte überprüft und das weitere Vorgehen geplant.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist unter einem Extremwertetest zu verstehen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Beim Extremwertetest liegt der Fokus auf Werten nahe an den Extremwerten der Spezifikation. Ziel ist es, das Systemverhalten an oder jenseits seiner Grenzen zu beobachten und Fehler aufzudecken, die nur unter extremen Bedingungen sichtbar werden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Testverfahren Black-Box- und White-Box-Test.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Black-Box-Test: Die interne Funktionsweise ist unbekannt. Fokus auf Eingaben und Ausgaben zur Prüfung der Funktionalität.
White-Box-Test: Die interne Funktionsweise ist bekannt. Struktur und Design der Software werden untersucht.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Geben Sie die möglichen Vorgehensweisen an, die Fehlersuche mit Hilfe eines Debuggers vorzunehmen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Breakpoints setzen
- Schritt-für-Schritt-Ausführung
- Variablen beobachten
- Stack Inspektion
- Exception Handling
- Logging', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Warum ist Performance-Testing in der Softwareentwicklung wichtig?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Performance-Testing stellt sicher, dass eine Anwendung unter verschiedenen Lastbedingungen effizient funktioniert. Es beantwortet Fragen zur Reaktion unter normaler Last, Skalierbarkeit, Verhalten unter Spitzenlast und identifiziert Engpässe.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie sechs Kriterien zur Bewertung der Qualität von Software.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Benutzbarkeit, Übertragbarkeit, Änderbarkeit, Effizienz, Zuverlässigkeit, Funktionalität, Sicherheit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen den Begriffen Qualitätssicherung und Qualitätskontrolle.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Qualitätssicherung: Proaktiver Prozess zur Fehlervermeidung während der Produktion.
Qualitätskontrolle: Reaktiver Prozess – Prüfung auf Fehler nach der Herstellung durch Tests und Inspektionen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen und erklären Sie die vier Phasen des PDCA-Zyklus.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Plan: Ziele festlegen und Maßnahmen planen.
Do: Maßnahmen implementieren und Daten erfassen.
Check: Ergebnisse überprüfen und mit Zielen vergleichen.
Act: Geeignete Maßnahmen endgültig umsetzen und Plan für nächsten Zyklus aktualisieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was bedeutet es, wenn eine Software als barrierefrei bezeichnet wird?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Barrierefreie Software kann von allen Menschen einschließlich Menschen mit Behinderungen genutzt werden. Beispiele: Bildschirmleseprogramme für Blinde, Untertitel für Gehörlose, Tastatursteuerung statt Maus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter Softwareergonomie und welche Prinzipien können angewendet werden?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Softwareergonomie: Gestaltung von Software auf die menschlichen Fähigkeiten abgestimmt. Prinzipien: Nutzerzentrierung, Einfachheit und Konsistenz, klare Rückmeldung, Anpassbarkeit, Fehlervermeidung und -behandlung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Unterschiede bestehen zwischen strukturierten, semi-strukturierten und unstrukturierten Daten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Strukturierte Daten: Klar definierte Struktur, gut für relationale Datenbanken geeignet.
Semistrukturierte Daten: Gewisse Struktur, z.B. XML und JSON.
Unstrukturierte Daten: Keine spezifische Struktur, z.B. Bilder, Audio- und Videodateien.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie in Bezug auf Datenbanken die Begriffe Primärschlüssel und Fremdschlüssel.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Primärschlüssel: Feld oder Kombination von Feldern, das jede Zeile eindeutig identifiziert. Keine Duplikate oder Nullwerte.
Fremdschlüssel: Verweist auf den Primärschlüssel einer anderen Tabelle, um Beziehungen herzustellen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind Datenbankanomalien und welche Arten können auftreten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Datenbankanomalien führen zu Inkonsistenzen. Arten: Einfügeanomalie, Aktualisierungsanomalie, Löschanomalie. Sie werden durch Normalisierungstechniken vermieden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was bedeutet der Begriff "NULL" in Bezug auf Datenbanken?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'NULL bedeutet, dass ein Feld keinen Wert hat – weder 0 noch Leerzeichen. NULL repräsentiert fehlende oder unbekannte Daten. Arithmetische Operationen mit NULL ergeben NULL. Aggregatfunktionen ignorieren NULL-Werte.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Vorteile bietet die Verwendung einer Versionsverwaltung in der Softwareentwicklung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Nachverfolgung von Änderungen am Quellcode
- Zurücksetzen auf frühere Versionen
- Zusammenarbeit mehrerer Entwickler
- Testen neuer Funktionen ohne Gefährdung des Hauptprojekts
- Transparenz im Entwicklungsprozess', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wozu dient die DTD (Dokumenttyp-Definition) bei der Verwendung von XML-Dateien?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die DTD definiert die Struktur und den Inhalt von XML-Dokumenten. Sie legt Regeln für Elemente, Attribute und deren Beziehungen fest und ermöglicht die Überprüfung der Gültigkeit eines XML-Dokuments.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Informationen kann man aus dem Klassendiagramm ableiten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Klassen und Objekte, Attribute und Operationen, Beziehungen zwischen Klassen, Sichtbarkeit, Kardinalität.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie das Prinzip der Vererbung in der objektorientierten Programmierung.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Vererbung ermöglicht es, neue Klassen (Unterklassen) aus bestehenden Klassen (Oberklassen) zu erzeugen. Eigenschaften und Methoden der Oberklasse werden an die Unterklasse weitergegeben. Fördert Wiederverwendung und Reduzierung von Redundanz.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen Prozeduren und Funktionen in der Programmierung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Funktion: Führt eine Aufgabe aus und gibt in der Regel einen Wert zurück.
Prozedur: Führt eine Aufgabe aus, gibt aber normalerweise keinen Wert zurück.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie unterscheiden sich prozedurale und objektorientierte Programmierung voneinander?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Prozedurale Programmierung: Reihe von Prozeduren, die auf getrennten Daten operieren.
OOP: Daten und Funktionen werden zu Objekten zusammengefasst. Fokus auf Vererbung, Kapselung und Polymorphie.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine Klasse in der objektorientierten Programmierung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Klasse ist ein Bauplan für die Erstellung von Objekten. Sie definiert Eigenschaften (Variablen) und Methoden (Funktionen) und bildet die Grundlage für Vererbung und Polymorphie.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Objekt in der objektorientierten Programmierung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Objekt ist eine konkrete Instanz einer Klasse. Es besitzt die in der Klasse definierten Attribute und Methoden mit eigenen Werten, die seinen Zustand repräsentieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie beeinflussen die Sichtbarkeitsstufen (public, protected, private, package) den Zugriff in der OOP?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '+ public: Zugriff überall erlaubt.
# protected: Zugriff innerhalb der Klasse, des Pakets und von abgeleiteten Klassen.
~ package: Zugriff innerhalb der Klasse und desselben Pakets.
- private: Zugriff nur innerhalb der definierenden Klasse.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter einer Klassenbibliothek in der Softwareentwicklung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Klassenbibliothek ist eine Sammlung von wiederverwendbaren Klassen und Funktionen, die komplexe Funktionalitäten bereitstellen, ohne neu geschrieben werden zu müssen (Frameworks, APIs).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie das Konzept der Modularisierung in der Softwareentwicklung.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Modularisierung zerlegt umfangreichen Code in kleinere, unabhängige Module. Jedes Modul kann unabhängig entwickelt, getestet und überarbeitet werden, was Komplexität reduziert und Wartbarkeit erhöht.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist Künstliche Intelligenz (KI)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'KI bezieht sich auf die Entwicklung von Computern oder Systemen, die menschenähnliche Denk- und Entscheidungsprozesse nachahmen. KI ermöglicht Maschinen, Informationen zu verstehen, zu lernen und Probleme zu lösen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie drei Dienstleistungsmodelle im Cloud-Computing.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- SaaS (Software-as-a-Service): Anwendungen über das Internet.
- IaaS (Infrastructure-as-a-Service): Virtuelle Ressourcen (Server, Speicher) über das Internet.
- PaaS (Platform-as-a-Service): Entwicklungsplattform über das Internet.
- DaaS (Desktop-as-a-Service): Virtueller Desktop über das Internet.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Bereitstellungsarten von Cloud-Diensten können unterschieden werden?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Public Cloud: Vom Cloud-Dienstleister betrieben, öffentlich zugänglich.
Private Cloud: Speziell für ein Unternehmen, hinter einer Firewall.
Hybrid Cloud: Kombination aus Public und Private Cloud.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Penetrationstest und wie wird er durchgeführt?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Penetrationstest ist ein proaktiver Sicherheitstest zur Identifikation von Schwachstellen. Phasen: Informationsbeschaffung, Aufdeckung von Schwachstellen, Ausnutzung, Ergebnisanalyse, Berichterstattung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Pre-Shared Key (PSK) und wo wird er verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein PSK ist ein vorab vereinbarter Schlüssel zur Authentifizierung. Er wird in WLANs als Passwort und in VPNs zur Verschlüsselung und Authentifizierung eingesetzt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Aufbau einer IPv4- und einer IPv6-Adresse.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'IPv4: 32 Bit, vier durch Punkte getrennte Oktette (0-255).
IPv6: 128 Bit, acht durch Doppelpunkte getrennte Hexadezimalblöcke. Unterteilt in Standortpräfix, Teilnetz-ID und Interface-ID.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche IP-Adresse repräsentiert "127.0.0.1" und was ist ihre Bedeutung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '127.0.0.1 ist die "localhost"-Adresse (Loopback). Sie ermöglicht es einem Computer, eine Netzwerkverbindung zu sich selbst herzustellen, ohne Pakete über das physische Netzwerk zu senden. Wird zum Testen des Netzwerk-Stacks verwendet.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine MAC-Adresse?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine MAC-Adresse ist eine eindeutige 48-Bit-Kennung für Netzwerkgeräte in hexadezimaler Notation. Sie besteht aus OUI (Hersteller) und NIC-ID (eindeutige Gerätenummer).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist die Datenübertragungsrate und wie wird sie berechnet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die Datenübertragungsrate gibt an, wie viele Daten innerhalb einer Zeitspanne übertragen werden können.
Formel: Datenübertragungsrate = Datenmenge / Zeitintervall', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie PAN und WLAN.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'PAN (Personal Area Network): Netzwerk im persönlichen Bereich, verbindet Geräte in unmittelbarer Nähe.
WLAN (Wireless Local Area Network): Drahtloses lokales Netzwerk mit größerer Reichweite, basiert auf Wi-Fi-Standard.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Warum spielt Quality of Service (QoS) bei Telefonie- und Videodaten eine wichtige Rolle?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'QoS ermöglicht die Priorisierung bestimmter Datentypen. Telefonie und Video erfordern Echtzeit-Kommunikation und sind empfindlich gegenüber Latenz, Paketverlusten und Jitter.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie die 7 Schichten des OSI-Modells in aufsteigender Reihenfolge.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Bitübertragungsschicht (Physical Layer)
2. Sicherungsschicht (Data Link Layer)
3. Vermittlungsschicht (Network Layer)
4. Transportschicht (Transport Layer)
5. Sitzungsschicht (Session Layer)
6. Darstellungsschicht (Presentation Layer)
7. Anwendungsschicht (Application Layer)', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Aufgaben des First-Level-Supports?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Entgegennahme und Klassifizierung von Supportanfragen, grundlegende Unterstützung, Weiterleitung komplexerer Anfragen, Dokumentation im Ticketsystem, freundliche Kommunikation mit Kunden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen dem 2nd-Level und 3rd-Level Support.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '2nd-Level: Erste Eskalationsstufe, erfahrene Techniker für komplexere Anfragen.
3rd-Level: Höchste Eskalationsstufe, hochspezialisierte Fachleute für komplexeste Probleme.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen einem Syntaxfehler und einem Semantikfehler?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Syntaxfehler: Verstoß gegen die Regeln der Programmiersprache, Programm kann nicht ausgeführt werden.
Semantikfehler: Code ist syntaktisch korrekt, liefert aber falsche oder unerwartete Ergebnisse.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie das Sicherheitsproblem SQL Injection.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'SQL Injection ist eine Sicherheitslücke, bei der Angreifer schädlichen SQL-Code in Abfragen einschleusen, um unbefugt auf Daten zuzugreifen oder Datenbanken zu manipulieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein End-to-End-Test (E2E-Test) und welches Ziel wird verfolgt?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'E2E-Testing überprüft die gesamte Funktionalität einer Anwendung von Anfang bis Ende. Ziel: Sicherstellen, dass alle Systemkomponenten gemeinsam korrekt funktionieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Funktion hat ein Meilenstein im Projektmanagement?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Meilenstein bezeichnet einen wichtigen Zwischenschritt in einem Projekt. Er strukturiert den Projektverlauf, ermöglicht die Messung von Fortschritten und definiert kontrollierbare Zwischenziele.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was bedeutet On-Premises?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'On-Premises bedeutet, dass Software, Server oder IT-Systeme direkt im eigenen Unternehmen betrieben werden – nicht in der Cloud.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie kurz das Speichersystem NAS.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'NAS (Network Attached Storage) ist ein eigenständiger Speicher mit eigener IP-Adresse, der an ein Netzwerk angeschlossen ist. Mehrere Nutzer oder Geräte im Netzwerk können auf die gespeicherten Daten zugreifen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen "Privacy by Design" und "Privacy by Default".');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Privacy by Design: Datenschutz wird bereits im Entwicklungsprozess berücksichtigt und ist fester Bestandteil des Produkts.
Privacy by Default: Datenschutzfreundliche Voreinstellungen sind standardmäßig aktiv, um weniger technikversierte Nutzer zu schützen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist OAuth2 und wofür wird es verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'OAuth 2.0 ist ein offenes Protokoll zur sicheren Delegierung von Zugriffsrechten. Es ermöglicht Drittanbieter-Apps Zugriff auf Benutzerdaten, ohne Anmeldeinformationen preiszugeben. Rollen: Ressourcenbesitzer, Client, Autorisierungsserver, Ressourcenserver.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Autorisierungs-Prozess von OAuth2.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Client fordert Zugriff auf Benutzerdaten an.
2. Benutzer stimmt zu.
3. Client erhält Zugriffstoken vom Autorisierungsserver.
4. Client nutzt das Token für den Zugriff auf den Ressourcenserver.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie: Trojaner, Ransomware, Phishing, DDoS.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Trojaner: Als nützliche Anwendung getarntes Schadprogramm.
Ransomware: Verschlüsselt Daten/Systeme und erpresst Lösegeld.
Phishing: Abgreifen von Anmeldedaten über gefälschte E-Mails oder Websites.
DDoS: Überlastung eines Systems durch Massenabfragen vieler Systeme.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen der differenziellen und der inkrementellen Datensicherung.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Differenziell: Sichert alle Änderungen seit der letzten Vollsicherung. Wiederherstellung: Vollsicherung + letztes differenzielles Backup.
Inkrementell: Sichert alle Änderungen seit dem letzten Sicherungsdurchlauf. Wiederherstellung: Vollsicherung + alle inkrementellen Sicherungen in Reihenfolge.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die Datensicherungsstrategie "Generationenprinzip".');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Mehrere Sicherungen in verschiedenen zeitlichen Abstufungen: täglich (Sohn), wöchentlich (Vater), monatlich (Großvater). Verhindert Totalverlust durch Beschädigung einer einzelnen Sicherung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was besagt die 3-2-1-Regel in Bezug auf die Datensicherung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Mindestens 3 Kopien der Daten
- Mindestens 2 verschiedene Speichermedien
- Mindestens 1 Kopie an einem anderen Ort (Offsite)', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was bedeutet Disaster Recovery in der IT?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'DR umfasst Strategien und Maßnahmen zur Wiederherstellung der IT-Infrastruktur nach Desastern (Naturkatastrophen, Cyberangriffe, Hardwareausfälle). Enthält einen Disaster Recovery Plan (DRP) mit Anweisungen zur Wiederherstellung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie die Bedeutung von RTO und RPO.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'RTO (Recovery Time Objective): Maximale tolerierbare Ausfallzeit nach einem Störfall.
RPO (Recovery Point Objective): Maximale Menge an Daten, die verloren gehen darf, gemessen in Zeiteinheiten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Funktion einer Hot-Spare-Festplatte.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Hot-Spare-Festplatte übernimmt automatisch die Rolle einer ausgefallenen Festplatte im RAID-Verbund. Sie beginnt sofort mit der Wiederherstellung der Daten ohne manuellen Eingriff.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen symmetrischen und asymmetrischen Verschlüsselungsverfahren?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Symmetrisch: Ein Schlüssel für Ver- und Entschlüsselung. Vorteil: schnell. Nachteil: Schlüsselübergabe schwierig.
Asymmetrisch: Schlüsselpaar (Public Key + Private Key). Vorteil: löst Schlüsselübergabeproblem. Nachteil: langsamer.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie ist die Funktionsweise von hybriden Verschlüsselungsverfahren?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die Nachricht wird symmetrisch verschlüsselt. Der verwendete symmetrische Schlüssel wird asymmetrisch verschlüsselt und übertragen. Vereint Geschwindigkeit der symmetrischen und Sicherheit der asymmetrischen Verfahren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Schutzmechanismen beinhaltet das TLS-Protokoll?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Verschlüsselung: hybrides Verschlüsselungsverfahren
- Authentifizierung: digitale Zertifikate
- Integrität: Mechanismen zur Überprüfung der Nachrichtenintegrität', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Zusammenhang zwischen digitalen Signaturen, Hashverfahren und asymmetrischer Kryptografie.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die asymmetrische Kryptografie wird umgekehrt angewandt: Der Sender erzeugt die Signatur mit seinem privaten Schlüssel. Der Empfänger prüft die Signatur mit dem öffentlichen Schlüssel des Senders. Zur Effizienzsteigerung wird nur der Hashwert der Nachricht signiert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie drei Eigenschaften, die ein sicheres Hash-Verfahren aufweisen sollte.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Kleine Änderungen im Eingabetext führen zu großen Änderungen im Hashwert.
- Keine zwei verschiedenen Eingaben dürfen denselben Hashwert erzeugen.
- Rückrechnung auf den Quelltext darf nicht möglich sein.
- Hashwertlänge ist konstant, unabhängig von der Eingabelänge.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist "Salting" in der Kryptographie?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Salting fügt vor dem Hashing eine zufällige Zeichenfolge (Salt) zum Passwort hinzu. Dadurch haben gleiche Passwörter unterschiedliche Hashwerte. Reduziert den Nutzen von Regenbogentabellen und erschwert Brute-Force-Angriffe.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist die Rolle einer Certificate Authority (CA)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine CA ist eine vertrauenswürdige Organisation, die digitale Zertifikate ausstellt und verwaltet. Sie bestätigt die Identität des Inhabers und signiert das Zertifikat mit ihrem privaten Schlüssel.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine Public Key Infrastructure (PKI)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine PKI ist ein Set von Rollen, Richtlinien und Verfahren für die sichere Ausstellung und Verwaltung digitaler Zertifikate. Funktionen: Zertifikatserstellung, -verteilung, -prüfung, -widerruf.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Bestandteile beinhaltet ein digitales Zertifikat nach X.509?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Version, Name des Zertifikatsinhabers, Signaturverfahren, Aussteller (CA), Seriennummer, Gültigkeitsdauer, öffentlicher Schlüssel des Inhabers.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die vier Phasen der Teambildung: Forming, Storming, Norming, Performing.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Forming: Einstiegs- und Findungsphase, neues Team beginnt Zusammenarbeit.
Storming: Konflikte und Störungen in der Zusammenarbeit.
Norming: Entwicklung von Strategien zur Zusammenarbeit.
Performing: Team arbeitet effektiv zusammen und fokussiert auf Ziele.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie zwei Merkmale, die ein Gantt-Diagramm von einem Netzplan unterscheiden.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Tabellarische Darstellung der Vorgänge.
- Konkrete Termine statt nur Zeitdauern.
- Balkenlänge visualisiert die Dauer.
- Pufferzeiten nicht direkt ablesbar.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welchem Ansatz folgen die iterativen Vorgehensmodelle?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Iterative Modelle unterteilen den Entwicklungsprozess in wiederholende Iterationen mit Planungs-, Implementierungs- und Bewertungsphase. Feedback wird zur kontinuierlichen Verbesserung genutzt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Hauptmerkmale des V-Modells in der Softwareentwicklung?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das V-Modell ist sequenziell: Jeder Entwicklungsphase (linke Seite) ist eine Testphase (rechte Seite) zugeordnet. Betont Qualitätssicherung durch parallele Testplanung. Ideal für Projekte mit klaren Anforderungen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein MVP (Minimum Viable Product)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein MVP ist ein grundlegendes Produkt mit minimalen Funktionen, um frühzeitig Nutzerfeedback zu erhalten. Ermöglicht schnelle Markteinführung und iterative Weiterentwicklung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Unterschied zwischen statischen und dynamischen Testverfahren.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Statisch: Programmkomponenten werden nicht ausgeführt. Beispiele: Schreibtischtest, Code Review.
Dynamisch: Testen durch Ausführung in einer Testumgebung. Beispiele: Black-Box-Test, White-Box-Test.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie können Äquivalenzklassen für eine effiziente Auswahl von Testfällen genutzt werden?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eingabedaten werden in Gruppen mit ähnlichem Verhalten aufgeteilt. Ein Testfall pro Klasse deckt repräsentativ alle Szenarien ab, ohne alle Kombinationen testen zu müssen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter einem Code Review?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Code Review ist eine systematische Untersuchung von Quellcode auf Funktionalität, Lesbarkeit, Wartbarkeit und Standards (statisches Testverfahren). Nachteile: zeitaufwändig, subjektiv, Code wird nicht ausgeführt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie das Prinzip der Anweisungsüberdeckung.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Anweisungsüberdeckung zielt darauf ab, jede Anweisung im Code mindestens einmal während des Tests auszuführen. Deckt auch "toten Code" auf, der nie ausgeführt wird.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind Unit-Tests und warum sind sie wichtig?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Unit-Tests prüfen einzelne Codekomponenten isoliert. Sie helfen Fehler frühzeitig zu erkennen und sicherzustellen, dass Codeänderungen keine unerwarteten Probleme verursachen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Eigenschaften sollten Unit-Tests nach dem FIRST-Prinzip erfüllen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Fast: schnell laufen.
Independent: unabhängig voneinander.
Repeatable: unter gleichen Bedingungen stets dasselbe Ergebnis.
Self-Validating: selbst bestimmen ob erfolgreich.
Timely: vor dem Produktivcode definiert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen funktionalen und nichtfunktionalen Anforderungen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Funktionale Anforderungen: Was ein System tun soll (konkrete Funktionen).
Nichtfunktionale Anforderungen: Wie gut das System Aufgaben ausführen soll (Leistung, Zuverlässigkeit, Sicherheit).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Zweck eines Mock-ups im Designprozess?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Mock-up ist ein visuelles Modell eines Produkts. Es dient zur Präsentation von Ideen, zum Sammeln von Feedback und zur Erkennung von Problemen vor der eigentlichen Entwicklung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist Staging-Testing?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Beim Staging-Testing werden Anwendungen in einer der Produktionsumgebung ähnlichen Staging-Umgebung getestet, bevor sie in Produktion gehen. Ziel: Fehler vor dem Live-Betrieb identifizieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie unterscheiden sich Komponententests, Funktionstests und Integrationstests?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Komponententests: Einzelne Komponenten isoliert testen.
Funktionstests: Gesamtes System auf funktionale Anforderungen prüfen.
Integrationstests: Interaktion und Zusammenarbeit zwischen Komponenten prüfen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür steht die Abkürzung KVP im Qualitätsmanagement?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'KVP = Kontinuierlicher Verbesserungsprozess. Permanente Verbesserung von Prozessen, Produkten und Dienstleistungen. Der KVP wird niemals abgeschlossen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie die Grundsätze der Dialoggestaltung in Bezug auf Softwareergonomie.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Aufgabenangemessenheit, Selbstbeschreibungsfähigkeit, Steuerbarkeit, Erwartungskonformität, Fehlertoleranz, Individualisierbarkeit, Lernförderlichkeit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind relationale Datenbanken? Nennen Sie zwei Beispiele für nicht-relationale Datenbanktypen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Relationale Datenbanken speichern Daten in Tabellen mit Primärschlüssel-Fremdschlüssel-Beziehungen.
Nicht-relationale Typen: Dokumentenorientiert, Schlüssel-Wert, Graphdatenbanken.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Data Warehouse?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Data Warehouse ist ein zentralisiertes Repository für Daten aus mehreren Quellen, optimiert für analytische Abfragen. Speichert strukturierte Daten über lange Zeiträume.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Data Lake und wie unterscheidet er sich vom Data Warehouse?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Data Lake speichert große Mengen roher Daten in ihrem ursprünglichen Format – strukturiert und unstrukturiert. Ein Data Warehouse benötigt ein vordefiniertes Schema und speichert nur strukturierte Daten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Datentypen werden in SQL verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'INTEGER, FLOAT/DECIMAL, VARCHAR/CHAR, DATE/TIME/TIMESTAMP, BOOLEAN, BINARY.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist referenzielle Integrität in Bezug auf Datenbanken?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Referenzielle Integrität stellt sicher, dass Fremdschlüsselwerte immer auf gültige Primärschlüsselwerte in der referenzierten Tabelle verweisen und die Konsistenz der Beziehungen gewahrt bleibt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die erste, zweite und dritte Normalform in relationalen Datenbanken.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1NF: Alle Attributwerte sind atomar.
2NF: Alle Nicht-Schlüsselattribute sind vollständig vom Primärschlüssel abhängig.
3NF: Keine transitiven Abhängigkeiten zwischen Nicht-Schlüsselattributen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Schritte sind notwendig, um Datenstrukturen in einem ER-Diagramm zu modellieren?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Entitäten identifizieren
2. Attribute bestimmen
3. Beziehungen identifizieren
4. Kardinalität bestimmen', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Anforderungen sind bei der Ableitung von Tabellen aus einem ER-Diagramm zu beachten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1:1 – Fremdschlüssel in einer der Tabellen.
1:n – Primärschlüssel der "1"-Tabelle als Fremdschlüssel in der "n"-Tabelle.
n:m – Auflösung über eine zusätzliche Zwischentabelle.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine Stored Procedure und welche Vorteile bietet sie?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Stored Procedure ist eine gespeicherte SQL-Anweisung auf dem Datenbankserver. Vorteile: Leistung (einmalige Kompilierung), Wiederverwendbarkeit, Sicherheit, Transaktionskontrolle.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Warum ist die Indizierung von Spalten in einer Datenbank wichtig?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Index ermöglicht schnellen Datenzugriff durch eine sortierte Liste. Verbessert Abfrageleistung erheblich, hat aber Overhead bei Speicherplatz und Schreibvorgängen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen einem Compiler und einem Interpreter?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Compiler: Übersetzt den gesamten Quellcode vorab in Maschinencode.
Interpreter: Führt den Quellcode Zeile für Zeile zur Laufzeit aus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie je ein Beispiel für eine Compiler- und eine Interpretersprache.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Compilersprachen: C, C++, Pascal.
Interpretersprachen: Python, Perl, BASIC.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist JSON und wo wird es verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'JSON (JavaScript Object Notation) ist ein Datenformat für strukturierte Daten in Attribut-Wert-Paaren. Wird häufig in Webanwendungen und APIs eingesetzt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Unterschiede zwischen CSV und XML?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'CSV: Tabellarisches Format, Werte durch Trennzeichen getrennt, keine Hierarchie.
XML: Markup-Sprache mit hierarchischer Struktur, Daten in verschachtelten Tags.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Der UML-Standard unterscheidet zwischen Struktur- und Verhaltensdiagrammen. Nennen Sie jeweils zwei Beispiele.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Strukturdiagramme: Klassendiagramm, Objektdiagramm.
Verhaltensdiagramme: Anwendungsfalldiagramm, Sequenzdiagramm.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Ein UML-Anwendungsfalldiagramm visualisiert einen Ablauf, ist aber keine Ablaufbeschreibung. Erklären Sie diesen Zusammenhang.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Anwendungsfalldiagramm zeigt Akteure, Anwendungsfälle und deren Beziehungen aus Benutzersicht. Es stellt die funktionalen Anforderungen dar, zeigt aber nicht den genauen zeitlichen Ablauf der Interaktionen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was stellt ein Sequenzdiagramm in UML dar?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Sequenzdiagramm zeigt Interaktionen zwischen Objekten in zeitlicher Reihenfolge (oben nach unten). Besteht aus vertikalen Lebenslinien und horizontalen Nachrichten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür wird das UML-Aktivitätsdiagramm genutzt?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Aktivitätsdiagramm stellt Reihenfolge und Bedingungen von Aktivitäten dar. Wird zur Visualisierung von Arbeitsabläufen, Modellierung von Systemverhalten und Darstellung paralleler Abläufe verwendet.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Verwendung des UML-Zustandsdiagramms.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Zustandsdiagramm zeigt den Lebenszyklus eines Objekts durch verschiedene Zustände und Übergänge. Es gibt Aktionen beim Ein- und Austritt aus Zuständen sowie Übergangsbedingungen wieder.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie den Unterschied zwischen Aggregation und Komposition in UML-Klassendiagrammen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Aggregation: Lose Beziehung – das Ganze kann ohne die Teile existieren.
Komposition: Starke Beziehung – die Teile können nur als Teil des Ganzen existieren. Wird das Ganze zerstört, werden auch die Teile zerstört.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'In welchem Zusammenhang steht Datenkapselung mit Datenintegrität und Code-Wartbarkeit?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Datenkapselung verbirgt Daten vor direktem externen Zugriff. Nur öffentliche Methoden können auf interne Daten zugreifen. Dies schützt die Datenintegrität und verbessert die Code-Wartbarkeit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine generische Klasse?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine generische Klasse kann auf Typen arbeiten, die beim Erstellen einer Instanz spezifiziert werden. Ermöglicht Code-Wiederverwendung und Typsicherheit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter dem Konzept der Polymorphie?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Polymorphie ermöglicht es Objekten, sich abhängig von ihrem Typ unterschiedlich zu verhalten. Klassen können Methoden teilen, aber die Implementierungen variieren je nach Klasse. Die spezifische Implementierung wird zur Laufzeit bestimmt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen der Deklaration und der Initialisierung von Variablen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Deklaration: Variable wird durch Typ und Name definiert, Speicherplatz wird reserviert, aber kein Wert zugewiesen.
Initialisierung: Der deklarierten Variable wird ein erster Wert zugewiesen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Unterschiede zwischen rekursiver und iterativer Vorgehensweise?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Iterativ: Wiederholung durch Schleifenstrukturen (for, while). Einfacher, weniger Speicher.
Rekursiv: Funktion ruft sich selbst auf. Eleganter für bestimmte Probleme, aber höherer Speicherverbrauch.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie können CI/CD implementiert werden?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. SCM: Versionskontrollsystem nutzen.
2. Automatische Kompilierung bei Änderungen.
3. Automatisierte Tests nach dem Build.
4. Automatisierte Bereitstellung nach erfolgreichem Test.
5. Monitoring und Feedback.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie arbeitet der Bubble-Sort-Algorithmus?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Benachbarte Elemente werden verglichen und getauscht, wenn sie in der falschen Reihenfolge sind. Dieser Vorgang wird wiederholt, bis die gesamte Liste sortiert ist.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreibe den Ablauf des Suchalgorithmus "Lineare Suche".');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Erstes Element prüfen.
2. Übereinstimmung? Suche beenden.
3. Nein: zum nächsten Element.
4. Wiederholen bis gefunden oder Liste erschöpft.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie funktioniert die binäre Suche?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Die binäre Suche vergleicht den Suchwert mit dem mittleren Element einer sortierten Liste und halbiert den Suchbereich rekursiv. Benötigt max. log2(n) Vergleiche. Setzt sortierte Liste voraus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die einzelnen Schritte der binären Suche.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Mittleres Element finden.
2. Mit Suchwert vergleichen.
3. Gleich: Suche abgeschlossen.
4. Kleiner: linke Hälfte weitersuchen.
5. Größer: rechte Hälfte weitersuchen.
6. Wiederholen bis gefunden oder Liste leer.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Komponenten umfasst das MVC-Muster und wie interagieren sie?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Model: Daten und Geschäftslogik.
View: Präsentation für den Benutzer.
Controller: Verarbeitet Benutzereingaben und aktualisiert Model.
Ablauf: Benutzer → View → Controller → Model → View.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie den Begriff Datenbindung (Data Binding).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Datenbindung verbindet Model und View. Einweg: Daten fließen nur vom Model zur View. Zweiweg: Änderungen in View aktualisieren auch das Model und umgekehrt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Aufgabe des Singleton Pattern.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Singleton-Muster beschränkt die Instanziierung einer Klasse auf genau ein Objekt und stellt einen globalen Zugangspunkt bereit. Nützlich für geteilte Ressourcen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine REST-API?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine REST-API nutzt Standard-HTTP-Methoden (GET, POST, PUT, DELETE) für zustandslose Interaktion mit Ressourcen, die durch eindeutige URLs identifiziert werden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die wichtigsten Architekturrichtlinien für eine REST-API?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Client-Server-Trennung, Zustandslosigkeit, Caching, einheitliche Schnittstelle, Mehrschichtsystem, Code-on-Demand (optional).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen verlustfreier und verlustbehafteter Datenkompression.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Verlustfrei: Alle Daten bleiben erhalten, vollständige Wiederherstellung möglich.
Verlustbehaftet: Einige Informationen gehen verloren, höhere Kompressionsrate, keine vollständige Wiederherstellung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Unterschied zwischen Paketfilter-Firewall und Applikationsfilter-Firewall.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Paketfilter: Analysiert Header auf Netzwerkebene (IP, Port). Einfache Regelbasierte Entscheidungen.
Applikationsfilter: Analysiert Inhalt auf Anwendungsschicht, erkennt spezifische Angriffsmuster.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist eine Next-Generation Firewall (NGFW)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine NGFW kombiniert traditionelle Firewall-Funktionen mit IDS/IPS, Content-Filtering und Anwendungssteuerung für erweiterte Bedrohungserkennung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Aspekte werden bei einem Device Security Check überprüft?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Betriebssystem und Firmware, Benutzerkonten und Zugriffsrechte, Netzwerkkonfiguration, Anwendungen und Dienste, physische Sicherheit, Verschlüsselung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür steht die Abkürzung RADIUS?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'RADIUS = Remote Authentication Dial-In User Service. Protokoll zur Authentifizierung, Autorisierung und Abrechnung von Netzwerkzugriffen, häufig in WLANs eingesetzt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür stehen die drei A in RADIUS (AAA)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Authentication (Authentifizierung): Identitätsprüfung vor dem Netzwerkzugang.
Authorization (Autorisierung): Steuerung der Zugriffsrechte nach der Authentifizierung.
Accounting: Protokollierung der Benutzeraktivitäten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie Standortpräfix, Teilnetz-ID und Interface-ID einer IPv6-Adresse.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Standortpräfix: Identifiziert das Netzwerk/Subnetz, vom ISP zugewiesen.
Teilnetz-ID: Identifiziert Teilnetze, von Admins definiert.
Interface-ID: Identifiziert ein bestimmtes Gerät im Subnetz.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie drei Vorteile von IPv6 gegenüber IPv4.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '- Größerer Adressraum
- Automatische Adresskonfiguration
- Integriertes IPsec für bessere Sicherheit
- Unterstützung für QoS
- Vereinfachtes Routing', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen TCP und UDP?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'TCP: Verbindungsorientiert, zuverlässige Übertragung, Fluss- und Überlastkontrolle.
UDP: Verbindungslos, keine Zuverlässigkeitsgarantie, geringere Latenz. Geeignet für Echtzeitkommunikation.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Begriffe Routing und Switching.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Routing: Weiterleitung von Paketen zwischen verschiedenen Netzwerken anhand von IP-Adressen.
Switching: Weiterleitung von Paketen innerhalb desselben Netzwerks anhand von MAC-Adressen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was steht hinter DNS und was ist seine Hauptaufgabe?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'DNS = Domain Name System. Dezentrales System zur Auflösung von Domainnamen in IP-Adressen. Funktioniert hierarchisch mit Root-DNS-Servern an der Spitze.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Proxy-Server und wozu wird er verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Proxy-Server vermittelt zwischen Client und Zielserver. Er kann Datenverkehr überwachen, filtern, umleiten oder anonymisieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Unterschiede zwischen LAN, MAN, WAN und GAN?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'LAN: Lokales Netzwerk in begrenztem Bereich.
MAN: Netzwerk über eine Stadt.
WAN: Weitläufiges Netzwerk über große Entfernungen.
GAN: Globales Netzwerk über den gesamten Globus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie zwei Vorteile des Einsatzes von VLANs.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Logische Segmentierung des Netzwerks, unterschiedliche Sicherheitsrichtlinien je VLAN, kleinere Broadcastdomänen, bessere Verwaltung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen statischen und dynamischen VLANs?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Statisch: Manuell konfiguriert, feste Port-VLAN-Zuordnung.
Dynamisch: Automatische Zuordnung basierend auf MAC-Adresse oder anderen Merkmalen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind tagged Ports?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Tagged Ports verarbeiten Datenverkehr mehrerer VLANs. Paketen werden VLAN-Tags hinzugefügt, die anzeigen, zu welchem VLAN sie gehören.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Aufgaben des IPsec Protokolls.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'IPsec ist eine Protokollsuite auf Netzwerkschicht. Bietet Verschlüsselung, Authentifizierung und Integritätssicherung von IP-Paketen für sichere Übertragung über unsichere Netzwerke.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Schichten des OSI-Modells gehören zu den transportorientierten Schichten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Bitübertragungsschicht: physische Übertragung.
Sicherungsschicht: fehlerfreie Übertragung zwischen benachbarten Geräten.
Vermittlungsschicht: Adressierung und Routing.
Transportschicht: Zuordnung zu Anwendungen, Reihenfolge, Integrität.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Schichten des OSI-Modells gehören zu den anwendungsorientierten Schichten?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Sitzungsschicht: Sitzungen zwischen Anwendungen verwalten.
Darstellungsschicht: Datenrepräsentation, Kompression, Verschlüsselung.
Anwendungsschicht: Anwendungen und Dienste für Endbenutzer.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Nennen Sie Protokolle der Vermittlungsschicht und Transportschicht des OSI-Modells.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Vermittlungsschicht: IP, IPSec, ICMP.
Transportschicht: TCP, UDP.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Ordnen Sie Hub, Bridge, Router, Switch und Repeater den OSI-Schichten zu.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Bitübertragungsschicht: Hub, Repeater.
Sicherungsschicht: Layer2-Switch, Bridge.
Vermittlungsschicht: Router, Layer3-Switch.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür wird das Network File System (NFS) verwendet?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'NFS ermöglicht in Unix/Linux-Umgebungen den transparenten Zugriff auf entfernte Dateisysteme über ein Netzwerk, als wären sie lokal gespeichert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist die Aufgabe des SMB-Protokolls?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'SMB (Server Message Block) ist das Standard-Dateifreigabeprotokoll in Windows-Netzwerken. Es ermöglicht die gemeinsame Nutzung von Dateien, Druckern und Ressourcen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie den Begriff Service Level Agreement (SLA).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein SLA ist eine schriftliche Vereinbarung zwischen Dienstleister und Kunde, die Leistungsparameter (Qualität, Reaktionszeiten, Verfügbarkeit) festlegt. Dient als Grundlage zur Bewertung der Servicequalität.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welchem Zweck dienen Standard Operating Procedures (SOP)?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'SOPs sind schriftliche Anweisungen für spezifische Aufgaben oder Prozesse. Sie gewährleisten Einheitlichkeit, Effizienz und Qualitätskontrolle in organisatorischen Abläufen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist das ITIL-Framework?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'ITIL (Information Technology Infrastructure Library) ist ein Framework für IT-Service-Management (ITSM) mit Best Practices zur Verbesserung von IT-Services und Kundenzufriedenheit. Weltweiter Industriestandard.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wer muss bei einer Datenschutzverletzung informiert werden?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Datenschutzbehörde: innerhalb von 72 Stunden.
2. Betroffene Einzelpersonen: wenn hohes Risiko für ihre Rechte und Freiheiten besteht.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter einer User Story?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine User Story erfasst Anforderungen benutzerzentriert in der Form: "Als [Rolle] möchte ich [Funktion], damit ich [Ziel] erreichen kann." Fokussiert auf den Wert für den Benutzer.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist das Ziel eines Regressionstests?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Regressionstests prüfen, ob neue Änderungen unerwünschte Auswirkungen auf bestehende Funktionen haben. Sichern Stabilität nach Updates.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die grundlegenden Operationen des Akronyms CRUD?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Create: Neue Daten erstellen.
Read: Daten abrufen.
Update: Daten ändern.
Delete: Daten entfernen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist ein Man-in-the-Middle-Angriff und wie schützt man sich?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein MitM-Angriff schaltet einen Angreifer unbemerkt in die Kommunikation zweier Parteien. Schutz: Verschlüsselung, Zertifikatsprüfung, MFA, sichere Netzwerke.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter cyber-physischen Systemen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Cyber-physische Systeme verbinden physische Komponenten (Maschinen, Sensoren) mit digitaler Steuerung und Kommunikation. Sie arbeiten in Echtzeit und reagieren auf ihre Umgebung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür steht die Abkürzung ODBC?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'ODBC = Open Database Connectivity. Standardisierte Schnittstelle für datenbanktyp-unabhängige SQL-Abfragen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie unterscheiden sich Selection Sort und Insertion Sort?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Selection Sort: Sucht in jedem Durchlauf das kleinste Element und tauscht es an die richtige Position.
Insertion Sort: Fügt jedes Element an der richtigen Stelle in den bereits sortierten Teil ein.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist das Factory Pattern und welchen Vorteil bietet es?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Factory Pattern lagert die Objekterzeugung in eine eigene Methode/Klasse aus. Vorteile: Entkopplung, leichtere Erweiterbarkeit, bessere Wartbarkeit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind Erzeugungs-, Struktur- und Verhaltensmuster?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Erzeugungsmuster: Flexible Objektinstanziierung (Factory, Singleton).
Strukturmuster: Klassenverbindungen zu größeren Strukturen (Adapter, Decorator).
Verhaltensmuster: Kommunikation zwischen Objekten (Observer, Strategy).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Begriff Change Request Management.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Change Request Management ist der geregelte Umgang mit Änderungsanfragen. Änderungen werden geplant, geprüft und dokumentiert umgesetzt, um Systemstabilität zu wahren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie die Vorteile von SAN gegenüber NAS.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Höhere Leistung, blockorientiertes Arbeiten, bessere Skalierbarkeit, Online-Erweiterung von Volumes, erweiterte Redundanz- und Fehlertoleranzfunktionen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Worin liegt der Unterschied zwischen MTBF und MTTF?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'MTBF (Mean Time Between Failures): Durchschnittliche Zeit zwischen reparierbaren Ausfällen.
MTTF (Mean Time to Failure): Durchschnittliche Zeit bis zum ersten Ausfall bei nicht reparierbaren Geräten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Treffen Sie Aussagen zu RAID 0, 1, 5, 6 und 10 (Mindestanzahl HDD, Ausfallsicherheit, Nutzkapazität).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'RAID 0: mind. 2 HDD, keine Ausfallsicherheit, Kapazität = n * HDD.
RAID 1: mind. 2 HDD, 1 HDD darf ausfallen, Kapazität = (n/2) * HDD.
RAID 5: mind. 3 HDD, 1 HDD darf ausfallen, Kapazität = (n-1) * HDD.
RAID 6: mind. 4 HDD, 2 HDD dürfen ausfallen, Kapazität = (n-2) * HDD.
RAID 10: mind. 4 HDD, 1 HDD/Subraid darf ausfallen, Kapazität = (n/2) * HDD.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die Bedeutung von DES, 3DES, AES128, AES256, SHA256, MD5.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'DES/3DES: Symmetrische Verschlüsselung. DES unsicher, 3DES dreifache Anwendung.
AES128/256: Symmetrisch, 128 bzw. 256 Bit Schlüssellänge.
SHA256: Hashverfahren, 256 Bit.
MD5: Hashverfahren, 128 Bit, gilt als unsicher.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erläutern Sie die Methode des Blue-Green Deployments.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Zwei identische Umgebungen: Blue (aktuelle Produktion) und Green (neue Version). Nach erfolgreichem Test wird Datenverkehr von Blue auf Green umgeleitet. Bei Problemen schnelles Zurückschalten auf Blue möglich.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie funktionieren Trigger in Datenbankumgebungen?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Trigger ist eine Stored Procedure, die automatisch bei bestimmten Ereignissen (INSERT, UPDATE, DELETE) in einer Tabelle ausgeführt wird.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was versteht man unter dem Begriff "Transaktion" im Kontext von SQL?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Eine Transaktion ist eine Gruppe zusammengehöriger SQL-Anweisungen, die als Einheit behandelt werden. ACID-Prinzip: Atomarität, Konsistenz, Isolation, Dauerhaftigkeit.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie die SQL-Befehle BEGIN TRANSACTION, COMMIT und ROLLBACK.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'BEGIN TRANSACTION: Startet eine Transaktion.
COMMIT: Schließt die Transaktion ab, speichert alle Änderungen dauerhaft.
ROLLBACK: Macht alle Änderungen der aktuellen Transaktion rückgängig.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind SQL Joins? Erklären Sie INNER, LEFT, RIGHT und FULL JOIN.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'INNER JOIN: Nur übereinstimmende Zeilen beider Tabellen.
LEFT JOIN: Alle Zeilen der linken + übereinstimmende der rechten Tabelle.
RIGHT JOIN: Alle Zeilen der rechten + übereinstimmende der linken Tabelle.
FULL JOIN: Alle Zeilen, bei Übereinstimmung in einer der Tabellen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was sind die Unterschiede zwischen einer "well-formed" und einer "valid" XML-Datei?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Well-formed: Erfüllt XML-Syntaxregeln, kann von Parser gelesen werden.
Valid: Erfüllt zusätzlich die Regeln einer DTD oder eines XML-Schemas.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie werden abstrakte Klassen verwendet und welche Vorteile bieten sie?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Abstrakte Klassen können nicht instanziiert werden und enthalten abstrakte Methoden, die von Unterklassen implementiert werden müssen. Vorteile: gemeinsame Schnittstelle, Code-Wiederverwendung, Erzwingung von Methoden, Polymorphismus.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist die Rolle eines Konstruktors in der OOP?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Ein Konstruktor ist eine spezielle Methode, die beim Erstellen eines Objekts automatisch aufgerufen wird. Er initialisiert das Objekt. Hat den gleichen Namen wie die Klasse und keinen Rückgabewert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Vorteile bietet eine 3-Schichten-Architektur?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Klare Trennung von Präsentation, Logik und Datenzugriff. Bessere Wartbarkeit, Skalierbarkeit jeder Schicht, erleichterte Wiederverwendbarkeit von Komponenten.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist das Observer Muster?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Das Observer Muster ist ein Verhaltensmuster mit Einwegabhängigkeit: Wenn ein Subjekt seinen Zustand ändert, werden alle registrierten Observer automatisch benachrichtigt und aktualisiert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wie funktioniert das Observer Muster?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), '1. Registrierung: Observer melden sich beim Subjekt an.
2. Änderung: Subjekt ändert Zustand.
3. Benachrichtigung: Subjekt ruft update() aller Observer auf.
4. Abmeldung: Observer können sich jederzeit abmelden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist SOAP und wie wird es eingesetzt?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'SOAP (Simple Object Access Protocol) ist ein XML-basiertes Protokoll für den Austausch strukturierter Informationen in Webdiensten. Transportprotokoll-unabhängig (HTTP, SMTP, FTP).', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wofür steht ARP in der Netzwerktechnik?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'ARP = Address Resolution Protocol. Löst IP-Adressen in MAC-Adressen auf. Wird hauptsächlich in IPv4-Netzwerken eingesetzt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie DHCP und nennen Sie drei übertragbare Informationen.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'DHCP (Dynamic Host Configuration Protocol) weist Netzwerkkonfigurationen automatisch zu. Übertragbare Informationen: IP-Adresse, Subnetzmaske, Standardgateway, DNS-Server, NTP-Server.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den DHCP-Ablauf nach dem DORA-Prinzip.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Discover: Gerät sucht per Broadcast nach DHCP-Servern.
Offer: Server bietet IP-Adresse an.
Request: Gerät wählt ein Angebot aus.
Acknowledgement: Server bestätigt die Zuweisung.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Für welche Aufgaben wird ein Reverse-Proxy Server eingesetzt?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Load Balancing, Caching, Verschlüsselung, Schutz der Back-End-Server-Identität, Datenkompression.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche verschiedenen VPN-Modelle gibt es?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'End-to-Site (Remote Access): Einzelnutzer mit privatem Netzwerk.
Site-to-Site (LAN-to-LAN): Verbindet zwei Netzwerke.
End-to-End: Von Endpunkt zu Endpunkt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Was ist der Unterschied zwischen Tunnelmodus und Transportmodus bei VPNs?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Tunnelmodus: Gesamtes IP-Paket wird verschlüsselt und in neues Paket eingekapselt.
Transportmodus: Nur die Nutzlast wird verschlüsselt, IP-Header bleibt unverschlüsselt.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Sicherheitsvorteile bietet ZTNA gegenüber traditionellen VPNs?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Mikrosegmentierung, identitäts- und kontextbasierte Richtlinien, reduzierte Angriffsfläche, Always-On-Sicherheit, Echtzeitüberwachung und adaptive Reaktionen.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Beschreiben Sie den Unterschied zwischen Zweigüberdeckung und Pfadüberdeckung.');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Zweigüberdeckung: Alle Entscheidungszweige müssen getestet werden.
Pfadüberdeckung: Jeder mögliche Pfad durch das Programm muss mindestens einmal ausgeführt werden.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Erklären Sie den Unterschied zwischen Offline USV (VFD) und Line Interactive USV (VI).');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Offline USV (VFD): Schaltet bei Stromausfall auf Batterie um, kurze Unterbrechung möglich.
Line Interactive USV (VI): Zusätzliche Spannungsregulierung, kann kleinere Schwankungen ohne Batterienutzung korrigieren.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Welche Aufgaben übernehmen Switch, Bridge und Router im Netzwerk?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Switch: LAN-Verbindung, OSI-Schicht 2, MAC-Adressen-basiert.
Bridge: Verbindet Netzwerksegmente, OSI-Schicht 2, MAC-Adressen-basiert.
Router: Verbindet verschiedene Netzwerke, OSI-Schicht 3, IP-Adressen-basiert.', NULL);

INSERT INTO question (cid, scid, qtid, question_text) VALUES (1, NULL, 5, 'Wozu dienen Branches, Pull, Push und Merge im Versionsmanagement?');
INSERT INTO answer (qid, answer_text, is_right_answer) VALUES (currval('question_id_seq'), 'Branch: Unabhängige Entwicklungslinie.
Pull: Änderungen vom Remote-Repository holen.
Push: Lokale Änderungen zum Remote-Repository senden.
Merge: Zwei Branches zusammenführen.', NULL);