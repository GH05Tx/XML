
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1300" height="700" style="background-color: #b4b8ab">
            <script type="text/ecmascript"> <![CDATA[
var chrtNr = 1;
showDivs(chrtNr);

function move(n) {
  showDivs(chrtNr += n);
}

function currentDiv(n) {
  showDivs(chrtNr = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("charts");

  if (n > x.length) {chrtNr = 1}
  if (n < 1) {chrtNr = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x[chrtNr-1].style.display = "block";
}
	  		]]> </script>
            <xsl:variable name="tmp" select="'Łączna liczba samochodów: '"/>
            <xsl:variable name="liczba" select="Raport/Podsumowanie/liczbaSamochodow"/>
            <xsl:variable name="sedan" select="Raport/Podsumowanie/liczbaAutSedan"/>
            <xsl:variable name="kombi" select="Raport/Podsumowanie/liczbaAutKombi"/>
            <xsl:variable name="hatch" select="Raport/Podsumowanie/liczbaAutHatchback"/>
            <xsl:variable name="compact" select="Raport/Podsumowanie/liczbaAutCompact"/>
            <xsl:variable name="coupe" select="Raport/Podsumowanie/liczbaAutCoupe"/>
            <text x="150" y="55" style="font-family:helvetica; font-weight: bold; font-size:30">
                <animate attributeName="x" attributeType="XML" begin="0s" dur="2s" end="2s" from="0" to="150"/>SALON SAMOCHODOWY</text >
            <text x="0" y="0" style="font-family:helvetica;font-size:15">
                <animateMotion path="M 0 0 L 150 70" dur="2s" begin="0s" end="2s" repeatCount="1" fill="freeze"/>Wykonanie: Jan Klamka &amp; Maciej Pracucik</text>
            <g class="charts">
                <rect x="150" y="100" width="750" height="400" fill="#f9f9f9"/>
                <line x1="150" y1="500" x2="900" y2="500" stroke-width="3" stroke="black"/>
                <line x1="150" y1="500" x2="150" y2="100" stroke-width="3" stroke="black"/>
                <rect  x="200" width="60" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$sedan*50" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$sedan*50" />
                </xsl:attribute>
            </rect>
            <rect x="350" width="60" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$kombi*50" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$kombi*50" />
                </xsl:attribute>
            </rect>
            <rect x="500" width="60" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$hatch*50" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$hatch*50" />
                </xsl:attribute>
            </rect>
            <rect x="650" width="60" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$compact*50" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$compact*50" />
                </xsl:attribute>
            </rect>
            <rect x="800" width="60" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$coupe*50" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$coupe*50" />
                </xsl:attribute>
            </rect>
                <g class="description" style="font-family: helvetica">
                    <text x="200" y="520">Sedan</text><text x="225" y="490" fill="white"><xsl:value-of select="$sedan" /></text>
                    <text x="350" y="520">Kombi</text><text x="375" y="490" fill="white"><xsl:value-of select="$kombi" /></text>
                    <text x="500" y="520">Hatchback</text><text x="525" y="490" fill="white"><xsl:value-of select="$hatch" /></text>
                    <text x="650" y="520">Compact</text><text x="680" y="490" fill="black"><xsl:value-of select="$compact" /></text>
                    <text x="800" y="520">Coupe</text><text x="825" y="490" fill="white"><xsl:value-of select="$coupe" /></text>
                    <text x="160" y="125"><xsl:value-of select="concat($tmp,$liczba)"/></text>
                    <text x="150" y="550" style="font-family: helvetica; font-size: 18;"> Opis: Podział liczby oferowanych samochodów wg rodzaju nadwozia </text>
                </g>
            </g>
            <g class="charts">
                <xsl:variable name="lpg" select="Raport/Podsumowanie/liczbaAutLPG"/>
                <xsl:variable name="diesel" select="Raport/Podsumowanie/liczbaAutDiesel"/>
                <xsl:variable name="benzyna" select="Raport/Podsumowanie/liczbaAutBenzyna"/>

                <rect x="150" y="100" width="750" height="400" fill="#f9f9f9"/>
                <line x1="150" y1="500" x2="900" y2="500" stroke-width="3" stroke="black"/>
                <line x1="150" y1="500" x2="150" y2="100" stroke-width="3" stroke="black"/>
                <rect x="280" width="90" fill="black">
                    <xsl:attribute name="height">
                        <xsl:value-of select="$lpg*30" />
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        <xsl:value-of select="500-$lpg*30" />
                    </xsl:attribute>
                </rect>
                    <rect x="430" width="90" fill="black">
                        <xsl:attribute name="height">
                            <xsl:value-of select="$diesel*30" />
                        </xsl:attribute>
                        <xsl:attribute name="y">
                            <xsl:value-of select="500-$diesel*30" />
                        </xsl:attribute>
                    </rect>
                    <rect x="580" width="90" fill="black">
                        <xsl:attribute name="height">
                            <xsl:value-of select="$benzyna*30" />
                        </xsl:attribute>
                        <xsl:attribute name="y">
                            <xsl:value-of select="500-$benzyna*30" />
                        </xsl:attribute>
                    </rect>
                <g class="description" style="font-family: helvetica">
                <text x="305" y="520">LPG</text><text x="315" y="490" fill="white"><xsl:value-of select="$lpg" /></text>
                <text x="445" y="520">Benzyna</text><text x="470" y="490" fill="white"><xsl:value-of select="$diesel" /></text>
                <text x="600" y="520">Diesel</text><text x="615" y="490" fill="white"><xsl:value-of select="$benzyna" /></text>
                <text x="160" y="125"><xsl:value-of select="concat($tmp,$liczba)"/></text>
                <text x="150" y="550" style="font-family: helvetica; font-size: 18;"> Opis: Podział liczby oferowanych samochodów wg rodzaju paliwa </text>
                </g>
            </g>
            <g class="charts">
                <xsl:variable name="a8_opis" select="concat(Raport/Samochod[@Model='A8']/@Marka,' ',Raport/Samochod[@Model='A8']/@Model)"/>
                <xsl:variable name="a8_cena" select="Raport/Samochod[@Model='A8']/@Cena"/>
                <xsl:variable name="camaro_opis" select="concat(Raport/Samochod[@Model='Camaro']/@Marka,' ',Raport/Samochod[@Model='Camaro']/@Model)"/>
                <xsl:variable name="camaro_cena" select="Raport/Samochod[@Model='Camaro']/@Cena"/>
                <xsl:variable name="mustang_opis" select="concat(Raport/Samochod[@Model='Mustang']/@Marka,' ',Raport/Samochod[@Model='Mustang']/@Model)"/>
                <xsl:variable name="mustang_cena" select="Raport/Samochod[@Model='Mustang']/@Cena"/>
                <rect x="150" y="100" width="750" height="400" fill="#f9f9f9"/>
                <rect x="150" y="500" width="750" height="70" fill="#b4b8ab"/>
                <line x1="150" y1="500" x2="900" y2="500" stroke-width="3" stroke="black"/>
                <line x1="150" y1="500" x2="150" y2="100" stroke-width="3" stroke="black"/>
                <rect x="280" width="90" fill="black">
                    <xsl:attribute name="height">
                        <xsl:value-of select="$a8_cena*0.0015" />
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        <xsl:value-of select="500-$a8_cena*0.0015" />
                    </xsl:attribute>
                </rect>
                <rect x="430" width="90" fill="black">
                    <xsl:attribute name="height">
                        <xsl:value-of select="$camaro_cena*0.0015" />
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        <xsl:value-of select="500-$camaro_cena*0.0015" />
                    </xsl:attribute>
                </rect>
                <rect x="580" width="90" fill="black">
                <xsl:attribute name="height">
                    <xsl:value-of select="$mustang_cena*0.0015" />
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="500-$mustang_cena*0.0015" />
                </xsl:attribute>
                </rect>
                <g class="description" style="font-family: helvetica">
                    <text x="295" y="520"><xsl:value-of select="$a8_opis"/></text>
                    <text x="405" y="520"><xsl:value-of select="$camaro_opis" /></text>
                    <text x="575" y="520"><xsl:value-of select="$mustang_opis"/></text>
                    <text x="290" y="490" fill="white"><xsl:value-of select="concat($a8_cena,' zł')"/></text>
                    <text x="440" y="490" fill="white"><xsl:value-of select="concat($camaro_cena,' zł')" /></text>
                    <text x="590" y="490" fill="white"><xsl:value-of select="concat($mustang_cena,' zł')"/></text>
                    <text x="150" y="550" style="font-family: helvetica; font-size: 18;"> Opis: 3 najdroższe spośród oferowanych samochodów </text>
                </g>
            </g>
            <g class="buttons" style="font-family: helvetica; cursor:pointer;">
                <g style="font-weight: bold; font-size:20">
                    <text class="btn" x="400" y="585" onclick="move(-1)">&lt; Poprzedni</text>
                    <text class="btn" x="600" y="585" onclick="move(1)">Następny &gt; </text>
                </g>
                <g style=" font-size: 22; width: 20px; height: 10px; background-color: grey">
                    <text x="0" y="0" style="font-weight: bold; font-size: 19; cursor: default"><animateMotion path="M 0 0 L 945 250" dur="3s" begin="0s" end="3s" repeatCount="1" fill="freeze"/> WYBIERZ RODZAJ WYKRESU </text>
                    <text onclick="currentDiv(3)" x="0" y="0" style="font-weight: light"><animateMotion path="M 0 0 L 945 280" dur="3s" begin="0s" end="3s" repeatCount="1" fill="freeze"/> &#176; TOP3 najdroższe samochody</text>
                    <text class="btn2" onclick="currentDiv(1)" x="0" y="0"><animateMotion path="M 0 0 L 945 310" dur="3s" begin="0s" end="3s" repeatCount="1" fill="freeze"/> &#176; Podział wg rodzaju nadwozia</text>
                    <text class="btn2" onclick="currentDiv(2)" x="0" y="0"><animateMotion path="M 0 0 L 945 340" dur="3s" begin="0s" end="3s" repeatCount="1" fill="freeze"/> &#176; Podział wg rodzaju paliwa</text>
                </g>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

