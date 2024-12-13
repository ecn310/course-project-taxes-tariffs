## Comprehensive ReadMe: Taxes and Tariffs

This folder contains the reproducibility package for the Research Paper "Taxes and Tariffs" by Dylan Thomas, Umar Bilgrammi, and Kathryn Sarrge

The data being used for this research project is from World Integrated Trade Solution. We analyzed these three time series datasets
- [Taxes on international trade](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-INTT-RV-ZS)
- [Taxes on Goods and Services](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-GSRV-VA-ZS)
- [GDP per capita](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/NY-GDP-PCAP-PP-CD)


### Computational Requirements
- Stata (code was last run with version 16)
- The code was last run on a **Windows 10 computer with 32.0 GB of RAM**

## Instructions to Replicators

### Part 1: Downloading the Data

1. Click on the website links below to view the different datasets
   -  [Taxes on international trade](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-INTT-RV-ZS)
   - [Taxes on Goods and Services](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-GSRV-VA-ZS)
   - [GDP per capita](https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/NY-GDP-PCAP-PP-CD)
2. In the top right of the table hit the thunder grey button that has an arrow pointing downwards then click excel download and save the file
3. Open each excel file and add 'yr' infront of every year (ex. yr1988, yr1989,...yr2022)
     - this is so we can change the dataset from wide into long and then successfully merge the two.
5. Navigate to Stata then click the specific buttons in the following order:
     - file in the menu bar
     - Import
     - Excel Spreadsheet (*.xlsx;*.xls)
     - browse
     - select the excel datasheet you just downloaded
     - check the button that states "Import all data as strings"
     - click OK



### Part 2: Access to the Data
1. Go to the taxes and tariffs team repo found on this website: [https://github.com/ecn310/course-project-taxes-tariffs](https://github.com/ecn310/course-project-taxes-tariffs)
2. Select the Reproducibility Package Folder
3. Inside the Data_Files folder


## List of analysis codes and outputs
The provided code reproduces all the tables and figures in the paper.

| Exhibit | Input dataset | Program | Outputs |
|---------|---------------|---------|---------|
| Figure 1 |  | remove china and final scatterplot with cons int.do | Scatterplotintvscons.png |
|  |  | twowaydevelopedhistintcons.do | twowayhistdevelopedintcons.png |
|  |  | twowaydevelopinghistintcons.do | twowayhistdevelopingintcons.png |
|  |  | twowayhistintcons.do | twowayhistintcons.png |
|  |  |  |  |
