Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0EDCA0EE6
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7WgcMRtQpsxJTfs3l/hLWL7U74fLWMtYIhjnieMehQ=; b=ICRe8Qe7VxyTAaqN5l7bkYskmV
	dK16Z06sTj8lM70Mj459bKvcAKCasuAm4Vyz7EhVBeiRpe/lILSANmtpr+6wgO5RtrS4Xgjt6eIJQ
	5C0FSR7zvnvkUuPAhB2oNcvwOsUBRm41qR+/DN0NtkMLI7JW/dRZ5XQKzGFYRHhOEKT6CAdFxR+un
	l1d3itDE2cMohqKIae0UEIioMsVOQSBtiJt7Ppn6i46IrlBjH8uYT3G8o09f/JAdSoS/aeNQfgVbf
	s3EIMJQ9Zn5QyButRWfBRCXX74M9WLu3G7k3TisMwww/kP2/78vjnyHhyDEsAv5/+zeexmZibxTBn
	SIgeNRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDSn-00000009K4g-0Y3c;
	Tue, 19 Aug 2025 03:56:45 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDCQ-00000009HiA-4B5h;
	Tue, 19 Aug 2025 03:39:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE5p6oA3Sc6kAVxOkj+t4e7ViJr15n3P5Jg2GjKKFve6oJej7qiKCcMbe5QN4bMmPkeyWhhqEcXE65Oy5DzDXG6oReH5x3qT6nvOJ2cMImLo7n3sArRpuF+hPN4mKIteQwkMMBDxcTCvB77JaVR0cPh9ufb1mlvd+EpRLZ2YJJl30vRt4wAvJVWxO/AK+pqJlo4Tgs0kraF86Zhd+XQjAEtHDShYhrjqiaL1pkPjUpxn8VbLUeVv0I1y5F5AChxwgaQpb5X+xvqo8ixcF8aB6rUz4ihrCE9RXMHSI5tF9BFcSf5M2Gkg1YMxeQxWec2EjQMtS8h3IYQtwudyNDLCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CemYhDFthbnu9RwHQa5x5rkulyS9sYn7kpY8D5eMEvw=;
 b=LSDSplNGukVSr+29nB4q3jDDXkAAEYSL8+lrj3Zh+poZdLMEjdkgmcilcnhpqwZLdIqMWlaBA+wvuhYp5ERpKp37StdsGhZ4pzvfJCgIZd5iMiLbCipbpyPx8tmv4Huw+Kjay89OOZkXpPh8xynZfG8yDmg+EZmp5W8tFdz1SsU34ZnhmPtSYf9we5WyZfm5rRAkVVNupxiufbAFALgr3OgYetoPYQhpcod6hzREjy9NDOLt1xFMKcSDMXxVoXfH3EkCJ6vHZKWVo5rT5whSF/FfUlIism3DoJBzwFFzkTnySXDM910aTY+LW4TRNxcuvEMYWtp813bHh/ZGSf28fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CemYhDFthbnu9RwHQa5x5rkulyS9sYn7kpY8D5eMEvw=;
 b=L+uKKHsArQeoqrAz4XMFTNgVvQB+2o4kbREwRbQT7VxvbUuerYx4lY3ak6g/jBk7/5tg0FEtaNg10sGEgmr43rslP1wrFpMoyKd15StMNNPKuhzokc/4rWk/SVgEc7/nYeZPvStL8tiF2UfXiTOC0IHwPihYGM3D8Fvb5KsL05k0ZwgI1qGzBX35tJvCkSXguFVI8Kpx7KrxsdBoWfzdmBlLLyLNXifpi6lRBtRFfu9xAC0z8+cIlEpR9gHZPo7fos5czS8WqdNrBQ3HZw8PnMWdZQ7hu1kBzZuXLZrAuiNjP3X/jWuYL9ZvoclSEr5pQV1gxXUqVhQ3ItVuI/MNJA==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by TYSPR02MB7782.apcprd02.prod.outlook.com (2603:1096:405:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 03:39:41 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9031.018; Tue, 19 Aug 2025
 03:39:41 +0000
Message-ID: <TY1PPFCDFFFA68A838BC092C3C35F0FDC70F330A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Tue, 19 Aug 2025 11:39:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] RISC-V: KVM: Allow Zicbop extension for Guest/VM
To: zhouquan@iscas.ac.cn, anup@brainfault.org, ajones@ventanamicro.com,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <db4a9b679cc653bb6f5f5574e4196de7a980e458.1754646071.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <db4a9b679cc653bb6f5f5574e4196de7a980e458.1754646071.git.zhouquan@iscas.ac.cn>
X-ClientProxiedBy: TY2PR0101CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::27) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <38500aec-ff53-48d2-89cf-c69f0bcc7eb4@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|TYSPR02MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a6c4a5-4aeb-4d0a-3e3c-08ddded207e6
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|36102599003|19110799012|5072599009|461199028|6090799003|15080799012|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCsvdXhPYmRBUXU5QTBvMzliMW1nOXlVTVRlSXFXQzBTQkxxTGJJK1M5VWZ3?=
 =?utf-8?B?VCtkU2lKVXBtVThXMzU0UzFFamRiRkxacXdaaXdVWUVVZnM3dWdrRWVKZ1Uz?=
 =?utf-8?B?Tll3aXpEMTVIVXI0Z2xUeXhFNDV1dUhsZC9nQW9GdFBiN3NUajdDSkpaT29P?=
 =?utf-8?B?eTNBcTB6TUQreS9BNG1ZM1c2NWxydEZOWklGNmErb0JtSjJld3NySmltdU5S?=
 =?utf-8?B?MUl5elBJbjhucGt3b3lLbDNtNitIUDA1dVBYSm15b0VrQzcxUUtLM21UT1lW?=
 =?utf-8?B?UFE5Qm1wZXpsWHZ5NTVrbi9pWjFnekxTQ0lwWThJQy9BclMyUFhrWnpPa0k0?=
 =?utf-8?B?eWRGbUtPUDE0UWVRTTZKUGFaUUozQitsM1dtWjhYS1J5dzdTaGtrQWlPWEh4?=
 =?utf-8?B?L05xU0pSUUNYdnp6N1ZzR1ViNnhPRTc3RkRYSzhzWURTRVlGZ01QTSt2clls?=
 =?utf-8?B?OHBRRFlYS3dHUE16ejNJaWV6TGlGdXJ5ZVBISmliRzZQNFEwVHJ6dGJ3eXNi?=
 =?utf-8?B?SVZzanZ1OUx0VDlqNHh6amRrdDVPMjYrNkV1L2w2eFNIN0M1RWpvNU5nUnZ0?=
 =?utf-8?B?N1J4bkZlZHRQMzJyNWhZNUhIcE5jaWxWWkhDVWtvOVU5R2xrdDhod1lzZ2hI?=
 =?utf-8?B?VnZhenhNc0QzTHVrQzMxQm5KSDQ4NjB4bUVzZWdzOHNyN1pMOHV2TUY0Y3Av?=
 =?utf-8?B?YlpVQW1LQ2U0YUN6VmlPZGJ0R2hEc1VEMlpMSnRsQ3RqdTRzR3ZlNC9ybDd4?=
 =?utf-8?B?SnRBSGoxbmdNV01CNjVqdlE0ZXFOZzFjbzVZTjkySktWZjdla1JGNDZ2UjhW?=
 =?utf-8?B?YzdRMmNWd08xYzNWZ1l3WERBQ2tGSjQ5NU5WZnRsTXFSZEVxRmp3Q2tVMXhQ?=
 =?utf-8?B?QVNqN25zaExoTnFkeFJrTnozKzdPU3crRmRmU0UwMEhkYVZmU2p4cjVWUU9Y?=
 =?utf-8?B?RDVwcVQ2dGNBMDc3ZHI2cThrSXNEREVKNFk5bk41MloyYno2Ym1mSnh1eVNt?=
 =?utf-8?B?SmJ1bzQ4aGdWVGZYaC9JaHdEZ21GWitrZm5CWEFMRS92WHBLOUhDbHREeXl1?=
 =?utf-8?B?VUNjNitjNjZJN2xVZ1dLWk5aV01TeTJHS3F2d1pURy9uQ2ROZS9KQktSQUpi?=
 =?utf-8?B?V25RWFhZTWVxZHpUSCtuQWVMbjRiNUhncXNOQTlna2NFeUdZT1IwYkJ1ZjB5?=
 =?utf-8?B?MWdnbFFEazBacUM2cUoxWlptQkpBR2VDZTRrV2ppd3o3VzN2eWdwZUZBdVNE?=
 =?utf-8?B?M0daRGQveGQ3Y3F2cG1NVWtmMUtZVUNzUlNpYmhMazl3cWZ2TkttMGU5NUJK?=
 =?utf-8?B?aE9qcEpiaHZFTW9MN0pTaEUvcm4wb01GWklxU1gvb0E1WWVtdGgrTUZJODh0?=
 =?utf-8?B?SEthMzB3NUZSZHZwbjBiTlYySHlYbVI0NjhmTythbjFPcENGdWcrV1lJMEJG?=
 =?utf-8?B?TXNjMFEzbm0ycnR1WmVlcU1LR05JcDJvN1h6Nlh3TVF1MkdGdnUxRUg1UUM4?=
 =?utf-8?B?bWF1bHE5TmRlV2tHdWpoeEpaQnZzakdRbldGMnhhYy9CRXV0czdJZnp4UkpD?=
 =?utf-8?B?cFIzRVhRZFVMeFdqT2huOUF5ZlBHeE9wdnROUnZqc2xEd0h2TExWV2owR2R4?=
 =?utf-8?B?VmdBMFY3dGJRaGtDQnVtajg0S0lSZFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHkzbUZ0cGx0UUVxcFlKN0tyeGRoQUMyczlQTzZ5R3hlUlAyRmJOTDJ4UlVt?=
 =?utf-8?B?UlJSZ2NFd0I0YkZOdkN2K0FNVVRuSjJTK2NsS2FGdTdwRDVHaTlpeVh1djhI?=
 =?utf-8?B?dHJsS0VxZmhha0kwdDZML0tmSlBoN29HTlJmNGZGUXMrcXM4MjhPUjJ4ZWI3?=
 =?utf-8?B?VWx3TVFGSk05bDEyNnVBUVMxcGRTZzd5ZHdhMi8xZ0I1cXRmYkN6akhqQ3hC?=
 =?utf-8?B?dHJsd3RldmZZNFNJZm9vQ3pqeTN6aERuOWZZZzAvZ2xtSHduV0lwa0xFanRT?=
 =?utf-8?B?c0MxKzlKS3VNVmF1S05OeEgzZWF2R1BWM3pNYVZTcm8vRHNYa3J5RDFJUG85?=
 =?utf-8?B?c1NJZG93OHR2ZmpJb0FGbGRlcFROcU8xYVNTMm9ZbTFIUElpSXhrNDVMS09W?=
 =?utf-8?B?NUhzVG9SbGZNMU5QWnBnNkFhamhFekRJVVRVNzQ0ZUNCTnFhYklCNDU2bExZ?=
 =?utf-8?B?Zkc2UmFjT2pFc3dzNUd1Y1kxcnN2dmMxbk1GOEJVV00yU2hKbTNiV1FDeFpx?=
 =?utf-8?B?U1NYM1pZelpxaUFVcWQ3d0ZBQiszbVp6QkI0ajJoZ3dPY0pGVXJKLzBpbU01?=
 =?utf-8?B?KzVKZUlZR211cENqOG9iWFBHSGZnN1dQZDZ5ZTBQb20xYXFjUzBvVysva0Rh?=
 =?utf-8?B?Q1BURy9XVzhXbFNkWHpCaGh1YUZQdkpmTkdySWJmMTE0M3BobWh2cDNYRGJl?=
 =?utf-8?B?QlM5L3MyUHI5ak1kZGVSSEt0eXdsSHN6cENUOFdFOUVXdVpBK2pSQ2Z1dUVm?=
 =?utf-8?B?SUVhL1piWW5hYldhdjRtYlg4RVRnRjNWcjB3bXNmdWFRNis4c2JydDM5cDho?=
 =?utf-8?B?VnJGMnlHV0xLcEcyalN6YzFSR0xMa0NkS3k4RHZDWUtvVUpsdk5POGV4MzNl?=
 =?utf-8?B?RFZIaVhJMlVKWXR2REM1WmFVZjdDNVhnanVxREh4ZS8wU1JkeXQ5WU10R09K?=
 =?utf-8?B?R1FMS29YK2JjOXdaRE9wbk05T1JuZk9ZdTltVFo4aHVoSjIxd2FkaFhKdkN5?=
 =?utf-8?B?a283aEc4c0wrL3BoTCswcjJ6Z1h1UUFCVDRhMHpYVEdQM3Q3alRSZ01rWE9B?=
 =?utf-8?B?aWpqU2FRYnA3Zk9zZTEzZWVqbVpuVGlQNjc0c3JYR21jSkR5MGpYT1c4SVhy?=
 =?utf-8?B?MWhiNm1WUDRqOElGOUEyeVBXWWx3NFNBVEVGUmxsNUc0TjB1S3lEVG82YzZ6?=
 =?utf-8?B?Njg2c3U0QlY3YzZ4aGZuUTdhZ0dyalVUYTdLdlR5NWRDcHJVaTJxMS96dHJH?=
 =?utf-8?B?YjRzdkhOUm96OVFxYmloRHRpSkkvdWRuc1dzNzdzQUJOdFV3VVJPUUJ2K0Fh?=
 =?utf-8?B?K1J1Tjl6dW9pTWVMMlNHa29Xc3pwRTF4Z1Y1K2k2WUx2RE5HTFkyV3BWaWg4?=
 =?utf-8?B?NmhjNTNZd0ZMbG0zcU1qRHVvY2h1WTBtQlFCMFVOY2NEVmR3WVhwalhXRkRO?=
 =?utf-8?B?bVdoTGwzcHI1NTd4TllMaVhXRlRxeTlGN2h3MEVlaXQ4bExDeWFFcGZqMWhN?=
 =?utf-8?B?bHNxOUxyWnYxU1V3OXpHRk03UzZOc3JJbFdHQzcvWjVuZFRma3Z3QkxONkxx?=
 =?utf-8?B?L3oyRS9SOGVILzhTczhGWHN1eEJVTnZscG10dVhwV2h5dkU1aUZJUmMyN1hu?=
 =?utf-8?B?TWw1SURueDg3ai9Sdk5wcTFBRlo0NEtaMmZOUzNQZ0tIS3U4OFlsU0lJR2t3?=
 =?utf-8?Q?fercq9l6CtpZYW99vr7F?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-c9a3c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a6c4a5-4aeb-4d0a-3e3c-08ddded207e6
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:39:41.6744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203951_060852_1B846FCD 
X-CRM114-Status: UNSURE (   7.63  )
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


On 8/8/2025 6:18 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zicbop extension for Guest/VM.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/include/uapi/asm/kvm.h | 1 +
>   arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>   2 files changed, 3 insertions(+)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
