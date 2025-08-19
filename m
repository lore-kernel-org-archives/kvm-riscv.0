Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE4CA0EF5
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcOakXWEuoxg2LT+mv8xDcerExzHUJY8Ot+A6YvYQqo=; b=HdMy17UcHGexZo4ozrBMsU+teg
	jStwdnWswZu5cbPM7CZVs32mRihcq61xYgaqQJ0yttsw6z2WkKxc6GNy4zqvCwCtzy1L1dsveutWO
	PQ7n44N5vRmW0J8xQ3I3tTPeda1RPWVjUTlXhXNjH5MtWj8QC0e1qpGlyFLoG+v2HzaccgwZvzf/T
	xnGfmmkUJf3Q0hvQfmezYoRQjelPMRhEGaSfso+JiBcXwD0YIoVDa+xP/VSKYBUUHhNOa4Yjo+AJx
	BxubUSW4sA1YreX4H/L2LCVcx1DsoN+A6TL9LMY1Xnc3jf8xZDOgJiKQmoJBS8n0vf0WiRzALtyIz
	WkNvsQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIlj-00000009z7g-0MmC;
	Tue, 19 Aug 2025 09:36:39 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIFD-00000009smW-3fPO;
	Tue, 19 Aug 2025 09:03:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJNpTo34hCQcCbuLSFktO9Y763ieB2D14ZfTDpEus5GZsWXSWuZb2VUKv7u4mQVGsTYHZA2jALITQHbP26HezzjJLggXQsTkGz4qbZqCwuMZAKKi7OTCCErPNq9m/Txa+eCZJABD/0AkBaM72XPhcUgm1A3jZQ6CkEFxFRuYkm/mgw7/uA8p+3SuPsR6NhDdbVbP7I5apGkA4QOuxOoI38mMcdCNM0t4926ZncX1pncz2k5aSD1D717a7JPErUFvEiLNbzT5mWznJdNdsZXUWoIu2PVDjUuVyrU94whSx5hXKLnbkid3AcLoSlrnvbD+wA2dHWiISfmE6XBO731jBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DtaTR3PXzI4QaHLG5H03mmBovIuZaySImF8NF8kkRk=;
 b=BR5/IDXWNcPfKA8BKj4heSsyR5HyYZbrpIhn+QLlJVj3isqCAYQu8mZ3lLTNHWIOo+ieN63ajdcALkVEdKdxtAfBsTLSVso0gxAv3unDZYTDsVtZyay+H1v/gyP2F7BpDnr2nJi31owm+OQjjXvotarjy6hPfLnzfNrzD2JTauY5Japkzf0exiAxomcqXBwVqmSzPghArnN+UynFnQIPgtXydhCkz7KzvGXiTJx5EnjgvLU+lickhVr4QuuRfhoNkkAQQAWm+dqhoAz5QlDT9gtuz7hnm8qwIJUWo0ga8m7jfqSg9KMqQZN2Ie+kwbJUp0C9NUf/IElo+u5nTmP5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DtaTR3PXzI4QaHLG5H03mmBovIuZaySImF8NF8kkRk=;
 b=SQAfFuaBaNPALJ0X9v1GM9wC3WcavDxauKeiAod2iwRAylyn28QWgwgsfMuw+ypplpydy4TIr//KdiOHu45hZ0XIl69cqAeBqISpfcaUM+0FPsBbwEMXUzKQGEHI6HbFO3cqgbQGuyUT6wnSAx7AZ/NjDILK6t3ra5UOCJQqUeI5CnokJxWo+Zyv8XAqUvk80KF4PL+Lqwai26YvG+qg+Fa1QLlfM0+cAozEXZTw77WtwoeHboe9kE5FUH2ivTdn8iPP17li1vWfNxXmcl2Xy/q1kuVIAa70us9goBtRJvTrwZyN6cKRczh35IVTdqFxkaWQ89bc6SzTzT+jFy/EWQ==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by PUZPR02MB6114.apcprd02.prod.outlook.com (2603:1096:301:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 09:02:55 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9031.018; Tue, 19 Aug 2025
 09:02:55 +0000
