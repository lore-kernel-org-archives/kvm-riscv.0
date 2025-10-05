Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D57FCAC5B8
	for <kvm-riscv@archiver.kernel.org>; Sun,  5 Oct 2025 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=getOXIK+L+VDC711/d7LPbJn/IosTwSiSTfZWaCLWuk=; b=DUSzPp9+zGvbTc13UnH5spvARP
	8B2HSE6HHzwqfntiJVx28Uo1V//WL8k31mVwauKYHvEvHENYDlocNy4JsUzyKPcewUbFQDPzgHO28
	hj2RsAoHTmgsDGtgdUb97p8t5J+BhRQ5T1wfoaErS1QXFWiN/06IU+zb7cBRl9xDYbM4YHmg9I97K
	ZrALB159I5QnrWus4aHAwhRGCtlnWToshScsONv5p7IDRIKPhtD4NosPuPBJ/pbPeXNMkPWOabczL
	8WUp1MLvwdeAsFtZe00Gtj5XkYzY25OYQojvsxgX7aIflZIS6dZpu/9BrfFClKHNOZM4Ohpy391w3
	OBOi7kEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KM7-0000000ENOt-0pUZ;
	Sun, 05 Oct 2025 08:44:35 +0000
Received: from mail-japaneastazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d405::3] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KM3-0000000ENMy-35DF;
	Sun, 05 Oct 2025 08:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh1rcGOL6oCNOr+SO2+ABobqgUxxFbtNeNLUFbey85v6x77PNbBqgfDj+pJc1lNiBGLi5U+8GVlGi3DK+6PU+Tgh1DIeoVQLVVgghPgHfyQLoj1gD+zm+ULmtkg0wg0S6gWuQceJf+ZoQhqyqCwoEPWjVJqOKHjOUKWBK/fVlau2Z5eTTRfnG2DqWAAg2zAOGJrKPaaX4GXGXYciAHzg5hkYmw+qfDCUbT/WebXBVdBdWjKxjh/C7MAQYpxDufOrSgAYcL6g8guZjL9b3PbiqaCsAnibyNqXBpN4RVqObGhJCAWVwtkYfAVX3J6JtB3ylaBXOZL3A1lkaP2mzV/eyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GBn8fNk/CwlZ69yhThcdETS6jlHK7nmkwRuvgCtqVU=;
 b=fDxU+mZUSQKv+YbizZIMXRmjEVybFqwLJjDx8ssK9cALX9yBDulxjJsoj5VN5wgPifj6ZW3CRsEgo4fdRjGtRXbVC5ws6YacQt11PaySekfBJQajsIg2Whn73voP5AhjzdBoHc2G8YclVIslYE4iayZxEo4cV+UEpa2PJVBcdEp6lmDkTkF0ClxfoQazOwKwNT6EY6mnCjIBsHLzGAlcvVAfdzkXWbzDqz/mKYXhbYp649pVw6f8F151VhrrstzM5Rin9r+L08UvfbGFM1RHu5EmeRjSea2zbHT/QOOjtqcF00hT2wI4SbyMkj2yQZCFYeR0uUsH8HO7K5Qy0eRNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GBn8fNk/CwlZ69yhThcdETS6jlHK7nmkwRuvgCtqVU=;
 b=bnhTNpyqfPvYG9zkcLWjnj2SmUJvRWKZaXRsQXo49w8WDh37f/SrrmyPbws6rqKHYdatozEYOWZFumuFAK75Cci9/bIZ3i3vOWLggXEH50v+fL7jw4zyasozMyKaNMzoQMnu4xULiXHJTsVY5QF+4dFj0UO94YPSlYB9Y4HkiWy/OHX+29J8ilqz7foua0jpvcgUEoFqgrSjKUlgmLiPJX/MOjjDl7dY67++G2K3TnlZTsRhMtRau8+1jgve3OJ7DN9JyQFDAeWhr4YxGRnP0aYtuQYVHYXxM1KqdKgblBdlBEdG46IbyCKoKCJst8U2EicFOR1qJs+KVpilMGi99g==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by TYZPR04MB5805.apcprd04.prod.outlook.com (2603:1096:400:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 08:44:26 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%5]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 08:44:24 +0000
