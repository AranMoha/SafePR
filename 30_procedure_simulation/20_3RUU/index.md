---
title: 3RUU Parallel Robot
parent: Simulation
has_children: true
nav_order: 3
---

# 3RUU Parallel Robot

Bedienung der Mini-Delta PKM in der MuJoCo-Simulation und des realen Versuchsstands.
Wenn ein Punkt hier fehlt/falsch ist, dann bitte eine Mail an die untenstehende Adresse.
Aran Mohammad, aran.mohammad@imes.uni-hannover.de

## Repostruktur

Das Repo gliedert sich wie folgt:

- `Koordinatensysteme`:  Koordinatensysteme jedes Freiheitsgrads der PKM als Matlab-Figures

- `Maple`: Symbolische Rechensoftware für Kinematik-, Dynamikmodellierung
  - `Fourier_Polynom_Anregung`: Berechnung einer Fourier-Reihe zur Anregung dynamischer Parameter
  - `MiniDelta`: Implementierung der Kinematik und Dynamik der PKM mit anschließendem Matlab-Export


- `Matlab`: Matlab-Code zur Bedienung der PKM und Nachbearbeitung von Daten
    - `Ausarbeitungsskripte`: Auswertungsskripte von Daten
    - `Funktionen`
      - `Ausarbeitung`: Ploteinstellungen setzen
      - `Beckhoff`: Konfigurationsdateien der Sensoren und Aktoren
      - `Dynamik`: Dynamikfunktionen der PKM     
      - `Filter`: Offline und Online Filterfuntkionen     
      - `Kinematik`: Kinematikfunktionen der PKM      
      - `Klemmstellen`: Jacobi-Matrizen für Kontakte an der Struktur     
      - `Kontakt`: Skripte für Kontaktauswertungen     
    - `pdos`: Konfiguraitonsdatei aller Slaves - Ausgabe auf dem Echtzeitrechner
    - `Postprocessing`: Zusammenfügen der mat-files von Experimenten
    - `Trajektorien`: Trajektoriengenerierung und fertige Trajektorien
    - `Delta_Kin_Controlpanel`: GUI zur Online-Dateneingabe wie Sollwerte und Reglerparameter
    - `PKM_Delta_Versuchsstand_2018`: Simulink-Modell mit der MuJoCo-Simulation und Versuchsstandsschnittstelle
    - `PKM_Delta_Versuchsstand_Init`: Initialisierungsskript mit Pfaden und Parametern

- `MuJoCo`: Enthält Testsimulationen zur Integration alternativer Komponenten, welche jedoch nicht immer funktioniert haben.
    - `3Dstl`: stl-Dateien der MuJoCo-Simulation
    - `mujoco210`: MuJoCo-Dateien für die Integration in Simulink

- `Dokumentation zum Simulinkmodell des Delta.docx`

## Bedienung der Simulation

Zum Starten der MuJoCo-Simulation sind folgende Schritte nötig:

1. Führe das Skript `Matlab/PKM_Delta_Versuchsstand_Sim_Init.m` aus. Die MuJoCo-Animation der PKM sollte erscheinen
2. Falls das Betriebssystem ein anderes als Windows ist, müssen die notwendigen **.mex** Dateien für Matlab generiert werden. Hierzu muss die Datei **MuJoCo/mujoco210/mjxmake.m** in Matlab ausgeführt werden. Vorher müssen jedoch noch die Dateipfade in dieser Datei angepasst werden.
3. Öffne die GUI `Matlab/Delta_Kin_Controlpanel.mlapp`
4. Öffne das Simulink-Modell `Matlab/PKM_Delta_Versuchsstand_2018.slx`
5. Führe das Simulink-Modell `Matlab/PKM_Delta_Versuchsstand_2018.slx`aus
6. In der GUI folgende Eingaben tätigen
    1. **Set Model Name**: Hierin sollte der Name der Simulink-Datei stehen und mit Klick des Buttons bestätigen
    2. **Set Mode of Operation**: Der Eintrag _PD-Regelung_ entspricht der Momentenregelung
    3. **Start**: Der Roboter ist im Default-Zustand (im Zustandsautomaten) und wartet auf eine Eingabge. In diesem Zustand, in der die GUI aktiviert ist, aber die Motoren noch ausgeschaltet sind, kann eine Trajektorie geladen werden und es können Regelparameter des Impedanzreglers verändert werden.
    4. **Enable Drive** und dann **Set Statuswort**: Anschalten der Motoren und simulierte Kommunikation zwischen Master und Slave über Statuswort und Controlword
    5. Jetzt kann eine Zielposition (bestenfalls in Arbeitsraumkoordinaten) mit Betätigung von **Zielposition EE** oder die Startstellung mit **Homeposition** oder eine Trajektorie mit **Trajektorie** gefahren werden. Der Roboter in der MuJoCo-Animation sollte sich bewegen. Verhält sich der Roboter unplanmäßig, wird durch Betätigung des Abbrechen Knopfes der Motor direkt ausgeschaltet.
    6. Sobald die Fahrt fertig ist, dann **Abbrechen** betätigen und wieder Schritt 5.5 befolgen.
    7. Wenn alle Fahrten fertig sind, dann **Abbrechen** (falls noch nicht geschehen) --> **Disable Drive** --> **Stop** und Simulink-Ausführung beenden





## Sonstiges

- Simulink-Version ist in Matlab 2018b
- Weitere Informationen zum Simulink-Modell sind in der Word-Datei `Dokumentation zum Simulinkmodell des Delta.docx`
- Weitere Informationen zur Aktorik/Sensorik oder Bedienung am Versuchsstand sind unter: https://wiki.projekt.uni-hannover.de/imes-projekt-dfg_mrkpkm/start?do=login --> Versuchsstände/Mini-Delta
