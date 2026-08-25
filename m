Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C047C61DB4
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8s70Azl1v9Bu8mOQnBOyMbWeMWrwZFN/XFfaZfiZtU=; b=vyOrHUbeK6xM5qxX033Cp3+mAu
	cBw95Hmg+n2OpDD2HVvsi/DWTPp7DyRI0lJbD3t9H/lUPFTjAzU9btknoXdSdDMmmex4Gmpa7wZv5
	2d+fcWSwaMutUX5u4K1ju+g9VRDQj6DuRkvD1YNyPOokUtK0VCk+VhkU54ZEtxRJn6439SJ0yZuTH
	rcR+64vBTpFBn3AayR23/wZiHC4h7QxZedqnWQHql//JTD/+DSqRUvk1jbwXo1Y4Kv10Tcjj4dLLH
	RI2touZsTVBsqKSGivX0vLBimewzM4p4j6AJ6yX2TnOt7hZI6dp74gzcwlq3BaEArlhLWpjQ7X5fT
	YeO7dP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynvm-00000000XgT-3Xiz;
	Tue, 25 Aug 2026 09:58:58 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynvk-00000000Xg0-2wCr;
	Tue, 25 Aug 2026 09:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD9B6uvEAH1IUEa4eF889nD8hUKntvUvo6bgR/sUL1rceUvESRoRz5W4Pa1ttlpZeo4I/1C+wv+ZAofuJUyYcv2ODP2ldS0CSNNsgFOiYErYQ11jrGDNl62+V8VcxhCaQ9842a4zia7mDqbYc2xCSrNKo94x+e7qyS9hMp134jfRZaD0oCjeGBfWNGfr0dFBmITLPgpfpUjDwWlu4i4Ra01oN5km703oKUm5Ao/o1NBlo0Hh6gkZTkT3adYQ9k3ohVAJRNo1aT9xDzqLcaouyjffAxBH5SQkxuPcfXgoSvmedYolsOmXcI8yKO7FUcPSuhrxkS+m1Q/iucvrw5eCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNMGe7K+HF94mPtfo/J6e4+2MTAZacJNYL6U7UP1zJQ=;
 b=w+0IOalABw2vy9RESqLXogh/oY8vPp+WtCvtTrfda43qjor4dJKkNOp2pxTYmdHeHDPzphE3+oSd05O53TxliZ0eex76ae4d1CbTVPzQ27KvHj13DJGVwC6kSuAlM6CkjjdxZz6X7J8UtiFKSi0dnN1r0b4fRDIw2dTb7R0ZWlyzDSdGNKp4v3I9J/o7W8hBH4gmljMEKvPYAo1ScShLpw0Kat+Wt43O2ylTwujaa6mHMU+8mcmm94HlJC4FtAZXhOspQuyDfei3/g+ZFYqsRes6rL+teVF6iR7mjd2ZIuwBnC/FcqwPtVAWjChrSXQDwC365tXv2d+xo9nFRDM09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNMGe7K+HF94mPtfo/J6e4+2MTAZacJNYL6U7UP1zJQ=;
 b=OMYIDHpKohNwYl0+SthQTsPOcq2gYV6S7bsWNZ6wQDCVvH1W5KJZ9BOZ3/2WoT/qVn6olOpkiPPLSJBQugv4QGZ74tCJUHv9Ol3J0whYFedtbcU14/SnqpDj9BJbCo2+cqlsYGBkzeTAqytId1felVLKzDSxggjNVGc8YGYGcK7BwRHbjPQT3ThhzQ7y0WlkwgmYstWpLsSyIFpkzSN+hGqMM6To5JQ25hSVk+d5w77M+QmXIZjfWn0VZA340nnB/6zkJyHNeESz7hgdJiG6NTcZEzl9/yBtMlllf72TvnIJPZ21z2Gs1V+7xfZBpnEUbrIuStkT9WjprpXMZgKcyg==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by TYZPR04MB7269.apcprd04.prod.outlook.com (2603:1096:400:45a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 09:58:42 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%5]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 09:58:41 +0000
