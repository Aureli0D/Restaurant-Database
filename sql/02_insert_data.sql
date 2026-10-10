USE [DatabaseIB]

/* =====================================================
TABLE: KLIENTI
Description: Stores information about the 
restaurant's customers.
===================================================== */
INSERT INTO [dbo].[KLIENTI] ([KLIENT_ID], [EMR_MBI], [TEL], [EMAIL])
VALUES
('K001', 'Arben Hoxha', '0000000001', 'arben.hoxha@example.com'),
('K002', 'Elira Dervishi', '0000000002', 'elira.dervishi@example.com'),
('K003', 'Armando Doka', '0000000003', 'armando.doka@example.com'),
('K004', 'Sara Kola', '0000000004', 'sara.kola@example.com'),
('K005', 'Erion Meta', '0000000005', 'erion.meta@example.com'),
('K006', 'Artjola Shehu', '0000000006', 'artjola.shehu@example.com');
GO
/* =============================================
TABLE: STAFI
Description: Stores information about the
restaurant's employees, their roles, phone
numbers, and monthly salaries.
=============================================  */
INSERT INTO [dbo].[STAFI] ([STAF_ID], [EMR_MBI], [ROLI], [TEL], [PAGA])
VALUES
('S001', 'Jona Kola', 'Kamarier', '0000000007', 60000.00),
('S002', 'Sara Meta', 'Kasier', '0000000008', 65000.00),
('S003', 'Ardit Pasha', 'Kamarier', '0000000009', 60000.00),
('S004', 'Ilir Baho', 'Menaxher', '0000000010', 85000.00);
GO
/* =====================================================
   RESTAURANT TABLES
   ===================================================== */

INSERT INTO [dbo].[TAVOLINA_RESTORANT]
    ([TAVOLIN_ID], [TAVOLIN_NR], [KAPACITETI], [STATUSI])
VALUES
    ('T01', 1, 2, 'Gati'),
    ('T02', 2, 4, 'Gati'),
    ('T03', 3, 6, 'Gati'),
    ('T04', 4, 8, 'Gati'),
    ('T05', 5, 4, 'Gati'),
    ('T06', 6, 4, 'Gati');
GO

/* =====================================================
   ORDERS
   ===================================================== */

INSERT INTO [dbo].[POROSI]
    ([POROSI_ID], [KLIENT_ID], [STAF_ID], [TAVOLIN_ID], [POROSI_DAT], [STATUSI])
VALUES
    (1, 'K001', 'S003', 'T01', '2026-01-20T00:00:00', 'Gati'),
    (2, 'K002', 'S001', 'T03', '2026-01-20T18:52:37', 'Ne Pritje'),
    (3, 'K003', 'S001', 'T02', '2026-01-18T18:30:14.333', 'Gati'),
    (4, 'K004', 'S003', 'T04', '2026-01-20T00:00:00', 'Gati'),
    (5, 'K005', 'S001', 'T05', '2026-01-20T18:37:24', 'Ne Pritje'),
    (6, 'K006', 'S003', 'T06', '2026-01-20T18:52:44', 'Gati');
GO

/* =====================================================
   RESERVATIONS
   ===================================================== */

INSERT INTO [dbo].[REZERVIM]
    ([REZERVIM_ID], [KLIENT_ID], [TAVOLIN_ID], [ORAR_REZERVIMI])
VALUES
    ('R001', 'K001', 'T03', '2026-03-02T20:30:00'),
    ('R002', 'K004', 'T05', '2026-02-15T14:00:00'),
    ('R003', 'K002', 'T01', '2026-02-03T21:00:00'),
    ('R004', 'K003', 'T01', '2026-02-14T21:00:00');
GO

/* =====================================================
   MENU CATEGORIES
   ===================================================== */

INSERT INTO [dbo].[KATEGORIA_MENU]
    ([KATEGORI_ID], [EMER_KAT])
VALUES
    ('KAT1', 'Ushqim'),
    ('KAT2', 'Pije alkolike'),
    ('KAT3', 'Pije jo alkolike'),
    ('KAT4', 'Embelsira');
