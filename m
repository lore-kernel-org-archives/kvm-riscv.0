Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9269606A325
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHvLJbjV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=oZTEvV0T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Cc:To:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qxEQ7xjHF1Wt5EMnC50697R2RU6wFNjMLWAgnEgx8OM=; b=BHvLJbjVNnbTRm
	0RncbNt2yugBAQlobacYca1vufyHkHaZLUYGVlImRALJzn/c022mvg3S2g7hql0n0/6NLqWZzC1+f
	7bZBEpAiovSCTt4PYzztuU5URidUGIeZRxXGTGZkxqK5NURH96BBDuFRg6D9y9xl8y4+6d5rJCYmX
	l58RK7wdK+X2zY+YEIsPS45h1LCuFTyVlar0xZtnpDloevs+tbJiiPwE68mSBmivlm4Dr4d8E2u2D
	2SHTZp+M1duR013IeecitxxHd24jjeoBWN/UYc1dQfVBodxhDoSl/GNae8stQs0E/bYig6ig914NE
	0nrq804cNCgUlxWQzPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaBH-0000000CZ40-1PSe;
	Wed, 21 Oct 2026 17:32:51 +0000
Received: from mail-japanwestazolkn19012051.outbound.protection.outlook.com ([52.103.66.51] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaBE-0000000CZ3a-3zk8;
	Wed, 21 Oct 2026 17:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmzja60sPGYKjjsA+mJ8s2jyI4MXygJgS6BEG8NDUK0C6ujNRNhgnZv9himMEPBl7XG/eJb1XBQjmfE3ArOmZhlwRuWiTW3Nj06L4fK3x/2ibY1FiH+yC4bQxwDz34LVgoXJ59jnARPXLiTxFTIA6uXENQRwMbbHDa44inWcOrjRfJhko1VDSs8DDvu2kHz/0I7qquRNlU7dYkRwX5WvIkImh+wim/j+X9YcV6YPhBtaVeE1U8Q5MLaYH2QRZkOi72+6i7wHKRD7FHMN3QaIMJLomXQTAIOQVwmAdlIQbQfWkWHyY5J0n3dOIdxRylQLoKdJs28rkFBwr1Y6iEFqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6aJJFuqTWQKGgObm4FvTeEbykVdX7s0yFz35AF9XaU=;
 b=qxo6Ji3eKTlgymjkMoA5KIn6XzO/T+f1WU5TTrV/KyH9fIzoTol3yNOVzcYP7KavQbSGH+SRK9Wy4Tufno50tqS5n2n5KY3IaMbiUPv3X9TF/8gZ7qPKLjBMP+3cAsxyeujB23xJENLUubF48TmlaZcGRdhBjfcnjdrkDoY5XL7S42orwWmQGpTvY+euibecfcGq2w0Ycyq4Hp8qt6tkz700yAQ/W/RyJnFim+XuGE54JoDlWp3Sch+NUCZu6eaKA22P0oKJT78cq3RDJ72mxL6U5ASFDVaCxn/YibmGa6fmlay/VvJMi80mQY0ccp7XDWpTfs6q1jwkg1bsq8R7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6aJJFuqTWQKGgObm4FvTeEbykVdX7s0yFz35AF9XaU=;
 b=oZTEvV0Ta1W/PXHwaoVzfDSgwk2XY/W/hirE5Z4nIJxJF1c5WKZg5wga0B4bhc1k27sRP+nBJg8aBtSdPokA2J45DEbe8aa81V7yoKUWlsivujijPK0XtZsdS0lEQx3q96gWbjc94Hzf5llJMW3xmUg0UhRQAK2k5Pjuwpba2EMx/3U/X6n3SwmPF/a73rrC8voGcb83iyDD6NM2bFrg8tgKX2fLh5ohlI6YNZTZSD/7+e4LVGD5UDG4xUc6tCrKPJI246VWKokuymEqytTo3cBncmf7TXv4Ko8f/gGDjmhFZ73yxCcSD6lYOjPl0/hXMTsnJ7Gp2qaMsPRoGyr/NQ==
Received: from OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 (2603:1096:604:290::7) by SEYPR01MB4079.apcprd01.prod.exchangelabs.com
 (2603:1096:101:3f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 17:32:30 +0000
Received: from OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 ([fe80::708b:59ed:4ad6:b84c]) by OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 ([fe80::708b:59ed:4ad6:b84c%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 17:32:30 +0000
From: slack up <yxcnew@outlook.com>
Date: Wed, 21 Oct 2026 17:31:44 +0000
Subject: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
X-B4-Tracking: v=1; b=H4sIAAjR2GoC/x3MMQqAMAxA0atIZgNtUEGvIg61pppBLY2KIN7d4
 viG/x9QTsIKXfFA4ktU9i3DlgX4xW0zo0zZQIYaa8jirjGitzhWqOe4yoFMNHnTBhdqB7mLiYP
 c/7Mf3vcD17xZzWMAAAA=
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Xiaochun Yu <yxcnew@outlook.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792603927; l=2409;
 i=yxcnew@outlook.com; s=20261021; h=from:subject;
 bh=hVb3aCborZrl3NS21KYEFbO+8l8p7jg2iMw4OyCzDS0=;
 b=uxp5lzj5RxCyfKEdanFALKEpU25vWt2Po7IVLe9d3cRDGPtnc4VeZ2GXTu9YQbVUcPNr0AzP2
 LQckUJpjPVRDUVtZcyhdbpGKl+V1aYTZcfwnLQolvHZ95YaChXd11lE
X-Developer-Key: i=yxcnew@outlook.com; a=ed25519;
 pk=rTJiYAeqF/1qwCPx6wb42KO5VR4KlEV+4B6rz1p/n84=
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 (2603:1096:604:290::7)
Message-ID: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSQPR01MB6326:EE_|SEYPR01MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 992294b1-19a0-453b-e965-08df2f9948b8
X-Microsoft-Antispam: BCL:0;ARA:14566002|24021099003|19110799012|8060799015|260925184616899003|15080799012|6090799003|4140399003|25010399006|39105399006|5072599009|5062599005|23021999003|12091999003|41105399003|40105399003|18071099003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NENiVXpvSXB5SnRrdkZyU1lmZDJsU0RMQ1F3QmtIbWwyaG1kOG1mRjFVN1Ns?=
 =?utf-8?B?M2lLMXlKUjJCZUpXU3NoMitMRCtSVXBXWEZJUmJseTBMOWxLQzVYOEdJSGNu?=
 =?utf-8?B?YW9hQXk4cjZPd3Q1WmMvRmZKOVAzQTk2WjgwVnhEYlUwMW1aNVYycVdaVnJE?=
 =?utf-8?B?NFA5cXl6cHNwNVVGY2xKdDY3SldLN1pGTnc4dnZHTFlLUGZuYndQRUJUUUlD?=
 =?utf-8?B?UTRBV0xIMnJEbjJ2blZ6elRDOThkMzduZ1VvRVRia3RtaGpvdkYrQnBLY0FU?=
 =?utf-8?B?clNocWJ5QVdlSjljK1FxSHNLamJuZklUUWgzc25aQlRxR0pWbHAzTXNReHlJ?=
 =?utf-8?B?TVdxUmFWVzEvUm5abXJxaHQrWCtpdjFRNmZxbTllVW55N3dnZXVabHowV3Iw?=
 =?utf-8?B?NFRoT0U5VUNFR0l1SXVWenhxckxhdGZKNjR6VkVDQTRKN3NNY0QwdHA4dGo2?=
 =?utf-8?B?dEFsSVZhU295clAwZHI2RHZ3WDcyQUZkbnpIKzRTWTA1dUZXM2h3bEdLejV0?=
 =?utf-8?B?TUpnbG1kb3RVZzhjd0VoSktWTnduam9rUldNdEFQa3k0MzZGVUxONGdjcnNk?=
 =?utf-8?B?bXpyS0pHbGtXWHVONmVvaDhJTWhQaDUwbUZwbkJrMkl2MndWTXJqYVNaWjJr?=
 =?utf-8?B?amFTQTBkdzQ5RjRRY2FlMnZpc09qSlhTWHRtZTZmYi9KZWhvSHZjVmY4cSt3?=
 =?utf-8?B?VEFyKzQva1hHdjFDNzhCN3NLL0ZrTVdyWmRNZVBnSnVVaEZHVllKTWl6bWtm?=
 =?utf-8?B?MVpXSDRGa0s3SDdzdnRtUTF5TDRHNGhWdDlUYjQ5RWxVazAwOXhCbE1hZkNl?=
 =?utf-8?B?Tnl6ZnR0aFBvam1RUUtsVzZIcGtQTnRnU3NFK1p0OWRCMFUzczhFMitpUVhy?=
 =?utf-8?B?OTAyZG5lSTF5SGZ4cTk2SkNBRzFMYmVVOGNreTlKZTBTaWwyQWZZOExCdUhB?=
 =?utf-8?B?VFFZanZxWFZDRC9ESEFaTS8yVzFFM014TmpZZURYdGNUNzNVTEEzTEx6T1BF?=
 =?utf-8?B?NlVRL3lDUnFuL3dXQnZCU3pDcFBENFp0VUhMOGdSRkVtMVludThERlFEVUdq?=
 =?utf-8?B?c0laT0RoMjhCWFF0ZEZuN0pMcFRrdXFuQUpFdlU4SHZhMk5uTEtQdjdqUldV?=
 =?utf-8?B?ck9rTm5lN3lzM0Q2TlR1NnR6U1Vaa3RZcDErcWNUWjZ0STlRVHVJTDhzTmF3?=
 =?utf-8?B?RXJVeklJS3pPME1SZzNSVkxaY1dad0g1WFJQZHJzSC9zU2c0RzBqbzBXY3gw?=
 =?utf-8?B?Y0ZERldaNng5NUQzOEJiaTlsY2dhVXZraFZUaFB0ZGxZREJUQ1VSTXh0N2tO?=
 =?utf-8?B?RHZ0QXlpcXk3RWlQVTVJR2tjWjByOEUyVUtjYlZvZnZkbXg0bVhaU1c0c05R?=
 =?utf-8?B?WS8rWDlFaTdJclUya0VqMXpCMytQd1JOYWlKTThvNk56S3N6RFdCUGlxckpl?=
 =?utf-8?B?VFQ4cHRiVnpkVjM2UGIvQzYxRUVmeWp5SVlrZWErbmhBc3d3TzAxRm9POVdX?=
 =?utf-8?Q?12yPoWtrjyOaj2USSJCWImR9htm?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhuem0yL0x5dGU5ODg1ODFSeHBwdGc2UnJNVjZIY2J0aXQ4Ym5NV3hGS0lh?=
 =?utf-8?B?QUo0SVg1eml6MCsxeTJSbm9TS01FNlNtMmlHQm4rQTk1Rk9ySEhMelpCYmZr?=
 =?utf-8?B?UHFIWjdoS1RwYVNiZDdkcmY0ejdIaXlyclpNVXc1T2swaTVOWVlRRm1WeVc1?=
 =?utf-8?B?d3B0WGYzdHFRbStrSGF6Yjhhazl3bC90c2N5L25HMGNwengrTHphZ08rZkFN?=
 =?utf-8?B?azJjclRuZS9oQWZ0ajlXRE8xcHQyQWI0citUSlJXc0xncUdRL3l5cnVPNFhr?=
 =?utf-8?B?SGovcGR1b3paMURSSXJ5MFhNclRDdjNic3pWQXdDaGtGRnBOaGFjL1FRMGdu?=
 =?utf-8?B?NFRjZlJ3MzQxcDVUdDJCa09zRTZiaXhxMWNkM1FWL003ZnlCZDl4N2hPN0s2?=
 =?utf-8?B?WE9lTG1SME9YWWVXbHE1WnRiaWJaYUJpVUg0T2xscXloclV4dDFiUkFhU2tK?=
 =?utf-8?B?aEw0T0EraTNtbmZ4T0VtOVkwSU9TNFhWcHhvRFBQUW8zaGpTdzJMOUZ2Tzlm?=
 =?utf-8?B?bFFvaHJTaSthZkNPazkzMWdkQkhJV3U4eVJWK0YxTGwyNUhmelRsSEZmOUVm?=
 =?utf-8?B?NW0yeWdOSEluOTNoR0tpVStPZFlPWEdnNGxUdWpFOWFnbVM5WHNHaFJ1a0JD?=
 =?utf-8?B?bXo5OHlHU1hjUGRva1VocGtBZk1ZZUd0K0pybDY1OGs1OGpqaVdVWncybEdC?=
 =?utf-8?B?dEpKUzVXVDhxdnlVbmE1NUsvS3d2bDRoMUdKZnUrai9sUVpzZVVINFlDZnI5?=
 =?utf-8?B?M2tQalBkZDIvN3o0TWRBNFlaeGNyYU5WdWNPSlBZSWRYbHFvK3BpU2ozT3RL?=
 =?utf-8?B?VTVkVzIxd1BqRlZlZndqK01xcEVQOGNGZ1hQNzhNaTZVTjZseG1rc3I3M0Vw?=
 =?utf-8?B?NGh4RHpXalpJMWhDNTVoclFSYXg1R08wM1p4K3c3VWxZOC9nZVUvT1JrOWdD?=
 =?utf-8?B?bk5sLzEzZzBuTFNyTUNyNUVjb2M1NlZHWTltN0crTXRqT0J6Kzg1Z1lPNnVM?=
 =?utf-8?B?YzBlQmRkVjdzd216WUNyYWJPVmZxd3dZdXU4bnRFemtUNURKQUQ2eDVWZ3J0?=
 =?utf-8?B?azJ6eFpPa0dFeTk0R1pFTVlWOE5VWUVQWWNMZ2VUOWNFQmJhR0tTVEhYZUdh?=
 =?utf-8?B?VmxwblA5K1FTTUQ4aEFtMlFHRVQzOWZ4VnhFWncvdDNCaWh0ZDhiQkQvNy9E?=
 =?utf-8?B?NkZid0czNkpoTlJud3FuRlIyYTlqbEJjbStoZDZtY0s3dEpGS01zeUQwZFN6?=
 =?utf-8?B?T0Y2eWFjSXJXQVh4YnUyWFF0d2pPc0RhVi95eWJHVHZNTkd0SEE1TDJFYTdk?=
 =?utf-8?B?bjVMZit2NmpYYmhJZGh2c2s3dnJLeUVPN0pXbm1sMzJ1STN4OE4vRmRWL1pl?=
 =?utf-8?B?U2VMVllrTS9CSWlLZjRadUxNeW9kdmtWNk1PRW81eE1qUG4zTmZmTFNzekZS?=
 =?utf-8?B?QzN4UklyVE9PZlpDTzBmNVhiVEZmYnJ0Rmc0ZEgzb1RCNnZmT3RqYXgyeWZY?=
 =?utf-8?B?UTRtSisxTGVDK0FwbWcvaXBTb2l6d050S0xiL1hMMG9tcjlvZnEvY0VpcXpP?=
 =?utf-8?B?SGhJSnQxU2tvbkNLdUJsdEJ0WDkyNVlYS3lnQjRYWHZqcWFFZTQreDVDaWR0?=
 =?utf-8?B?RUpPTSt6dHgrc0ZsVC9DRkZoMkloTWFDWjdLVGxCMXg3QUtOM2dkNlFhMXI1?=
 =?utf-8?B?RGZsWmY5c0JnRHRRNDFVU0paS3RKMDEzZWVXdndwQmkvNTYyT1pZYks2SWRt?=
 =?utf-8?B?MnVNZFE0ZGZsaEY3NkwrK3RHZFRqZ3JaaXZMN2VHT1BEc0dhaTNXa2owM0Fs?=
 =?utf-8?B?d29PbmVITHc2VGZ4ZzEvaTQxVmpReEMvb3YyQVhsV0NxOGNtRlErb3FjNlJG?=
 =?utf-8?Q?/ZVKp49S5UmxT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992294b1-19a0-453b-e965-08df2f9948b8
X-MS-Exchange-CrossTenant-AuthSource: OSQPR01MB6326.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 17:32:30.7956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB4079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_103249_005752_15B8DF43 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xiaochun Yu <yxcnew@outlook.com>

Commit b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context
handling for kernel-mode vector") made the KVM vCPU load and put paths
call get_cpu_vector_context() and put_cpu_vector_context()
unconditionally.  It also added an unconditional call to
__kvm_riscv_vector_restore() on the guest entry path.

The no-op definitions of the first two helpers live in <asm/vector.h>,
but <asm/kvm_vcpu_vector.h> includes that header only when
CONFIG_RISCV_ISA_V is enabled.  The KVM header also does not provide a
no-op __kvm_riscv_vector_restore() in its disabled branch.  As a result,
a KVM build without CONFIG_RISCV_ISA_V fails with missing helper
declarations.

Include <asm/vector.h> unconditionally to reuse its existing no-op
helpers, and provide the missing KVM restore stub when Vector support is
disabled.  This does not change the Vector-enabled path.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>
---
This single patch fixes a build regression when KVM is enabled without the
RISC-V Vector extension.

Tested on base a804c5742bff (Torvalds master):

- CONFIG_RISCV_ISA_V=n, CONFIG_KVM=m: full Image modules build passed.
- CONFIG_RISCV_ISA_V=y, CONFIG_KVM=m: vcpu.o and vcpu_vector.o rebuilt.
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..ebc619ed67dd 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20261021-ospp-c1-b4-submit-e22dc09faf5a

Best regards,
-- 
slack up <yxcnew@outlook.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
