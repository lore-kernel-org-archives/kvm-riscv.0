Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32FCCCA470
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXo/cyz/1EqruHIonNcOODUWsBQIubLjdmIOgaF/R90=; b=aQeg7jTqYx7fez7tFe7iuggAKM
	NpV+Te4NfZpIJGSfzQNRjPma1I9TeljBe72App7j3Mjyz6KgL/PjXCseRwFqo7goJ7Pkt+ODFApS1
	vdglEvVELGkxunLWTx32E0nzV9oYqOkO0o9awS/+3RhhuiCOeByKDB8v3uiITiMTjAcik1HlW8TKw
	BPCgQhcgrXCLOicmZcUFHpmij4JpUZjIWgJWV/KhHeFwEDIH/9+k4x418h0LFydGQdeh6NDOMeVFu
	873ust4dbDVmbVTP2H9VMoyvncNjCXH/zsC3Lh9Z3lJFwcvayhvqukbPx1VZOqvQCVWyl/aBC8OhH
	EsYflMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VhW-00000004dWP-1esy;
	Tue, 30 Sep 2025 08:27:10 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VhT-00000004dSw-2foO;
	Tue, 30 Sep 2025 08:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmvyPznHJjY/Ihon/hfxuFPwEPF6Iz8/zL54xqTclcfHYzClfHjfAfxMnOKYasL8tMaHFBtUYLyXfjVNKTRpEJKbRhxWFRn8I/Ybh5Q7jruPUz3YhHbEFSpH4IO+jAg8l9op4lMERSnxQcEM4pVQ32AFtrPl0vIPy5384soX+X2hmsnLJc0mXTc/PSTmRVrRUB/DAnxethD0j6DTjH9chbI9cKKQTLtTRTbZl2ZeUsyf+uci/W38ivrPeu1bE6Cn8pVu8wSfo3axrMIVUeBh1p8+fbX2P8BYN23t9PK/96UkpKKzzZon222OztAVbPOYJQWVdMlSF3uX6ggC5qwXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqQx/siSvgza/jSVxExB3K2dd6OkYRzPjTwKLF3XQho=;
 b=eM+P0OGWKVCews1xLm6za76mpPicucpLHIeyD6sZFbWcjLspr8+BpRfGOMSNrGDEkqkduGvRYlOF9c+2s9xckkxjVGjhq0l/gHyTTKv+mvE+tThS49/d2d+W1Hqgsjhqq+dWZOn7+o8di1QBwjXQup/5XN9nZn07Zi+Lyb79JRa5jzOsyOVp8yLKmHsOiFARTC5fPqOCCHdtJ6qPG2j62z7T+RBGSFIIGN/6Usc+bm9qWsTD84Blo8Pt4AfW1VDIsMNrhWAIoengKCvegjeJx0HsmSQIq3ElkND91asafHAgM198XijF6qljMA7Hin0eR2faUby3RMTcB445Cp81VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqQx/siSvgza/jSVxExB3K2dd6OkYRzPjTwKLF3XQho=;
 b=T9L2eqUMe95hTd+0iQ40WU8n5EQL160jkcCfs0b39vQfU3k/V2PYLtWkJKjUHiiAFkgBeRE2QRcvNFkxe+60INnH5xrrtNs3ARZxpsX0YP+P23QaJIbQqHYh6/2OQTIqk+HFqW5iqkKykZwOeJc/qSaOPFf/2iY1iiC+MPlMiyiLSoR0BBhT+nDpgIPU9yHeRGFw2+fj6BDAbdUqVBL/JfOrQF9CjnH0hsnVvw9jMkaCGFBSU77kepIykof+C45PcoDxbI2bJ0UGxdNcj4xl/4tZnNIbANwP6gRwMoj34n9o9bTv/tL5KuQUloYOBqC/NPTnSK18w4aY4EENokdxdg==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by JH0PR02MB7088.apcprd02.prod.outlook.com (2603:1096:990:53::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Tue, 30 Sep
 2025 08:26:43 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9094.021; Tue, 30 Sep 2025
 08:26:43 +0000
Message-ID: <TY1PPFCDFFFA68A8A7B407686AFB2DE4AA4F31AA@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Tue, 30 Sep 2025 16:26:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/18] iommu/riscv: Move struct riscv_iommu_domain
 and info to iommu.h
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
 atish.patra@linux.dev, tglx@linutronix.de, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-22-ajones@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250920203851.2205115-22-ajones@ventanamicro.com>
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <67b82728-66ff-45b5-8ffa-35b66cf3f046@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|JH0PR02MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8f382e-cbcf-46ab-03e2-08ddfffb154b
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrNsJbj7NxvUrpSYkT7K1zyU9/F5LFZ3l9LS+T44MweSaNc5vytV+1WvQJLbQdGbSOix4uH0LitTl2Ybvwm+XIBJZTzTeJe1bSGhVk8DA1Z8QKipIy5+l8NDTgGX2JilPF7WWupvDKh2wxXLr7rtYjhsqQpSukEgTCmc32wyTyxDo56Uzq/7msjOTJjWQ/kxNNQ2iaw0OoZWJiGBh8ZrDK3rNI7LQvS2y3HbmB3Kogy6nQmoOMxcyVfqyEXGOs27pUpof3hJCCcc/zzTwgUUhuWE0kLBhdz+cMGgToLF67siibEJU7WF9Si6cNOMvrBFmuNqf4lMbaqMy/N+u03KbwRKhX1aWMiZARrlfMrH/1c1+dX7joBsVCl7Bg6juEWZXSneB0dHVD+yvzNykaJUlxdusSUmU63fjtPzq8tui4tRUcTqSXK7DCqjGVpY9RVrBojn3ZL0sZXLbiNU2/BdIM/BTboaAVo9lws2eoVW5cK1Gp+mUDkCNUcGMlRlxUOknn5kY0Y9Qj/vMpMopsPsE9XhvMkEHe/tRpDcTV8fPLSqs0lx9LGlX5zXDb8wBTvdH7SWp1jyRF1YMKaqxOthL5kgWRM8DaDECWfzolUB5bFA5XwRFbbX8hNNfPDwfDBIVV3/i1Gv6clyck4n9L0sZF6iUvMQxa2qYCFtsnMuSZA7dWPB14kul+UHnYfWo1JSqCfCTxWCtfEi1TW5rbE+OXv/KTvZdavsQEWME/b9OdUKbg4uCECkGqsKW3x9YK9XkQU=
X-Microsoft-Antispam: BCL:0;ARA:14566002|37102599003|8060799015|19110799012|6090799003|15080799012|461199028|5072599009|23021999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVEwOS83cWoyb0ErSFBiZzFWUUhnRGZQbnRTcTRvS3ZNMDBGRnNwSXZCeU9K?=
 =?utf-8?B?UWVHRnZtYVByb0JwbUhPQmRDcXowaWp0QkIzMHE0R0FTaXVJejR2aVprUU1u?=
 =?utf-8?B?TVFTTDJWdnR2T3VSOTA3SUhDVlMvb1UwUzhvV3EvdFVQUG9GeW96NGNVdTg0?=
 =?utf-8?B?T2RBeENWOHNqSEFIVG1vWm14VUZOQzdOMzF2YUJLYXUxVmNpaitPaTZXU2dD?=
 =?utf-8?B?d3hiTm5LbitWWEVybjRNVHhmVU1JcmpEdWh0NlYreTArdHJLSjRBVWhSc1dL?=
 =?utf-8?B?T1hMV2xRVG0xT3hwYWFWd3JiUmpudlpkQ3psUFJPMGUvbERueVozTWdMN3lG?=
 =?utf-8?B?SDBQVEpSUVZ2Wk0xdkZDc2xWcVZwWnRRdlo4VFpnZS9oWWExV2h2TFlydUE2?=
 =?utf-8?B?ZkxIa1Fxd0hZcDhNbGV0SzVlb1Yyd3p4RERNUzU3VXI3Zk9nTVRlZWt6RUJw?=
 =?utf-8?B?TWRZeit4N3VhWXRMQ1FhajNrYkNuZ3dqQ3BzNTZrVnlHTXVPcWpYUEI1VW9z?=
 =?utf-8?B?ZTdrZURvUU5PZ0tXVlV0bFRJK09wVXdxMmdESk96WExGY2NldTZvTmIrOFh1?=
 =?utf-8?B?bkNwaVFyOS9kaW9BL05XNUd6YTdabVZqSlFieFBjV2JWeGpPZWYrTzZyUlk5?=
 =?utf-8?B?U0ZMSnpycHE0Qkl0SXpXbUUrdWp5SHBmRUV2UEUxUG1PazZXdVlORnphQTh6?=
 =?utf-8?B?OVJUS25LTHJlMFlBWCtBR29lKzR1WjZQdTlxeHhjRDZXdDMxUjR2ZG0yYW5D?=
 =?utf-8?B?NDZjRjJMOVAxdUZRV0NZMXpwYW9jejRIT096My95OGVvdjJBc2hYTktoOU9Z?=
 =?utf-8?B?Uk9kRlNJdWdiRWxTUWgrZWFWbXNLR252dzNvb3RrZXBXdmVlenpPYnNFMm9m?=
 =?utf-8?B?SENxaXJIWnY1YVJxKzZhSmZaZ1VveVJTZDNyK1o5cG5DdDA0dDhseHJTT1hV?=
 =?utf-8?B?RlRGOW9jUGdSbkNpZlV0ZEYxNklXNEJyZUhwS2FLT1Jmb0hzam5reDlaZ3pv?=
 =?utf-8?B?OEhsczU0SitSYVBDa2RKZStod0hUMmhDZGtObjJ4SlZxZ2NCV3lKVXp5UTRF?=
 =?utf-8?B?WnFuY1JTRzNVSXBrS3RIZmQza01hRVJBMitrTXlnMG45VkRhMHZBckk5QlFW?=
 =?utf-8?B?Uy95R09Xcy9kMHhpVDVvdW9vS2ZJOWM4NnJENTNsWDUrK0s0UGhSZE9zYUls?=
 =?utf-8?B?Y1NhWFFXZUUxaXcwU0UwOEFaZ24wcmc5aEhsSHNmZTlIZEZVV0xXWVNiL3pS?=
 =?utf-8?B?emNRRzVjRUdaUzRpWTB2aDM0RTFjdzV0a09aRmZnSWpNeTVDSW9QSEs5WjdI?=
 =?utf-8?B?Tkg0RHd5eEswVmlXbFhPQk12T3NLeDFUR1lraUh1WlJPL20yZ0k1VzI0UFJt?=
 =?utf-8?B?Sy8veFI2UCtPTHRqN29xZ25zOGp2d29BQ3g4ZEg4d3NDTWQ5QVhENi9hRk9U?=
 =?utf-8?B?VzRsTXl4cG5LOUw5ZFNRL0JlTElzdm5idXFBZFlFUWUrRGlKclhkQjhyb3k5?=
 =?utf-8?B?cXo3SFBIQXgxMU9MQnZtVzlWelJjQXJmZ2crYWMvSHEyOC9hbzZhbHN6OE5G?=
 =?utf-8?B?TkpoUk83QlJ5a2JJdlZuNTM5cnlrZVJBSzB5R3RydUZGTkMvUzBVZUlOa3Vi?=
 =?utf-8?B?Uy9OWEltSXNCbDF5QkgyQ1FucEJZTVE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnRtS3cxZUkrS3lIb0psMWFiMHBva1RVWGdEYzNYMkF1Mm1oRElscDhIeEJi?=
 =?utf-8?B?SHNNM3ZVbUxUOVpzd29nYkZhTWJ3aUo4K1oyNHBaRHpkNXoxaXp6T3d4Wm5J?=
 =?utf-8?B?REJBMXRrUi9mV0U3WG0vM0ZYbWZMZFNHSEt4ZU00dDNQbzAya0lyWjRTUVVh?=
 =?utf-8?B?WnQ3RThhWWJHQjVsUlZUWWs2b3ZrS1JzdXdmWWFINHFEcGw3bzdFRzlqYTRo?=
 =?utf-8?B?Vm9BT0tKcTRSRGZhWG4vR3M0bksrUzZyR2NtNmRXdy8rZ2VSelZpRkoyRGZs?=
 =?utf-8?B?aXlGSDhsbGE3WWtZNGdKUmQ2Uyt5RGtTV2lWd1RnNk5FbUZqV21FMXI2bVdS?=
 =?utf-8?B?Q1k4ano2bXB3aVdXSmxoSlBnYVpKRGZUMXFGeWlnSjJ1TkNmNkJ5alk0OTNl?=
 =?utf-8?B?L255cmlNemJmRVdNZEY4WEVJSU5LWGV2aWpUMUdRMVp3ZDY3ZDN2dzEySHNj?=
 =?utf-8?B?VllhYXA3TkRVT0paeC92MEJkbFp5TGtTQ2tHSTg0NVJHQnhUN1RMdFh5V1E0?=
 =?utf-8?B?azM5S0pKKzU5L3ZNYXllODhnZW9KSTgrMmVaTUUrcGJuOEJhQWJqVVFxbkNT?=
 =?utf-8?B?WURtcWsvbW94NlY0alBzbGhURGVsSjhDRzhWaWh4RldQeDZ3dm51TVdsZ1hq?=
 =?utf-8?B?UERKcFZQYnlrcU5XT0haWVl5VTJhT0E5SjFwREJRVCtjL1FVL1hyRm9qWFFt?=
 =?utf-8?B?TEhDV2xSekNMWnJQa3pmRzNPRDdSOElJeXQvK0FDR2lRRytnSUJXU0FnMlRS?=
 =?utf-8?B?alcwdjluRzVLYzJOdkRVdGNZWGUwUFhYbjdpMXlKTFd0TUNuc3NTMktYak1u?=
 =?utf-8?B?TW9sRjdlbFI3Y0t2VEZMbWZxaC82dlJOR2tvK2duVUQ3VENKeVIvcndmWmJX?=
 =?utf-8?B?QVZjK1ovVk9MSWttMisyNldzVE1PMGJVVkhQbk9LQkUycnRjeno5N1dxTlVY?=
 =?utf-8?B?aU5DYmpySktRTHBNN1RzbzBFenZJUVNhR011ZUZGN3N5NXduWmszQWJqMnFk?=
 =?utf-8?B?NmFLWi8wTXFRVGRNdHczclI5MVEwdTRVYlptOVBJQTlYaVYvcFk0V3VmQzEr?=
 =?utf-8?B?ZTVwak9VYjB4eE8zazcvMXoyeVZsNC83S3NHeWtWVWNyVFJGbTlrZkIxRGR6?=
 =?utf-8?B?bkRIWXQvS0RyRmdFaXFjUlMxbDM2UUpadmtFRFFTRXBOdnYyd3NKQlhsZC8x?=
 =?utf-8?B?Z1JSVGxIcEoxOHhOb3ZjemRBZ3F3R01hZGFZUDJMUmk4SnYzTTQxL2lPZjUw?=
 =?utf-8?B?ekdBdU5xeDZDVXVMazFpSVliSE5TaU1zUG1tT2s1b3RLWnExdXZqNDVUSzNp?=
 =?utf-8?B?cXFtTTFpR3pEMS9vNVgvUHZyZS8vZVd5a2hxbFI2NHcxcDZUcHFmYnhHbUlD?=
 =?utf-8?B?L2o2bnFjRWxkMlZTMDFwbTNLMmNXdDZDV0RiUHFyLzR0SDlRY3JNT09ZYllt?=
 =?utf-8?B?Y05NUDZadlZlYUJwam1KSlFzY1U1dlJrMktoVUpaZnYwY05FUytsbnlFZGdL?=
 =?utf-8?B?azJkUENlVjZEdXJ6SHBJOExDK3NLazM4cVI0NzYzLzNFTGlaRkR4KzZuZUtC?=
 =?utf-8?B?ZndoZ1d5cDZqL29WQ2JMK1RNanVSV2hQbG5JOUxQcGNhZWxsd1N3bU1DSnNi?=
 =?utf-8?Q?TbHeUBl9dg8MI+TmkEvyL39JzBDToBxuAYzf6aqdj11s=3D?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-a092a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8f382e-cbcf-46ab-03e2-08ddfffb154b
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 08:26:42.9821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_012707_674718_09942DD9 
X-CRM114-Status: UNSURE (   7.72  )
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

On 9/21/2025 4:38 AM, Andrew Jones wrote:
> In order to add the interrupt remapping support in a separate file,
> share struct riscv_iommu_domain and struct riscv_iommu_info through
> the header.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   drivers/iommu/riscv/iommu.c | 20 --------------------
>   drivers/iommu/riscv/iommu.h | 20 ++++++++++++++++++++
>   2 files changed, 20 insertions(+), 20 deletions(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
