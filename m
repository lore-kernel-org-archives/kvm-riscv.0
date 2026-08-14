Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F8C5CFC1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9hYSUm6cuTibUYj0H5LxCjHryK8WhLJ0l889+5BrYA=; b=ZZAyBQ+dIget/Deo31PGh+Uom5
	XdMno9k9r2VBYrwSjM+9j4wRlCmfF2J/wWaSvs1v4tKwG/IJgXrBrRogGgwPDUbwZ0gyObfFu1kTg
	ciYs0PY0jpx56XIuaQv9DUJ1/hirXE0GyoGPi7VQs3j6VwW29HOQGODLyCJgXbVvkqFxkjRpDizQz
	+3MjICNbW/6j4STLMpCilCTF55aLxK+Kj4AYpSDU5wkm7CvN7DOLCu1aRbEDd6TVsTNvqYUTINaYl
	2taPl88J8FMm/nqhWOnRw3FO8WkjmxxPve1X5dEgQ4lm/w5xUqUlmJfvu4gNhhye55sGKW8Vf5EwH
	lcrXmSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuixv-00000001uyy-168a;
	Fri, 14 Aug 2026 03:52:19 +0000
Received: from mail-japaneastazolkn19012052.outbound.protection.outlook.com ([52.103.43.52] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuixs-00000001uyZ-3GpP;
	Fri, 14 Aug 2026 03:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YErnnAIGEOrLITwRCjR+TA7Llzzk7S3cL8MDmIwN4fdsQ/cxhZGEndHhiONEXt+MWRJ1IIMn2sAtJvfXGjchYyDzHts6QU+sabUlQzUiA4rDMRa69ZNnah77/AtFZfDJuQulP9tvBnqUjxMoxZ49l7Moh0/v9fdYC4D9+7rWp8H5CpafIG1oyhtUvvsT4vqaqP8yM7S8ZwAVcQiihRKJNfDrrpHAGkvYLp1NCYXmyjaKd8FBCWI5gXp0goN/IWMDewPSdH9QygbJ5iRJzBU2oSjF9UqsmsugGApu9B9TtLOATBdD8ti4PhSY4Qk1+YyyEMzFPSF1Hpx7l4KczWclrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVRUAjlVvNXZlUtYm7hGdxihJL4RdMCTJzPawVls514=;
 b=SL3DqNU9QFi4w1ugIJ9HIs8ZuEgZ7jsufOfKd++o37IHYHkzvN2C0a9/96DIHvw1+yNAU8Ip16CKNzx1Jg76kz7XNkSaGVSW2qo4eqieYHLBdhWe23t7oGAKvqZi2raypfyqLNOGsPijeeugZuSppBQ6+gJtejU9wsRfSj9teyeX8VZ9IOapK26xkLNuT7KXq8Ke4JfhNVjE37KKe7Y+kCIafs3e8talgR3wS3TfGt/z9m1/CE144q1QOpfRcqvHZnSFWIIiTGblwakMpnNSeiaFjr2lP2EetOezIm2l3Fq9NaQQCMNP+KnAznjF7oABOI0+C5O3sBAjJH0SHPnAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVRUAjlVvNXZlUtYm7hGdxihJL4RdMCTJzPawVls514=;
 b=F/wZwa/mmunRNhV0yqQqnPjDIxCeVKXqQ7GE1VXStdRgfuGhFeJaxk0O1L6ES9hjAlNZBz4txUlNwPY11FyaTW4YZ+zS5zSWU7RVgMENey8xpl5nSiGqIEgnZEZsEEF9oQEfefu12LlVaik1cgQbnSvXNJXdPBdnss11Tzfc3KXSKe8QTBOvqelPIzNC4mXQihesOqDQ19gSq4cVblNjunvqzRJ2tIwp8yDPwLiw30ozQgP5D/MHo5k7utZdd7AGXXaUY9EPoyJxEJCbYT2i+NdiolEEq/k1TupAAI+2EbHZOTjAYiGeddJq/lo/x4re2L1QOzJHOMNtiur+yr8v5A==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by KL1PR04MB7466.apcprd04.prod.outlook.com (2603:1096:820:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 03:51:46 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%5]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 03:51:46 +0000
Message-ID: <SE3PR04MB89228527CBE8BC6CAE525B07F3DA2@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Fri, 14 Aug 2026 11:51:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] KVM: selftests: Enable pre_fault_memory_test for
 RISC-V
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <pjw@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Jinyu Tang <tjytimi@163.com>
References: <20260811230316.218770-1-jinyu.tang@linux.dev>
 <20260811230316.218770-4-jinyu.tang@linux.dev>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260811230316.218770-4-jinyu.tang@linux.dev>
