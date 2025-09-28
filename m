Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A760CAC5B5
	for <kvm-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLAq+v68U2ZDH+qrqgEkahzSP0mZe5Gv8lLAaSNzm+U=; b=ubXbkJgsw4tMn7tkvNb0ZOSLZp
	INQvlUcLKSIvgkC7YchGbuEHHAueTN9n6wAsEYeUpKYnriLrgGDWXIH+DdGBEYibaTeqlAJOyQyi5
	4BWYUB1KqM4KcVlaKmWqaWJW3/D/OKwTXM4hh7Ue/qdO/zyov62fA8bhdgMd63Ac59t1nf/Vx/K6o
	wHP3fs/DxJom0u5BTOo/QXdUbbrNNWR4R8oNIpXWzNRBRnPRvhJvgs8aeKWS+m806cYHrtZDY4dQm
	hDYVDlQifgOOPVgXuWX8oNSTFehZUTqleO/uQzffU1lQfcRFgVtuAAxhTca7QmhovhLrsfk1YpZ3r
	91C2iGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nkI-0000000Efov-2BAv;
	Sun, 28 Sep 2025 09:31:06 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nkF-0000000Efl5-2c1R;
	Sun, 28 Sep 2025 09:31:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9xBGoKT19G5/Pp8XnFJSDJXHZQKGWaGSYoJZ0kWZI6XGW/G4NoQ9u1deldg66oTVtsXaVpjE0bsJbabEolv/qO+ayfGoKloUYWLMkV+zq3OzTK1kz9joosFjWHqNDzD3Th/QZ8A5N2qJ5xfD/AlQjdxW9udzs7r3NqCNxojq/5X45F7G0VvgqQq5FVVtYomf0DdNXFKNAVkZH5s+1Him9mhBvX5AIsuHcl2IsGMZZaofFHsMs2OYZK9K8I6Qkx8t51QrM9059GSevk2ceB9RjOpyd280aNLC89pw9e/IwcA/JVuEJXbBOmDeHWe+MUEQmMWRG1jW3+JryG4floz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXE45bbZ2O+3AwlteHlZGra4JghQ889bmZ9HPLXlJO8=;
 b=GdZFhfnTUm5SeBhQEso1NYI3DxdTkL/S9sgWM2ZBDt05sV0YhhYl7fgMZY80QAlOv9nzjGtZA9uE9GFuZ4EuczkJ27bF1020Jkj7vgOxHmXsOGcO07m597X4E7EVqD2cnT7FXCfz10VR3Pm9aEOzGXyaFYbnMfdP86R0uT8UEG+Dp6EWBqIe9UD25jEw131WOt89QtkREcSXEzguzjOPa31hkcLJVYX7TwEwKKlt5HyUuRrqAsecjrwm5JUb5kxvwBSp50zGkCF/mDbaM1r/0/6mwn5A9o9MP5c9Wksco1Ot9G/GH2U+UM7GzneEoGTYG/lxjgDL7Moo0WavKRPcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXE45bbZ2O+3AwlteHlZGra4JghQ889bmZ9HPLXlJO8=;
 b=m15ZrRW2rkgO1h27kK9ujZS7CVxSdBZPt0uUJcrzWBM4najI6CtB0ODGZ62ZZuvGlQFisLonepXDHIzb4Kzr6GlzOL3hXqwrKZmTejjNMLzQiTMGYjvn4I3OdHy0/1bDnz44IvEn2xhLYjLxvkzK75rXWFS+/xKF4MslN+HDbhZOOA3QaOmURFHZHZSspXegueBNv+Cpx/ESZPWxSYEntDHQN+DPCfj5yQM2gErguHonx2exy7zvqkJAUIXYHJ0AFEfiz5X1L1pr26y5rBRaJdJPRZZfk4jmHOKUC3VL0c3Ath4noXLE3rZYGV7nXu9u2nz9rTTjuo6romJs27iOWA==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by SI1PPF7CE38F105.apcprd02.prod.outlook.com (2603:1096:f:fff6::759) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Sun, 28 Sep
 2025 09:30:33 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9094.021; Sun, 28 Sep 2025
 09:30:33 +0000
