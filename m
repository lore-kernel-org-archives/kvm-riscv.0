Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6981CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Sun,  5 Oct 2025 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=te1LcQ1YfgmuDvLUjClWVKq0ruRW0mrz/cLfPCpCs9o=; b=1IBLNOx5X4vvH30jPmjJQ2I/Fz
	hfU63KqsgCoTPfpEhKHEvoHRzUNT9zkdGy7v+4GTCe0nRTW/x/gDtalOnUrMfIkBYbxRfCj/dz3jt
	VHJNOwI5JL5uax2POtMgwmDbMOw2948TEMTXy/emQ+91I5nmQTwhYDCurgDYasBZLxqBxzUJ0TfRa
	zdS3f2Y0lxUkaCt4MjF754VOfHyMRWUxGMqjRUdQnFhAOfzc1ts6j3NH7gqYB0tDMjQgOlwBsFDQk
	CtbDsHB0+0LIReRAuoBGgzTErdwZkubhYnZ2J1gSyNcycEHF8KP4QAO8WHOPFpJLZwMBUzbMREfbI
	GaDo7JtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KIt-0000000EMQH-1rNL;
	Sun, 05 Oct 2025 08:41:15 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KIq-0000000EMP2-23F3;
	Sun, 05 Oct 2025 08:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxBeepOkkbiuceURJEWqjHzX3BdQw5bFgZhunJguuHXWx1vu+mWKWufKogZ3wZlQmWWxO5rOyqhoynQiR1e3TOEIhThG2sOQCoiyopJUK5Pg91r7ks26uouFxbaEGbyQI205r3jgQjNZhSHdpCAOUIfujg7be8xUH1JZTzzYIVOVVdGZ2lq6b4kG8FOLBryK8TLGKni6pUwW+gCktdZAcQE32RThSbk9HChHn4dkSO5SbQtYMK89XbPcWxJyYbWdPf0Q4S/6mrE0+7L97fNjfNcwi7fssL3VV3YCQpnrgUWZgZHFon/IZSoSFgIrsD8S74QKnjLARp3dsonI2YprLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr/LLVziW5W4yLa9hjA8TBxRC9lgXF23XhqTSkDQ1c4=;
 b=xH2QvTkeXbpyLU66FatxP9LzWIvrDKK8AqvDpudbmercCFLB/LvG3hLr/pVlE0F67hKdmy4V3Bpf6gjiotAyqEAtoDzAu9Rdu+fsGEWdc7EQ1jkTYBwo+E2inC6JeVDtXbASFD93nGwVRwTUK3rIAxSn1UQaeALSgFfVDU9z7mSmaPKtOU1fVi9jXs41+JRnCm341aUaLJsTOfhbrVa6nvZW1t+QGrOc3FuLTGSCGMTLLaVfeFdHGs29MHQNwvDce6eAG1lOOrRJZ2zf8XoX6PC4P9+t4bsLXR0vxiq/PP6rwPFjajH/omvs4iA5MKnBVgDiw1Wp9TBwxQOJXhcxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr/LLVziW5W4yLa9hjA8TBxRC9lgXF23XhqTSkDQ1c4=;
 b=N1C0Gpjixoc5tWENmpyOklxHeATrSjTZZS4FqAurIUDOK+OaFAEFyMyDpHVZsqIeTL6MHHx9VQT+mczbzjHIyoRptMXR+x1yO+2MQJPICrDcgo01dWaaoPM/bG90PFw0KnHn0VA5l3zZnnesMrV+xD9c3Cn601wgwnuWv8Z1PrA1/eDBfe45FmtP3QBG6eDBxdImdYxLrNr+77R3oCVmCD48OEJwmQZ+or9JIXCUrxIBlC/fbrJtXkvNX78p7S+q9aFdDgRUvfnf7d1FZ+J/7+EByvunIFcMpaFcCSjtfhhd11kl7KEeFUiBnasq5brjAab2+52fJ7WYoSnUjGF2qA==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by TYPPR04MB8960.apcprd04.prod.outlook.com (2603:1096:405:314::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 08:41:05 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%5]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 08:41:05 +0000
Message-ID: <KUZPR04MB926516CEFC1CBF2C5071658FF3E2A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Sun, 5 Oct 2025 16:40:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/18] iommu/dma: enable IOMMU_DMA for RISC-V
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
 atish.patra@linux.dev, tglx@linutronix.de, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-29-ajones@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250920203851.2205115-29-ajones@ventanamicro.com>
