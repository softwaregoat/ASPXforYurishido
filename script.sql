USE [abigail]
GO
/****** Object:  Table [dbo].[tbl]    Script Date: 10/21/2020 3:55:22 AM ******/
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
 CONSTRAINT [PK_tbl] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl] ON 

INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (1, 59, CAST(N'2017-09-26' AS Date), N'Program3
', N'SUB
', N'Supplier Disclosure
', N'Supplier
', N'Damage to parts caused by Supplier during processing
', 200281354, 124203, N'Site5
')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (2, 96, CAST(N'2017-10-09' AS Date), N'Program3
', N'MSE', N'Supplier Disclosure
', N'Supplier
', N'Supplier Damaged parts during processing', 200281873, 124203, N'Site5
')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (3, 17, CAST(N'2018-01-17' AS Date), N'Program3
', N'403', N'QA Finding', N'UY', N'Supplier found Defects on parts supplied from LM for finishing.', 200285773, 124203, N'Site5')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (4, 93, CAST(N'2019-03-19' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Parts mixed from supplier', 200318704, 380875, N'Site1')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (5, 201, CAST(N'2019-06-26' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Part not identified by supplier per drawing requirements', 200329923, 380875, N'Site2')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (6, 260, CAST(N'2019-08-07' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Parts RTV for supplier to Rework', 200341060, 380875, N'Site3')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (7, 299, CAST(N'2019-09-05' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier sent part with reject tag on it.  ', 200346014, 380875, N'Site5')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (8, 364, CAST(N'2019-11-12' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier did not wrap parts in VCI paper', 200357629, 380875, N'Site5')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (9, 18, CAST(N'2020-01-15' AS Date), N'Program5', N'THD', N'QA Finding', N'Supplier
', N'Supplier shipped wrong part.', 200365872, 380875, N'Site5')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (10, 0, CAST(N'2020-10-20' AS Date), N'Program1', N'sub1', N'Reason1', N'IssueOrigin1', N'des1', 111, 0, N'Site1')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (11, 0, CAST(N'2020-10-20' AS Date), N'Program1', N'sub12', N'Reason1', N'IssueOrigin1', N'des2', 111222, 0, N'Site1')
INSERT [dbo].[tbl] ([RecordID], [UniqueID], [EntryDate], [Program], [ProgramSubcode], [InitiatingReason], [IssueOrigin], [IssueDesc], [OriginalDefect], [EnteredByUserID], [Site]) VALUES (12, 0, CAST(N'2020-10-21' AS Date), N'Program5', N'subcode', N'Reason5', N'IssueOrigin5', N'description', 11111, 0, N'Site5')
SET IDENTITY_INSERT [dbo].[tbl] OFF
GO
