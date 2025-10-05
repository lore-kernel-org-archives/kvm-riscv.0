Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A181CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Sun,  5 Oct 2025 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZVZGTTd6KLAvYsWdXh9nv8xzeLGBIDnQ6B+BPeNbuw=; b=qgaE74Gbok7IVhLe/33ezrzmQJ
	mCvvl2KF2rkzDv8THARVoj1kUJTilLfPjezdkGaPWWnNnpVb0XINujx/tOrNnL6q2OrElXwhVo1dc
	BjWZKqiqlizwjNnMiXkJbn0b8Ox1SOyapekeapFcJyWz/OfpfVdAz/R/dF3t5cqQ0WY7nv4kDuMkh
	9dJy6gYjI5O8vgr2LrXmC2k10OE8ohCl9J9UMTd6hqtgIDdl3DPmCr0UYaLn0GWZx/w395rghrzHi
	YUojWsYNprMjUTGMSLtSqtcrLyMlfoHcQX/aTRKMvKbWKWDMQTQiFVzKUCyY/h8ulniyptKhty293
	YWt+CUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KL9-0000000EN4c-31B6;
	Sun, 05 Oct 2025 08:43:35 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5KL6-0000000EN2u-2TJ1;
	Sun, 05 Oct 2025 08:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0NZc6k9MhWhZ3v/qw/TA299RV2ZAoOYxa9kieX83RBcGbIcVF1oWiNb89QvPSw/YK9BVcK5149I+7R/UDxGpvHl7r41HuquIxSinet+s9ZQ2wvlb/IY71mT8BOel4kdPIiodzGK751PH1reAlkfml5mf8XSEhdFS0pSIkeFzThpGmxKJQeSogeYfQSuIF0kB+NYxVBuFEFhTrw6euaYbzpJGhcAu7KZrc3Z2yrLL7sbghC3l00+X2iOjADeY/cg4HBQRWWsA6CVLphN8ebEfSBK8VP2DsqFk2mx4ojbTt7iUBeueE3n/edkvEJUagIjZ5lP3TiBNGzHcaHysD0FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnagC2eD95c83JqbyKwjfhmDSFogNt5AONxCPdaXYhc=;
 b=WrOrAqPLcExRX1w/yH9a07GuDntAbCLTs/hS8DILnahZX7K1otx2XJxWY7Q2gRO7Nx55uvF26X09ixUXaZ1BWQFgjoJygbyV2jRVkta3wUCZZgSltrgBeDOQjhMGe72O+8+5m3paF55JyVY4Jh+TAXnfmciOSprBVH5ZJw3I9w0VjdQRn68QeDkxHzL5NZJyAssok62g13ISxk3jFPuzIvZYqhF8Yn+plvLZapqsTSeIeXvdBMg/MNiV9C53q6oyd4keMks3yYZSRZfmQ/fEdslYpdG1cbW67u4r04nNj2y7azcnM+y44KncVJpZfjDGpK6/t0GIoHKsv2TE86ShXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnagC2eD95c83JqbyKwjfhmDSFogNt5AONxCPdaXYhc=;
 b=fulXq23/ASsQ0k0fWBbLNHhFk29SAE6/0EFSJS9CAdF3YQdiHUxvMiKJ8gSSDM1tKWj0+lN62LoiJE3GnT8PGRnqargTTPYzIDWKCOZ1wmhhVB8wKXlQLkIJCpoUBdSkNG4Wd+3FzS805AGZGagMoNVHQD3RWlqzIOzmaGObAdG7dlY8va6e7E32Yz40jbo/8ewFkxYSqRanyaWxNGxE/kaw1WAet9DLxsTJe2xpUFyOEHAMTDekaITw/jgO0oGCDlQFYt1Lyg7BelxTpIuh+zkUQuZhxIk3wU0AjL1ydTv08DN5fJaZkYdYhotBLyerAaIhWriftOafrwYpnZl94w==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by TYPPR04MB8960.apcprd04.prod.outlook.com (2603:1096:405:314::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 08:43:23 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%5]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 08:43:23 +0000
