Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED58FC591C
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0UgvsQta8ksqhLS90UWmUFnecbfWM2iys9kGeSywIo=; b=Owz1OrWcp+yazYIgPJ7in5PgzX
	6LYTcV+Q/BduN0FWjjVboh3WcGyssBytOfr9ba4r03VM64Kz2P5bXyxTcBdOcBCPznDASst7fDEYd
	XvsSa5p5yaOosixJfTv2Y8YhFn3E22UAbFo7JfioPjFimBBso0OPRbGiIyaICr6xicde4ZUsRFWSY
	D8pO7FPk/BX1KtIRZ0ZGox0weyW8EI30AbDsu+IzScouHnaZGrJqqUUrLIc6h2sDQMgKtE8y+Gy1z
	cp2bj66Jy5VZ9Urj9jt9ViMkzy1TxlwW/NaBg4ZaSxmKbpH+zGe9U2ElB3nP7vgH1eWD02NElR/1Y
	cFZiEL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXxN-00000005q0V-45LT;
	Thu, 26 Feb 2026 09:46:53 +0000
Received: from mail-koreacentralazolkn19013077.outbound.protection.outlook.com ([52.103.74.77] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXxM-00000005pzc-0LIz;
	Thu, 26 Feb 2026 09:46:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uivdc3KOPnN4IXuZXN1sjIaNsny72hNRVihE/bXpZXFlmqQWV/d6okcgLFCM/TwcjB6fm7yKAcJ1MBPlga/UmdrcV3aECHLtECHRJo/kVFlyJaDQmtNxM29YZ1eGYg/WNblZpy01whDWBiKnRk0YnyXEXWuayR0H18r1dk/SBd7SZXva45e+r4VEDv0yMuWxrqi0oyRq+yvy18z10HVjAXRQHp1FUl/zQLHNCKJEeEJ9vL68kp+jI/VWBcyGb9LbhavNjPNmYyXikFbrJLoxWD15cnO6DHXtoDdnrDSkYfU4q2SWnXu+AdpBfefTfXpSDitQWroSOx/KIUD+4ukWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoYpyFo/K50tNuvgj6SKBH3RrQLtjI2yBLhe0KwabEs=;
 b=Ij8uyFIRxd0/ZGcJIsOE3YRqoBNBBDpijGtHvyd72Uem0bqqTwnyCeFdM2E+L+aJE9XsxIqaQvrNY0/E4B99p7Yz0UjPW/UcW9Q3o4yFxA7irkikIGxxy0NAlRaSdiDAhsaRV81fPj/QrF0+buQAFGg62YFi8HHpOGbmxeHsSGqeO213ssD/79DLuUGWi/z++UpzjOASG0r2nU/5CQlWgt+xg02HFCAYzwP7fbScQmYN+n9XZWr/QRJnifdwTrw+ON1bIItQ5AQ/K/G+m6QkDIbOmBe9SADvu7qDT/c5I4JNvNSA+yCayIabwHKghv/Hhf/55hFiYPl7ep84LqMS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoYpyFo/K50tNuvgj6SKBH3RrQLtjI2yBLhe0KwabEs=;
 b=oAK/OIqiI8nAwk8FD1ntjxwtFsJO6lqFuJtZA8crBEBKCyYsJszwckJ2uAnnUVRwlpKHMg4MGe1u6AP2Fm5Z66Mg/IO9rrx2qqqVhMXk1esvpPKmIz1KvpUuxW0qThx3qzTm2H5+5PAJe23cJ7kd/cawDx30ljIDC0cp7WF5GBfFfd287B3UKkDEbXEj6yuE5Be5vAbmDkh5BYgEzSpJvZx0g0yUCExZDbo2+zBl/aQkhgdqjeW9CMLNbuDuUfvfQFLJ+RQaFf3euaceE3EOqTz2uJL/wWOBcNGaxFBXPTEUmTi+LDF19vdnd3mgcqgCXgPz+4d6eS8wmCSsXrOWPQ==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by TYZPR04MB8093.apcprd04.prod.outlook.com (2603:1096:405:a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 09:46:41 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 09:46:41 +0000
Message-ID: <SE3PR04MB8922DAB758E81D8B16CE44CBF372A@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Thu, 26 Feb 2026 17:46:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in
 kvm_riscv_vcpu_aia_rmw_topei()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Atish Patra <atish.patra@linux.dev>,
 Anup Patel <anup@brainfault.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
References: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <333005f2-b55b-4df0-98e7-40e998f4118b@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|TYZPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8a6e09-2b62-4596-45b5-08de751bf028
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZmcv7cN2CQdJd4XVKwegu/4uZqsT57xel8AYRw3XRvKlv6Fxa/8NQfcRlA/WQMsrQkf0j++puNEbukN7jNIR4Pg19+5zUVJuzMKKvPRa1dL2cqZ7pMZvgeJJ++1C2i3dwcFHPMUOpKaSXhrue3hgo1Qq6AO4lt/QSIxPdepvzX6R6jJ+HEvc7sPYrprQUp6pG14yJI1UPJIOxNtbBKFVASiRETNyxXwlwb+FBjCXqq4Fq9nVuv/jGFbsANj6jgEmOHWLXYFUDQnFNMKIPdJ4upnHw64l0T3pTPHTpjkO53TSR5jCe6RszCSwZwUcFDkkYrkPbeSg/tDpU0kxWk3sbclPph2hEaK2orivRTVDVgFQQcgvPPtONEFlQpNs6x/rouagVBubQ+Zvd1nGMjHJJDztKkeBbEHWjCY30zASFysCmIFus7Di9JCm7KLTCYcr/GzCd/iUbq6PMHwXXzBhaqbe5OtOk4Rv8NgvEJcexaBgHZmDQ+cbsNCCvZUPeFSfP0ZZijXZl302KpxKmYlAocqVOHxNEGlwbYkHKW1X5GMEwkxAssgFsjRTSTVoMpvzcL/SCvF0pRFA+XDiOQW4W48y/bOJ037M4X+vVDay5GkQaWerVhHD1Qnry7capFLYWDtH9NxR7G3tRvA7db3wGBMR5+JnI/lRB/A7GCY2GgJRTi8Vyj9iqZQY/kHH8+chZrAiwLJrm1RkMEue5OEadpaolbZyLN2b9q80b9N6ii9Ngq4bfwNQOii8FpsQsU2UkEozpJw0sNPzzTckSHKNKioxIeLptEyEaMJ2UqyqBKaw0b5XfeOMrQ4
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|6090799003|19110799012|8060799015|15080799012|5072599009|51005399006|461199028|7042599007|23021999003|12121999013|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzlBUEh5MVZ5eVY1VWhMa3VYSlk1L3VVbnc4UC96VnArYTlPRTA0SDhNTjlt?=
 =?utf-8?B?V2NOekJBenNUcDBLeG4reHY0RFYyTGlVc20vQzZWZlc2a0RlTWlKSDBtV2VH?=
 =?utf-8?B?bkk2OVJXRzU4RjRsSFhCYW1xOG5EQkk2MUFMSGw4QnlTL1kveTZkMW5OWS9I?=
 =?utf-8?B?N0daTkJjdXVqbStwSmkvakVLeFNWVy9WZDVHUWFsWk44MzhsTTU4Z01zbjRD?=
 =?utf-8?B?bTdrbVlWcnRFYXQ5VXJXZ3dza3lFTzBoV01QNFE2L0Q1aCtJSVdJV1kxTTRh?=
 =?utf-8?B?elR6OGtIZXdreUVaR0dlQnFSeGxPeCtxZnpKdmhubCt1d1RYbGQrdi9saHA1?=
 =?utf-8?B?TjlrM2R6RWFSZFVmNXlYb01URTNlcXZFSjFTZG5ubjRONEtwc0swZXhjc3Zn?=
 =?utf-8?B?aFVYZHRzdTlpbXM2Sjk5Zll0em9EUFBhUlhuZHlIc2dSSE0vall1dWpHRElk?=
 =?utf-8?B?UTluWjArekg3UDNibmlkblRISTJnZTl6ck0yVUsyYitIbkl2cE1QaGJka0Rs?=
 =?utf-8?B?RVNwOG9NR2ZyYmRyMWhrTGR1V2ZHZmRscmQ5OFVWejQ4MVZ3VTlIRG96WjFJ?=
 =?utf-8?B?Ym1MVFNZcTN1QnFYTTFjRWwzbE9mcWJUdUZwNDh4Uk95czBTc3IwbjFlR1Jr?=
 =?utf-8?B?UVA1Wk1KMEp5OUtBZ2RFcnBhSG5yd3JTMktoeGhQSDduT0lWSUFmOGFKK1NX?=
 =?utf-8?B?R1NiUVBZSWRXZ1ZXeDRQelVsalN2alJZaG5YdUZ5eWRXdU9lTWV4czRwdHNn?=
 =?utf-8?B?S3ZkZTRMRXhjWHlkdU9GNjFPSjZZQ2NhNGY0NDc3L295VWxhREFFWGRhS1li?=
 =?utf-8?B?UUVKV01JSDZHL3BTdDdISkp0SmNENm5jREZyZGVWaW5PdzFIVDZDRHdYRkJi?=
 =?utf-8?B?TnZ4a3FGa0pDR2ZCTkozYTFsVVQxY01KWU4yWFlLQ01jTE9aQXc2aE5ua2dP?=
 =?utf-8?B?V3ZzR1QwbDE5UXplQWJQN2ozdlc1R3FQVnBtSG9qVkxucGlEeS9FTXpjbkVr?=
 =?utf-8?B?SDhWZ1h2T1VMZnRTSGpQTnJZV09mWHJ5THRkTERLN0hudU1tMUFsSTBLd200?=
 =?utf-8?B?U1FMZGJnUlN3M3FMcktWbDlaZnNuTGpkVmtTV2V1Lys2OVpUWVJNd1MwOWZ4?=
 =?utf-8?B?NGRlNlVIY2M3dG1xWDc0VzZMT2pHK1Zsa0ZMcWZEOHFKb0k3WnQ3Mi9KMnNR?=
 =?utf-8?B?RVZROXovRjcyZldDMVFUYWttcERMMU9uUGkzWnkyZndRZGIrL1NNcms3YTh6?=
 =?utf-8?B?NzJyZVdtQkprMVlwdFNjRmhERDJDUkw4Qy9vS3NRcndKc1JhWTYvUmFSV0lp?=
 =?utf-8?B?VTBSOG8yeDRzVzEwcEduaitCT1p1cjA5TDNla2RSbHZrdkJjTVpNa1p6am1C?=
 =?utf-8?B?VUtPbUlUeVFkSkE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBubFI4citKbE9NckdyWVkxQXh4d0xXUFN3L3Q3S2xva3dqcVplMzVZT2lj?=
 =?utf-8?B?M1BSaVl0d2hrT1dYTkxLVXRyVnBkOEdBUlIzSTRzbEwrV1EyRitWeG9XbHly?=
 =?utf-8?B?Y0ZYdjROR0VqR1JTQ3F6ZWpQUVh2QnZGaDFiWmRJSlJYdWhHamV1SXJBSFoy?=
 =?utf-8?B?Ykp2cUY0TDJKWFUvNmVTWTBlN1F3TVZSSWNtVUQ0TEdsdk9UMzBFMnVuODQ5?=
 =?utf-8?B?eUl2Rm8zazF2QUFORnpwNWErRW9tSExjVkdpZVpTRW0xd3N0eUx6MitUQlhu?=
 =?utf-8?B?cVVZWCtpSk5aT3dyYXJCeGdEV2RFY0hxMk9HK3NDYzdTa3RqT2RucG5taDk3?=
 =?utf-8?B?QU1lc2ZzT3J0TW9ZSnl4Yk1jc0RlMEtWcko4cDZLS3RRNlpPL2RVcFJEcmV1?=
 =?utf-8?B?azZPWGtZUjBwT01wRnNpQndGOGRvU0ZEMWxvWllSbUc3Z0FOaEZNMU83V1Nw?=
 =?utf-8?B?TGtNb3p2Sk9pS0crZTRFeDZHTEtUTWhhWklhWEQxdHNvRUh5ZzgwWG9iaitB?=
 =?utf-8?B?UGxReVhLeFZMcVV3VUxjN1Iwd0l6cG9KRzMreWdYRXM0R0dxMFkwVUEwVHJQ?=
 =?utf-8?B?TWs5REV4Y3dMd29Hb0hjTmx5WS8vbFZkRllTTEZDcUlIWWl1ZU9Ld0VMWjlx?=
 =?utf-8?B?QmttYStDZW1NelV5UkdObXVDZXdEU0xNSUswbVhXWXNHREdFRzFhaERqTHdX?=
 =?utf-8?B?a1lHWXpsUEplRFgzRktISVk2cDJOZ0cwbitYWlZoODNvZ3VYZG5ZdFJVWkh2?=
 =?utf-8?B?STFIQ3gxcnA3OXZuRTNnTkxBQWpxMURPWEY0SVhTcnYrWmEvZm00RWhtU3ZV?=
 =?utf-8?B?azZyNFNhSjUyL3RtWnkvNEFGbnZ0MUx6OVdrUi9CUk0wQWRMRnFqdHBJaXFv?=
 =?utf-8?B?ejA2UDZISW9GWWNRdkhWNkRUbW9Bb1dhcVFOSTlSSnpUL0VKN1dVR3NSVEhQ?=
 =?utf-8?B?dUM4eDllZElubGRIcnpFbWZNQnVNNnB5MG9aMzNYWmZqalJNSnNNRUJsUk84?=
 =?utf-8?B?SnMyVU9Hem1raDZQZFpzOEpDTzBZN2JrUjZraWtxVTJNdEV3RkZDUHI5dEcw?=
 =?utf-8?B?WDE2TTFPWWkzTUxSRGp3dHFYY09wMWt3QkRDV2ZlRnJjRXpKbzNsS2IyZTdL?=
 =?utf-8?B?Nmc0Z2tVQVpBb1F5Q0t6T3hCSFJFazNNajJiR3pjOUZvK1Z2Zll1bjZnaCs2?=
 =?utf-8?B?bi85MUQxVzYvSEZqY1RoL1kwLzBGeUlXR1dheG9kV09VZWFmYXI1d1dlMXpX?=
 =?utf-8?B?S2cwME83MnJZcldTbTRha09raFUxdXRqQ2t5WHdxQ1lZeFd6cERNVjNxRDRN?=
 =?utf-8?B?dnB1dEMzZ05RV21wY0ZlSnlqdWtkeTZkVFpTQTVVeEgxUU5YL0NLdHhHa0ZN?=
 =?utf-8?B?Q0NCSlV4dEVHS0k0UU9DbktDenk2NnVVZjBKczRYUEZDY1EvREtJN1BNNzkx?=
 =?utf-8?B?RUV6bDl1MGRKRTk5KytxdTdvT1ZmRXVCTzBvajBEdWRIaDB1WGxYZTRMS0FS?=
 =?utf-8?B?ZThoS21rT3libDNCRVI5TTJPb2ZFNGgzY2J2WjlUdEEvcFM3M2t5S1U2Qk9u?=
 =?utf-8?B?aUpYWCtqdkkwcTRramRVV0pJRDgxSmNFdXpHVDFOOGZtY2o1RW5hSVZvZ0lv?=
 =?utf-8?B?amZPTlFjQzM3OFVrTFQ2V1ZhZUhtRzQwZ1JuQk83dko5NURwOW8vVTBVd0VU?=
 =?utf-8?B?MExWekdLZmRPSTQ4N05xV01DT1ZzN3NDbitMOWFEOWVycXJwSDAvT3NiQk5q?=
 =?utf-8?B?RHc1YWNLOEZ0Y2l6SzdCNC9hOGxqQ2RxWFY2c1BORmh2Y2wvZ080cVhZQWNN?=
 =?utf-8?B?cDk4bU9IOWx4Y1d6ODdwbXNWbmt3eGdPaGowaUZoRExobjZHNGNqMFN1Y0hO?=
 =?utf-8?Q?gzs2PCXhRpG0x?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8a6e09-2b62-4596-45b5-08de751bf028
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:46:40.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_014652_158991_485F7576 
X-CRM114-Status: GOOD (  17.76  )
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


On 2/26/2026 4:51 PM, Jiakai Xu wrote:
> kvm_riscv_vcpu_aia_rmw_topei() assumes that the per-vCPU IMSIC state has
s/kvm_riscv_vcpu_aia_rmw_topei/kvm_riscv_vcpu_aia_imsic_rmw ?
> been initialized once AIA is reported as available and initialized at
> the VM level. This assumption does not always hold.
>
> Under fuzzed ioctl sequences, a guest may access the IMSIC TOPEI CSR
> before the vCPU IMSIC state is set up. In this case,
> vcpu->arch.aia_context.imsic_state is still NULL, and the TOPEI RMW path
> dereferences it unconditionally, leading to a host kernel crash.
>
> The crash manifests as:
>    Unable to handle kernel paging request at virtual address
>    dfffffff0000000e
>    ...
>    kvm_riscv_vcpu_aia_imsic_rmw arch/riscv/kvm/aia_imsic.c:909
>    kvm_riscv_vcpu_aia_rmw_topei arch/riscv/kvm/aia.c:231
>    csr_insn arch/riscv/kvm/vcpu_insn.c:208
>    system_opcode_insn arch/riscv/kvm/vcpu_insn.c:281
>    kvm_riscv_vcpu_virtual_insn arch/riscv/kvm/vcpu_insn.c:355
>    kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:230
>    kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:1008
>    ...
>
> Fix this by explicitly checking whether the vCPU IMSIC state has been
> initialized before handling TOPEI CSR accesses. If not, forward the CSR
> emulation to user space.
>
> Fixes: db8b7e97d6137 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V1 -> V2: Moved imsic_state NULL check into kvm_riscv_vcpu_aia_imsic_rmw().
>            Updated Fixes tag to db8b7e97d6137.
> ---
>   arch/riscv/kvm/aia_imsic.c | 4 ++++
>   1 file changed, 4 insertions(+)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index fda0346f0ea1f..60917f4789d84 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -892,6 +892,10 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
>   	int r, rc = KVM_INSN_CONTINUE_NEXT_SEPC;
>   	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
>   
> +	/* If IMSIC vCPU state not initialized then forward to user space */
> +	if (!imsic)
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +
>   	if (isel == KVM_RISCV_AIA_IMSIC_TOPEI) {
>   		/* Read pending and enabled interrupt with highest priority */
>   		topei = imsic_mrif_topei(imsic->swfile, imsic->nr_eix,

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
