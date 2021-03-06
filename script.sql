USE [abigail]
GO
/****** Object:  Table [dbo].[tbl]    Script Date: 10/23/2020 11:26:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueID] [int] NULL,
	[EntryDate] [date] NULL,
	[Program] [text] NULL,
	[ProgramSubcode] [text] NULL,
	[InitiatingReason] [text] NULL,
	[IssueOrigin] [text] NULL,
	[IssueDesc] [text] NULL,
	[OriginalDefect] [bigint] NULL,
	[EnteredByUserID] [int] NULL,
	[Site] [text] NULL,
	[UIDfull] [text] NULL,
 CONSTRAINT [PK_tbl] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl] ON 

INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (1, 59, CAST(N'2017-09-26' AS Date), N'Program3', N'SUB', N'Supplier Disclosure', N'Supplier', N'Damage to parts caused by Supplier during processing', 200281354, 1242021, N'Site1', N'Site1-2017-SUB-00059-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (2, 96, CAST(N'2017-10-09' AS Date), N'Program3
', N'MSE', N'QA Finding', N'Supplier
', N'Supplier Damaged parts during processing', 200281873, 124203, N'Site5
', N'Site5-2017-MSE-00096-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (3, 17, CAST(N'2018-01-17' AS Date), N'Program3
', N'403', N'Supplier Disclosure', N'UY', N'Supplier found Defects on parts supplied from LM for finishing.', 200285773, 124203, N'Site5', N'Site5-2018-403-00017-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (4, 93, CAST(N'2019-03-19' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Parts mixed from supplier', 200318704, 380875, N'Site1', N'Site1-2019-THD-00093-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (5, 201, CAST(N'2019-06-26' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Part not identified by supplier per drawing requirements', 200329923, 380875, N'Site2', N'Site1-2019-THD-00201-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (6, 260, CAST(N'2019-08-07' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Parts RTV for supplier to Rework', 200341060, 380875, N'Site3', N'Site1-2019-THD-00260-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (7, 299, CAST(N'2019-09-05' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier sent part with reject tag on it.  ', 200346014, 380875, N'Site5', N'Site5-2019-THD-00299-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (8, 364, CAST(N'2019-11-12' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier did not wrap parts in VCI paper', 200357629, 380875, N'Site5', N'Site5-2019-THD-00364-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (9, 18, CAST(N'2020-01-15' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier shipped wrong part.', 200365872, 380875, N'Site5', N'Site5-2020-THD-00018-A')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site], [UIDfull]) VALUES (17, 19, CAST(N'2020-10-23' AS Date), N'Program1', N'403', N'QA Finding', N'Supplier', N'Supplier shipped wrong part.', 200365844, 380875, N'Site1', N'Site1-2020-403-00019-A')
SET IDENTITY_INSERT [dbo].[tbl] OFF
GO