X-ClientProxiedBy: TP0P295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::19) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <5cfb857d-3ce0-4a2f-a9b1-83e25dcf3d75@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|KL1PR04MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c93703-eeb4-48da-112c-08def9b75c66
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|25010399006|16041099003|19101099003|23021999003|5072599009|4140399003|8060799015|15080799012|6090799003|24121999003|22091999003|53005399003|40105399003|41105399003|26121999007|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qnl0WE1rOFVheXg5U0l1ZXJ2eWM1eDcyZCtNSlBoTzdkMzZhUncyakxGQ05I?=
 =?utf-8?B?cDcwcWlsc1BjMTdVNlI1azZIRzJTZW95RkNxSjZ5aW40MmJ6a1YxRk9ob0Zh?=
 =?utf-8?B?eVFzNlk1eWlXVzRnVmFDMCtPMlgxL2t2Sk5YWWhlZFYySUtpQm9ubDBac2Vt?=
 =?utf-8?B?ZWFXbEZ0aEtwRXd0L1hXb2srSmxYdFVGaVFyMmtpVnppdStPWUw3cnNLbnQ5?=
 =?utf-8?B?VmNJZ1k1R283azZoZ3NNcFVZZm9HN0Y3blVyZE11bFlPYWRyWGZ0cGV6QjdZ?=
 =?utf-8?B?UThWZGdoR2JnY3o5SW1EcFY2MHNZc2xPTWxibUFxQ3NhV1hEb2FWbTEyZlZn?=
 =?utf-8?B?R1l1Y0NIOHlyZWR4Z3lBM1Rvd2VuOGFiRnR5c1VNdG51RWdINHZXZU1FMVcy?=
 =?utf-8?B?WlhRWUFQTCt5ZnRCUTFTS2ovYkRQY3dpbUdHNGdnTkhCb0VvZFl2YzBHNmt2?=
 =?utf-8?B?OEpsTDc0c3NvQkxSZ2RvQVNjRHlSU0IyWWhkb0lhWmRxT2doTFQyME44VEhr?=
 =?utf-8?B?WE4vQXBodG02MFNyNm9PamQ1OVZmWkxoblZmMXo4WjluN3Iyd0hoR2kyWEQ1?=
 =?utf-8?B?V0hWempheS9wN1I1dU1ZV0FYdENEMjg3NDhWbzJ4V2FwNGNTUHlvQXN0YmUr?=
 =?utf-8?B?cC9DV1RkcTFVQ240eWk2dFV6b0NRYnlWYUw5clJCWnpOTUNTN1ZlSUovQi9P?=
 =?utf-8?B?UVFuOXJKNXRORlBNN1ZIZGdxdVFmZEtkdzBoa2tqZ01aSEw5MkNkb1BaNGVL?=
 =?utf-8?B?VXEwb0ZnTWJWKzMzWXl2OUVSaHh1ZjF1UHlHNXFnRHB5alhLdFpkd1lTbzVW?=
 =?utf-8?B?S05INEY1empVZjlYUm9jeVR3RmNVTFBGMEhPRXpnOXgrRVpmYzRXbnRnUzVh?=
 =?utf-8?B?RTl3T3o5eVNvRWNTYWtQTFR0UXFkbFhCUEVYNWx4MVUwTkZkSzF0bC8yTm01?=
 =?utf-8?B?TjV4NmoyU1BoVlkya3JIU0dFNWR0K3hXS2pUazZoVXR1ZUR0d25lbHBTeUV6?=
 =?utf-8?B?MFV2Q25jNFprWlQ3Q1FkSUV0Q1RDTUJVYWtGSUJqSVJHRGlBaG01aXJJdHd5?=
 =?utf-8?B?YlBWcDA1ZXp1OUR1ZkNyelU4UjFvSXo3bkVzY05jY2F5cTNSK1JhT2lERzJZ?=
 =?utf-8?B?Q0VSaFNJYzZEMjlJSElTdDNQMms2R1U4ZHdpS056Zzlvb245UW5WMllvZVpp?=
 =?utf-8?B?RFhSUXhTSnZiSFYvWjV0R0luWmhLYnI2NzkxeTRHbXRYZWkyOXVpMSt1UWdN?=
 =?utf-8?B?SE9jeWt3eXBNQW1VVGhESXAyVGhCN0NIYWF5ZlRMTGdzSFFpeHJma1NuM3dD?=
 =?utf-8?B?bEVHUVhQNlRwZVc5Nnk1NFh1Y2VpY2lZeWUzMTBNUlBwenhmRTBaSklpb0FY?=
 =?utf-8?B?d01XNmU1SEwrWDEydXlwT1p1bEtIdkRHaEQxQUZtdVBsWDc0RVFITkl3VXBu?=
 =?utf-8?B?SlFGd3plL1VnQ0w5UW9EeFE2aTdZWHlwWGZqUitiNmZMbXNtYTZyK01ZSHNt?=
 =?utf-8?Q?HzUacnnhz9Gt30MdFCB1YzLE4vI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTUwbTNVRXpvMGFvU3hmdFNFTzNrWmw0eU1zWHIvdUJudCt6cUFNcURVaCs3?=
 =?utf-8?B?MFJHRnpxZStTamVnYmhaKzg1d2ZSNEtFUHh1d2JvZ1c3SHA3SFM1dk5HaE55?=
 =?utf-8?B?YnlEMjZqbzgwbFdDdGo0NXgrS2hqZXoxSUJDY0ZyYWoyUUNWdEZlTG9uNVJM?=
 =?utf-8?B?aXNyQnZydGRJVHdNTTNWSWVSU3BOS2Q1ci9GVUJEM1gyRjhuUlNZUm40aXh3?=
 =?utf-8?B?YVBCSmZYV1VsQ05aLzJ2YVpJQXdmZXEvUU5wRDVsM3pQdHVURVRNZ0RmWDAw?=
 =?utf-8?B?MFZCTHVXNFhHa2VuUCtXdGNjMldNUTFEVWNaMUNBbGdORkttUStsY2JYY0Ix?=
 =?utf-8?B?TG8rbE9GLzRMK2ZZQTZBL0g5WExqZ1hQQWhxQTk3SjNvYURaMllCMVFjaHUx?=
 =?utf-8?B?Rml5NzBKVnIxalJRYXpMY3hLY3VkK0MvRDYwdHk5WG05YjRlZ0NQbExyb3F3?=
 =?utf-8?B?QXFaM3ZDNk1qWEpXaVRKUDdHQ2VkYVJKa1RUSVZoenFrbUNzTXY4SFZTbzRH?=
 =?utf-8?B?MWUwMGM1dCsrOURSbXNhZ1FrVmZGVWRsdjgydlJTU1Jod3l5d3Q5eXM4NjBN?=
 =?utf-8?B?Tk9aRDhLM2pZVkI0ZFlyMHMzeGtKNUpzaEpTUFdLUWJCU2tMU281ZHR1ZFNz?=
 =?utf-8?B?TjhkSUtqa3NVYzJIMnBRcm4vbnBCQzBNQkVXRVk4ZklpTWF5aituN3ozWFdo?=
 =?utf-8?B?UFl4YmFML1BnTHdWYmwxajF1a01NakxsTlBINzJXQ1gvT1A0Tjhab296RGo5?=
 =?utf-8?B?dzA4QXVGaDVYWURvTHduQ2JWV1lBSFNyMlRrd2xUbnAzUHovRnhPdlI5d3I4?=
 =?utf-8?B?ODN3RVdFdjFHNytYVG5va1NYdkVhc2tCM3RGQmFsTHp0SXFpNThGdXc5TEdu?=
 =?utf-8?B?Zldmbk1qTU90ZG9LZ0RVd05LbkJaUTFvWHVCdGVrWTh4Nmd4VFBJQTRHOU10?=
 =?utf-8?B?amhWR0JpWU8zb1pTQ1ZXa29ESVdyS1VwM2NYZCtxQlBmNXJBd0N4Z2czRDlF?=
 =?utf-8?B?bXVDSFBUQXpveDBIQ3BBU05vM3RGK3VpVTUzZlhKOEZmTitUZEU4dEgwYksz?=
 =?utf-8?B?amhZWFMycDZXTUlyWWtSTEFram1MdExhYlVwTmNzRlpxQndTMEJJQVQ2Wkk2?=
 =?utf-8?B?YXh2T2grRFlnUGUrdUdFMHlySm5pcTNNcm5kSXVCYThQdS9nVkt5R0puOUgv?=
 =?utf-8?B?UW10UnFib3pMSUczakUzNnFsL3FuQkNia214NFkyVFJPcmZmS2pYU1pPMjhT?=
 =?utf-8?B?bUlCbXRLc09XVzdCbXRyRnowdC96NGpiWERRZHNtS3Y0cGx3RU1zcEpRTDF5?=
 =?utf-8?B?czRDOCtYREpMWU9ZdnJwOTZ3NFYxOWl3b0c1R2Jsa28wQzJESUtRYnZRckUz?=
 =?utf-8?B?aG0rTFRQKytxM0MvRkF1RUVJVVF3SmJVLzgxQ3RqK3NDSm1UTjlINExnaHhH?=
 =?utf-8?B?VnVoM2VsTXk0bGlzbTRRRFRFRGYrZVFMRlBERjhkMGpobDlBZklYY0dFUFdN?=
 =?utf-8?B?QzFScmlTRWZFMWxwUnRJNXFMODNwc080WFJSNDFtNnZmeUh6alRFSHJTeFh5?=
 =?utf-8?B?NHoxcVlYdUhDS2N3ZFB6cFBiVkZXVlprd1Qvd2F0UzBMV2c3dkFuL2dxcWds?=
 =?utf-8?B?NWdLRWUveXNhVVZoYzdzZVUvWWtSczE3MFN4WWtGQlU5UTQ0VklrYTVlaWFN?=
 =?utf-8?B?aXVSaklyS0FONFI0U2p5d2xNdi9hbTNwREJic3lseE4zMHNKSE5haEJQQ05C?=
 =?utf-8?B?VXduRWlTSWo2NjZBMGFGcDZ3YmhHYUtQRTFrUWJVSEZzbEJxdW83dDU4RHBO?=
 =?utf-8?B?VFdUZUkvdHVRWkYvMHJBZEVXSkNVd282bXlvT1YzZEtuQXAzTjB4WDhOOGhn?=
 =?utf-8?Q?7wnlrvBWqSDzV?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c93703-eeb4-48da-112c-08def9b75c66
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:51:46.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_205216_844342_0AB89882 
X-CRM114-Status: GOOD (  12.64  )
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