Message-ID: <KUZPR04MB9265D45020D114BE45DDDAFBF3E2A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Sun, 5 Oct 2025 16:43:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/18] iommu/riscv: report iommu capabilities
To: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com, zong.li@sifive.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
 atish.patra@linux.dev, tglx@linutronix.de, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-33-ajones@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250920203851.2205115-33-ajones@ventanamicro.com>
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <b7d2a696-8da3-4168-9ca8-220c57de8b97@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|TYPPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 1861c5d1-0317-45b1-73ce-08de03eb3e98
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799012|461199028|6090799003|8060799015|23021999003|37102599003|19110799012|3412199025|40105399003|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHo1b05BUlh3TEtzMEtjcUpUQ2grZVRYcHZHYUVTRVQ2eVRwRWcxNHlYLzF2?=
 =?utf-8?B?Vit0UU9wUkovQ1lYQ1NQeHN0dUcxU0VGWHU2UkZDNDlSNklmWG5BQ0tWU2dE?=
 =?utf-8?B?NUxOVVJpUks4b1JmNnhBbkNlUGZpdWFKZ1ZPc2d5T2xxYW1Hd25Ddno5bTdy?=
 =?utf-8?B?TThnQWtUdkN5cTlQNHIrVC85OVJiUjRTWXlKQ1dXZDF3eUZHaUVURVNkbG1l?=
 =?utf-8?B?Z0xKeXJvMTNWVlNXWTc4L3JuWXAwQXpjWlR2NEFaWEd1YWtKRzZaR25RRWlt?=
 =?utf-8?B?ck80SUVkN1pOZDVMbnh0Vi9WMDV0SEkvS3dDZ3V4TWZ3S0dsNkZiNnZYcmhh?=
 =?utf-8?B?WTlYNHRjcG9ZN1NIYlQrdGp4NXFLZ1VMSlpUN29Xdnpsei9rc1Boa2U0UGtX?=
 =?utf-8?B?eXZnVW1INzNGMWJJMENsdVFZcmhwcThxbWFtdTQyMGIwd3NmQ1RySnIwVmox?=
 =?utf-8?B?WHIwNmFDSm03bGtaSFdkdHM0QVJDdjhobHR3ZFVZdmhNT0psVEZZSm9uSXpT?=
 =?utf-8?B?MlZ5K3NaS3I1RDcrZ1o3Zjl5Qy9pOU4zdURxZjYxTWdUZ1g0bUo3aCtzMXJa?=
 =?utf-8?B?WExzbll4aTd5bXFBRllOTnN6cHhpdm1rWkFyUjQySGE4eElwb1MwejFFeHFq?=
 =?utf-8?B?Z2dJdktBc2RGMnJoeXNnWDV3NGVuSHBoL1VxV0NPc3dCY0lNTkFVR2FYT0pr?=
 =?utf-8?B?aDlkMFQybU90bWY0VWhPUVp3UnFidDF1bFFnNDFsRGJ3MkFPdnFINDU2UXJ5?=
 =?utf-8?B?WE9KRFhzS1dHY0xHTWpObUpuQ2VCTmU5UVR2TUEwMzZ3K1BEYXJGRlVwTW54?=
 =?utf-8?B?Z1oyRmZEZGFFMjRBNVN1QUtBMGNTc093UDhmUHRPUXZBbkt4eDFkVG1YS0Nj?=
 =?utf-8?B?aSswWHR1aHg2Tkswci9naGRGTVo3Z3dDbUpPYVNMT3JXeVU1OG12Nk5zTksv?=
 =?utf-8?B?S3dac21EU1F1Z1FRWWlSNC9WS0xrRUdySW9QSTlYN0lROUxCaUF6UEZpS2Y5?=
 =?utf-8?B?SkY0YnZYVlV1bGFxcEl6akM1dlhEcUNTVUZyTlNnK1FhV2RTSnVzMFozdWp2?=
 =?utf-8?B?WHBScy9STkFEWFR0TW0yZ1NpMFkvdTBYUFB1UEsvQ05HcGJBa3lYenA2Ymd2?=
 =?utf-8?B?aEh2YUVncDBZTEJxN011TWNBWmF6aVBHMlNxSlBrTld1ZnlHUE5ieDdTeks0?=
 =?utf-8?B?SURWUHBrbWVRRDRpeWsvbmszZ0tzeXFvM1pOZTZyZ2h1cmsxTWZuMDJDUzVH?=
 =?utf-8?B?UzFPYjVoTXBnc0dwNFpPbUdxdEQybE91M2cxUnlIcHFQbHhlblZpaVQ3R3ph?=
 =?utf-8?B?WS9sUjVERVpxckJsNXhNZFJweGRYaHFSR0NaVHJJbno2MURKWnpWWGZZcVhy?=
 =?utf-8?B?NmxxZDVOKzFCMjVicFllbFgzVTZaS3ZBUGEvcVVyYUl1Qkp2NVFtR2NEOUIy?=
 =?utf-8?B?aVlra1Zsb1ZRWFR0dUZKU2NKclJXYWlvY0pPa0EwS1hvOVRLQzhFSHd1RVI5?=
 =?utf-8?B?cGJIcFlBK1pJKzF5ZmUweWdlQlZHaHZjMU83M2dLWnZFckdocUxQc3VHZy9R?=
 =?utf-8?B?VHF0VUVjK2J5c0pPb1FOcTNRckV4dmxxakFVcW5uNzhSV29HM09JYVhjbzZK?=
 =?utf-8?B?SGkvK1RDMUZCNFBDWWVVc0RpaXRIY1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlZJNXRwRHhnSjlkZEkyRm9od0NRbEh5TWVMZEdhazBJTy9NSzlCSi9PUDlG?=
 =?utf-8?B?d3NNNWw0UlpRUmtERVhGZ3V1ZXNBZHA5UEFIaHVLaGJFODhSUjVjelQ2Q3dm?=
 =?utf-8?B?VDlqRERtT2YxZHQza0tBQ0ZQRTdjQlY0MVp3aVd2U2xpSFl6VmRuazVsYjQy?=
 =?utf-8?B?SzJaRzRIQ3A2SE9mSE5VU3VNOGVKRmFYR1dEOTMvYlJYYisrYUcwMElHelRZ?=
 =?utf-8?B?RExhSkk1bk5pKzFCUHp4RGlDbmFNYTVyeTMweFVKMy96akhsdWJpQlpIdG5O?=
 =?utf-8?B?SGpKdWtCUFlwUmNXS3FOL3l2UWFJdFRzWG0xZWFEYnBZajhKS0hTdzUxT1hC?=
 =?utf-8?B?M3BuejB3VFN4Qzk0K0UvOUsyS3FwQWdXUnlyZHhUcU5ST21ZeEttQlY5M1ZX?=
 =?utf-8?B?TjNSd1EzaXpuNytJSHp6R3oxODB2Yk1NVCs4K2V0aVJRYkJTd1dtTTkxWThK?=
 =?utf-8?B?VEZGaWhuckp2RGtDVFczdk4rZmdRSWdVczNhekg3Zk1TQVlHRmRUSnRTR0RK?=
 =?utf-8?B?UXJOS2ppb0p3S0lxS3lXWWt4eElHSXNzVEU1d3RvUEZjOVV6UERpTGl3Z0c3?=
 =?utf-8?B?b0o2d2t3L2JPV3VYSHZuNWx2RUxYZDNySnk3VjZaell0bXRiZnc0V3FRMkxE?=
 =?utf-8?B?UUVlcXR2bGw4N2F0YmxRc1draG55UW1oeFJDOGxnRjRFSmRtWVBnQUhyOUw0?=
 =?utf-8?B?S20ySmtjZHNQWU41MUtPdnZzSWFWdXQ3bmJzdjVCaFl1ZlJkZkQveE52S0pB?=
 =?utf-8?B?dVM3VGdpOE80Vit3VURkWlRuQUlXR2xiMDNJcUF1S0xncUJhQ0lpWVR6bFlw?=
 =?utf-8?B?WXFNNkVoNWtWdlMwalovcTFIVUcxQUN4S0JxNkYxNnlERVpwUXI1ZlBtNmJL?=
 =?utf-8?B?ZWlaMXg4dzJZNmJMY2tpOEJvR2pIVFcwNnpzOEFTdXkxcGtHNkVNZW9VQTh1?=
 =?utf-8?B?dm9ieTBqKy9uZDRJME9MY0tBNFBIM3M2MTlDTjdEaldITlBjbGNNT3NGblFi?=
 =?utf-8?B?WE90anI3THBUQXhuK21lS0ZKd1pGM2YxWUlYZGpKaU9aa210aUo4Vjh0b2pG?=
 =?utf-8?B?RytyQU9tS1lWdXpialpJbUtKTEhhbmMwcGhXZFRpRkYyU3lMcGgvRVFhRjBP?=
 =?utf-8?B?d25Qa0YvWUtWYVNUeGFza0JlTzRNMVp5c2pKMlM4ZFJYQ0dWSzVub3l0cG1m?=
 =?utf-8?B?akpkTXRNVDA4Nk84YWpqYTFEb1ZXMDkzbmRqYmpZcmVDdzdMdmhnQTdkczB5?=
 =?utf-8?B?WTBuSVc4Q09NUHYyOEJFR0ZqOGVtKzk5Yzg2VTU5L3R4Z0RhdmlsRnRuRXMr?=
 =?utf-8?B?d1Y2aEZTeDZaUzJsTVk2bkNlS3Q5aXFldVAxbTdwN3RZWUJsV0RWbUJqL1Nm?=
 =?utf-8?B?U0pSVnZvUHNUazRZWWxaNVRqTENHT0hlaERQOUNxck90ZlM4bDBkQlFDV0Q1?=
 =?utf-8?B?dVd6cVZlYkFPdVhqNXU4VHJhSGF4MVNWejZwV2tpdHhZOUtuQUtGZ3hvMkxq?=
 =?utf-8?B?eU9Rd2dEU082U2FEaW10dHFCeWVlTjFsZ1BBYWFNZm15L2lsTFFQRTltWHJ3?=
 =?utf-8?B?Y3I4RmI1UWo2clNGYlErVTZOL1pXM0s4OFFGU3J2bXJaVlBvbkUxZlZidEdp?=
 =?utf-8?Q?5bqwNjfxoKHCcvcaAVE+W3Mr+p2dRfhOHsBbBOqZuYnU=3D?=
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-38779.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1861c5d1-0317-45b1-73ce-08de03eb3e98
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 08:43:23.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR04MB8960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_014332_635049_DE88FED5 
X-CRM114-Status: UNSURE (   6.29  )
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
> Report RISC-V IOMMU capability required by the VFIO subsystem
> to enable PCIe device assignment.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   drivers/iommu/riscv/iommu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
