Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8239CCF9F8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 03:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbsWgLeOKOm20UkttCHJSOqqXOdL74y1IEEzvuL5asQ=; b=AOoR9LESV0lWdIkFo79tNiJS5J
	cxNRFchf7+cK99PO6fL0FxNHbcJMLkLe1eW8pzRmSvuALMuJmJfHf80urWALpRYWUyZD3kIVlVD23
	lH2a8+6cd/LREPRrt7/IPOfgZ1qo4GLucxM4tDQ+jAOLFRallUJVuu1E9kcfNDrJzVST16v7gXrtI
	6npy+BNKi0j6c59RSvK2972k1Vupy8PKOebOg6aZjB1jsGBdvBMqytbXxTK1EAyG2sjSwhWAV5o3P
	caBIy8EfT7FyDtCI13rnlqXaM1qsc49CEAuix8kfS1GYm3/UZ1YUW+rY4D0n8tTNZ7G6EExRzz4f2
	dBiJ7CYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7sR-0000000B4Vr-0rp2;
	Tue, 04 Nov 2025 03:38:35 +0000
Received: from mail-japaneastazolkn19013080.outbound.protection.outlook.com ([52.103.43.80] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7sO-0000000B4VT-3PNH
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 03:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFX+jU+D/Ei7PlfqiP5R+EV/kVJ/YZVitVH6WQmjlM/f8AaDCHPVRlqs2akCemwc6fd+rCvwSdWsUhE0tsa4UN6DvK5vCXveWPxw79rM8oYDCwi3PPP9RgJ/R4njFlpEF31RAn1JtCmn8C2OebR+kqUoM+cAw8dNxqnq9j6oy7rUsElxBdphT3Zwuo9elgGT2yAXmH7FtXLIp/2L4ANfBKkZjLumyenkiGJXEb1sN9JEl0ZHwyUgiMFwhQQIfrTeGOZxd/OKLMvDk4azQTeM8SjGvyD36ZXSaTqXol6+ef9aRYDX2gfMlsVJfmOIJYDe0HDHAVTtVzhUH7+NM7+WhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwSjjlmdjGUHdexI/UcaLaqZpBaaK9CVHwBYqvf17R0=;
 b=toGovUZfRCqL4sN/uWf2BuMrbf8TFwemnSnfJZxSPbdu42rygoQmY/NnQxtHaLuptOz2v5cgorVK2USv90/UKfRhUoXS7/reS0pyXo3UFhT86/To24lHHIBjvmoVbRJ+ZoQ52HaubKEjtpitNtG7zKb3trWgcIza5j5q6+6yftGeRrKghCc2680NsCjTnXF0IUo8R/a4Pm1IBpZiPLM5w0oH3yRmK4liV2NP2+2/u0Fww58XRzm1gLKacP4+SpmlAKz11BfCwggmDCsVTUURy31ewK/yBPDJb5H6B0vIAImXgXQ1CGUYB9S+C0ixNpLyahO3sh/pBBzNdYBnMQN5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwSjjlmdjGUHdexI/UcaLaqZpBaaK9CVHwBYqvf17R0=;
 b=aCv6fOY4yVaCsTn6BtSJywEskU9QSLAOWcR2D5UsU8DVNTd8qlj9Rdwu/TO00pUlkQyoUfNlIog2vD33cHJq7ose+61rTbq4xG43kxQBtm+KDfEKwjFEFmPjtcOqsZ43WdIeppkTcDGJjUmlGDH4wQPFLvYNgx4kMlWQ98FR4b2bp8U3uPpC0Sw0GdApyO6zqp6JArpgfZQPf2EFJRda/EBaM37Ol3Zw2s+xa9H4Pem8rSnPbQvESGNA/LRxOfvn6JX/QtxKHXS57bEFAvPA7d8Gxu8kqFe0+NoVnQ02lJ0KdwvQC2rQOsLUDfV6gFjgEcLH8MuSASTI8qTHu4KO9w==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by SEZPR04MB5897.apcprd04.prod.outlook.com (2603:1096:101:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 4 Nov
 2025 03:38:22 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:38:21 +0000
Message-ID: <KUZPR04MB9265A9C7B93E6348D815D704F3C4A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Tue, 4 Nov 2025 11:38:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: riscv: selftests: Add riscv vm satp modes
To: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org,
 ajones@ventanamicro.com, rkrcmar@ventanamicro.com
References: <202510291139.59TBdMIU031588@mse-fl2.zte.com.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <202510291139.59TBdMIU031588@mse-fl2.zte.com.cn>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <ffc88619-ab46-4f7d-a1d6-0e96381f9bb8@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|SEZPR04MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 728728dd-3f22-4b42-0198-08de1b5399ea
X-MS-Exchange-SLBlob-MailProps: laRBL560oLT/z5vudnqSE/O7qQNjjjS4hXT/84iXTm2WnRy6uRif+wQYP6wD4xmFwpXnUr8hGSZw5Zsd1ki40PgfAOtd3QLdUrPDYUYLtUKaTKP2E+1lVuBgio+fKhzffJYD+klznYR26opK8vYpZo7ypSGPCmwwfZdQyc+nsN03WIY//VT6ebY1DDASGQh90B84TWZlooXZJSbs/VBeFkXcsg+zlMqSUvlJlewFBaiWAW22VybI4kS8acL8KJq9Doin1eGE5IYIUc0DRXJfVTUU9TE9iJt8NcMrVum29ij+mMjnhHmR13YjryjA0OsJ1hJU1GpJH8cP8vCH/6grszIJqm/3JgIlfzLTTsiuuJ6zG3+g0OYmVkRFUquIcBM2LSRaBgbiSxE/vjWwrYaZZlUkA0kMqvMGwEiwnYp33LX161KFzPTZJeDtYyTkR5IKBpBN5/88NHHOXlA5F5saiHXoeUmkm6ifWUi5B5LGJxcSDrtcprJcypS2uEaqJBZKyErRnwysIDksFZp8AuQJnYXsY6uxXZDEB+HoD+llWAJHUQGVvsN4J71HX+/UZzfxXAIcbkEIU4vUieEk3hIbSqEILmG3UuBrBt/lp38J5tOE5gINv8gjY3qI/MIUu2vqNOmb0bOR/6JLT48RtR+HMPVASlY85kP9gFt40maVUSbS2zcuSSKyZbLt5jHG9imSM+czOxEUo1+wN4ahPdEYmwRl75TbrKd+veuAPJ+nKz3UHEFmfIIMJ5JmKMlHd5usXNITr5IYYZOw3fhcpo/PueEjDCA4uiKm
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|6090799003|5072599009|8060799015|19110799012|37102599003|23021999003|15080799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1hpTmVja0FJOHJWZTc5S0JHd2hoUVlBTzM0UitRWGFpeXlvWm5yN0k2TDg1?=
 =?utf-8?B?QnpycVEvck5zMmNrK1VDUS8xRHJFR1RoNE1GYnpENzZOUGkzYzZoYlRNN292?=
 =?utf-8?B?d1JGMzFhQk92aXRFRGhtYUwwNVdNTlZQbktZZjRRSld4dklnZzFzclQ3QUFY?=
 =?utf-8?B?TmlLQkFWWW00N0tnRHN6YUl6MU5VeE9OU25jT0lkQ1c3S0JxTE5lVmJIa01I?=
 =?utf-8?B?TnZDZ3FhZnZNWlBJeURqVHRJSzNHczJxTnlJbUg1N0tzNmYrVXRRckIyK0Jj?=
 =?utf-8?B?TjZ2RFhNWkF4SWdqMmo1MWhhMnJuZmVnaFhObEU2TWFLTFdvZUM1cWpLNEVi?=
 =?utf-8?B?aWFnWDUzYTBQeDRQQWVTelBSZ01DRzdhUXQ1NmtlRjNCQUJVaWZVSG9Cc2Jp?=
 =?utf-8?B?MldVNDR0dms3bmJrMDBRM1ZXZ0NOVURBSVFpSmcrekp5UFFNbFZnT0dOQlJi?=
 =?utf-8?B?UEtQaS9MUkN0S2kzL1UzSCtudzFrY2k3NEFJNk1peWd2dzV5bWhmdjJycjFJ?=
 =?utf-8?B?blJFamlDYmNvbml5bzRMbEwxSG1land4c2JtT0RVNE13SDRtRFc3ZTVvUE1O?=
 =?utf-8?B?ZTZDYU0zSjVGWitwN042REllRERlalU1SjhjU1VBbHJYOXFxZkg1ekk3MWZI?=
 =?utf-8?B?YjY5NlJwWVZvNnFVR0w5QTdYallJWEQ0TXptNjNkTjdzYjVHdkRMdEFsb3E1?=
 =?utf-8?B?R0c4V2o4VHJCVmNvaTYzREd4dkR4QjFzaHN2SUlmUUt5Mjc3SHhXUkNxOXM3?=
 =?utf-8?B?dG1WWjZIbFZNMWpQSW1NYzRza3lkR1pZMmVwbnpJMnpkcEtZSTFLZ1ZlcUFU?=
 =?utf-8?B?SEJ4UTRCQnFKY056eERWNjVvZzZmdnlwT3YwS0NHUlMyTXdQQ200eVVDWE9t?=
 =?utf-8?B?WmxaWUJkbHF4b3ROa05qNGFhTkFjWVhaZXpHZXFqZzQzRGdBN3FZYmlieUVM?=
 =?utf-8?B?d3dTa3R5cHZMR3hVRFo2b05hV3ZvZW9wTXpwcHR6WTZYYnZWTE5OcjliVkhm?=
 =?utf-8?B?TklDM24wb1B1SDFsMkVzZmNLZXRRMUpvakYvNjVDeU5QZUVadmd4dXpEa3BT?=
 =?utf-8?B?dHRUSTc3TlZVMGZTNlhzc2twTlhtNW1tZnRFNjFkenN4V3pBN0xNZ0ZMWlps?=
 =?utf-8?B?T2QrYWJsdDFqTVNJcXBQekxnMHErc3hwNURSc3YyZ0NjVVp6Y2RKWk1tRS91?=
 =?utf-8?B?bjVpaTFPalJWM3FuUjF0bzZWNWR6aWxYcEVHMFhyRFNCTjl1Qyt2Y2lNVFlS?=
 =?utf-8?B?Z0lpWU9IMGV4M2dWMDBFaEdDS0ZHTjladk9WZDJ2NmtRODBkSFpZOXV6R3Ey?=
 =?utf-8?B?ZDlmeHpwREZpNWs5SVc0ek03VDBYODgzbThaUlp1VXEzc3puNVNIa3RKZllK?=
 =?utf-8?B?K05hTGN2Y1M5aFl0UXBzK1ppR044OGRRZ2NaVEJTQm1SY3ZINXhiUldRMEhX?=
 =?utf-8?B?ZGM0R1p1dmxKTUZidlY3MStWa01JUWRtSm1vUnp4WE52T09zcTFhV1N3VHZj?=
 =?utf-8?B?Yjg5alN3RnNXRXQzeTRHMjRybnNQajEyRW92cDRWWjl2dWdHdWVNNmU3dGYx?=
 =?utf-8?B?d0dXK2U4NUJtRE01TytRMFF6elBlbXM5bjNYa3U1WUVVYy9weWI5b0dscnNy?=
 =?utf-8?B?c0dYWnM3VlJETWJ0aWgxZW9JYll3RlE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjRpOEpreEFsVy9BcE1xUThxRmZUU285dTI2RlI1RjFDczdUSVM3MGxPR0xK?=
 =?utf-8?B?UmFyNGRNOFkvK2NETmFzRXM1UFJQNll1TVZxWGxtVlFxckR1ZktaYk1US3Ru?=
 =?utf-8?B?bStNWWpuYkgyM0lRMFZPZzd5cGxraDhHQUN2UFlId3hoTEJ5VFlWQnlSOU42?=
 =?utf-8?B?c2VyQjgwaVIwcXBKMDFsM1U0eXhkek8xMVd4WTBPM1h3N2FWeGs0MlNGbTNP?=
 =?utf-8?B?bXh0SDNnNm1STkFRRXJQZTlwemErcm1uYU1MN2N6WXN3bmpOL1RkbGovY29U?=
 =?utf-8?B?Snl4MXdEM1ZWUzFHSWNTL0dsVEpwbFZPTzNxU1RZS2Z0WVBzOVBGV01iUzFw?=
 =?utf-8?B?TTk3V0JGSkpZSk5xV3JoUnczZUVVeHJObEErc2RvRWFNVlhMRTFnWGhObUZ2?=
 =?utf-8?B?VGNTUC9sNTBKSDYzRnN6WU96RUJqNWh1aGtUY3crUVVNSDBHcjY1NmhNcmIv?=
 =?utf-8?B?RzlVeGR2cUFZUGJTRm5aUEVPNCs5ajV1TjVWL1lGYnUybTdDUGxPQWlRVW10?=
 =?utf-8?B?bkgyNE1Yb2VZdmRtR1RjTWJueGNtbkluamptWmgzUzFNT1U5L0p2SWhoR1RR?=
 =?utf-8?B?SklUWVZuU25HTWdkaHJNa2pib2hLcXU2SVV6UTIyR2sxWk9CRVo0SmFHeWV0?=
 =?utf-8?B?TldQckhaZ1dQaE41bUVJbzIwVnBZc0FsRmIvSXlrUzdMRHZkZEs3dnJvQ29m?=
 =?utf-8?B?aDZPUHY3TkwvdU9SWWg5dmFyYjByOGRUcE9EZitOSjA0cERrVzBMMW53Umcr?=
 =?utf-8?B?MXQ2ZUdsa2lLeUNSOGRmNVI0Z211Sm82cWQwUW9YNWd2ZTQrV0c4WGNHMDJB?=
 =?utf-8?B?OUZwMyt3bXVncGFBYW9yaVRHc2JxcUVOT2tIWkg0WlNXYUhWQVpCSHQ3TEZv?=
 =?utf-8?B?TXJ6K3pFUVhmeFZ6eWpTVU92OGJKUDhWT1ZXcnJQZFNDaTRhYUhHeFQvajBh?=
 =?utf-8?B?ZHBPejZtM2tLazBSZmVyQWo1SGMraklRaDZDSHJOYi9pSENnQUo5Y3h3dnd2?=
 =?utf-8?B?UXpFcDZaVWc0WjRmeitCQVJ1YlpBbG5GR3hlZHJvOCtQdFJaMWYyc3UvYUpa?=
 =?utf-8?B?ZGhKRWVMMUUyejJweWVqN2VWR2RyY2l5K2dtZUwvbGVRMmxEL3Y1SVl6alN0?=
 =?utf-8?B?Ty9XYk8vekw0dTYzc3FPSllDL0VIbnZqYUdFNVNDclR6OGNqeUhHY1VLNTFw?=
 =?utf-8?B?T2ZLcFE0bnhUbDdmU3JXYkhsMVAvN0FSQ3RQVGl0MzMvOWZLend3WmJVU3RG?=
 =?utf-8?B?NTFCcUIzblZLSW1lL28zRnd1T25BTGZ4aTdPT0wxUTN2MHhzREdPazhqc2J1?=
 =?utf-8?B?TWE0cjFUSDd4TEtTM0QzUWh1cDdaeHdKaEtrMS9QeVNuMGdoOVRNWVMrVjFY?=
 =?utf-8?B?ai9zM3JIdGNvc2x6eWdkeUtLcWxYMzBKWDlWNmE2Zi9iYnZwdXgwWmJHQzlT?=
 =?utf-8?B?YVJjcHM5OGFOL3lIWjRpN0lSTEppaENhUmRKOFYvM3k1bVY2SHNTVzkzZzhl?=
 =?utf-8?B?OVJENjAwU3RVdXcyRkZRbHNvbjU5cStJWWF5NjFwaW9WZjZJeUlDOHNPdkV1?=
 =?utf-8?B?MWpCRVVZd2d0WUI3Qm5KRVdkdmFOKy90MnQ1N0ZCbnoxK3J3b0pSNldaMHE4?=
 =?utf-8?Q?fbJWuMuDuz9KJd23lSD2wwKE8MgGrgwc/YK5iplg2MYs=3D?=
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-38779.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 728728dd-3f22-4b42-0198-08de1b5399ea
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:38:21.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_193832_928822_81FCCF01 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 10/29/2025 7:20 PM, wu.fei9@sanechips.com.cn wrote:
> Current vm modes cannot represent riscv guest modes precisely, here add
> all 9 combinations of P(56,40,41) x V(57,48,39). Also the default vm
> mode is detected on runtime instead of hardcoded one, which might not be
> supported on specific machine.
>
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> ---
>   .../testing/selftests/kvm/include/kvm_util.h  | 17 ++++-
>   .../selftests/kvm/include/riscv/processor.h   |  2 +
>   tools/testing/selftests/kvm/lib/guest_modes.c | 41 +++++++++---
>   tools/testing/selftests/kvm/lib/kvm_util.c    | 33 ++++++++++
>   .../selftests/kvm/lib/riscv/processor.c       | 63 +++++++++++++++++--
>   5 files changed, 142 insertions(+), 14 deletions(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
