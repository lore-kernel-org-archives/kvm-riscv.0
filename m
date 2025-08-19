Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29926CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNHeq5bR3dzl3LwvrYgj/bDhUsX4o7ybO6aGz08sGH4=; b=czq281LBk11HgoCEws8RUucCEQ
	BZgq8SYeLxz2HZTuPs0S/tMErS2tLTs+gxbuk9ME2rcrMgH0LMQKbn4AVR5yl83lyW/k0WObFF57t
	k7vUOVIQzoFYZNSvXuHmvg+EO15zPm2UoZl19IAk0Rvpx15kfj/qpfhH2xbGFID4q8/DCCwvyIfEo
	QNwy0QTsdg1nz/ek8wz6yvK5pItV+seXyBnNbGn0cqBaJKS3QQ/icT3gAGFA/lF/0PfJ3Hgch2sBp
	D8xt9+MWnjs4Qh8ssDmcS1aRJ546miZYzYatC1EaVOA6Wc+WudoJv5PijrFWqoTAj16vSun68D758
	CpkpvT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDSl-00000009K3J-3UG8;
	Tue, 19 Aug 2025 03:56:43 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDC8-00000009Hfk-0Ewh;
	Tue, 19 Aug 2025 03:39:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDPkIcmBHgv35+EDP/X+NGrnXXlDktipWW+Cb3J9uidhAyTMN7slRUBVXBdLjKotK8ie3aVRfH4HpmG+qViYhtQXEzn34ddTm5VhFVXqxQ11wmoRDfxCclHiLCBfgezq1iXjiDp02kRjQtvqtEHWhKSmQNVLvQp98IH0rlm55iDFJMYZcHf/+zvB2guOFtCPiOsWqMtBl92nxaWV7TqGstAIu/wcg6BzX+PlEo9PabTfsD7tIkzq88MydIhSfaY8/XsyXev6PiRMnvm5bbaEpMaYUgu9bkVbLbP4xtBYC+pm3uAf3O9N1mK2KB0VCNvxVezBZmLL9K33iA29l8UYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efKi8ef99nHWOCxx4UlOmvZdaLeV8vXg/8bCJpEkw5E=;
 b=J5OmN84/t5xWQ3Tue4uqi1qPY2EGGuOnou16UIvinAVQTa8dE35+TZmjeMGNpgAhcvO7ODd3XqzC7bogli6L8pVASnsWUqV8flO8/KkJYpZhvPuz7jvY0Qws9mcvVw6OLw4JWq1xuR18bbf+usUABNsfW1oglkVToKlnFwDgw04YliI6xRhcf0eXyIlrPVWqzI7JBNKsreTLmebzvy0tT8Ki/24Ad30FoIE5xTBA0DdR62JLxkYedfOrAMEeAXKJ4D5OaHDy+6QWurXivHGDQ52ZL57NSgmxWhZPuVw77cvfghDwvW/HIBhZIgmJrFTzvJ0UFcUO3AmGevJcBg8PjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efKi8ef99nHWOCxx4UlOmvZdaLeV8vXg/8bCJpEkw5E=;
 b=Xs7ly2e0Be8GRBo3oEzfLOXGjB5IqJw5dPxkvgVRe4/5q3iKRbuopaQbf9bX2KJzi/pElstzLTGz9HMG430ufdwUazN7iFDXG+JOmSsxmJ/nngRaqmXTB8ZngNnvcUEqaozD6yfdnCzHNr9a7R47sELh+KyXQHcUeq/pu224/97xjPmX1QEtfv42Jb6CpJ6PFXkCA1ny7dV4XrTveMIF1NifSrRS0tmSB9vDCQcwVjaiQplRf6IVzV68V7uAsBgZZr3t8Z7tiuwQDZOlFNQs+xfNGzcuzVbjIo8r/u3heBvMRx04XAwTCaOveaStQXbZDKFbzez/Zu+nML0xxy2NyQ==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by TYSPR02MB7782.apcprd02.prod.outlook.com (2603:1096:405:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 03:39:16 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9031.018; Tue, 19 Aug 2025
 03:39:16 +0000
Message-ID: <TY1PPFCDFFFA68A08BF1A42657C178794B9F330A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Tue, 19 Aug 2025 11:39:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] RISC-V: KVM: Provide UAPI for Zicbop block size
To: zhouquan@iscas.ac.cn, anup@brainfault.org, ajones@ventanamicro.com,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <e741b6db-8af1-4db7-9cfc-1c048a4b6d2d@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|TYSPR02MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: af458d71-3144-4f84-b3d3-08ddded1f8ec
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|36102599003|19110799012|5072599009|461199028|6090799003|15080799012|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZjOGNCTHhyeEp1b3lLY3VYV3BoWXBiWDd5SGlkTTRCUHhQMVl4M1l2WWhs?=
 =?utf-8?B?SG9DTC9Wb2syUnNZdUVmM3lFLzhTZmM1aG00QW82MjBkZmFIa0ViVld0cFAv?=
 =?utf-8?B?Uk8wbUJXV3pJcVlTWTUyZlBEYjd6QWN0NjltMXhueTR6cDcwYUNBb20xL080?=
 =?utf-8?B?RlNCZnRrRjluOHlxNTlWSExlSzJ6QWs5Y3RvRE1oT0lVQ1h0MFdGaXJMb3BP?=
 =?utf-8?B?aW42amY2MmxLSnZEWDlzSkNlUlNyUmZ1MTE2NkFsWlEvWFJlQnFDaUlzUGJO?=
 =?utf-8?B?K0xnY2dQcjI4cU5NWWlWM2NTY1BMQjdzdy9TVjcrMGJDYWh1NG92UDdDWFp6?=
 =?utf-8?B?di9lZVVuQkVYN0tvanQ0Nk5ldnVKUzRGMjNVOUFTZUUzOFpPZkoweHRraTAr?=
 =?utf-8?B?SVdsenZHcUlRZVUrdWs3dnBrTU9yQlhMVFpHU2JmL0hhbmhHSlZpQnlyV1Zk?=
 =?utf-8?B?c21WNmlHR1FPakxSdUo0bUVLZ2s0a2lWS2JteXpmeGh4K2xYcDV0aUpWemgz?=
 =?utf-8?B?WnQrd3VnTDc5WFFlWUMzYlA4VDBMQjljZDF2VEFHUnM3bkdhM0x4dHJqK1J3?=
 =?utf-8?B?eDIxZGxPelY3dE9uSFEra0xQZGtoMFZRd29kclBYL1FKQzF6Wk1vM2pHZys2?=
 =?utf-8?B?MFdHcXZyclRUZmhoRDJmVzRXaU9POVhYWmdheXE5QnArRjhERzZwbW9DNEMx?=
 =?utf-8?B?YTdqeHh5ZFlvazdldEJNUEpTZE03clkrT0RNVnFJNGlPcWpNNWN5Zk5OSWtO?=
 =?utf-8?B?WTZrZVhGYWxTbmtlNFVGNFBISDc5V3V6Z0g5YnRLVWVpV2VLc2d2SVcyV243?=
 =?utf-8?B?WTZ2NUk3MXArYTE5RFlmbTN5eDU1YjJYY1Qra0VncHFIWnkyRGMxMkQwZUZ3?=
 =?utf-8?B?SzhQQkdySVdFNGhwSTFhem1IYUExZlZldFRGVDlHYWhvbnB3WDZGazFLMjJO?=
 =?utf-8?B?WEcxb0svRE9KL1E1NXFCWUtBNFJOSHNGVGNjYWFsekZ0QmsxeTRxYkNBeHRX?=
 =?utf-8?B?N3lzdHYwTTRPN3MvZWFvQUs1MS9WS20zTGtlcWtWV3BySm9FeEptYlhMK01P?=
 =?utf-8?B?dHR0Qk9kS050VHRuTUg3RWx2aHR0SGJ3NnJySVVqK29OVjd5T1JVMUNXRUZo?=
 =?utf-8?B?dDR1OXNZNmhnaDZobklrV0MraEVIQnV1c3hJUXVsYWRWUlZqajlFVEJvRXNx?=
 =?utf-8?B?d29HNDN0VnJjc3hLTk1iUmJndnc0NFd6OURkWXgydFZEbENtZkgzbThHQnl2?=
 =?utf-8?B?dXd5ZE9ucXNsSEJpNlpCbjBoYUVTLytidmpYUnpSZnljUlFsVEc5djY4cmoy?=
 =?utf-8?B?Mzh5VjJUeWo0ZDVXeTZmTjFIeVdGcG96S1MyVTVVbFRTQVVYQkd4eTRxNzNQ?=
 =?utf-8?B?cGFFUkdYbHE1QWV5ZjRUMWVqZ09zK0wwcS9Md3dQREVTa2ZuME9FQTlFUmor?=
 =?utf-8?B?R0xSbHl5R3plMGxLdzgvUWw4aHpSR1VOZWhLUlBKeDNNdHVZa0NlcEttVXNT?=
 =?utf-8?B?alV5QXVzYTdPUkZxVWtqZ2NFYkFBbWpNQ0xxRVo2eURhZGJFN2JQdWY4OXR2?=
 =?utf-8?B?cVgwL2JKRWpIaUh5eG9MRWp0TFdLS3YyK3ZWelNlRExJd1M1MkRCd0RLYU5J?=
 =?utf-8?B?aUMvbTlCeGUwMVdaTW5VU0E2djlza2c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERweWdoVkwxSmNyL0k2RGx5ZWZ1c1pWYVpkTEtNMnNhOHFKc0pURUhieWc4?=
 =?utf-8?B?YlY0SzRiL0NDbkdqK25mNExLdzhocndXclVya01UMFlTai9KTkpraU9aWFBN?=
 =?utf-8?B?NXE0ZVphdUJzUUxUZTdWdHZ6YndRcDV3eE9BdTdqUjA3cm44N3lSQng3bWF4?=
 =?utf-8?B?YVZ5bnVsM3ZjN25oQ3ZBeWNWUkNZcmExZ2xmYU9XWUZCRE1UWi9iOEtWTlJ1?=
 =?utf-8?B?YnNVazNtUzNaQm1aS0N0T2xvWkJERGNZdlFnNDlhNGkzWUZjc3cxSFAwOXhv?=
 =?utf-8?B?dXNyMGFma2grRi9nNElPQkEyMHBqeXVTcUtHeVIranY0eHE2WHhqcUZMY2dC?=
 =?utf-8?B?aVhqdXZ2RGxjRDYwN2kxVTZKcks3dkx1M20zWXlaMXgxemo5dWMra0xDSFpP?=
 =?utf-8?B?WUMxcTkrSDdDczg5VXBLQWV3bXoxMDV5WWtSeGM0NWRaNHJhYW9oVENPYWVw?=
 =?utf-8?B?QWRtN3RiNGhXY2VWTEZHNytSUFVpcFFPN3BOWTJxVCtBdkN6SVRSalZhaTJ3?=
 =?utf-8?B?bGhIdDJKbVR2ajVQUVQ1RTM1NDNBTSs1VlpMNUROdjBQRmZDWk1jWnIyWFRZ?=
 =?utf-8?B?aXQxTFFQRDMvdEs2Z0dUK25HOW1aQnBwaWJlRlQ1NC9CS1IwQkJzeFRyWENL?=
 =?utf-8?B?UzRaQy9jcS9uMnpjU0hlZ3dYSWpWWFFSSHZvUU16UlpHcjhFMHVXdUVybXZH?=
 =?utf-8?B?YmZ0ZUhMVTNoT000SVY3ei9TS2JiUm1HVkU2U1l2UUVBejFGWGRNQlZjZkUv?=
 =?utf-8?B?QnZUdUFnYTJQOWc4YjhHT0ZlSnBmV1hmck4vaTMwTThVT3drQXZHZWRkZ00r?=
 =?utf-8?B?QW0yM0RHV0JyU3dKdzU1Tjk0WWhqVW5RNWlsUVZlVWp5bnVsV2pSY3hvS3dz?=
 =?utf-8?B?UWRsZlVBUU00ejdhZkx3TFlvSUd3Tmxlb2gvUThZTEdpQU1uVkt5czNqaGNF?=
 =?utf-8?B?S0tHNnZpbW1qZzZ6LytabW9JYjgwTjZNOFlPU2I1dzErRE90Tm5idlVDdENm?=
 =?utf-8?B?S240aFRmNE5LOG5NcmJhOTBDbnh6dnc2aUZOQkt0bGlKZjc0dDNkRkVQTmZ0?=
 =?utf-8?B?K1Q5aTlrV0Q3VXZPVGNQQkl2UktYa1FYeWZZM3AvclA4QTExWk9oZExTOGxQ?=
 =?utf-8?B?STRhZW5mUi9BNmlRQU5ERVE4RUtnbk9NWE9xcmtjcVFIRzhZanZNSk9GQURI?=
 =?utf-8?B?VktiYzh3eFBldHJTZHlHQUMvMC9qajNVWDZXWXo4TFo1LzdrUkRqSm5kQ1FU?=
 =?utf-8?B?V2k0UUp5KzV3OGJJY2UxUzFsVkdCc0tObGltWDZ6TXpqdFdZeVBmNDVHaHla?=
 =?utf-8?B?S1dIMEtDQmVUNVgvM2sxcXlxaC9GVlNqa255WEtKdDBBY2NJbFAvWFB4M1Nv?=
 =?utf-8?B?eC9tczNhUGpGdCtjdE5kalFJdE5CMzArSSswL1AyWUI1YlNvbjE0K2hESndq?=
 =?utf-8?B?WE9YUkViM2FUemxlN3BLVU5Ya3AvQ0t4d2hYWTQ0eFNWRVdVaXVuT1MwNUlO?=
 =?utf-8?B?VVhvaDltMEVrNTcxdEFNM25PeVRIbCtpT1RQWXJLbnczbmUwK291elZHalFw?=
 =?utf-8?B?UDBSWEd3VFJ4TTUwcWhwY0pZdyt0ZWl0djJubE5lZ08vdjlOd09IbmljWWRI?=
 =?utf-8?B?eE50WStkcVc2K0JkNjdzMU5ETElTdHlNYjFwWENwK0dRUmovQ3F2UFQ1OCtu?=
 =?utf-8?Q?OtTcJGuN3GdknWoIzv1C?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-c9a3c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: af458d71-3144-4f84-b3d3-08ddded1f8ec
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:39:16.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203932_113419_A9978542 
X-CRM114-Status: UNSURE (   9.83  )
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
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/include/uapi/asm/kvm.h |  1 +
>   arch/riscv/kvm/vcpu_onereg.c      | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