Message-ID: <TY1PPFCDFFFA68A928BF5EB4A5B552D5A95F330A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Tue, 19 Aug 2025 17:02:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] RISC-V: KVM: Introduce feature specific reset for SBI
 FWFT
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-3-apatel@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250814155548.457172-3-apatel@ventanamicro.com>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <0c6a8180-09a2-4b2d-b729-00c67c57818e@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|PUZPR02MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: df45458c-7c93-4ea4-1d11-08dddeff2f1e
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|5072599009|461199028|21061999006|15080799012|19110799012|8060799015|6090799003|36102599003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlBBZWtyZk01QWVCWXFNbmg1M1hoRE4rZnVlcU5UaXMvK0ZxZ25abmg4azFP?=
 =?utf-8?B?NVV2ZTgrMFZMbWFEZWYrUmFLQjlvdHFXUWZkWkV6NzBpeWxHWlRRaFFmMFRD?=
 =?utf-8?B?Qk9nS3A1UEtFaTdrbXJHWW5IK0Z4VXF0cDZtRlFKQ3Yvem5WanhZOGV6RU52?=
 =?utf-8?B?ZGRuLzd3TnZva2tndlRNZG4xRVVJMWxFRS84TWovMjU4Q2wwSU83Y3F1cXFq?=
 =?utf-8?B?aW1oVXVjVnRiWDFmc3VLbjZ1QVRaVkJIdXRFM3pJdHpVVHRQM0s1UDV0V2xU?=
 =?utf-8?B?WE1aSmRRbFhVM1F6dTdMUHZCZlJzR3U0OExYQ282YmxzSXR1VTl5QUdmUS9T?=
 =?utf-8?B?djZYU1BHMXQ4bHJkNktmR3U2dzBPZUYySDNqeE4rVG0xSFhrRG9KaVU1cnQ0?=
 =?utf-8?B?RTEyWndyM0FoUUhyMjk1OHc1dU5mS3FyUWo2M0VWWkxGZVlLeWUrL2FrMHFH?=
 =?utf-8?B?aXgvbms3YnIrZ0tjSW56aEVpeWpTcFEvZ3dNclZZWURMODcyZ0JYbXU0aHhT?=
 =?utf-8?B?amY5L1RqcVRqS21SdjkyNENqMkZLTEpSRWJxUUIwT2FIdjI1ZDVyVzhycWM1?=
 =?utf-8?B?RmRxT1RERGRDWnRSNTduekRBZzN6Yys1akJKdFhubTdkQ3Y5dG5CcXNzOUMx?=
 =?utf-8?B?VUVNVUZJd3Vka2lqek5rcm1KeGo1cUVmZjJYTkV3VUJwL1ZyTGRUUnRWTDVN?=
 =?utf-8?B?SnNoUUthckE1dWprT29ZVVh2amJ5TTU3RmV1enA3a3lHRXc4cnFKMUxieFBq?=
 =?utf-8?B?QkZScUtjdW5razBQcnFobDd3ZDlYckxrRnJZdUFIblFJQXRKQUV6MUdGc002?=
 =?utf-8?B?SnV2TlhYalFQNnI1SVg2RFRPbWxROHRzU1V5NDVTRDB1NUloNmpESzM0TmFm?=
 =?utf-8?B?Y0owZFFOVG5scElGamo0RFdZbjVRazM5eWRaaENmTVoyKzdyUHhJQXRpVVJZ?=
 =?utf-8?B?Rm90OGtPSWNEVi9OQ3gvUExCRUc1SVZON1hiV3ZrRFNWcE5OSDhIb1JXSmFy?=
 =?utf-8?B?cC9pcXFZV1V4cGRRK1EzTFpJSThtSmZva0xucnljYlFVREt2WlgvRVkrR2ZG?=
 =?utf-8?B?bHI4ZXhwVWREbytaSStrTUhLcVBzN0tRbTlvK1g1Z0o5M3ZveGFsREhvNGtI?=
 =?utf-8?B?MTZScW1VdEhVL0FOOHJFdEhyZkcxTXkxcXhvUHp4c1Y1eU9OSHVEZmZKdGdU?=
 =?utf-8?B?UlRDMWNGTnp1bVVNc1NHaEYycC9aMlIyMVhhQWN3OTJxdTlMaEg4OUkzUEx6?=
 =?utf-8?B?VC9lU2hPcE9iQXB2ajBpVkpab3NkOGVrTldRVUo3VUFjajl1T3drMEc0cUhZ?=
 =?utf-8?B?ODR2eFh3WTJpekhDTGc3ZGNLdmI1MlJKQnhVczFXZnY1Nk12RWx5ejZBd242?=
 =?utf-8?B?VnR0WHFsWGNoY2R2RXcySW5CbE1kR0cySjFHU1B5cGRqSTdEbGxiYUg4azE2?=
 =?utf-8?B?RlRpZVRWSUpLUEFhWGtuakJJeXArTUp5YWJSaWtFbi9JcjRvczltaHFhQzl6?=
 =?utf-8?B?ZGhrVFo1V2FYazJWdlBnbit1S3gwWTFaQm9CSDlEcVFOVFB2VjNZd0NlTlQ4?=
 =?utf-8?B?U25udlNLZUw3QTBZYjhaNHU1OTNBSmQvQmM3L2tyemtpU2FRSlMwMGU5a0Y5?=
 =?utf-8?Q?cIltnSEVOPaoS/iAg6ayHNoUjaqaql4OrYAeJ3DKzSa4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE44bjQ1Y0g2cmZva3Z2NStmMEFiamozODJTWkdpNHd2TU01RjVubVAzS2gy?=
 =?utf-8?B?em8yTGdFS2Vud3BScytLOFErL3p2eVptRys3Y01pSWFkWjhoSUhJOXd5YjNU?=
 =?utf-8?B?aEl1M3BvaW9PZ3dWR1lKVTl1ZEFGMXBLRjJlWTVmR3dNa1BkNllIeWdQdzE2?=
 =?utf-8?B?STdOdzNqRXpYeFZ1eElycUMydmROK2FrOEJnaXlRaVh2bW9EQnNodnZxME9t?=
 =?utf-8?B?MXRidkU3bzFrLzFuSlRHSzVqdWRJOFJ5QUU3TE0wQmowWWR1ZDAxOE5Faytl?=
 =?utf-8?B?L2FRY2hBQ3h5bHpOVVRKVjJ3S1BWQ1gzTzhsd1RLa0xibGtEV0JTTWk4U2NO?=
 =?utf-8?B?bHo5c2ptcUpFck9hMlRlZjVXM1lBRkhpc05KRTNzUmw3NEtJU0dTWU1lTDN5?=
 =?utf-8?B?K0tORnUyb0JxaU95RlpLU0djYktmZ2x5N2lHZ1dFMmhSK2hBNG42MENJZHV5?=
 =?utf-8?B?U2FpSGFuTTRSVlYxU3NVMjdxV1M3M25lcVJtSjVETUI1TFB4emZkUnlNTC92?=
 =?utf-8?B?Y0lTUGRoNmlCakpabTFGL3JTVU9xczBSVWhkNjdtTDRkYS9BbktwYW5iemlP?=
 =?utf-8?B?Wmw3OWQ3cy8rL3BQaHJucHFFeG5DVlAwTW5DZWRtcHlYemlKZjJEcHdvemI1?=
 =?utf-8?B?M2JGcTBiOEdKaUdoMVhSUHB4cHgzSm9mZW1HcUVnenBRaUROOGZZelRuUy85?=
 =?utf-8?B?M05aNFNKaVBzOFYxWnVNYWN6RjlTM1dWM2c2dnZTekIwaFFNRkcrQ3doTlN0?=
 =?utf-8?B?YVF3TythY3lFNzN2MExlQ0JVcVQ2QjgzczYwaENIQkY5TnQzVEZDcDJWZkg5?=
 =?utf-8?B?OGxZWW13ZmlMSDMrbUI0clM0US9VeTVlMytoeVloZWZhQlJsbFl5RU5Ec3d4?=
 =?utf-8?B?b1VmQXFrcDVUV2R6R0ZuSkVNdzBJdnVTM3JhakxRbU5BSUtMeDNpNXl1d1RR?=
 =?utf-8?B?NGdEMWFYWnU2Z0syVWxFZlFwZm1Dbk14UHJxeVhZNFEzelA5aTJCc3krQm1y?=
 =?utf-8?B?K1BoeGdQWUNZTmVlcHVVUXVtZVI4bWRYSzFMZmlxMTNTRUdjUjcyVW52L291?=
 =?utf-8?B?N2VZbU00ZDVHVkkwL2x4YlQxV1Y3MTB1TFB0UjJscVRVbUc5ampHaG1OMmhZ?=
 =?utf-8?B?QzdNT2xrR1dVYmlxajdvaGxrd0Z6U2ZaZlZIcStqdUQrNWg4bEVKMWI4aUJO?=
 =?utf-8?B?S2NUVWpnNndKdVVTZ0phVUw2YVg4Y0dncFNnT0FabWgxTUVLL2FOYTNieTlD?=
 =?utf-8?B?aGxxQkt5S1E0YjlkSzBoYVJIVGNVNkkrblBCeG1JNUFCMzFlNVlpNzZFeG9M?=
 =?utf-8?B?Yk9HWHVDb1BIaGM0cjhBZjgrWjVxMUFtVklwazY5SFNJWlBLUERqb1BXUDBM?=
 =?utf-8?B?OE1SRzFxMEdjUDdGRTVlaXJvWUtBL2t0VUxOOVl0QkxrOG9qZkdscmRxYXJT?=
 =?utf-8?B?Zlo1aHRUZC8zTEhCRTB0eGc2U2NVWTJUc1lnUjhHVGpyWis5OFBQRjdyVzd5?=
 =?utf-8?B?bDZHbElrWElRcjAwd1QxVERtT3ZqUWxhSzhqNUdvWXZpNUx2Q0F0UXg4dHMz?=
 =?utf-8?B?amVXcEY3WVVDRXI4YXRUdUVUVktOWURxZ2pCUTdhWkw3K1YvaDhBWGowNnpq?=
 =?utf-8?B?TnpGenJxSWZ6QVlrR3pIZXl1NXJaRURNVm1Sa1QvS2F4azBZYkVGMmVlRmlW?=
 =?utf-8?Q?a85HVWRuZOmOFLHoznEb?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-c9a3c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: df45458c-7c93-4ea4-1d11-08dddeff2f1e
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:02:55.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020303_913904_8B1B4EB3 
X-CRM114-Status: UNSURE (   7.10  )
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


On 8/14/2025 11:55 PM, Anup Patel wrote:
> The SBI FWFT feature values must be reset upon VCPU reset so
> introduce feature specific reset callback for this purpose.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu_sbi_fwft.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