Message-ID: <TY1PPFCDFFFA68A1C49C083357FF49575AEF318A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Sun, 28 Sep 2025 17:30:26 +0800
User-Agent: Mozilla Thunderbird
From: "Nutty.Liu" <nutty.liu@hotmail.com>
Subject: Re: [RFC PATCH v2 04/18] iommu/riscv: Add IRQ domain for interrupt
 remapping
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
 atish.patra@linux.dev, tglx@linutronix.de, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-24-ajones@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250920203851.2205115-24-ajones@ventanamicro.com>
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <0be8b7c6-bfa0-4be4-a3ce-c819882bea77@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|SI1PPF7CE38F105:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb86983-5042-4bea-6e60-08ddfe71ac30
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|23021999003|8060799015|12121999013|6090799003|5072599009|19110799012|461199028|37102599003|15080799012|3412199025|40105399003|440099028|19111999003|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWRNTmJuTk5PdzJhc1pIMm1MN0cwTFZxT1NUVkFPTy9HNjVKajhwMUpLa21Y?=
 =?utf-8?B?YlNXWGhOZEtldnQ1TTFWV1h1aHQxQTR5U2s2cldWMGl0a2hsN3ljQXc3UlV4?=
 =?utf-8?B?bkx5a0hUVHdmWGE2Q3lBaEEwM1ozUXdXbGlWNG9aaVpmL01VMnBuOG1kNzJ2?=
 =?utf-8?B?USs1dkl1ajNYRDdHRFJydXBYcEZ2RFNkdUNhMXpmTzBhT0sxQWhoaXlheHJz?=
 =?utf-8?B?c1JxNDVES1NCR3dQNVFwTHo2cVVkbkU3MGtGckZOVEhwbWU3ODhLaXR0cTZt?=
 =?utf-8?B?ZkMvSTQ2NnljcVNhTDZoZVZibW9tNHk2TDN2Z0VONDZNODlyRm5xQjFlaGJC?=
 =?utf-8?B?dzhGQ1ZEUkEvYmxoRkhXaHRDM0hpcTdocGl0MWJtVHpqdFFmWVJsWlh1Mnh5?=
 =?utf-8?B?VXBjREVPQkFOWlZ4bjB5UlQzK0IvVjYwSUR5R0tmQmM4aEhKY2J2U1JrbFZ3?=
 =?utf-8?B?bXY5Z1c3dE5iK0kxY1hVTjRnZnZqT3RnRW9hRmJzbzNpWVZoVXVwT0dFcnFN?=
 =?utf-8?B?YkFkZVVuRTdtVFlObXRaMGJiamxiWlRPZXZrc3FPaXRxWThhS2RYMmFQQkVk?=
 =?utf-8?B?Ynl5SCtEVUpadGM2QXNZQU9KVzlsNzM1c2ZpOFZ5dWtUVzRoL3I2UjI4bkF1?=
 =?utf-8?B?TzhySTRncEh5eE5SNGVENW5IRWJBQ0NmK1g3OE5yTDNGSmp4K0pFMWg3Y1Vi?=
 =?utf-8?B?bUpxZjN5dW1NbDlBN3kzNlloNklTSndOT3pLRW5kbFhIRk96U1daOGd5NU1k?=
 =?utf-8?B?UEVHL2J2dzc0TWZJR2pUdVppN2I5dS9GOFRaUFBHSmJXN2F3R2NWMlZQZWJa?=
 =?utf-8?B?bW4zMC90YmI2eDR6L2h6UzlWY2REYmhHSmJ0b2ZPZVpHRFloT1lwcGVGL2ZM?=
 =?utf-8?B?RkZYN2hkK0ZOMzRyeUNVMndXblhrNlJwdjNJWlBWM3dTQ0hWZXJxUHRyQ096?=
 =?utf-8?B?UFVyVFlua1p2UXFCS01ucENMVFNaMmZaVWFIc1VHdmoxd1E2UmpDR3BjOXQr?=
 =?utf-8?B?cnZPYVllQVRrSTNOT2FnejRGazZOK2FLVFdpZjhvUXBwcHQzcWhtejJwdTB4?=
 =?utf-8?B?UUNTbHlUWm9rZlhueXZDR2w5bW1DWWU4aG45MktyUlBtYkxzMHYrMzJYQWVF?=
 =?utf-8?B?OFdFL2hqd3doSWNhUHR0SjRDU2F6VlVyWHdLVWZ2eXZxdGpKenNSOSsyTHJ6?=
 =?utf-8?B?ZXAzWE15SlZDOGtBeWdMMmJjbjZyL2ZVcnN2OGw1QkRLRDh5VWQzNUlscDFy?=
 =?utf-8?B?aDVEK2x5RDN0SWJPaDZ3TWplbXdCaTZkTXQrRGRYRHNQWnlVWTd0NHY5OUFh?=
 =?utf-8?B?cDRIVFhTSVdVazF2YTIzNXlwZnhsUVBoc0hjdDd6eWpWSkhpYjFwSTdvL1Vi?=
 =?utf-8?B?TXVwQUZxL05haHpRRFhYdXc4Qk5GSEJROWpQMTJNS1ZJTE1WWWdWOVZEY2Jz?=
 =?utf-8?B?bFQ3WlBNSDhDOGhBNFBNMkZCb0htcTF0bFJOQy96SnkvVHMzTERMTHVHVTc1?=
 =?utf-8?B?Y2dPWXJFYThOam15Sk1XUTZjdGFGMkwrYTl1Rkx1YTNoc3JoNXVvRkdFWTcv?=
 =?utf-8?B?UFF5S1FvRnJoaldSZ3liaENYM2I2VC9SYmVNcWZwTDRiSExrcmtDZVEyaFlp?=
 =?utf-8?B?ejZsSCtreFI2UERqK3ArUEgxeW5iRlNqQWltMGZraUJJMXVVOXNtOTl1blI1?=
 =?utf-8?B?Qi9nRDh5d0t6ZCtORDFmRjI2Smd5NjVsMnhpM0pheGdzdXpmQnNCWjA1UXA2?=
 =?utf-8?B?ZXdPN1JxcGQ1VDUyeS9jbXd4UUNEM0YweHhSZldDWW9XT3JYYWxCRERueFl2?=
 =?utf-8?B?d090MDk3amNRQkhESDg3dz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpzWExIdUtsK2lmNFNJS0hRc01wb1lvVTE5c3pUQTJmSllreExrSDEvTDZi?=
 =?utf-8?B?UHRjTTZvcVBFcEllRnVIOC8vSWpzZG1LYUxCTkhNS0FxenI4Q1hxVXFHMjJR?=
 =?utf-8?B?cFNTSTJkT3dQUUJNVFozZHp0THVjWWlRUWdlazJMQ2RsYjBNbUw4WGVkSDFD?=
 =?utf-8?B?K29nQ1JxSFYySFNqdk0xVFJhSmUwS05zREdRUC93WVlPYXg3NzY2czlqaVpH?=
 =?utf-8?B?aHFDeXJDM2E5dUErdWFHeFVTT0d1T1Nqb2d2T09jYWEzK3N5K1ovZU9JOXVl?=
 =?utf-8?B?S0VGc0huZ2l2ajJISUh6ZjZBMm9qVmlrZUgrcnBQVkMyZkNMVW4xc0Zqak1v?=
 =?utf-8?B?MloxQWdHOXFSdXNLb0lMQnJGUTJUQ2ZwSU9wNWhUSzJINjNkVE93dmw2UkpC?=
 =?utf-8?B?YnZPTnhiM1U2eTJWR2FScU9rK25CM2UveCtzRTNweSsrMnFkZFRUckozNm5F?=
 =?utf-8?B?dHMwMzl5TGtTL3lIR1Q4eHpnOVdSZ1lpWDFGTFhDUitRbkhQVnZ1c3dMRndS?=
 =?utf-8?B?ejlIR1p6VVpNWnY5YmlVem5YMFZ5cjJoMWtrMm5QeGJTampLSWtBUlpjcEky?=
 =?utf-8?B?YzFUTmtLVnpyT2ZNaDBBVHRUS3BxQjRVTlZxV0NHMkpKUzBGZzRQL0drbk1R?=
 =?utf-8?B?eTdKMzZ4NXl5akxSbG1WdTZvSVJjbHFUZTRBQ2wxNnNIV3F2Vm1sd1pmcFg2?=
 =?utf-8?B?ZVpjRjRLYzFabkVBRnVZM2RaTndqN2JJeG1haCtmek05SWRiaDZYYUxrbG95?=
 =?utf-8?B?cmYvL3FDTVlCWEdXSnkzazMwb2tDMnJscDVEc2FYT3grSXpvR2tUb001T1Yx?=
 =?utf-8?B?YkRIOWdBZnpqaXBESVh1WlA3SlNPOFd4UGdOSWdaaDJONmRlNjhnUmhiTkZj?=
 =?utf-8?B?ZmFPbmRUU3dnZVlacUg4b3JlN2IwRFRhTmxjbmVvOHRmaURCSEhuYm1mblk4?=
 =?utf-8?B?UVhLaTZldnFGSUl4a1VTdW8vRWFwaGF2aGJDSm1adklaNFJVMXZOeVluM2FP?=
 =?utf-8?B?clNWUVk3OWE2Tk92Rjc2dW9PbG1IN0xpaGNabXdMWk01WU0zNjZVRWtwOXk5?=
 =?utf-8?B?MXBVRVRhTzVxbmdCbnJmdForNUdzd3ErRGptRkxxa3Rya2tucVZNMi9NWFRS?=
 =?utf-8?B?R0FhOXlvMDJVeVYvWm5QdWdHVjM5VXMwekhsbEY0NU1rRTFhQ0ppL1dIbXMz?=
 =?utf-8?B?QXVMWUoxNlF2L3F6Z2NtV1hTT3Vmb0MrZDI4aFk1UFZFZ3ZVWGFJZ0llZ0tD?=
 =?utf-8?B?UHJEYUkwWlF1M2tXRE92MHNvckxTNTZGUWlIbEV6ZnFBSEV5Wk1vLzUyQStn?=
 =?utf-8?B?dDJ4ZDdydnQzVWRuWU15V1hKZzN3ZUZOSHBialBTSUhjOFc3L1BkLzZNRUV1?=
 =?utf-8?B?dHhvOEo3TzF4a3Bzd0NKTWN6VTVGL1pFd1lVeDlmN0hlNkM0UlJWL3EyKzBi?=
 =?utf-8?B?RTA5VDFhc2MwdW5vVUNYc215TkdGeVVTTmgyMlI2aE9qVnZwS2FURjF2U1Ew?=
 =?utf-8?B?Z3RwYmx1bWxPOGsvRG5iTFYxMmFRMHAyMnBlcE9vQ2hkNUpIME9lTnA1NUE5?=
 =?utf-8?B?YkVWbkIzZTFoRG5WL2x3cVJaUnJrTGNDakN6QW4rWVhwcTk4QU9nRFRCMDZa?=
 =?utf-8?Q?VfKaoyYl/rYNYzmOJg4xoB3MS9CLWYSo9FvbpDbN1nF0=3D?=
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-a092a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb86983-5042-4bea-6e60-08ddfe71ac30
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 09:30:33.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI1PPF7CE38F105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_023103_769993_1440C794 
X-CRM114-Status: GOOD (  24.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDkvMjEvMjAyNSA0OjM4IEFNLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVGhpcyBpcyBqdXN0
IGEgc2tlbGV0b24uIFVudGlsIGlycS1zZXQtYWZmaW5pdHkgZnVuY3Rpb25zIGFyZQo+IGltcGxl
bWVudGVkIHRoZSBJUlEgZG9tYWluIGRvZXNuJ3Qgc2VydmUgYW55IHB1cnBvc2UuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXM8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUtaXIuYyB8IDExNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICB8ICAzNiArKysrKysrKysrKwo+
ICAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5oICAgIHwgIDEyICsrKysKPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMTYzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWlyLmMKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlIGIvZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmls
ZQo+IGluZGV4IGI1OTI5ZjlmMjNlNi4uOWM4M2Y4NzdkNTBmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L01ha2Vm
aWxlCj4gQEAgLTEsMyArMSwzIEBACj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKPiAtb2JqLXkgKz0gaW9tbXUubyBpb21tdS1wbGF0Zm9ybS5vCj4gK29iai15ICs9
IGlvbW11Lm8gaW9tbXUtaXIubyBpb21tdS1wbGF0Zm9ybS5vCj4gICBvYmotJChDT05GSUdfUklT
Q1ZfSU9NTVVfUENJKSArPSBpb21tdS1wY2kubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LWlyLmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWlyLmMKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDhjZjE1OWI1ODdkCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtaXIuYwo+IEBAIC0w
LDAgKzEsMTE0IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
PiArLyoKPiArICogSU9NTVUgSW50ZXJydXB0IFJlbWFwcGluZwo+ICsgKgo+ICsgKiBDb3B5cmln
aHQgwqkgMjAyNSBWZW50YW5hIE1pY3JvIFN5c3RlbXMgSW5jLgo+ICsgKi8KPiArI2luY2x1ZGUg
PGxpbnV4L2lycWRvbWFpbi5oPgo+ICsjaW5jbHVkZSA8bGludXgvbXNpLmg+Cj4gKwo+ICsjaW5j
bHVkZSAiaW9tbXUuaCIKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAgcmlzY3ZfaW9tbXVf
aXJfaXJxX2NoaXAgPSB7Cj4gKwkubmFtZQkJCT0gIklPTU1VLUlSIiwKPiArCS5pcnFfYWNrCQk9
IGlycV9jaGlwX2Fja19wYXJlbnQsCj4gKwkuaXJxX21hc2sJCT0gaXJxX2NoaXBfbWFza19wYXJl
bnQsCj4gKwkuaXJxX3VubWFzawkJPSBpcnFfY2hpcF91bm1hc2tfcGFyZW50LAo+ICsJLmlycV9z
ZXRfYWZmaW5pdHkJPSBpcnFfY2hpcF9zZXRfYWZmaW5pdHlfcGFyZW50LAo+ICt9Owo+ICsKPiAr
c3RhdGljIGludCByaXNjdl9pb21tdV9pcl9pcnFfZG9tYWluX2FsbG9jX2lycXMoc3RydWN0IGly
cV9kb21haW4gKmlycWRvbWFpbiwKPiArCQkJCQkJdW5zaWduZWQgaW50IGlycV9iYXNlLCB1bnNp
Z25lZCBpbnQgbnJfaXJxcywKPiArCQkJCQkJdm9pZCAqYXJnKQo+ICt7Cj4gKwlzdHJ1Y3QgaXJx
X2RhdGEgKmRhdGE7Cj4gKwlpbnQgaSwgcmV0Owo+ICsKPiArCXJldCA9IGlycV9kb21haW5fYWxs
b2NfaXJxc19wYXJlbnQoaXJxZG9tYWluLCBpcnFfYmFzZSwgbnJfaXJxcywgYXJnKTsKPiArCWlm
IChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgbnJfaXJxczsg
aSsrKSB7Cj4gKwkJZGF0YSA9IGlycV9kb21haW5fZ2V0X2lycV9kYXRhKGlycWRvbWFpbiwgaXJx
X2Jhc2UgKyBpKTsKTml0cGljazrCoCBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8gY2hlY2sgaWYgJ2Rh
dGEnIGlzIE5VTEwgPwoKPiArCQlkYXRhLT5jaGlwID0gJnJpc2N2X2lvbW11X2lyX2lycV9jaGlw
Owo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGlycV9kb21haW5fb3BzIHJpc2N2X2lvbW11X2lyX2lycV9kb21haW5fb3BzID0gewo+ICsJLmFs
bG9jID0gcmlzY3ZfaW9tbXVfaXJfaXJxX2RvbWFpbl9hbGxvY19pcnFzLAo+ICsJLmZyZWUgPSBp
cnFfZG9tYWluX2ZyZWVfaXJxc19wYXJlbnQsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1zaV9wYXJlbnRfb3BzIHJpc2N2X2lvbW11X2lyX21zaV9wYXJlbnRfb3BzID0gewo+ICsJ
LnByZWZpeAkJCT0gIklSLSIsCj4gKwkuc3VwcG9ydGVkX2ZsYWdzCT0gTVNJX0dFTkVSSUNfRkxB
R1NfTUFTSyB8Cj4gKwkJCQkgIE1TSV9GTEFHX1BDSV9NU0lYLAo+ICsJLnJlcXVpcmVkX2ZsYWdz
CQk9IE1TSV9GTEFHX1VTRV9ERUZfRE9NX09QUyB8Cj4gKwkJCQkgIE1TSV9GTEFHX1VTRV9ERUZf
Q0hJUF9PUFMgfAo+ICsJCQkJICBNU0lfRkxBR19QQ0lfTVNJX01BU0tfUEFSRU5ULAo+ICsJLmNo
aXBfZmxhZ3MJCT0gTVNJX0NISVBfRkxBR19TRVRfQUNLLAo+ICsJLmluaXRfZGV2X21zaV9pbmZv
CT0gbXNpX3BhcmVudF9pbml0X2Rldl9tc2lfaW5mbywKPiArfTsKPiArCj4gK3N0cnVjdCBpcnFf
ZG9tYWluICpyaXNjdl9pb21tdV9pcl9pcnFfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgcmlzY3ZfaW9t
bXVfZGV2aWNlICppb21tdSwKPiArCQkJCQkJICAgIHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJ
CQkJICAgIHN0cnVjdCByaXNjdl9pb21tdV9pbmZvICppbmZvKQo+ICt7Cj4gKwlzdHJ1Y3QgaXJx
X2RvbWFpbiAqaXJxcGFyZW50ID0gZGV2X2dldF9tc2lfZG9tYWluKGRldik7Cj4gKwlzdHJ1Y3Qg
aXJxX2RvbWFpbiAqaXJxZG9tYWluOwo+ICsJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuOwo+ICsJ
Y2hhciAqZnduYW1lOwo+ICsKPiArCWZ3bmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiSU9N
TVUtSVItJXMiLCBkZXZfbmFtZShkZXYpKTsKPiArCWlmICghZnduYW1lKQo+ICsJCXJldHVybiBO
VUxMOwo+ICsKPiArCWZuID0gaXJxX2RvbWFpbl9hbGxvY19uYW1lZF9md25vZGUoZnduYW1lKTsK
PiArCWtmcmVlKGZ3bmFtZSk7Cj4gKwlpZiAoIWZuKSB7Cj4gKwkJZGV2X2Vycihpb21tdS0+ZGV2
LCAiQ291bGRuJ3QgYWxsb2NhdGUgZndub2RlXG4iKTsKPiArCQlyZXR1cm4gTlVMTDsKPiArCX0K
PiArCj4gKwlpcnFkb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9oaWVyYXJjaHkoaXJxcGFyZW50
LCAwLCAwLCBmbiwKPiArCQkJCQkJJnJpc2N2X2lvbW11X2lyX2lycV9kb21haW5fb3BzLAo+ICsJ
CQkJCQlpbmZvKTsKPiArCWlmICghaXJxZG9tYWluKSB7Cj4gKwkJZGV2X2Vycihpb21tdS0+ZGV2
LCAiRmFpbGVkIHRvIGNyZWF0ZSBJT01NVSBpcnEgZG9tYWluXG4iKTsKPiArCQlpcnFfZG9tYWlu
X2ZyZWVfZndub2RlKGZuKTsKPiArCQlyZXR1cm4gTlVMTDsKPiArCX0KPiArCj4gKwlpcnFkb21h
aW4tPmZsYWdzIHw9IElSUV9ET01BSU5fRkxBR19NU0lfUEFSRU5UOwo+ICsJaXJxZG9tYWluLT5t
c2lfcGFyZW50X29wcyA9ICZyaXNjdl9pb21tdV9pcl9tc2lfcGFyZW50X29wczsKPiArCWlycV9k
b21haW5fdXBkYXRlX2J1c190b2tlbihpcnFkb21haW4sIERPTUFJTl9CVVNfTVNJX1JFTUFQKTsK
PiArCj4gKwlkZXZfc2V0X21zaV9kb21haW4oZGV2LCBpcnFkb21haW4pOwo+ICsKPiArCXJldHVy
biBpcnFkb21haW47Cj4gK30KPiArCj4gK3ZvaWQgcmlzY3ZfaW9tbXVfaXJfaXJxX2RvbWFpbl9y
ZW1vdmUoc3RydWN0IHJpc2N2X2lvbW11X2luZm8gKmluZm8pCj4gK3sKPiArCXN0cnVjdCBmd25v
ZGVfaGFuZGxlICpmbjsKPiArCj4gKwlpZiAoIWluZm8tPmlycWRvbWFpbikKPiArCQlyZXR1cm47
Cj4gKwo+ICsJZm4gPSBpbmZvLT5pcnFkb21haW4tPmZ3bm9kZTsKPiArCWlycV9kb21haW5fcmVt
b3ZlKGluZm8tPmlycWRvbWFpbik7Cj4gKwlpbmZvLT5pcnFkb21haW4gPSBOVUxMOwo+ICsJaXJx
X2RvbWFpbl9mcmVlX2Z3bm9kZShmbik7Cj4gK30KPiArCj4gK2ludCByaXNjdl9pb21tdV9pcl9h
dHRhY2hfcGFnaW5nX2RvbWFpbihzdHJ1Y3QgcmlzY3ZfaW9tbXVfZG9tYWluICpkb21haW4sCj4g
KwkJCQkJc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAr
dm9pZCByaXNjdl9pb21tdV9pcl9mcmVlX3BhZ2luZ19kb21haW4oc3RydWN0IHJpc2N2X2lvbW11
X2RvbWFpbiAqZG9tYWluKQo+ICt7Cj4gK30KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gaW5kZXggYTQ0YzY3
YTg0OGZhLi5kYjJhY2Q5ZGM2NGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gQEAgLTE3LDYgKzE3
LDggQEAKPiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaW9t
bXUuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2ly
cWNoaXAvcmlzY3YtaW1zaWMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPgo+ICAg
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAg
Cj4gQEAgLTEwMjYsNiArMTAyOCw5IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvZGlyX3Vw
ZGF0ZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwKPiAgIAo+ICAgCQlXUklURV9P
TkNFKGRjLT5mc2MsIG5ld19kYy0+ZnNjKTsKPiAgIAkJV1JJVEVfT05DRShkYy0+dGEsIG5ld19k
Yy0+dGEgJiBSSVNDVl9JT01NVV9QQ19UQV9QU0NJRCk7Cj4gKwkJV1JJVEVfT05DRShkYy0+bXNp
cHRwLCBuZXdfZGMtPm1zaXB0cCk7Cj4gKwkJV1JJVEVfT05DRShkYy0+bXNpX2FkZHJfbWFzaywg
bmV3X2RjLT5tc2lfYWRkcl9tYXNrKTsKPiArCQlXUklURV9PTkNFKGRjLT5tc2lfYWRkcl9wYXR0
ZXJuLCBuZXdfZGMtPm1zaV9hZGRyX3BhdHRlcm4pOwpTaW5jZSB0aGUgTVNJIHBhZ2UgdGFibGUg
cG9pbnRlciAobXNpcHRwKSBoYXMgYmVlbiBjaGFuZ2VkLApzaG91bGQgYWxsIGNhY2hlIGVudHJp
ZXMgZnJvbSB0aGlzIE1TSSBwYWdlIHRhYmxlIG5lZWQgdG8gYmUgaW52YWxpZGF0ZWQgPwoKT3Ro
ZXJ3aXNlLApSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+CgpU
aGFua3MsCk51dHR5CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
