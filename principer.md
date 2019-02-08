# Principer Selma-Light
Här dokumenterar vi de olika principer vi kommit fram till under projektets gång. Principerna är indelade i olika området och belyser olika saker, högt och lågt.

## Arkitekturella principer
- Insamlingsstegen är frikopplad från ett kreditärende i LP
- Överföring till LP sker när kund "Ansöker".
- Återanvändning av befintliga tjänster/externa där applicerbart.
- Nya tjänster exponeras med REST-API i json-struktur.
- Anamma Open JDK för runtime (minskad licenskostnad) (?)
- Statussida för kompletteringar och kommunikation

## Utvecklingsprinciper
- Activiti samt processdatabasen blir LH-processspecifik - egen leverabel. Regressionstester har på detta sätt inget beroende.
- Modulärt tänk vid utveckling.
- Automatisk acceptanstester så långt som möjligt.
## Modell- och Metod principer
- Dokumentation görs i Open Banking API standarden.
- Beslut kring swagger: 2.0 eller openapi: 3.0.1 eller högre
- Interaktivitet:
    - 1. klickbar .pdf.
    - 2. Körbar mockup mot sandbox-data
- test
## Affärsmässiga principer
- Kravspecifikationerna ska läggas upp i Jira 
- Testfall ska läggas upp i Jira


