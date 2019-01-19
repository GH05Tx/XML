<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="Raport">

            <xsl:apply-templates select="Projekcik/Samochody"/>

            <xsl:element name="Podsumowanie">
                <xsl:element name="liczbaSamochodow">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod)"/>
                </xsl:element>
                <xsl:element name="liczbaAutSedan">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/nadwozie[@nad='sedan'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutKombi">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/nadwozie[@nad='kombi'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutHatchback">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/nadwozie[@nad='hatchback'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutCompact">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/nadwozie[@nad='compact'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutCoupe">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/nadwozie[@nad='coupe'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutLPG">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/paliwo[@pal='lpg'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutDiesel">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/paliwo[@pal='diesel'])"/>
                </xsl:element>
                <xsl:element name="liczbaAutBenzyna">
                    <xsl:value-of select="count(Projekcik/Samochody/Samochod/paliwo[@pal='benzyna'])"/>
                </xsl:element>
                <xsl:element name="sredniaCena">
                    <xsl:value-of select="round(sum(Projekcik/Samochody/Samochod/cena) div count(Projekcik/Samochody/Samochod)*100) div 100"/>
                </xsl:element>
                <xsl:element name="sredniaZnizka">
                    <xsl:value-of select="round(sum(Projekcik/Samochody/Samochod/znizka) div count(Projekcik/Samochody/Samochod)*100) div 100"/>
                </xsl:element>
                <xsl:element name="dataWygenerowaniaRaportu">
                    <xsl:value-of select="format-dateTime(current-dateTime(),'[D01]-[M01]-[Y0001]')"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="Projekcik/Samochody">
        <xsl:for-each select="Samochod">
            <xsl:element name="Samochod">
            <xsl:attribute name="Marka">
                <xsl:value-of select="marka"/>
            </xsl:attribute>
            <xsl:attribute name="Model">
                <xsl:value-of select="model"/>
            </xsl:attribute>
            <xsl:attribute name="Rok_Produkcji">
                <xsl:value-of select="rok_produkcji"/>
            </xsl:attribute>
            <xsl:attribute name="Przebieg">
                <xsl:value-of select="concat(przebieg,' ',przebieg/@jed)"/>
            </xsl:attribute>
            <xsl:attribute name="Nadwozie">
                <xsl:value-of select="nadwozie/@nad"/>
            </xsl:attribute>
            <xsl:attribute name="Paliwo">
                <xsl:value-of select="paliwo/@pal"/>
            </xsl:attribute>
            <xsl:attribute name="Data_przegladu">
                <xsl:value-of select="data_przegladu"/>
            </xsl:attribute>
            <xsl:attribute name="Pojemnosc_silnika">
                <xsl:value-of select="concat(pojemnosc_silnika,' ',pojemnosc_silnika/@jed)"/>
            </xsl:attribute>
            <xsl:attribute name="Dostepnosc">
                <xsl:value-of select="dostepnosc"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="string(@nadwozie)='sedan'">
                    <xsl:attribute name="Rodzaj_nadwozia">Sedan</xsl:attribute>
                </xsl:when>
                <xsl:when test="string(@nadwozie)='kombi'">
                    <xsl:attribute name="Rodzaj_nadwozia">kombi</xsl:attribute>
                </xsl:when>
                <xsl:when test="string(@nadwozie)='hatchback'">
                    <xsl:attribute name="Rodzaj_nadwozia">Hatchback</xsl:attribute>
                </xsl:when>
                <xsl:when test="string(@nadwozie)='compact'">
                    <xsl:attribute name="Rodzaj_nadwozia">Compact</xsl:attribute>
                </xsl:when>
                <xsl:when test="string(@nadwozie)='coupe'">
                    <xsl:attribute name="Rodzaj_nadwozia">Coupe</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:attribute name="Cena">
                <xsl:value-of select="concat(cena,' ',cena/@wal)"/>
            </xsl:attribute>
            <xsl:attribute name="Znizka">
                <xsl:value-of select="concat(znizka,' ',znizka/@wal)"/>
            </xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>