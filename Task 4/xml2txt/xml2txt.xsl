<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>

    <xsl:variable name="title" select="'SALON SAMOCHODOWY'"/>
    <xsl:variable name="title2" select="'DOSTĘPNE SAMOCHODY'"/>
    <xsl:variable name="title3" select="'STATYSTYKI'"/>
    <xsl:variable name="break" select="'|'"/>
    <xsl:variable name="space" select="'                  '"/>
    <xsl:variable name="space2" select="substring($space,1,8)"/>
    <xsl:variable name="line" select="'-------------------------------------------------------------------------------------------------------------------------------------------------------------------'"/>

    <xsl:template match="/Raport">
        <xsl:value-of select="concat($space2,$title,'&#xa;')"/>
        <xsl:value-of select="concat(substring($line,1,160),'&#xa;')"/>
        <xsl:value-of select="concat($title2,'&#xa;','&#xa;')"/>
        <xsl:text> Marka       | Model    | Rok produkcji | Przebieg      | Nadwozie    | Paliwo  | Data przeglądu | Pojemność silnika | Dostępność | Cena      | Zniżka </xsl:text>
        <xsl:value-of select="'&#xa;'"/>
        <xsl:value-of select="concat(substring($line,1,160),'&#xa;')"/>
        <xsl:apply-templates select="Samochod"/>
        <xsl:value-of select="concat(substring($line,1,160),'&#xa;')"/>
        <xsl:value-of select="concat('&#xa;',$title3,'&#xa;','&#xa;')"/>
        <xsl:apply-templates select="Podsumowanie"/>
    </xsl:template>

    <xsl:template match="Samochod">
        <xsl:call-template name="print-cars">
        <xsl:with-param name="Mar" select="concat('&#160;',@Marka, substring($space,1,12 - string-length(@Marka)),$break)"/>
        <xsl:with-param name="Mod" select="concat('&#160;',@Model, substring($space,1,9 - string-length(@Model)),$break)"/>
        <xsl:with-param name="RP" select="concat('&#160;',@Rok_Produkcji, substring($space,1,14 - string-length(@Rok_Produkcji)),$break)"/>
        <xsl:with-param name="Prze" select="concat('&#160;',@Przebieg, substring($space,1,14 - string-length(@Przebieg)),$break)"/>
        <xsl:with-param name="Nad" select="concat('&#160;',@Nadwozie, substring($space,1,12 - string-length(@Nadwozie)),$break)"/>
        <xsl:with-param name="Pal" select="concat('&#160;',@Paliwo, substring($space,1,8 - string-length(@Paliwo)),$break)"/>
        <xsl:with-param name="DP" select="concat('&#160;',@Data_przegladu, substring($space,1,15 - string-length(@Data_przegladu)),$break)"/>
        <xsl:with-param name="PS" select="concat('&#160;',@Pojemnosc_silnika, substring($space,1,18 - string-length(@Pojemnosc_silnika)),$break)"/>
        <xsl:with-param name="Dost" select="concat(@Dostepnosc, substring($space,1,12 - string-length(@Dostepnosc)),$break)"/>
        <xsl:with-param name="Cen" select="concat('&#160;',@Cena, substring($space,1,10 - string-length(@Cena)),$break)"/>
        <xsl:with-param name="Zniz" select="@Znizka"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="print-cars">
        <xsl:param name="Mar"/>
        <xsl:param name="Mod"/>
        <xsl:param name="RP"/>
        <xsl:param name="Prze"/>
        <xsl:param name="Nad"/>
        <xsl:param name="Pal"/>
        <xsl:param name="DP"/>
        <xsl:param name="PS"/>
        <xsl:param name="Dost"/>
        <xsl:param name="Cen"/>
        <xsl:param name="Zniz"/>
        <xsl:value-of select="concat($Mar,$Mod,$RP,$Prze,$Nad,$Pal,$DP,$PS,$Dost,$Cen,$Zniz)"/>
        <xsl:value-of select="'&#xa;'"/>
    </xsl:template>

    <xsl:variable name="name1" select="'Liczba samochodów'"/>
    <xsl:variable name="name2" select="'Liczba aut sedan'"/>
    <xsl:variable name="name3" select="'Liczba aut kombi'"/>
    <xsl:variable name="name4" select="'Liczba aut hatchback'"/>
    <xsl:variable name="name5" select="'Liczba aut compact'"/>
    <xsl:variable name="name6" select="'Liczba aut coupe'"/>
    <xsl:variable name="name7" select="'Liczba aut LPG'"/>
    <xsl:variable name="name8" select="'Liczba aut Diesel'"/>
    <xsl:variable name="name9" select="'Liczba aut Benzyna'"/>
    <xsl:variable name="name10" select="'Średnia cena'"/>
    <xsl:variable name="name11" select="'Średnia zniżka'"/>
    <xsl:variable name="name12" select="'Data wygenerowania raportu'"/>
    <xsl:variable name="break2" select="substring($line,1,60)"/>

    <xsl:template match="Podsumowanie">
        <xsl:call-template name="print-stat">
        <xsl:with-param name="LS1" select="concat('&#160;',$name1, substring($space,1,29 - string-length($name1)))"/>
        <xsl:with-param name="LS2" select="concat($space2,liczbaSamochodow)"/>
        <xsl:with-param name="LAS1" select="concat('&#160;',$name2, substring($space,1,29 - string-length($name2)))"/>
        <xsl:with-param name="LAS2" select="concat($space2,liczbaAutSedan)"/>
        <xsl:with-param name="LAK1" select="concat('&#160;',$name3, substring($space,1,29 - string-length($name3)))"/>
        <xsl:with-param name="LAK2" select="concat($space2,liczbaAutKombi)"/>
        <xsl:with-param name="LAH1" select="concat('&#160;',$name4, substring($space,1,29 - string-length($name4)))"/>
        <xsl:with-param name="LAH2" select="concat($space2,liczbaAutHatchback)"/>
        <xsl:with-param name="LAC1" select="concat('&#160;',$name5, substring($space,1,29 - string-length($name5)))"/>
        <xsl:with-param name="LAC2" select="concat($space2,liczbaAutCompact)"/>
        <xsl:with-param name="LAC21" select="concat('&#160;',$name6, substring($space,1,29 - string-length($name6)))"/>
        <xsl:with-param name="LAC22" select="concat($space2,liczbaAutCoupe)"/>
        <xsl:with-param name="LAL1" select="concat('&#160;',$name7, substring($space,1,29 - string-length($name7)))"/>
        <xsl:with-param name="LAL2" select="concat($space2,liczbaAutLPG)"/>
        <xsl:with-param name="LAD1" select="concat('&#160;',$name8, substring($space,1,29 - string-length($name8)))"/>
        <xsl:with-param name="LAD2" select="concat($space2,liczbaAutDiesel)"/>
        <xsl:with-param name="LAB1" select="concat('&#160;',$name9, substring($space,1,29 - string-length($name9)))"/>
        <xsl:with-param name="LAB2" select="concat($space2,liczbaAutBenzyna)"/>
        <xsl:with-param name="SC1" select="concat('&#160;',$name10, substring($space,1,29 - string-length($name10)))"/>
        <xsl:with-param name="SC2" select="concat($space2,sredniaCena)"/>
        <xsl:with-param name="SZ1" select="concat('&#160;',$name11, substring($space,1,29 - string-length($name11)))"/>
        <xsl:with-param name="SZ2" select="concat($space2,sredniaZnizka)"/>
        <xsl:with-param name="DWR1" select="concat('&#160;',$name12, substring($space,1,29 - string-length($name12)))"/>
        <xsl:with-param name="DWR2" select="concat($space2,dataWygenerowaniaRaportu)"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="print-stat">
        <xsl:param name="LS1"/>
        <xsl:param name="LS2"/>
        <xsl:param name="LAS1"/>
        <xsl:param name="LAS2"/>
        <xsl:param name="LAK1"/>
        <xsl:param name="LAK2"/>
        <xsl:param name="LAH1"/>
        <xsl:param name="LAH2"/>
        <xsl:param name="LAC1"/>
        <xsl:param name="LAC2"/>
        <xsl:param name="LAC21"/>
        <xsl:param name="LAC22"/>
        <xsl:param name="LAL1"/>
        <xsl:param name="LAL2"/>
        <xsl:param name="LAD1"/>
        <xsl:param name="LAD2"/>
        <xsl:param name="LAB1"/>
        <xsl:param name="LAB2"/>
        <xsl:param name="SC1"/>
        <xsl:param name="SC2"/>
        <xsl:param name="SZ1"/>
        <xsl:param name="SZ2"/>
        <xsl:param name="DWR1"/>
        <xsl:param name="DWR2"/>
        <xsl:value-of select="concat($LS1,$break,$LS2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAS1,$break,$LAS2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAK1,$break,$LAK2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAH1,$break,$LAH2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAC1,$break,$LAC2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAC21,$break,$LAC22,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAL1,$break,$LAL2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAD1,$break,$LAD2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($LAB1,$break,$LAB2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($SC1,$break,$SC2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($SZ1,$break,$SZ2,'&#xa;',$break2,'&#xa;')"/>
        <xsl:value-of select="concat($DWR1,$break,$DWR2,'&#xa;',$break2,'&#xa;')"/>
    </xsl:template>

</xsl:stylesheet>