On 8/12/2026 7:03 AM, Jinyu Tang wrote:
> RISC-V now supports KVM_PRE_FAULT_MEMORY, so include the generic
> pre_fault_memory_test in the RISC-V KVM selftest build.
>
> The test uses PAGE_SIZE from the architecture processor header. Define
> the normal 4K RISC-V selftest page size so the generic test can build
> for RISC-V.
>
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
> v1 -> v2:
> - Drop the per-test guest_modes_append_default() call from
>    pre_fault_memory_test.c.  RISC-V already initializes supported and
>    default guest modes from kvm_selftest_arch_init(), which is called by
>    the common kvm_selftest_init() constructor, as suggested by Sean.
>
>   tools/testing/selftests/kvm/Makefile.kvm              | 1 +
>   tools/testing/selftests/kvm/include/riscv/processor.h | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 6fc34e9bf8e1..ac64ac92fd4b 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -225,6 +225,7 @@ TEST_GEN_PROGS_riscv += coalesced_io_test
>   TEST_GEN_PROGS_riscv += dirty_log_perf_test
>   TEST_GEN_PROGS_riscv += get-reg-list
>   TEST_GEN_PROGS_riscv += mmu_stress_test
> +TEST_GEN_PROGS_riscv += pre_fault_memory_test
>   TEST_GEN_PROGS_riscv += rseq_test
>   TEST_GEN_PROGS_riscv += steal_time
>   
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index abde3c71c891..70487c8ed155 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -12,6 +12,9 @@
>   #include <asm/vdso/processor.h>
>   #include "kvm_util.h"
>   
> +#define PAGE_SHIFT		12
> +#define PAGE_SIZE		BIT_ULL(PAGE_SHIFT)
> +
>   #define INSN_OPCODE_MASK	0x007c
>   #define INSN_OPCODE_SHIFT	2
>   #define INSN_OPCODE_SYSTEM	28

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