GO

/* =====================================================
   MENU PRODUCTS
   Prices are in ALL (Albanian lek).
   ===================================================== */

INSERT INTO [dbo].[PRODUKTE_MENU]
    ([PRODUKT_ID], [KATEGORI_ID], [PRODUKT_EMR], [CMIMI])
VALUES
    ('P001', 'KAT1', 'Tave dheu', 650.00),
    ('P002', 'KAT1', 'Fergese', 500.00),
    ('P003', 'KAT1', 'Lakror', 450.00),
    ('P004', 'KAT1', 'Pule fshati ne tave', 850.00),
    ('P005', 'KAT1', 'Mish vici', 900.00),
    ('P006', 'KAT1', 'Sarma', 650.00),
    ('P007', 'KAT4', 'Bakllava', 150.00),
    ('P008', 'KAT4', 'Trilece', 350.00),
    ('P009', 'KAT4', 'Revani', 250.00),
    ('P010', 'KAT4', 'Sheqerpare', 280.00),
    ('P011', 'KAT3', 'Coca Cola', 150.00),
    ('P012', 'KAT3', 'Fanta', 150.00),
    ('P013', 'KAT3', 'Uje', 100.00),
    ('P014', 'KAT3', 'Uje me vitamina', 150.00),
    ('P015', 'KAT3', 'Caj', 150.00),
    ('P016', 'KAT2', 'Vere e kuqe shishe', 1500.00),
    ('P017', 'KAT2', 'Vere e bardhe shishe', 1200.00),
    ('P018', 'KAT2', 'Vere e kuqe gote', 300.00),
    ('P019', 'KAT2', 'Vere e bardhe gote', 200.00),
    ('P020', 'KAT2', 'Raki', 150.00);
GO

/* =====================================================
   INVOICE LINE ITEMS
   CMIMI represents the unit price.
   FATURA_RRESHT_ID is an IDENTITY column.
   ===================================================== */

SET IDENTITY_INSERT [dbo].[FATURA] ON;
GO

INSERT INTO [dbo].[FATURA]
    ([FATURA_ID], [POROSI_ID], [PRODUKT_ID], [SASIA], [CMIMI], [FATURA_RRESHT_ID])
VALUES
    (1, 1, 'P001', 2, 650.00, 1),
    (1, 1, 'P005', 1, 900.00, 2),
    (1, 1, 'P009', 2, 250.00, 3),

    (2, 2, 'P004', 1, 850.00, 4),
    (2, 2, 'P003', 2, 450.00, 5),
    (2, 2, 'P010', 4, 280.00, 6),
    (2, 2, 'P018', 4, 300.00, 7),

    (3, 3, 'P002', 2, 500.00, 8),
    (3, 3, 'P003', 1, 450.00, 9),
    (3, 3, 'P011', 3, 150.00, 10),
    (3, 3, 'P010', 3, 280.00, 11),

    (4, 4, 'P004', 1, 850.00, 12),
    (4, 4, 'P002', 2, 500.00, 13),
    (4, 4, 'P007', 4, 150.00, 14),
    (4, 4, 'P016', 2, 1500.00, 15);

GO

SET IDENTITY_INSERT [dbo].[FATURA] OFF;
GO

/* =====================================================
   PAYMENTS
   Amounts match the invoice totals for orders 1-4.
   ===================================================== */

INSERT INTO [dbo].[PAGESA]
    ([PAGESA_ID], [POROSI_ID], [SHUMA], [METODA], [DATA_PAGESES])
VALUES
    ('POS1', 1, 2700.00, 'KARTE', '2026-01-20T00:00:00'),
    ('POS2', 2, 4070.00, 'PARA', '2026-01-20T18:52:37'),
    ('POS3', 3, 2740.00, 'PARA', '2026-01-18T18:30:14.333'),
    ('POS4', 4, 3450.00, 'KARTE', '2026-01-20T00:00:00');
GO
