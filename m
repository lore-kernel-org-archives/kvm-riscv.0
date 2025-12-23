Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186B6E6B25F
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzLIsE4okHqAEv8h8jtj19HoPbCkAKsUK375oECkxXA=; b=15ciiF21Dqk0wHjJzOB2ji/7Y2
	j7XXE5cRpHi9cDU+2BXExdHQmpp0Sa/BX3yYimkrzxke5hT/X3DDbpyropruTy4iPdEhOrZKcLZJU
	vIQDrnkuuC8vRxNEqvHoWYlZzzHDyALoUCrp1lKnxWDaf5mlx8htkoxGMUQ2pigLPtAS5U/ngalAo
	PFNQXhgrm37OFbtknI6bgNMGygyJRIgLDymSusugKEjqPD3mzT3xKhEPQtzlkApgKY1VQsbHzc9Zl
	0FlvXVWaimkPvPIsiXSCC1tdazozKIdClZliSj94G2hxxeR3aZrugFeUSj/2L0NVbtArjXGO+L2f7
	OG9zCLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvgs-0000000EaQi-1yOx;
	Tue, 23 Dec 2025 06:16:14 +0000
Received: from mail-japaneastazolkn19012063.outbound.protection.outlook.com ([52.103.43.63] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvgp-0000000EaQ9-0fgQ;
	Tue, 23 Dec 2025 06:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdz2U5bVqb6qkQCccYbcjbFYluqC/9GcrQ1uUaQvi37TkoNnsCRULvdiz9VDZ2YbiIOPuw+rt/PTw0GpVbYKaC2pDUQFbf8oJXdFt8vBzXmvUAcMU94FU7zIwfn/ecNJUTjYW89X0rhgIQYfvXu9H46MSUgiJc2t0UT7etV97eQn2MjOsGuHTxu5JZPl8GefnCW4Ueg1iS5eKSL52bkgH+vKrx+xBHmgBu5c2Fm945tZPnRPkf5O4ME566MbZ2lK9EnFAxfkn6/Gf3pKbAehdxCcHBwzyxhVKOpX+Si3M5eri3AIDbZFuFCTgAlCH42hbIo73k6kB+cFqrLhNclBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck6UUtyRDP7kDPqtXSPlPLXHS+yDthvGbdy8KKe/ffg=;
 b=Ef0SnWz5XNS2L8A5Ur8kc+D5AzrouLXypk8sgQ0AjBTZXZf54f0uKRanu8ueMMuMqUUatKteIKtb2Xikv8Z0tcwHzCmxu+aSnSjzIR/WL20sckJ7R9veQ15sNiO1+y0A78hPixrgVf1f1jmDpPTk0V//v7J7u5GTo6xG83u4rvYZ018seGa7xoZZWiiB6n7a2c3S+7ax5ayNV73fNuLXZ8b3DoH9F7WzLV/Qf9oV6sWLcelgnfUXfHkwt3p0iVKfQiQm8lBmCFwlCwsIv6erFAj/Ag28ez5LxfNJ8PjtWJdVziQkQ4F4SSLJb4ySwUySvl3PfD2kR9rj6Dj1BNqmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck6UUtyRDP7kDPqtXSPlPLXHS+yDthvGbdy8KKe/ffg=;
 b=K9GmrKFtLWNW0/ALb+TsEefLqXQO5fQ5742+FJLKtz1HT9EouFFFoRJHXhIR3T40J1RR6nb+8ExNfxO/SJIEFEzgbk3nuNdXyuNwsvNrkfYLvIOwhwQGqFhqVK8modq5mmG/N1N6wQ4XBDetqgJJeMNFplZW4HgVODo1MzqZzwSlY+HFBuxZaOf3iRp3hPn0IZdTn3sDn7cQMgA3+6edprBWlRPHvJ97fm/9hBio6Y9a82Lkvf8OgFB985plnYl6Gex4IQwpEtiKNvCSD9bfTVjSQ+YmJJw6caJWQfBPeWEXxNnj30xI6LcGXZWKRDBNJ+iw+QHfUBhAROsnlctipA==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 06:15:56 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:15:54 +0000
Message-ID: <KUZPR04MB9265AF1883CAE0BDDB8A204DF3B5A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Tue, 23 Dec 2025 14:15:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251222093718.26223-1-luxu.kernel@bytedance.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20251222093718.26223-1-luxu.kernel@bytedance.com>
X-ClientProxiedBy: TP0P295CA0017.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::11) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <2ca031a5-23a1-40a9-b2d6-fdba5f790966@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 891c6185-c9c8-4bae-9726-08de41eaba8a
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|7042599007|23021999003|461199028|15080799012|5072599009|6090799003|51005399006|41001999006|8060799015|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnlXTnk1UGlLY2t3VVdCTVVKeTJSTVFWSkx0bUkyS3lwcnlqUFZBTHZPY3Nt?=
 =?utf-8?B?eUphcHNUUVZBVGhnMEROemtDenBEZGlXaWZmVG44bmwraFJxakZaSUcvanJl?=
 =?utf-8?B?VjdRS09RVjNKRlhaWHhFMzJNNFFmYXZYb3Q3bm5HR3UxY0J3NlNRVGdpdEh4?=
 =?utf-8?B?dWhUcHpEZngzQVlGQysyRXIyM2pDNVRrY0dTNzkxVk1zblVRNEg2WDJMeUlz?=
 =?utf-8?B?RlVXdVlKVjhkLzJaL3ZZNHpBYmtzNWNLMFFZcW00SEpUVERmTS9oVTA2NFdw?=
 =?utf-8?B?QmFiblJqR1c2K0FIN1hZQ2lpZ0ZRdi9OMVlXU2tUUmdqWTU1VzY3Rk4rU1NP?=
 =?utf-8?B?RllBUjhNUmhQZ2d5VjRRY2hCTlNhTU1pSlN4ZWV0d2hXRVIvQ2h5SE84M054?=
 =?utf-8?B?WUNFWDB6OW5qcXA0dVpUQ2FJRHIyU1hPU0FEWGtZVXJaWDBTdFkxd2FVWUlV?=
 =?utf-8?B?SWRwcU9CbjNIYmkzbHZEQnBudHRwM0JBbFBoWW1KOXRlQ0tHbko1blR2Wkpl?=
 =?utf-8?B?Q1RIcGlieWd5b1FVSUxqV0UvSDZlZ05qUnljeEpVSUJZVndjR3phRkxYM2E4?=
 =?utf-8?B?K2RXRWtlRUExWktySXdXZzVmdzJBYytOWS9mbWNPVzFyK2Fscm82RUVkYlpS?=
 =?utf-8?B?eUdZSnFhZnM1azRyRkNuSkpQb09BUGlwNSsxN2JrK0Q3VGhsTkh3N1pzRmJt?=
 =?utf-8?B?REtsK0N3cTN3UldjVjJraDF3UUVTYjJpSThkdURtT21oSWdzZk80ZlArUklS?=
 =?utf-8?B?WnlFL20zVTBmUTdURndRNGZyNkhadUNZM2MreEI0V1lIdDJqdGlDY3JFODdM?=
 =?utf-8?B?NytSbFhtYXdQTFV4aFZGS0ZFL1hId0tEODYrODdWNXhPaC9EWjhVcmRLclYx?=
 =?utf-8?B?cEFiamNyZE9TT2VXS0V5bjVTSEdZKzF3L2ZUMkdKUCtZZWoyYUlqU1RnVGc3?=
 =?utf-8?B?N1RhMWV6RFUzS2R0aXBKR1BxWjRwTzVoM2dKcCtUcGN2enFKbXdITk1tZXo2?=
 =?utf-8?B?bGpYb2dpdi9aMXNsRnVyS01FYTNiMGx3VjBva3E1eUc2TVJlV2htNXJRMGlU?=
 =?utf-8?B?RUsvR1lUK3NrRW9PbEVhUGxzeXFva3BEYUpldFdSNHZYZW41S0UvWS8wVGRN?=
 =?utf-8?B?d1pVdVZhemVqYW5WSURCK3N3NisrN3FNaDQ0TGVVTXQzS2kzOElGVWFyTUJt?=
 =?utf-8?B?QWRjWHVZNk9tNWV2dEc1MjMzYnpwRjdCSnF6bEkrRURlcS9LMkhKaDV3Vzd3?=
 =?utf-8?B?VVlWL0dRUFRxMmFjeXJCaXBHV01pM0dTZWVQNzY5UmZxZm9nRXJObjJHTFQ3?=
 =?utf-8?B?cU8vZkpWUmhhYWZzL3RIZ0ZpdGpGQi8wd0FpZjcyWGh3VDBpNUZTSUk2SWlW?=
 =?utf-8?B?NWpucUl3aGlkcGxka2lIMldkMEhSSDNmbHArRFhzMWxXbzNBTE01RjJYYi8w?=
 =?utf-8?B?SForZFdLNTRSV1d2TjlaY1d2Znl1MFU5MVQ3akhXWTRTTlJqLzk5SFkzd0gx?=
 =?utf-8?B?YzRVVk1lUDNOc3kzWmd5TktxMElIckRjbTZVSFJzSHVQVHFoS3Qyb3hiS0sv?=
 =?utf-8?B?cWpKN0d3R2RMbnFOKzQ4OWhIMFpBYS9rMHN6cC9VQ1hkU0xvTHBVQXRvam9S?=
 =?utf-8?B?Q2FicTV5VVBRV2pmVXNWa3p0c2MrYjdmdFlaalJqUWlJbExWTHVsQWdoZzFk?=
 =?utf-8?B?WXI4R1NwZWl5SGFnei9UZElCYzFRZEgza3JuMTU3RG5JV2ZheXhZckVnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVnc01PZXk4MUpOM1h1Z2NEMkh3UDZua013TEFQM0x5eUZrQS91eWxoa3Bj?=
 =?utf-8?B?TnBXaEMxNkJpQ3VKTmNnLzNSalh2ZG93SW1qamFmcXVNbEh1UTB4bk5GdFpH?=
 =?utf-8?B?K3pNbFFWTGNYdHZWS254bFE1cWRNdm1YaE42VFpIaDBsbDJvblZHVE1Pek0z?=
 =?utf-8?B?dmFNbDlPb2ZmR010YUxPam1vbE5WTmFoUlBUOHB1cG44K0NCSjhKUXNLdDl5?=
 =?utf-8?B?T0RVNyttaTBwKzM1QlVKOEFDb09iTHdYK1pYY2FESUk0TnlleU5MVWVId3gy?=
 =?utf-8?B?WVFzSk45M3dtUk9HZWhVNSsyMWxVK1U0dGJTd25jU1FZR1FuOVJycHlFcnVM?=
 =?utf-8?B?aHF6cllhMG15ZDVheWtlMGFIRnd4SW5GbmVvK2IycVdGRmVqbGR4dlZlVUJW?=
 =?utf-8?B?VE81TVFUQm1KV0pWOTdJMVNyd1ZCYUFCT0EyVnhMSnBIK1ZpSGszZDZId2pN?=
 =?utf-8?B?SjhLQmdwazdTVXF4YlpoRkVoV0VtNUgrYkVTMGhmeHZwVkt5Wm5vK3haWlBt?=
 =?utf-8?B?TGk1a1JFQTEwc20rd3hrNHAvemlpSjFOVThySlZPTnhobjVTdjJ5L0NmK29i?=
 =?utf-8?B?TDVJTktjTkFjMjFLeFpGRUZCMGJkcXVHbmJZM2M5czc3WEFjcEppQ2trWmtZ?=
 =?utf-8?B?M3NVSkJDbWFLeGtFVk9kNGNjd0ZRUWJSdWtQTDZvZkhTbWJLRFZIV3VhOHJ2?=
 =?utf-8?B?N2tSN1hCMys4YnREdVBnWW9Pd0N0bmpCYkQveW9ybzYwSkwrcmRldm1TeitY?=
 =?utf-8?B?dkowWDBCZEdTYVcwVGRLRmJUaVBNM2lXYzE1bUZhbHQ3T0dtb1o2azBpTGF1?=
 =?utf-8?B?bzVSclU5dVFJczMrTitOajlpb0F2Q0d2YStQQ3owa3pPejJOTll6Y2lVQ2pn?=
 =?utf-8?B?cVY0QUxxcnl2VUdjamRsOFJ0RHgvYi8xbTI0VXlTVW5pQitjSmJPZHkxT3kr?=
 =?utf-8?B?ckZIRG5hSXl0QXhDNVo0UTRNOHI0cFhqOE95UmlaMFhwN1pzM1orRzFpTnZw?=
 =?utf-8?B?QWZ1d1pvM3NGS3ZBbTQ0Zkw1bWU5QU1HQTBIa2VoY3c3djZoNGRLcFJBT1Jk?=
 =?utf-8?B?bkNvQ3FoUUREUWxEc29UMGgrSEJWeHhhaEd1NzZJZVYvcWZlSlI3T3JuaDcy?=
 =?utf-8?B?bVRBbWIybHJOSUdFdmFHSGxBREszZVkxYVNabGFFOWNzcWl0WmFJSXVQTFdy?=
 =?utf-8?B?WGwxNzk0VFI3WTNtdFhVRTBRK1BEYWQ4QVdUcFIyaXUxNUp5SkliTGN3Vldy?=
 =?utf-8?B?Q2k0VlNZZjBnSG9xbzdvOGdtaEZVek92YUc1Q3liRW1UNXNKNzZ0Q0x3eFJj?=
 =?utf-8?B?alhFSy9aeXMvcE9iSmRKeGxzQVZtTllFZjJXdlRQd0hIcC85YTVMckJaYkYz?=
 =?utf-8?B?L2VtUFRwTjhHN252aWZXMUdDTFNsUHlRZHQ3VVgvVGk0YW5JM3RMWVZBVDJx?=
 =?utf-8?B?N2hLVTJ2M1ptZm03R3RvM2ZIVVJSZUw3YVlmWHVGTXVkYXJBb3g1R2Q1Vkx4?=
 =?utf-8?B?TlRtaEJTSVdDSG84WEpQY1pyS3c4TExrTjdLUWgwTmg2eW55SUVpbmlPSVp0?=
 =?utf-8?B?R2lqOS9Nd3RKZ2xTaFNPM0ZBaHhpQmEveWczMmhRN1c5QkZCQjhMOVM5Ymtr?=
 =?utf-8?B?dko3OWwyU3kvNUN0UVNsdEZDSXMyZWkzRUtKcS8wYmVwRXFPTnJiWSswemdl?=
 =?utf-8?B?ZE1vN3pVUVgvV3UwTXQyVzhjVUkvbDVJMXFsd0I1TENNeTNKSWtnWk1iUE5J?=
 =?utf-8?B?NU92ZVNWZkRnNFNvQ2d4eWhpV1lBYjliRkVVM3lNS0lRNUZtZkhJWGovQVdj?=
 =?utf-8?B?ZzZVUUY3U055MTFwTnRpOURpb2FkUHg5S2N6czBZRURSN1krSmNUWkN0MHc2?=
 =?utf-8?Q?1pVyknfFQBS8x?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-515b2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 891c6185-c9c8-4bae-9726-08de41eaba8a
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 06:15:54.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR04MB9265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_221611_220432_83B8C4AE 
X-CRM114-Status: GOOD (  21.76  )
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