Message-ID: <SE3PR04MB8922E6F977EB1EECF743061DF3AF2@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Tue, 25 Aug 2026 17:58:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: riscv: Avoid redundant interrupt check for pending
 timers
To: Jinyu Tang <jinyu.tang@linux.dev>, Anup Patel <anup@brainfault.org>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jinyu Tang <tjytimi@163.com>
References: <20260814123541.593613-1-jinyu.tang@linux.dev>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260814123541.593613-1-jinyu.tang@linux.dev>
X-ClientProxiedBy: TP0P295CA0059.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::12) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <6d882342-3f80-46a3-acd2-11104fd43296@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|TYZPR04MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: f601a071-cfcc-49a2-0636-08df028f711c
X-Microsoft-Antispam: BCL:0;ARA:14566002|19101099003|55001999006|15080799012|5072599009|6090799003|12121999013|19110799012|8060799015|41001999006|22091999003|23021999003|24121999003|4140399003|25010399006|52005399003|40105399003|26121999007|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzNwSGx6VjI1N3ZnTGJPVjVVQnRJNnJIMVY4bjNtR2tYaGtXVldUWVdyK1py?=
 =?utf-8?B?SE5PbUVqdGhHT3NiUTJRMjBvcUFNSVdxREJQMnVTZE14ZnlmK2xocDZwbW9m?=
 =?utf-8?B?ZTZYTVp5RmZIeWNvSHdJZGtIL21CTEJSek1XcWNFY2Q0bTMrNGVZeFhESkFC?=
 =?utf-8?B?MmoxeEJGc3BBTzhvOTRWNG9iT2ZmWUtvQ0hIL3Jaa1BpdXpWRW5hSDJ6N28z?=
 =?utf-8?B?d0x1Z2JrSGc0MTFKZkhzV3o5QUZJOFF6dFhsemIvN0VIM2ZDdm1WRExrU1Ur?=
 =?utf-8?B?ZWU1YnlwL3V6MjZFSXc0NHJqWkFTTkwzbGRtSFQycGgyKzBVVTdKVkZ6UVlx?=
 =?utf-8?B?UTFVdlE1c3BCYlNyZ2tUbWhRYVVLL3hoeHROTmFuQ2NnWHRZNFU2aE01Qlg3?=
 =?utf-8?B?RGIwLzBHWTRoMFMxRXcwRTlKVmlaSkc2QnBjajZLY3I2TVgxQ3hDeUxtMDh3?=
 =?utf-8?B?WnptYmNqUWtTTmtrSklGbmlaOEZtakhNU0pGVWxQL0dKd2hLS1BseWRaZEQ4?=
 =?utf-8?B?aE9CTWdGbFBnc25zZzdkd2FpVTNHS2QreXB1TDA0ek9zQ2JybFpqcWZOK0hE?=
 =?utf-8?B?bjFlc2VLa256VVNCWEhzOFV0VG4wZDAveWdVWXpPcmkwL3hseFkveERSWU9x?=
 =?utf-8?B?Vkk5bmMrUFgwZWtmRFdZSU9yTTdxNW14STVRMzljMmJ3WjdDaFZybS9jUDZK?=
 =?utf-8?B?TnRGbS81Unh3SGxja1BVOC9jZUN0RThHTUtDTGlOQnd6R29xRHBLUzMxNGtX?=
 =?utf-8?B?cWhQQUNLQTJBS3BZWDUwOTlkcEpGTUNFNXA5TG1GOGhrQUVVK1hxb1BPQk50?=
 =?utf-8?B?L0taU25HK25PQjBtMEJUZTQreWFVZzFIK2REY3lXZVNpTGR5bUd6dklzK29C?=
 =?utf-8?B?LzM4elJWc3ZMb1JTNkQwZG9Hc1pxeWJsV1lSR3BBREpCZ0pjZkhWdVczV2lK?=
 =?utf-8?B?RjJwMWRYOTZLRWNWN2RqaS9pOHRMWUFuVmI1QjB1NmlMQi8wbjFYVDVKendY?=
 =?utf-8?B?YXN6UGovZm9Yb2pRb3FQd0NtNitvZit0cDcySEZnemJnVUMwUEFHWENEMW8x?=
 =?utf-8?B?cGVnMGJOamZKOW1OTWhqNXJqMVpNSlVnczVuQmtONkpON3dzU05zNXRwc0Yv?=
 =?utf-8?B?Ylc5ZjdhSGNrOURkK3E3L09FcytMVjdZcGJnaGxvMHZOQWVocStGdmNwQWJz?=
 =?utf-8?B?Qit4SWRxMSs4b2ZleldsdXd3WWlXNCtVbitYUm84amhPM295Ty9FSytCaUNn?=
 =?utf-8?B?ekFZZzVhWmYzQmZkZGhrVGE2aVE2L2FpNjl0NkE3NU05TENlKzNTRnJ0cmhl?=
 =?utf-8?B?SSt4dXRMQm95MGRUbHVLeno1Zi9LY0pjYTlHRmFsVGJlM1MrQUcwQS9uZlNE?=
 =?utf-8?B?UEpzVFR6YVlPdkFoNzVWZUdiT3R6c3JRSWEvSUh5elkzTXZtOWtnLzEyTGYx?=
 =?utf-8?B?K25NQUthcDQvazNMQS96ejFLcHF6WTBiSWJyeDlYUk5WMTFlK25rUDJaamVT?=
 =?utf-8?B?WW9Lb0VqVUdBdzhGNGpMbzFiZGVjZXovbExCUERzMHhyRGhJTC9GVSt0eE9U?=
 =?utf-8?B?azF5UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWEvSjErS1ZQNTNXVERBcmVhRmFWMXVyQ00vZXQ0KzZlRDNNdkI1dUVBazRF?=
 =?utf-8?B?bkxrT3FjMTJqaDlsMmhVQ0NqM0JQaG1aSGJhVHgzMzJmQkxkQjU1MDlZWldZ?=
 =?utf-8?B?SUdMSWdUOFQwbm5qWVRua0UzYXZYZ1FUb2hwSjRML3hrYVRwaGNJaFlwSTZQ?=
 =?utf-8?B?RitEVDA4d0FmaXN3NXBwNW1PVDVMdjRVL2swUnFONFRWMHlNcC9QYi9DVGN5?=
 =?utf-8?B?UE9kbTU5OU02cCsrOUc1ekZjVlExR2FmQVBLWC9aUW5kUmpSbjh3SUg1WDVx?=
 =?utf-8?B?VXErRG13VXlwcFNpVittMjJ5THJHTlBZeUNnTDBvMzk1VEdleks0a0k4V0ow?=
 =?utf-8?B?dDlYQmdNdFF6QXlJWUdMVW5aMHdjTjFJalVGdld6emVzeHRKaXpxVmQycGNI?=
 =?utf-8?B?ZThqUDBhR2NZWHIvcmhmVlB6LzV6K2pyeGtJeGpvODE2eHFlNjQ0WlJBeGtv?=
 =?utf-8?B?dkxUN1FtT1Y3RWZORW9OTnNGRDRzNHJwMlAwNUJYRVhqVUtJSDlpcTA3ellO?=
 =?utf-8?B?WWhtbVBDZndPNGY4cVFYempjOXNsb2xvbHRKdHE2L3RNTGhJRm1CZUZsQ0xU?=
 =?utf-8?B?RWxBbU9aMGJHZmUwTWRyUWdNUzFGNTJOd3QvS3QyenpWbUE4MTExQkpmSDNk?=
 =?utf-8?B?bjdCTm9zQUl6a09DZlc3U1dqR1dCczJpMXo3aTFycTdLTFhvK2hvVjF3UDJF?=
 =?utf-8?B?NnVWNk80K1dJMHU5TTVyN2hpL054cUNLSFlLMmNDeVFUekZlR2E1V0IrZHNI?=
 =?utf-8?B?QWdWMUFQUitlQ1hVU094VWhZbVI3WlIvNVJ4Tko0bW9HbDNRVXdha2NGSXRt?=
 =?utf-8?B?d1RBZWI0aFZuOVhTb3JvVitCUUNiOWR4VlBIQnhCais2QkNwSjJWTm8vL1dN?=
 =?utf-8?B?V2l4Uk9XTFZMME92emc5Z1FLaGpsaTJUVmNGZ2h4VlpmT0hBdE5RTkNPWGI4?=
 =?utf-8?B?VlpiOG1DQ2JlbUt4eW5KR1RzV0YyaG1rUWkyS3VkM0FZcnAwdUUrdWNYd1BO?=
 =?utf-8?B?THVWZi9CQ2ZhSmhaNmxUVThUUitMalR3Q0Ztc2tIMHp6UGdBSDNMZmhFd2tK?=
 =?utf-8?B?VlhmaFNXT1ZzWUQwTjl3bXJHRDIzNmxPd3g5bjcwS0hpMkJya1FVelMzdW5x?=
 =?utf-8?B?MEJPUndObC83Rmc3SGdqQ2JXS1dvYmF1dVhKTkl0YzlLY0dpQnlvN2IxYlRa?=
 =?utf-8?B?OTV0MEdXWmVJVU1OZ1p3MVdZRzMrREpCR29YSzV1NjJ0OUl4SzUxQ0RabGE1?=
 =?utf-8?B?V1l0dDNjSWE5amJiNkdpcWR2OUYyaFhFWlU2amo4WDNRMGVkV252elI3ODc5?=
 =?utf-8?B?OXl3NGNsNGd3QXlXT0dOcjdtcThkbW1Ub1htamFReVFSc05TUWtkMmN5VWd0?=
 =?utf-8?B?QkRpN2NvNHlRNjBrZ2RVQ3huMDZta1M3RENMUHdJZGxmQ2ZyU25oSkpPMlgy?=
 =?utf-8?B?K2RhMDdOWXhuM3RJYkNlbCt5MGZmQ2dhU25mdHF4WUExR0VGWEZaUEhpMWxh?=
 =?utf-8?B?RGNsRXJib2pJZU1WTTJRbnNzSytaMllNY1M4Y0tJb0sxSUFvWXppVWZKdEVu?=
 =?utf-8?B?dTFhU1IwYlhBTFRpdmtYR0l3bjB6NG43V2lxa3o2eFdMNW4wVVUrWm9LQ0x4?=
 =?utf-8?B?NzdCR2VqakxBVDYvRWNlemJ5SEhWV2VFR0FSc1EzVGdnd1J3NWhzRklsQXZB?=
 =?utf-8?B?MjNYVnI3Z3hhK2ora1UzTW9JRnBjQ1NyRTlrRUJiWUFYS0RQWFMwMDFnYVlC?=
 =?utf-8?B?WlhWclZJV2piViszNHNwQ2czRzRlWXZ4YXlCWjE3SGZlOUFTUXBaSmNLOWVv?=
 =?utf-8?B?bjJRUDdaMzY0cWZYWm1DN1p5M2hzVElSM0VEd2VNR201ZkJuTnlZWnZWNm1N?=
 =?utf-8?Q?iQ+m4JjugAAPI?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f601a071-cfcc-49a2-0636-08df028f711c
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 09:58:41.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_025856_756450_E441CA6C 
X-CRM114-Status: GOOD (  12.60  )
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


On 8/14/2026 8:35 PM, Jinyu Tang wrote:
> kvm_vcpu_check_block() calls kvm_arch_vcpu_runnable() before
> checking whether a timer is pending. On RISC-V, kvm_arch_vcpu_runnable()
> already checks all pending guest interrupts through
> kvm_riscv_vcpu_has_interrupts(vcpu, -1UL), including IRQ_VS_TIMER.
>
> Drop the repeated IRQ_VS_TIMER pending-interrupt check from
> kvm_riscv_vcpu_timer_pending() and keep the helper focused on the timer
> deadline state. If the timer becomes pending after the runnable check,
> the timer path still injects IRQ_VS_TIMER and kicks the vCPU through the
> normal wakeup path.
>
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
>   arch/riscv/kvm/vcpu_timer.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ae53133c7ab0..0e01bd793772 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -132,11 +132,7 @@ bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
>   	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>   	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
>   
> -	if (!kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t) ||
> -	    kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
> -		return true;
> -	else
> -		return false;
> +	return !kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
>   }
>   
>   static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
