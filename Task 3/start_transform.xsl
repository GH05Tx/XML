<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title> SALON SAMOCHODOWY </title>
            </head>
            <body>
                <h1> SALON SAMOCHODOWY </h1>
                <table border="3">
                    <caption><b>SAMOCHODY DOSTĘPNE W SALONIE</b></caption>
                    <tr>
                        <th> Marka </th>
                        <th> Model </th>
                        <th> Rok produkcji </th>
                        <th> Przebieg </th>
                        <th> Nadwozie </th>
                        <th> Paliwo </th>
                        <th> Data przeglądu </th>
                        <th> Pojemność silnika </th>
                        <th> Dostepność </th>
                        <th> Cena </th>
                        <th> Zniżka </th>
                    </tr>
                    <xsl:for-each select="Raport/Samochod">
                        <tr>
                            <td><xsl:value-of select="@Marka"/></td>
                            <td><xsl:value-of select="@Model"/></td>
                            <td><xsl:value-of select="@Rok_Produkcji"/></td>
                            <td><xsl:value-of select="@Przebieg"/></td>
                            <td><xsl:value-of select="@Nadwozie"/></td>
                            <td><xsl:value-of select="@Paliwo"/></td>
                            <td><xsl:value-of select="@Data_przegladu"/></td>
                            <td><xsl:value-of select="@Pojemnosc_silnika"/></td>
                            <td><xsl:value-of select="@Dostepnosc"/></td>
                            <td><xsl:value-of select="@Cena"/></td>
                            <td><xsl:value-of select="@Znizka"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table border="3">
                    <caption><b>PODSUMOWANIE</b></caption>
                    <tr>
                        <th> Liczba samochodów </th>
                        <th> Liczba aut sedan </th>
                        <th> Liczba aut kombi </th>
                        <th> Liczba aut hatchback </th>
                        <th> Liczba aut compact </th>
                        <th> Liczba aut coupe </th>
                        <th> Liczba aut LPG </th>
                        <th> Liczba aut DIESEL </th>
                        <th> Liczba aut BENZYNA </th>
                        <th> Średnia cena </th>
                        <th> Średnia zniżka </th>
                        <th> Data wygenerowania raportu </th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaSamochodow"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutSedan"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutKombi"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutHatchback"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutCompact"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutCoupe"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutLPG"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutDiesel"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/liczbaAutBenzyna"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/sredniaCena"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/sredniaZnizka"/></td>
                        <td><xsl:value-of select="Raport/Podsumowanie/dataWygenerowaniaRaportu"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>