Message-ID: <KUZPR04MB9265EEB3E98A19CE443F8DC8F3E2A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Sun, 5 Oct 2025 16:44:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/18] RISC-V: KVM: Enable KVM_VFIO interfaces on
 RISC-V arch
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
 atish.patra@linux.dev, tglx@linutronix.de, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-34-ajones@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250920203851.2205115-34-ajones@ventanamicro.com>
X-ClientProxiedBy: TYCPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:4::31) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <98017c59-7425-4b93-bd14-d5f9653e6e55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|TYZPR04MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f3a465-6c8d-476b-3e7d-08de03eb62b8
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|461199028|8060799015|19110799012|5072599009|37102599003|23021999003|15080799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFB3Wk1vRVNCYndqVkJ6aXpockxhT2NLWng5OVF5R1NNbXlManpRNXlwUE9B?=
 =?utf-8?B?Q1NHUGNUL09FdW8ybTVha3AyLzZ2NHBTcVpTN244QTBqQU1tT3owQ0Q0K1hN?=
 =?utf-8?B?Zm1ndXIxajdaNnMrNnc1emd2ZWxNeDNVYVJRUmhIdHVPZnZsOEVBekFjR3kx?=
 =?utf-8?B?aUlTZURJQUNrcXRTbWptcldJTEtDb2RuS01TUll4cjhYb21UOXNmbjU2WFdi?=
 =?utf-8?B?OXp2RWVUT3QvaFVzUXY2RkxvbGxkNmVERG5xTXh5c2lLZjhOb0MxanBHWmY2?=
 =?utf-8?B?a1BlWHJMdWwxWWRtUUdjYk16WnNSdWt3QWZJeUFMRHljNFhiSzVwVi9nL01O?=
 =?utf-8?B?c0xhcUE1aUNYcThKMzF5WVhyTFpwNVFNd0RHcjRvdS9NNUk0dTdDWlJmVEdh?=
 =?utf-8?B?Q283Mk54eEN6UXJmbDBhUUk3TmtpcjMyaHc1dENJY1hQTGpwYk4vMVl0S0JT?=
 =?utf-8?B?V1AzWkVDRXkzZExkaTFpcDFacG16RldrOFJvUnFjS0cyWTNNcWpYdmY5ckdF?=
 =?utf-8?B?TlRBaGg2QUxkMDNVOVkvc2Q4WFE3MllmdmFYOTFQSmZrZ2JRbktFRVZNL0Nt?=
 =?utf-8?B?bjdDZ05FTUVRMmlISUlub0thS21sUHBGb3NMbCtxVytnc2xnOUhSdlkxTHZL?=
 =?utf-8?B?cmcyR1pZQWNxMWR1OEcyaEdNeTd4b0wvK1h1Q3VtUndrMGd0c1ZBcjI3WXdC?=
 =?utf-8?B?UGh6ZGVmTHcyRmVHSmpkL2NnUDlkSXR5YUEzRnlTRDlEcnhDdHNDcXdnNW5l?=
 =?utf-8?B?S3VlV0NqMnRNcHhFa29ISm0wS01MWjVDQXQrMkRicVdrMzlibFZzU0RYWWJI?=
 =?utf-8?B?cW01dUNwelFJRTZLbkZSeUZ0Tkk2TG9kTGdFS0VtdkpDWVNDaVhkclBGOTJS?=
 =?utf-8?B?dEhYamZjUlFzTU84cGFuRFFSbnJnNWFyZzZTUXptalhrMWZDd2J1SmRzTDd0?=
 =?utf-8?B?enJlakFTcUxDWnVrRVpSWkw4TS9uM3MwRDZKbnJNM1ZjOTdGTDRiK3BoN0pH?=
 =?utf-8?B?Wms3dmNmY1ZiZmhsN2J6WkFlZTRpNmVIKzFPSkF3U0N6TWVLcGh4UDlSRktS?=
 =?utf-8?B?V0F6dks5N05haTRYUEZkK09iRDhWZnN6dGlDNUZrbittS3VIRUprMU5qYWZE?=
 =?utf-8?B?NWw4T2JZL1BiMVJPd05yWE92dnhkamllUnRYc0U2alRQUVJESWk0eWhPanMw?=
 =?utf-8?B?MnJyMXRWY2ZhQzZOS3d3MHR4TC9wcWdZb2FlUjRrNGpMZjJ1V2VDV05Qc1F2?=
 =?utf-8?B?VGk2aGgxbHArTDZqTnBBSnBRdk5BTWRYbWhUcmlWcGpQcjhZSER0RW8veCs3?=
 =?utf-8?B?bi8yb1hqVUdKbUd1NzZSZ29haWFOcFBicjJiNkxzdEJLMmpxdmJqcUVYa1lt?=
 =?utf-8?B?Um1IeUxWZnZrWGZYVUNCVml0WjRVaTdtSDBuUngzQ1Nadkk5ZVFwc2xrRjBy?=
 =?utf-8?B?U04yUStZOVlmWkMzNWpFbjhEMXEvRnJVNlNBQUZ6R1hsNlJhOFBmNk5VTkMx?=
 =?utf-8?B?bUxxTWgrS1U1MXJlcStMbWNLUlNqeFYwUzUxdmxReWpuZjliRW01WVJia0Iv?=
 =?utf-8?B?bWFHSE1BT2NjMzFUdWxEUzNSSUo5aGU3bDQzd2JUekhEZEd1Y2VGb1ROcVND?=
 =?utf-8?B?QjAwWFEzNU5yWStyeXJvUkl4NnBpM1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2d2Q3pkcExsR3kwV2lQUWZVdFl1akIrZkRTQjhMblNEL1dHNE94Z3JRa25n?=
 =?utf-8?B?WGtOZHdpVDNiTnRqQkpueHY3YnhZeTRSeXptTmdqZDVkaHY1RXJPMTRwSGUr?=
 =?utf-8?B?cGhucXNlU1dEQmw0Zis2WjFtZFB0ZC9JMEdNaXArNExqbTlIeENNUCt3Qm9P?=
 =?utf-8?B?S3BOM29XMGpSS0FiK1B2QlZ6d0ovZS9YTkFNSjNEZkxrSFlCNjhyN2p1b3Zk?=
 =?utf-8?B?QWsvTXJTR2F2QTRvbko0VTlpT2M5K3paQUpFM0N4NHljbWdLL0cyRTJtUksw?=
 =?utf-8?B?eEpJUGhFMHRPS3M1MEdpZzFTaGZEaldFNGNzQTFPUUQ2aGJiaDhUUnV0bzV4?=
 =?utf-8?B?VHRaeUJSZFlLaXBNdjkxR0xDcUF3eklsSnFtNFZST1psM1lzWXVuM3NqZmFQ?=
 =?utf-8?B?MkxXVXVmckNyUXBEZGZKQWh3d3VBRU9WeW02U1dFMnZZR0tXQ1Z3RlJMZGZK?=
 =?utf-8?B?bWV6Mkl0RklacDE5L0ZvSkhIa1BVcEpqWWoxakc2RnNHVWNyRGlRZE1iTk1M?=
 =?utf-8?B?WWNBVnRyb0NITmpadWUzb2t1eHljMDEwZkpSbVpWOVcrWUZNS0xWREl3QkRW?=
 =?utf-8?B?ZVJEYS82ZlVrTEJTNCtGdHdHVWozbTZtVWszNXVSWVQ0TXRBNURFNjJkbmZC?=
 =?utf-8?B?Mm14Q0lGK3dZalg2dE5RKzhjTmhOdElMejZvM2FEWFI0RmRDdjEyTDJJVEQv?=
 =?utf-8?B?QmZ6Q3VLemszVjlzazBRR1pvandNbXp6OWtXVm1GWkJmcFNIKzdYQ09iZzcw?=
 =?utf-8?B?bE0zTElKMVUrLzhXNzNaUWlqNkRHUVl0T3VpRVFDQXFTeituY0tPeGhDRFFE?=
 =?utf-8?B?QndYWmhET3V3eGdpSkRYRTFmaGVLa0k1NDlFdkJIQVNjNUE3aG1IUU4waWsw?=
 =?utf-8?B?RjRBbDdSZmxKNm4zQ0tnMDRVbDJsWFhsWW00MGllTFhNV0RBbU8rNEx2a1lP?=
 =?utf-8?B?WWZqRGJ2a2N0SWhQSWxLZTNoQ0QzZ0MzdzJQVm82VXd0eGxKbEhMa3c0WGh3?=
 =?utf-8?B?UmVlMzhiNlZjU3ZHcS9udUdmdzFIdFR4eU54QTF2M0FCYzNmNUpRcmNsTG1y?=
 =?utf-8?B?NDFlOXBLeGhkSzJxd2lKbUJ3dUpvUElRdXVvdzlCWDdFZkRXVlpDeWxCWjZx?=
 =?utf-8?B?WXpwVGJkUFAyMWM2S1QrRWpkRW1SK2VySFhhT2FwaUZMUXhYRmt6UVk5MXdS?=
 =?utf-8?B?c1ZINlpmMzlmMTJQbW1yWDl4WGRMZXZEWkE4WXBHSVd0UUFBVlJGNjBBbmdx?=
 =?utf-8?B?YnVKRWgya3EreWhvZWFLcFRuQm93YlY5SDM1VFY0MVV3WFNSelJOeGNJTm5o?=
 =?utf-8?B?ak9DRWN6eHNjc3l6RGR5YmJPd1ljYUZFUHlUbTR2TjlERUxFbnhDL0NOcTJV?=
 =?utf-8?B?MEdZeEhOT1VYZHVwMUZRYkQrb3YxZHF2cVlMZUU3TS8vVkhqbElER2VrZ0Y0?=
 =?utf-8?B?WjRxVjVrNkw3SGRwazd0Z3V2TW9TVDNtallLYUpLby9YVW8xN2VjZWNPMlBR?=
 =?utf-8?B?c1M0b1dLZ3FuY3NGTDVOM3JKbnd6ZHFMLzZNV2wyZy9IUkVnOFF0ekNsVWNV?=
 =?utf-8?B?UnNib3MrdDJZTVNvN2gwWkY2YXlTY0lXOTlNaTIvdE0xQ2g2YWl0dG01VWpw?=
 =?utf-8?Q?D9T/55MvRt3H+x6qb18sfGJ/zcCtTnYaBRKWPX03Yghs=3D?=
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-38779.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f3a465-6c8d-476b-3e7d-08de03eb62b8
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 08:44:24.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_014431_783194_30678F39 
X-CRM114-Status: UNSURE (   9.72  )
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

On 9/21/2025 4:39 AM, Andrew Jones wrote:
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Enable KVM/VFIO support on RISC-V architecture.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kvm/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 5a62091b0809..968a33ab23b8 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -30,10 +30,12 @@ config KVM
>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>   	select KVM_GENERIC_HARDWARE_ENABLING
>   	select KVM_MMIO
> +	select KVM_VFIO
>   	select KVM_XFER_TO_GUEST_WORK
>   	select KVM_GENERIC_MMU_NOTIFIER
>   	select SCHED_INFO
>   	select GUEST_PERF_EVENTS if PERF_EVENTS
> +	select SRCU
>   	help
>   	  Support hosting virtualized guest machines.
>   

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
