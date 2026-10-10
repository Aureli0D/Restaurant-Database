/*
    RESTAURANT DATABASE PROJECT
    File: 03_queries.sql
    Database: DatabaseIB
    Description: Queries for restaurant management and reporting
*/

USE [DatabaseIB];
GO

/* =====================================================
   1. Display all customers
   ===================================================== */
SELECT *
FROM dbo.KLIENTI;
GO

/* =====================================================
   2. Display all menu products with their categories
   ===================================================== */
SELECT
    P.PRODUKT_ID,
    P.PRODUKT_EMR,
    K.EMER_KAT AS KATEGORIA,
    P.CMIMI AS CMIMI_ALL
FROM dbo.PRODUKTE_MENU P
INNER JOIN dbo.KATEGORIA_MENU K
    ON P.KATEGORI_ID = K.KATEGORI_ID
ORDER BY K.EMER_KAT, P.PRODUKT_EMR;
GO

/* =====================================================
   3. Display orders with customer and staff information
   ===================================================== */
SELECT
    O.POROSI_ID,
    K.EMR_MBI AS KLIENTI,
    S.EMR_MBI AS PUNONJESI,
    O.TAVOLIN_ID,
    O.POROSI_DAT,
    O.STATUSI
FROM dbo.POROSI O
INNER JOIN dbo.KLIENTI K
    ON O.KLIENT_ID = K.KLIENT_ID
INNER JOIN dbo.STAFI S
    ON O.STAF_ID = S.STAF_ID
ORDER BY O.POROSI_ID;
GO

/* =====================================================
   4. Calculate the total value of each order
   ===================================================== */
SELECT
    F.POROSI_ID,
    SUM(F.SASIA * F.CMIMI) AS TOTALI_POROSISE_ALL
FROM dbo.FATURA F
GROUP BY F.POROSI_ID
ORDER BY F.POROSI_ID;
GO

/* =====================================================
   5. Display invoice details for each order
   ===================================================== */
SELECT
    F.FATURA_ID,
    F.POROSI_ID,
    P.PRODUKT_EMR,
    F.SASIA,
    F.CMIMI AS CMIMI_PER_NJESI_ALL,
    F.SASIA * F.CMIMI AS TOTALI_RRESHTIT_ALL
FROM dbo.FATURA F
INNER JOIN dbo.PRODUKTE_MENU P
    ON F.PRODUKT_ID = P.PRODUKT_ID
ORDER BY F.POROSI_ID, F.FATURA_RRESHT_ID;
GO

/* =====================================================
   6. Display the top-selling products by quantity
   ===================================================== */
SELECT TOP 5
    P.PRODUKT_EMR,
    SUM(F.SASIA) AS SASIA_E_SHITUR
FROM dbo.FATURA F
INNER JOIN dbo.PRODUKTE_MENU P
    ON F.PRODUKT_ID = P.PRODUKT_ID
GROUP BY P.PRODUKT_ID, P.PRODUKT_EMR
ORDER BY SUM(F.SASIA) DESC;
GO

/* =====================================================
   7. Calculate revenue by menu product
   ===================================================== */
SELECT
    P.PRODUKT_EMR,
    SUM(F.SASIA) AS SASIA_TOTALE,
    SUM(F.SASIA * F.CMIMI) AS TE_ARDHURA_ALL
FROM dbo.FATURA F
INNER JOIN dbo.PRODUKTE_MENU P
    ON F.PRODUKT_ID = P.PRODUKT_ID
GROUP BY P.PRODUKT_ID, P.PRODUKT_EMR
ORDER BY TE_ARDHURA_ALL DESC;
GO

/* =====================================================
   8. Calculate total payments by payment method
   ===================================================== */
SELECT
    METODA,
    COUNT(*) AS NUMRI_PAGESAVE,
    SUM(SHUMA) AS TOTALI_PAGESAVE_ALL
FROM dbo.PAGESA
GROUP BY METODA
ORDER BY TOTALI_PAGESAVE_ALL DESC;
GO

/* =====================================================
   9. Display orders that do not have a recorded payment
   ===================================================== */
SELECT
    O.POROSI_ID,
    K.EMR_MBI AS KLIENTI,
    O.POROSI_DAT,
    O.STATUSI
FROM dbo.POROSI O
INNER JOIN dbo.KLIENTI K
    ON O.KLIENT_ID = K.KLIENT_ID
LEFT JOIN dbo.PAGESA PG
    ON O.POROSI_ID = PG.POROSI_ID
WHERE PG.PAGESA_ID IS NULL
ORDER BY O.POROSI_ID;
GO

/* =====================================================
   10. Display reservations with customer and table details
   ===================================================== */
SELECT
    R.REZERVIM_ID,
    K.EMR_MBI AS KLIENTI,
    T.TAVOLIN_NR,
    T.KAPACITETI,
    R.ORAR_REZERVIMI
FROM dbo.REZERVIM R
INNER JOIN dbo.KLIENTI K
    ON R.KLIENT_ID = K.KLIENT_ID
INNER JOIN dbo.TAVOLINA_RESTORANT T
    ON R.TAVOLIN_ID = T.TAVOLIN_ID
ORDER BY R.ORAR_REZERVIMI;
GO

/* =====================================================
   11. Count orders handled by each staff member
   ===================================================== */
SELECT
    S.STAF_ID,
    S.EMR_MBI,
    S.ROLI,
    COUNT(O.POROSI_ID) AS NUMRI_POROSIVE
FROM dbo.STAFI S
LEFT JOIN dbo.POROSI O
    ON S.STAF_ID = O.STAF_ID
GROUP BY S.STAF_ID, S.EMR_MBI, S.ROLI
ORDER BY NUMRI_POROSIVE DESC;
GO

/* =====================================================
   12. Calculate average menu price by category
   ===================================================== */
SELECT
    K.EMER_KAT AS KATEGORIA,
    COUNT(P.PRODUKT_ID) AS NUMRI_PRODUKTEVE,
    AVG(P.CMIMI) AS CMIMI_MESATAR_ALL
FROM dbo.KATEGORIA_MENU K
LEFT JOIN dbo.PRODUKTE_MENU P
    ON K.KATEGORI_ID = P.KATEGORI_ID
GROUP BY K.KATEGORI_ID, K.EMER_KAT
ORDER BY CMIMI_MESATAR_ALL DESC;
GO

/* =====================================================
   13. Display the number of orders by status
   ===================================================== */
SELECT
    STATUSI,
    COUNT(*) AS NUMRI_POROSIVE
FROM dbo.POROSI
GROUP BY STATUSI
ORDER BY NUMRI_POROSIVE DESC;
GO

/* =====================================================
   14. Display tables and their current status
   ===================================================== */
SELECT
    TAVOLIN_NR,
    KAPACITETI,
    STATUSI
FROM dbo.TAVOLINA_RESTORANT
ORDER BY TAVOLIN_NR;
GO

/* =====================================================
   15. Display customers who have made orders
   ===================================================== */
SELECT DISTINCT
    K.KLIENT_ID,
    K.EMR_MBI,
    K.TEL,
    K.EMAIL
FROM dbo.KLIENTI K
INNER JOIN dbo.POROSI O
    ON K.KLIENT_ID = O.KLIENT_ID
ORDER BY K.EMR_MBI;
GO
