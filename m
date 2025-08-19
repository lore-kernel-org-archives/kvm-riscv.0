Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7102FCA0EE6
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI4LEsJrt4/EhP3z1dnmKWdBT2azR2vfYH6cE4wFYxA=; b=BbYRuFQUiXqfSplU9hKsEzSZtp
	P40Qsm9OijmnhFG2w883sJEnZ3lk004SIh45DovUq/AA7CCMvR9zAREw80nnXd8QU14Jc54aR6dBr
	9KDGngtaar3lVwtrwMwsvK+AscsB+nvl/rzyDt3A+bA3ZlVOvnxcTQWkdKJ3jI2jctiBrxs/BRYUU
	zc8ahbOpskAvyWu88lkdV0ssFvNRs07GQ54C9nexNOUiwzn2lum4i+2JR4hkrLgpxLpkGynoLiqJF
	jqONXHxzylMvDEdOCmJy2hpAxF2eM+4TYkfMoHAPg5W0gslBI5sSg9xFQzeGd6nIsir4EiN//mwbF
	o2QKjZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDVR-00000009KvU-0uJP;
	Tue, 19 Aug 2025 03:59:29 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDGP-00000009IaT-0AFV;
	Tue, 19 Aug 2025 03:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6f5nUdnG3YyN7wuICz5k1321R1UuDIsE1YmhEu2womjAbrh3Jfx5ezvXdSWb/3E+rigLRVAcitpPB3pefgRsFo5Ldyj/AqHapbKvyqWgTDndj+AXNi9IVZ1LRIuxKfgkuXVKEsowqhbLiz6rTpUW3x76yIQwiMCWdA6F98YHoMXshFbkSmmFQB4fwqa8fpWT3VkYpIRbGql9dq1R0wSzJfd43HxcRwUtToRvsT+7cb1FijVjKN5ICaQgVydj4DsQ3fkkjGv3UD5/BD1At6TtAZShk5fLavAYlfpH3/T66blSf3HEpeSjY9feUzP08VchKFU63xGToMGpvMMSOg4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msJ1S/73+95yy9tFeW23623/K1fYumJ0w8Rb2yn583Y=;
 b=YzTLeSB3wS2i7S+tBRcqVXNRWqsvgw9Tpvf6uDvI/A/cfSyhyeHhHIzBECNY2lByL72FjgdYAaaCedgTD8OH3LnK6kY/+r/ym+oB7l0EA8WqfnsCmkq/676N1srbt+M4IbGu+rG0yMVThiIsIaQnd1f+6sLJspBmMQGYxN6x3MgOyRyw7huR4WRKFedofh9fb7HdSR0+pPoCGSOIGjtuwzJtSTf2oYi6emxyeLpY2kiTEaztQF38TMpOp17+42RKBvKziMqNl0ILZQA3dVJKCA1lQPAVeVw0mR0EacEOfIh49CpOdmK90ELu2jLz4HlQobLH+bQ5XKIzNzIbp4XZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msJ1S/73+95yy9tFeW23623/K1fYumJ0w8Rb2yn583Y=;
 b=CGwDuFUfOW1B6ijaCcQx0zJBN3W5XqbxwlwIGidCTN7K9eCjwLRpaToSJUURewbiGnOJXDOB6X365NWqrm5OQ53jgY6JgUqY7x4A0Iy2XI2ufztyPbM1TPI3rzI2Sf+emEFrCoRpTlUhfyOy4pka+O7zlj2znkazUrrCYvxSU0stSQS8/ZZUDlINu2lcMA/khwQon6zEEC34eqHkaUE0P05Rqp2DGnGyzoGjwgSSWApWkCm9TeK/ftcu123jT0ziUJqhoz4Cgm2RA84kC2Ad3tyqGSaeJ1c4K8zPo6GBIXKjSxP/sna1dCY2wg9Uwz+GLje00/mbcVlqk4c2UgzsSg==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by SEZPR02MB6253.apcprd02.prod.outlook.com (2603:1096:101:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 03:43:49 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9031.018; Tue, 19 Aug 2025
 03:43:49 +0000
Message-ID: <TY1PPFCDFFFA68A4AE169DEFA1089E2AF0DF330A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Tue, 19 Aug 2025 11:43:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests()
 comment
To: zhouquan@iscas.ac.cn, anup@brainfault.org, ajones@ventanamicro.com,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <3bf6f0e6-e018-461b-b8cd-1d4123d254f9@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|SEZPR02MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 41494cf5-8cc1-4906-1e2f-08ddded29b9f
X-Microsoft-Antispam: BCL:0;ARA:14566002|36102599003|6090799003|8060799015|19110799012|23021999003|41001999006|15080799012|5072599009|461199028|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHhibE9wSGR3QkkxLzlVemdvM21jejIzdmd4Y2srbGNHTTRDazJPRytUOVhh?=
 =?utf-8?B?SmRuS2xOdGFScHk5QkNuVTh5cWlScENEZGdRRngzdVpnblpzVDZxZmh1WnhN?=
 =?utf-8?B?TFVaYm11V1htcmxselQ2YkhNaVZqOEF2TWFYZWtXUldyaFhYRm91TGRsTGJ5?=
 =?utf-8?B?cEV5VnlYNDZCdUw0aGpoV3VxU0o5OGFESGhmcEJlb205LzBWVkk2bGdrMUZO?=
 =?utf-8?B?UGlhNFB4OGdrcytseGtnOWRiODNjMmk3a3d3cnFMUzJUQlBQcGxUdXc2T2Jp?=
 =?utf-8?B?dllCTSt2cFprZUxFRksyN1VsWDYyWFNESEp0SWdkYXV5Y0dPZDB5WnN3MHlj?=
 =?utf-8?B?VFlxc2RBQXZxS081UzVYajd5M0JUaThwUUtJNGJWOUh3OEl6S2tHS1c2dkdn?=
 =?utf-8?B?RjR0bkcydnZMNFV5ZDZRMFNHYVh3b0FUODBqK3RKSHIycWZvMm51R0h4TFEz?=
 =?utf-8?B?K2FwTy9sZG1ScHNwRHRGRHVoeVVEeFhtQUtwUnlCV05CTHpad3lPWDlSbGRu?=
 =?utf-8?B?SnRiZ2xNc3NtVXl2aWdsQVRYeURJTlZ0S1U2UXphd3g3U3RhOC9YZzVFeHhl?=
 =?utf-8?B?aWY1azZONnJiTDZKMXFDWUNpczdsTXh4Tzd4U01sZnlib2ttNHFPbGNJZTBY?=
 =?utf-8?B?MEJ0RGJSWENGNDR0VnNCUVp4cVpZaC9JK3pISWh3eTUyQWFyZGpSODVCWEps?=
 =?utf-8?B?ZGVUOWVjZ2FrbmlBRzlRWHRnNDZkYmRoSTliUDhRdUVrbWhRZE9YVDhlZU55?=
 =?utf-8?B?aXJ5eEphSzh1Zm14aFlFZ3hHV3E2R3k3UHYrQmdFMENwcXZINi9TUCtMSjhq?=
 =?utf-8?B?ZmNFMG8vRVZKdnFZV2VhVGtuSkpYaFN5WmZWVmJXTnh0bGZ4ejEvZFF6bHFF?=
 =?utf-8?B?SHVIOWx0NVRzRFpLVGJ3Z0FKZW9ITGJpS1VoQUlld1FWM21XU1J4dnVWUnFM?=
 =?utf-8?B?b3Zpd1dpaXlpcjhpaGZqR1kvM0tOSzZSZTQ3THNyaG4zaXVDdzZZSzlScWVX?=
 =?utf-8?B?OStjblFqK3NBbjlINWJZaTF6T2lQTVRrMFBTZFlJVU5kMG5ZQWFkbjNhQ3B2?=
 =?utf-8?B?VUFsUE1HZ1FLY2VJVlpOUXVuenlNbENyZXRTTEFxeEtCcGtGTUQvenZvNTBT?=
 =?utf-8?B?dFhoZzhFcWE1ZFlmVzZCNkh3S0xrVDNhYmkrM3pKNkZhVzhSanBJQ0g1N2FB?=
 =?utf-8?B?Q3RXQmhVNWs4RERHQkZIWHZwZG81OXA1dGI2clc3ZGRrSWlsZWtFMC9YbGhD?=
 =?utf-8?B?NVMwK3ZOcG85RG9aTW5QQ21qcnRTYS92aWxmbW1HMGRrTUQxNEgrSEtBclk3?=
 =?utf-8?B?ak9JVHgvZUVnSitUb1YwVEpiSmozQkxucWlSaWFIVmdVVWVvK2tHZ2MxTVg5?=
 =?utf-8?B?SXRDMG5udEZ4VTNsU0Q4TU1BcXJhM04xK21id3IwVkRHZDZ0dUNITUNXVkNz?=
 =?utf-8?B?RVBNOFpsek1XT2piUWNuZTJ6ZUZna1BRS2taSmJkbHFmbFRDSml1dnl6WTVP?=
 =?utf-8?B?OVo4SytsUlBrVldsQ2I4OFlZV29GYXNpcGRLck5HanRKUHNZc1lJSW5COTdK?=
 =?utf-8?B?dGwveHAzSndXSDBPajEvUVFlSFA5SWMyaDg4NjF1ZFZCQ3haQ3NsL0VzYllE?=
 =?utf-8?Q?wJGOpTTm5q8rgAYH8pDQ+N8rLWjvxMy677bDU9bxmBIQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSttUHJTV1ZyNXljblk2YlJRc1ZuK29YSmhlYlA4QXY1dHN4YzJDWCtWVDk5?=
 =?utf-8?B?V0srQVVzNVNyTmR1ZEdiNTRNUlpkeGxuaFNEUW9CREZGOXpIb0RyMGFZY202?=
 =?utf-8?B?M0hQNjBSZGxzRDZZYTJ1WGVFY0w4RE5ySjZXRHlsK1VzU1R4cWJGbHg4dHhh?=
 =?utf-8?B?TmQ2aGlkRjl6ODN0ekpMTU1vbmdPd29iaWNWVE8relRWK1Q4dmk0dGhHRFE5?=
 =?utf-8?B?YXBuYyt5WUNSNTY2R1p4UkZLekcyRzk4V2dzenVPcHcrRDJuTmRaQVVzQk84?=
 =?utf-8?B?Y0xCSjZEOE9DTXp6QVlUaE9VNjRhZW42dnk4QnlkL2FyN1ZlS29ZUitKdTFi?=
 =?utf-8?B?WDlkVVZUazJuTGdBc3RUV1RqSkFDd0hxbFJWUEs5U1czYmpJN2h2VzRuU2Qr?=
 =?utf-8?B?cm43dWRxYWsxaVZKRU00NVRJWWxQclRSZ2tteThRNTJ0cWd1TElxRCtHRXBu?=
 =?utf-8?B?TldCU1o2ZXZnOEJHNjNYeCt0UjErdkVkZlBoQW9ZOG5EN3dScXdPeUwvL25x?=
 =?utf-8?B?RnhRQ0hMWklDaDVxWlgrUWgwSFZuWTJqZThBZEo4Sk1XdW1QenRDbHdCNUpT?=
 =?utf-8?B?SGtVUzhXQlVXTEh6MHV5R3dTdGhpTVMzVVJtNVVxdGFBU1hzUWNLeXYvQTcw?=
 =?utf-8?B?M05yYU5NM0lTRVF1Vmh1Y2dVYTM5T2g1MHVGbzAwY0NGRWg3amtjMm5qZXMx?=
 =?utf-8?B?cnc0SzBEYzBWS3ZoTmI5dTAvdTBBR1VyWjRrZ0JTNHZZM3lFLzdkenNjeHE5?=
 =?utf-8?B?TkN4aEZQamFxRyt3WFZmZGZRL2wzSEpWUUpEb2NvK1hxZWI3VWhMRzh0VUQ3?=
 =?utf-8?B?bEd4RXFRK0RwSURmbGNQSnl3SGFnc0dEdXRMUE9UYW1BV01taHZNWHlES1RT?=
 =?utf-8?B?bjVxMXhYYUdFQzdVems2a2xVRkRUeTk3MlpFSC9hMzlscmJKUVY0b05Nbm4r?=
 =?utf-8?B?MjFLMkp4UFd4bjJUZUdUVHpzY09EMDZjMk54eE1jTmt3d3RyT2JseG1XOFhX?=
 =?utf-8?B?QlA1SUtHSDdtUFVXVDF6TkJIMHpGR0ROc2MwRjB5c2M4M0pIa2RKV0lHdTl4?=
 =?utf-8?B?UkZ0L1FaT3lvS1FiYkd6eE96SFV1QWZ4YVFrUDVISXVtbXdQelpTOHAzR1Zt?=
 =?utf-8?B?cGRLSUpEQWt5MDhlYmNQbE5qS2hCOEVRQmxpM05RRjZDazZDdmI5Q0ROWVNm?=
 =?utf-8?B?bk52VUdyd1JGSU5iWmhJd1hLMXhIYzJhSkdYRmtvRnU3SFo1cXpoaUxCWlU0?=
 =?utf-8?B?Qk5PSG8wOHNsdmc4ZU9DK0hLRDRTY1EyNTRJRDMrbXlBcUZHRGJKMUF2MTRi?=
 =?utf-8?B?bzJ1T3dwOVYweG5MY0c3K2RTQ1hYYTJybmxLbFZSZHFzMVpVL0VXTm01RmR4?=
 =?utf-8?B?dlhQc2RPcnBGaTdWZ0JocE9YUEJrOEJFaUpndjhQYUVIKzVhTytTaW1mT3Nm?=
 =?utf-8?B?VW1tY09oeDJZK2xqSjJTVlVjUVR5eGRDTlZKbDdubWovL3NVOGs4K0U1VGhB?=
 =?utf-8?B?NXBKdUtaNTZiQ2wyZzVyWXRCS3E3YmI4R3g4WFJPelF3NGtWL0ZjZEZWZFF1?=
 =?utf-8?B?THVEb201UGtPdG5EL0NqUnFwU1VJVzMwRzJwNlNKT0VEaWpOS3dTRnpWTktF?=
 =?utf-8?B?SkFwb3pSK1lUbE9Ta1UxZzNMVG9ZUWV4Ui8rUzBOZ1BuS1pPVUhSMXk0YW03?=
 =?utf-8?Q?vwWKoM+P5CWvvz3bek+Q?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-c9a3c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 41494cf5-8cc1-4906-1e2f-08ddded29b9f
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:43:49.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_204357_104912_34F5FC9E 
X-CRM114-Status: GOOD (  11.51  )
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


On 8/11/2025 10:18 AM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> Correct `check_vcpu_requests` to `kvm_riscv_check_vcpu_requests`.
>
> Fixes: f55ffaf89636 ("RISC-V: KVM: Enable ring-based dirty memory tracking")
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/kvm/vcpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e56403f9..3ebcfffaa978 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -683,7 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   }
>   
>   /**
> - * check_vcpu_requests - check and handle pending vCPU requests
> + * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
>    * @vcpu:	the VCPU pointer
>    *
>    * Return: 1 if we should enter the guest

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
