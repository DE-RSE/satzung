all: satzung geschaeftsordnung

# uses https://github.com/dalibo/pandocker
geschaeftsordnung_docker:
	$ docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker:stable de-RSE-e.V._Geschäftsordnung.md --number-sections --pdf-engine=pdflatex -V papersize=a4paper -V geometry:margin=3cm -V lang=de-DE -V fontsize=12pt -V breakurl -V hyphens=URL -V colorlinks -o de-RSE-e.V._Geschäftsordnung.pdf

geschaeftsordnung_pandoc:
	pandoc de-RSE-e.V._Geschäftsordnung.md --number-sections --pdf-engine=pdflatex -V papersize=a4paper -V geometry:margin=3cm -V lang=de-DE -V fontsize=12pt -V breakurl -V hyphens=URL -V colorlinks -o de-RSE-e.V._Geschäftsordnung.pdf

geschaeftsordnung: geschaeftsordnung_pandoc

# uses https://github.com/dalibo/pandocker
satzung_docker:
	$ docker run --rm -u `id -u`:`id -g` -v `pwd`:/pandoc dalibo/pandocker:stable de-RSE-e.V._Satzung.md --number-sections --pdf-engine=pdflatex -V papersize=a4paper -V geometry:margin=3cm -V lang=de-DE -V fontsize=12pt -V breakurl -V hyphens=URL -V colorlinks -o de-RSE-e.V._Satzung.pdf

satzung_pandoc:
	pandoc de-RSE-e.V._Satzung.md --number-sections --pdf-engine=pdflatex -V papersize=a4paper -V geometry:margin=3cm -V lang=de-DE -V fontsize=12pt -V breakurl -V hyphens=URL -V colorlinks -o de-RSE-e.V._Satzung.pdf

satzung: satzung_pandoc