X-ClientProxiedBy: SG2P153CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096::16) To
 KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <f2251156-a2c0-4658-a90a-d76b08fa222a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|TYPPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cd974b-f88c-405d-a5af-08de03eaec14
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799012|461199028|6090799003|8060799015|23021999003|37102599003|19110799012|3412199025|40105399003|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlDOGl2bDA4Qk1kUUwzbVF0dEEzekZROXJzUS80ZEUzMUJVKzVheXRRMEpR?=
 =?utf-8?B?ZmM4NGtFRlRSc2ppV05Nd1VqQzIvK0hZdS84RVVJQThMSzkxSXRGOVhkZUtJ?=
 =?utf-8?B?QmlmL3lpREVidWM3Z3BZS0ZtQU5pclBtc3JVektRY0pqQXFENE1rSW0zVWVD?=
 =?utf-8?B?NXJlU3grV0xHV3l0SkhRdWp0RVB4djZ6OEdpT0p5RGtaOTczV2NvRHdNVC9B?=
 =?utf-8?B?dWFGanpmT1RCVVZMNjRIZXMxdjdqdkFsTEl4SWZTQkxzcXZZbjJWMkhNbEg3?=
 =?utf-8?B?MWZZNHFlejZDem5Sb3F3dlFjM09HbHF4WDRQZHh2V1B6aUs1ODZwbkFRR1Nw?=
 =?utf-8?B?b1FRSEFyUnVqbHF3MG1JTXhoVy9Tc2FrVXE5RUZSNWJWc3lZRkt2YjgrVkIw?=
 =?utf-8?B?a2ZpWDNRM2t3dzJmY0pxVHdKQVMrVmp5Y2MyeVdIRTU5QkZFSGMwSjlBUmZa?=
 =?utf-8?B?SFdqK3RVRXZaV0IzdXZkTkJlbWk3WUNra2tjSnd2dGtnc25zdWdBL0VudTFG?=
 =?utf-8?B?eENiSnZEMWphb0JTYTlaRTBNQUUxTlU5amVILzkxOVBzcGw3QTR3OFBaYk1D?=
 =?utf-8?B?L01zVUVPTTVJZmFOYVhQZ25WaGJLdHFTNzZYaG52SjBJQm5mVnVCdWRKWjRx?=
 =?utf-8?B?ajZJaTBlWlV6SGt3bFl6RmNWU2Y1ZVlrREJHdGRjRXZxTDhwdForZEc2ZXZw?=
 =?utf-8?B?YUNuUWNkS1JpbWwwK1FTYjlRMFQwUVIvWTZGQXFaRFpLbEdYN3M0aks4NXRa?=
 =?utf-8?B?T3M0M3lOTkkwaEZUTS9UeGdId2J0dTlMTzhLN25YWVp1aWdPbWxmWFNCMkh6?=
 =?utf-8?B?K2M5WmY0a1MzRE1aRXFudUhiRVFUekdieVVINHZLRDIrcFBGMUVJR1RpNW80?=
 =?utf-8?B?OG5wV0xISnBpRklZK1dXQ3JqcXlUZTlGZG9WbFFMQ1Vod29uNFVGRTFoQkxj?=
 =?utf-8?B?OGw5cEFsMStDWXFOY0JPQk8ycXF0WTYwZWtGL2dHbVhFdm9UKzhOQzFUSDZ4?=
 =?utf-8?B?TDFYMlpXcFRrWDJ4cjd0aUF3K1FMLzRNZWJaOGtIV1E3Qngrd1BkVmJLS2ww?=
 =?utf-8?B?SGxONUswNDh6cjZHUVBYRXBFMnUrRlZTcjIvVytBZXZBbVZ5Znk3SnRpTnJ0?=
 =?utf-8?B?YW40eHEzUUhpbndVT2JoeXhLV3liemhlRHVSbjFZd0pzZk9OcnZ4S1pUblZa?=
 =?utf-8?B?WmpjcUErUS8wbC9URU9pVUIzaVlma0gvWENkTm83ZXlYdllBYkxUOW1sZG90?=
 =?utf-8?B?djIwYWF1TU15UG1mbmxCNXFUUWszSE5oeVl2dFJXK2ZibzNsc2NoQWFaYit4?=
 =?utf-8?B?eTRNVloxOUw3b1NvcVFBNWlnY0QzM2VuZXVrd1dJN1ZCWGU5MzZVaElGbFR1?=
 =?utf-8?B?cmh4ZnFWRjVnZ2hsUGNLRFFlMnJSV242UmNRd3dCSHlIRzk2cVBSSktvdDRW?=
 =?utf-8?B?cVgydENOYkFLc255U3VTcXVUaEpKbHdqVFUvZjJmckRVRCtOSFZuM3lzMHpo?=
 =?utf-8?B?UVo2VUFqMUlSTUg2cTk4YXVUemNUUlJheWpMWWFLWG93bFhOcG1mOWpFd2VG?=
 =?utf-8?B?QjVYVE1Idlh1YnVHTEl1VmR6dFVnd1VySHRYNXpTVDFYK0xvRXJ1R2VTZWRu?=
 =?utf-8?B?VWdjS3BpVkRXeU85Vi9zVk1xTlFJaFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlyMDhBWWYwNVNodWtabVJ4bVZDUG82cGp4aXQrckh2U2JBT000Mm90MVNu?=
 =?utf-8?B?UGU2emtpenJkekNyOTkvT0xwWnozcUk5ak5oSjJVeHFJT0VVWXJmRlJaWU9v?=
 =?utf-8?B?QUFGU3VjSm15eE5DcG5MQUwyVVdjNkhlNkN4NU9LMXJKck1pL2pNRFdtaHFl?=
 =?utf-8?B?VHZEUGNIRlBBNTF6M1diTk5iY0NSUVNwRjVpR09kbk15bU4zQlJlV3RQVFNl?=
 =?utf-8?B?ZlhYN0NPdXNJMTQ5QkxWVG51VlM5MFNqOEwrcVRoVFdJVzBoUk1zbTdVU1BO?=
 =?utf-8?B?VU9POVVDNy9hbG1oMEV2VGlCdkFTeDluSmtRTUJCWks2Wmg0dnZyL0cvRVlL?=
 =?utf-8?B?R2FJeGdsc1lGV25ERHpZbzZHb243eHJnY3pDZnlZWWwvSXA2S2ZpWmswcFlL?=
 =?utf-8?B?WWJvczRpZktoUm1GMDN2VWFxcTZoY1V5ekxUd0tud2swb2Q1cXhwOCtyekJI?=
 =?utf-8?B?b0tyY1EyS2pWdEZDL3F4WjZKSVQ4WDFXRndoSllpYXhzc1QyM1Y0QnJSdUN3?=
 =?utf-8?B?QzB1SjY4VVRMa3V1ZmpPTjA2UmpIbXhCNEZtTkJGSzhDam5CR1liRU9Ma0pn?=
 =?utf-8?B?cmFCQUlZOU1tUC9vWVdCUmhiSGpwUTNsclhjS1pjOGRza29OYXVLSlZyZW1r?=
 =?utf-8?B?cG9iNlFsdUEvdzRkZWZEUndUVkNZdlFZRUxnaGFpQi9NRUVhL1ZqZkRBM0hP?=
 =?utf-8?B?b043ckl1d3Jad2gwM01oR1FLKzliUUhybXNvUzd4amlYVXhQcVlqM2lSYUFF?=
 =?utf-8?B?aDloUjhVWkdRNFlmMU1wemNvVForWFVaN3JtR1QvVGt5YTZxdEozNy9uL20w?=
 =?utf-8?B?Qm5vVFhYQkJZb2RaMi82U29qUit4T3BEbGs3bHEwL0VSQThBcm9keVhWMTRp?=
 =?utf-8?B?TWdiQXNXTU9NbWUrc1VCTzk2T3BsR2M1RW1BN0FIREEzWnBseHJKS0dHSC9X?=
 =?utf-8?B?Mnd4bUZraStLMFhmZ3I3N2VXSE85bWM0VXN0UmdQMjBKR0Nna25kS1JiWGJv?=
 =?utf-8?B?Tzh0TFVLZ205amQrQ0VsSVJ4YWpwZkRwTE9XTnB4ZjJHa2RkWTdLV2QvZTdS?=
 =?utf-8?B?RC92Q3BJV2NOV3M4SithK2hxRk9VRDM0aUllQ2E2cmV2QkdQbllFQkJGdWxi?=
 =?utf-8?B?b0IrN3dsUXBFenZLR0RyNTIyMzJyU2VCSUV5NWgwZmZtUlk0U2lGS3lOTHZO?=
 =?utf-8?B?QzFzdldPTDI2NytSSXJZdHdmdUlvSTMvNDRzekJiYVJyaVFVUEdKNk9PM1hm?=
 =?utf-8?B?bGp6YUVHZUhsVkFkR2dhQ3psbll3MUFhUWh0Rkt3ZnpISFhoQTNxazc2TGl4?=
 =?utf-8?B?Y0x3SGVGcXBtekJyTS8rRmxzMVlSOWJpMEExenVVYmo4dHZYaWJyUDdLb1hq?=
 =?utf-8?B?VnJDdGxKRmgyeFNuRXpxblpLNlJPZVRNRmxQcXVMUjlPeUlIbG1iTHFRaE5r?=
 =?utf-8?B?REkyVmp1K3hQL1EvWTVuZUIrNnk0UTY5MVR0aGJObVdCQTQzL1hRMlZxdGVR?=
 =?utf-8?B?R0ZRTUpJd1I5QjV2bGJMK1BrL3pZdFpUenM0bFNFRFVCaFVMUHRPRG1lNE9m?=
 =?utf-8?B?WUVGZ0ovM1plb2pLbU5OQjhQVUxML1NSVUpla1pFNGVMQTFJdmJ3ZitoZURE?=
 =?utf-8?Q?UYD7YuxNvqh75pzYabgHBNVTH9s6CRFL1J6Qkc7BCqEs=3D?=
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-38779.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cd974b-f88c-405d-a5af-08de03eaec14
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 08:41:05.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR04MB8960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_014112_532129_99CC0987 
X-CRM114-Status: UNSURE (   7.60  )
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
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> With iommu/riscv driver available we can enable IOMMU_DMA support
> for RISC-V architecture.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   drivers/iommu/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
