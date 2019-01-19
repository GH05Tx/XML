<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Samochody" page-height="10in" page-width="15in"
                                       font-family="sans-serif">
                    <fo:region-body region-name="only_region" margin="1in"/>
                </fo:simple-page-master>

                <fo:simple-page-master master-name="Podsumowanie" page-height="15in" page-width="15in"
                                       font-family="sans-serif">
                    <fo:region-body region-name="only_region" margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="Samochody">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20"/>

                        <fo:table border="solid 2pt black">
                            <fo:table-header>
                                <fo:table-row>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Marka</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Model</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Rok produkcji</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Przebieg</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Nadwozie</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Paliwo</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Data przegladu</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Pojemnosc</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Dostepnosc</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Cena</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block font-weight="bold">Znizka</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <xsl:for-each select="Raport/Samochod">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Marka"/>
                                        </fo:block>
                                    </fo:table-cell >
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Model"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Rok_Produkcji"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Przebieg"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Nadwozie"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Paliwo"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Data_przegladu"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Pojemnosc_silnika"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Dostepnosc"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Cena"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                                        <fo:block>
                                            <xsl:value-of select="@Znizka"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                    </xsl:for-each>
                        </fo:table>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="Podsumowanie">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="left" font-weight="bold" font-size="15">Podsumowanie</fo:block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba Samochodow:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaSamochodow"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w sedanie:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutSedan"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w kombi:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutKombi"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w hatchbacku:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutHatchback"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w compacie:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutCompact"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w coupe:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutCoupe"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow :</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutLPG"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w dieslu:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutDiesel"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Liczba samochodow w benzynie:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/liczbaAutBenzyna"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Srednia cena:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="concat(Raport/Podsumowanie/sredniaCena,' ','zł')"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Srednia znizka:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="concat(Raport/Podsumowanie/sredniaZnizka,' ','zł')"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Data wygenerowania raportu:</fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="16em">
                                    <xsl:value-of select="Raport/Podsumowanie/dataWygenerowaniaRaportu"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>