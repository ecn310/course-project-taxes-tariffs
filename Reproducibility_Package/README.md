## Comprehensive ReadMe: Taxes and Tariffs

This folder contains the reproducibility package for the Research Paper "Taxes and Tariffs" by Dylan Thomas, Umar Bilgrammi, and Kathryn Sarrge

### Computational Requirements
- Stata (code was last run with version 16)
- The code was last run on a **Windows 10 computer with 32.0 GB of RAM**

## Instructions to Replicators

### Downloading the Data

The data being used for this research project is from World Integrated Trade Solution. We analyzed these three time series datasets
- [Taxes on international trade](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-INTT-RV-ZS)
- [Taxes on Goods and Services](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-GSRV-VA-ZS)
- [GDP per capita](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/NY-GDP-PCAP-PP-CD)

To download raw data, use the links above to access the datasets on the WITS website. Then, click the thunder grey button that has an arrow pointing downwards in the top right of the table. We have also saved these excel datasets which can be found in our [Excel_Files](Reproducibility_Package/Excel_Files) folder.

The datasets for source can be found in our [Data_Files](Reproducibility_Package/Data_Files) folder. they are labeled:
- internationaltax
- consumptiontaxreproducible
- gdpdata


## List of analysis codes and outputs
The provided code reproduces all the tables and figures in the paper.

| Exhibit | Input dataset | Program | Outputs |
|---------|---------------|---------|---------|
| Figure 1 |  | remove china and final scatterplot with cons int.do | Scatterplotintvscons.png |
|  |  | twowaydevelopedhistintcons.do | twowayhistdevelopedintcons.png |
|  |  | twowaydevelopinghistintcons.do | twowayhistdevelopingintcons.png |
|  |  | twowayhistintcons.do | twowayhistintcons.png |
|  |  |  |  |