On 12/22/2025 5:37 PM, Xu Lu wrote:
> Currently, KVM assumes the minimum of implemented HGEIE bits and
> "BIT(gc->guest_index_bits) - 1" as the number of guest files available
> across all CPUs. This will not work when CPUs have different number
> of guest files because KVM may incorrectly allocate a guest file on a CPU
> with fewer guest files.
>
> To address above, during initialization, we calculate the number of
> available guest interrupt files according to MMIO resources and constrain
> the number of guest interrupt files that can be allocated by KVM.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>   arch/riscv/kvm/aia.c                    |  2 +-
>   drivers/irqchip/irq-riscv-imsic-state.c | 12 +++++++++++-
>   include/linux/irqchip/riscv-imsic.h     |  3 +++
>   3 files changed, 15 insertions(+), 2 deletions(-)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index dad3181856600..cac3c2b51d724 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
>   	 */
>   	if (gc)
>   		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
> -					    BIT(gc->guest_index_bits) - 1);
> +					    gc->nr_guest_files);
>   	else
>   		kvm_riscv_aia_nr_hgei = 0;
>   
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
> index dc95ad856d80a..cccca38983577 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -794,7 +794,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
>   
>   int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
>   {
> -	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
> +	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
>   	struct imsic_global_config *global;
>   	struct imsic_local_config *local;
>   	void __iomem **mmios_va = NULL;
> @@ -888,6 +888,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
>   	}
>   
>   	/* Configure handlers for target CPUs */
> +	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
>   	for (i = 0; i < nr_parent_irqs; i++) {
>   		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
>   		if (rc) {
> @@ -928,6 +929,15 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
>   		local->msi_pa = mmios[index].start + reloff;
>   		local->msi_va = mmios_va[index] + reloff;
>   
> +		/*
> +		 * KVM uses global->nr_guest_files to determine the available guest
> +		 * interrupt files on each CPU. Take the minimum number of guest
> +		 * interrupt files across all CPUs to avoid KVM incorrectly allocatling
> +		 * an unexisted or unmapped guest interrupt file on some CPUs.
> +		 */
> +		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
> +		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
> +
>   		nr_handlers++;
>   	}
>   
> diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
> index 7494952c55187..43aed52385008 100644
> --- a/include/linux/irqchip/riscv-imsic.h
> +++ b/include/linux/irqchip/riscv-imsic.h
> @@ -69,6 +69,9 @@ struct imsic_global_config {
>   	/* Number of guest interrupt identities */
>   	u32					nr_guest_ids;
>   
> +	/* Number of guest interrupt files per core */
> +	u32					nr_guest_files;
> +
>   	/* Per-CPU IMSIC addresses */
>   	struct imsic_local_config __percpu	*local;
>   };

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
