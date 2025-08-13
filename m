Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C39C87FCF
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4AHLvLGeTa+jrRZeUZm2RGozqjhtj6TA/avjuEtmN+c=; b=gXj1lICzdO89wH60bCNIeXCVkO
	TW4WFUnFCxXvDyT4WXPyh5nBkjznoAVqYadVw8C2nXhyqePR0oxE4TVE+ID0QlnG/kKqma55ibQw0
	0TD0I1rSUiMKWDJ2OoSllhqxwWzH2r52eASTHlVF+O9BjCz2lvigZlF2mqbvZLhbvc39Y6WgdA8o4
	sxiB6tAW2b8927Kmo/oS8vdiQcvpEE1ikNSMs2/hDdLW47dhEvlSClsHfXyhueU35E9EHVkWWFOKl
	6QOW7Vku2skIn5TwFUcOhw6TSMRSv24FhKESV6TSbSBETpRRRVdzgCoeCKjdRx6xmlkAyi/ZAyJY0
	ea2GDclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9IM-0000000DTKU-4AhG;
	Wed, 13 Aug 2025 11:05:26 +0000
Received: from mail-dm6nam11on20600.outbound.protection.outlook.com ([2a01:111:f403:2415::600] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Y2-0000000DM6Q-0hQ3;
	Wed, 13 Aug 2025 10:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGoRzAASV0eM/EamjpsQuwR14qYFcacTo2MZIMBN72Bnhdf5lAgrbdgGsmnllzikxzUfYI8eU5TMBz+61F3vQU8GXEjni6lXZ8EH3NLFwb/BfnRrG7e/jW29yZGa9dZQGQcxfVeh5qxH4FAxBMHhA5G31C5aciMXzwvjS4HkDKAjWO7rZj6aC1FiGU6bPivDcmcONuPEHIus+yS/9/WlQSjY7+2T9piWEGkHadTw2sC6Bm5yGyyXS7G8u+3tT+7fkaJKB+ARccqS9UAo8vtuYm6P+7vqqzKuoyqAENLZSW47j0FCD7XBbSFiGbzSjUSV1ifWjPR/HyqhpGpeNwXFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzGpOlpXRIkFsCOIiPzOGFQ317V6GzOJ+6eXpG9FBMU=;
 b=u3GF4keKks7E++zadl0XEn0u1TcTrXh9rzaQfnCNVVinnw7g4siMhcKL7CdfX73nV1P1ZVWInbUOoQvYf5BxJUjbdkPlrWwSraxOm4VDHUFx23xtSaXX7uRua/EJPWtqd90ZVXSyDWdGrESuBSPzvkM/49srXg/NZfgpjbIxzuSwyBBlqPDvI62hjLIfkuGeiBmPpqGt22L+65GG17CZ5n+vgiIpk6akFYslzzqAtZFgRiaadFCRhcLWlAoa+6J2ZHGxPIgiNcM4tX6Jz1P622J7l0XN8VVS9lLCbdgIBTwcNDjrOc6L89YqwEyHiWTLxBLljjqRrdqCwm2sNaLmPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzGpOlpXRIkFsCOIiPzOGFQ317V6GzOJ+6eXpG9FBMU=;
 b=WHHoWP3bTBcuziDtNfT2WEbJAu/EjjDdxbWnUmkoLNUj05GmhaQLUj+Q2m4yP2tMqc4XfTNTp7qxUlisnrTkL8S0ep2texw6V+VRHkXABsbN92NGfz2dzlFKxMiwUR+4KQsPNKxltPYtmf8Cw0IJ+sML8WmwJaEzC/MxZePq77w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5712.namprd12.prod.outlook.com (2603:10b6:510:1e3::13)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 10:01:54 +0000
Received: from PH7PR12MB5712.namprd12.prod.outlook.com
 ([fe80::2efc:dc9f:3ba8:3291]) by PH7PR12MB5712.namprd12.prod.outlook.com
 ([fe80::2efc:dc9f:3ba8:3291%4]) with mapi id 15.20.9009.021; Wed, 13 Aug 2025
 10:01:54 +0000
Message-ID: <affba07d-78e1-41f5-980b-d4df7fa66804@amd.com>
Date: Wed, 13 Aug 2025 15:31:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 33/44] KVM: x86/pmu: Bypass perf checks when emulating
 mediated PMU counter accesses
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-34-seanjc@google.com>
Content-Language: en-US
From: Sandipan Das <sandipan.das@amd.com>
In-Reply-To: <20250806195706.1650976-34-seanjc@google.com>
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To PH7PR12MB5712.namprd12.prod.outlook.com
 (2603:10b6:510:1e3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5712:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cb71f8-899f-468f-443b-08ddda506e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWFxVWRMWFZ0aUhDZnovaGtUTms1cGJIN0QraDJ5aDZsNUtRU3FzcUdwUDVl?=
 =?utf-8?B?ZUk4Tld5TFo5Yk5aclo0eGpHUDcxaWhoRjliK1NleUU3OTE1TE5ia2RUSXFU?=
 =?utf-8?B?WE8zMW1MYjJBZmQwaFZQVnVLUXFTL1BNbTRScjlJeXBWaEh5OFRtendPd3Bu?=
 =?utf-8?B?a2p1THNNY09VeGRQMmJMSXpPbVR0cHltYTlZUG02ZVBsbWlDTmlIcnNKYlp1?=
 =?utf-8?B?eTFucktTUjRkN05QSkZoOUxsZTBwZjN0S2ZEWXp0bFFPK3AyZG9oZ1FoVmpR?=
 =?utf-8?B?dTA0QStoTGhFejNlTzZRbVdXMmlCcGdvRkFReW5IUENVamR3S0RlWWU0SWls?=
 =?utf-8?B?NTBLNnhGcVRZZkV4amJiMW15K2tCM2YzVllGbGFvc3ZFbE43MFM2UmNjUU5n?=
 =?utf-8?B?R3VaSkFmcGxWSE9xazRhYy9PL3o0UnRFN3lHSUk4QjhlemFKZS9HZEVqcTdr?=
 =?utf-8?B?cWRNTDA4cFhmaG5hRHUxZ0d5TC9jMXNjSmtGRFMybmkzRVB5c1hTZEVyQkNv?=
 =?utf-8?B?a0JlQlkxTGZtQTNZY0s1UGJiYWt5K1VjbmVIY3Yva2cvUEpaY0lrOXBVbExq?=
 =?utf-8?B?OTdhTWtlcFhlejVhc1BuWTh4T21Mc1AyTHp2Zld4S2NOM2dOSWlBNDVLZHJT?=
 =?utf-8?B?ZjNQL0ZuOGdPeTJNSnRiejBlWmErTk9zOWpnaHFoeWI5cW55TEs4RTlncE1y?=
 =?utf-8?B?K05vUFVRam1EYk9zaVBPdGVlWTZxNWZlTHovNEdqaFZBbGt6djJjeTI1SWZi?=
 =?utf-8?B?MmZjQk85VHI1RndPNFpjcWh4SWc1b292Wm44b2NJczM3bllvU1c4Z0I0RFN6?=
 =?utf-8?B?TEQ0clhkcnNCYjhxbXFPbkF1NzJWcnNjYWZGcVlBbHo0ckF0dTNSOWZ3NEQ0?=
 =?utf-8?B?ckZFMjM4dFdSY1QvSkQySFRWenU4V1Nydkt6QjZkV200T2tIT0ZDZGI0UlhP?=
 =?utf-8?B?NStwZ2Vlcy9uY2g4Q3RkTkJwMzJqbE81TVRHZm8xMjVwQWtRcnhDS2NOLzQ5?=
 =?utf-8?B?MGsxOHV5MEYxRFloZmwyeWkwU1k2SHBtRnJ2UzdnQWQwZHZHc25COHgrRWJ2?=
 =?utf-8?B?eDdJbTJlRGpnTCtMRmtuUm5RRlYxa0FmOUtIN2NGSytLSnFoalFEeGJrWE9l?=
 =?utf-8?B?KzU3elp5Rm1teWM3OGU0THhSNWpnaVRSQVgwR1RqZFZCb0lWUXJTSGgxK2Nk?=
 =?utf-8?B?U2wwcGNvSE0vV1JYd3RVaGVDZ0pNS1JTZ25DSTI1QVlzaWhaL1BBRXNmbVNU?=
 =?utf-8?B?VGo1NGUwVG1SUEVKY1VpTlRDZEFtQi9tRTFXSjBaYjVPQ0c4SmxDaHordVhM?=
 =?utf-8?B?K2F6ODRoZ1NibGdmSUZZbGJIeDFpeWFOVi8xZElXcDZmZUFUb3VMbStFTFlV?=
 =?utf-8?B?d3VvaWtBYk9vWVo2ZTBDaXdMQ2Rwamd4Z3JhdHRIU28vNHdWUC9sa0lYeFdw?=
 =?utf-8?B?eTZxRDdQanFVb1kzTDM0K0JpRDJRT3dPaDJ0SlJMTnFSVFBMaDRMdnlaenRE?=
 =?utf-8?B?N3dxakFrVFNDY2VPUE51ZkdhY01MVWtxR2F0bVpLditzUkkyM3NTeVl0NmFi?=
 =?utf-8?B?TUx1aGZpbmMrTTRsSDl6NHh0M0dtTWpveGJhaEw2WEVoejlZN2JCekNDU2pG?=
 =?utf-8?B?VkpjZmt3aFVCZnFzU3lRTCtuaVJwcFF3aE44SStqaEQ0WlZQNGQ1TU43c0xB?=
 =?utf-8?B?STB3b3BFekw4QkY1ZGJ6YlRXL2FQRFM5N1FDMkRmTGpEMlZnMUppOGIrZ0ZF?=
 =?utf-8?B?RFlOazVjWWJjcG5XUm94Q1I3L3ByYy8yZDh3MkhRbThkdG0yb3kwZnR0Y3ly?=
 =?utf-8?B?THdiQzU4allIN092Z1dOc3Z1di9JdWdZeXBEWmxReUFKaEpvRkFMTjZQN1lw?=
 =?utf-8?B?N1IreitNbWhqZUswelFLeU1nNVFUMlZFaDhFaFgwY0I5SEczMUhmSlE1VHhM?=
 =?utf-8?B?Z1FlU2hHUldrbG9kc2NKaFFpSDFKakFhUWF1c055czRxYng3M2ZEVUJWMnVQ?=
 =?utf-8?B?VlhtVkRUTzN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5712.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2J0VTJJSUh3WmpTU25DTzhmMjM4SXJrcnpMM2RhcmtPeGZ1ZmpuQm5rTE9K?=
 =?utf-8?B?VURWTkJWRnlTdzJFUUMreXFoSndXRHJRMGFERURXVGVlZ2I2cDY0ZE81TVBI?=
 =?utf-8?B?R0JGM1A5OXk0T25MY2pORzhoR0VMOWxnUllRQ1RsUmRZYjFTNTR5aG96Yld5?=
 =?utf-8?B?MmxUUDZLVWZwOFI1Q1o2c01KOUZXMEVmWlVza0dPbkpJTG9UWkRiUWVBRGU5?=
 =?utf-8?B?OUgybCs5RTVoZ2MvYVFGdDFZQVVmbThKSHhuMWRzZm5Xc0tvRVl1MkcrUkt6?=
 =?utf-8?B?TkU2aXVnbERkTEVuSmFOd2ZTTlZKNkVjWkFNR0RrQ210MFRnZWxWTU4wU0RQ?=
 =?utf-8?B?SGJrMzY3eDBsVy9tVk11M3VJNUhQMDE2ZjFzbGVPdGpkNkVUYUJPN3V4b09W?=
 =?utf-8?B?Um1HSjY4dHh2Y1UvZzh2RWx5S2hlVGIwcVdIM2haMzRkT28zS2lQWHhYcEhT?=
 =?utf-8?B?Ymt3ZkVIdDFpNXRDaFI4R29xaVk1MzlzbzZmdFhZZVAxaGxScThOaFZudUhO?=
 =?utf-8?B?S3VETVc2OFAxSGFvelZlak9KOUQwVGJqRUFLcndSbFl0U1AvM0t0cFFVVEI1?=
 =?utf-8?B?b2Q4MktldUVEbGNEY05ZbGIvT05reXBBNEVseVprZzEzZlZ6M2JmRHJEKzB6?=
 =?utf-8?B?c0pHUmh1Nld1b0R2T1lrbzgwNHdGZm1iQTh2ekJocnRseVE1WWdjQndPN0lO?=
 =?utf-8?B?U0t0ay9wa2ZNVUt6UWxpS21LdEhaYjNuVy9RLytaR2tEYWZFN0VYTW1PajVR?=
 =?utf-8?B?V21VcVo0NUxxRlYyeENFS054WWQvVkpwQWJYcy9sOTJaVThFVHpkZWJYYkJI?=
 =?utf-8?B?YzFjbElYSkJGOG5rbFBzOHpKcHVBMzZXdzNXd25LK3pRNHNOam9zVjdNWWtD?=
 =?utf-8?B?WnJDTWFnM2xjcGZLS01QY05nVEo0aS9uV1N3NnBySlUxUW01aTkzcmhmTWJl?=
 =?utf-8?B?T2o5WkN4ekxKYjd3OEtqbk1MdVlTb24wY2JyMDNtQkpiUzhmdnE3MTBuaVcr?=
 =?utf-8?B?eWpNY2JoajJ5WjZKOCtJbEtFU2xscDNZYk5SYndNTjhHY3YxSVBUYm5hdUtu?=
 =?utf-8?B?TXFzY2N6YWFQT1lRTndoaXlMaFJxTysvbFR3Z1E0anlLOHc5Tm0zYS9ESGF5?=
 =?utf-8?B?WUNvNmI0WHFnc2Iydjhzckk5bVZoWklHdVM3NG9xMW5BallDU1JVRm11YzMr?=
 =?utf-8?B?STBhQ1R2S2ZpQkpZWjh6QVdiQnh1cDdYUDBSK2lkZ0dIR2xha3F2ZFNaS1ZV?=
 =?utf-8?B?TFhBTmVkRDBUalhOY2MrYzBsNlhWQjhwQ2JucWlSdDEzWjQrK1RwUVJKb2xj?=
 =?utf-8?B?RWZRWFFvREZvd2RWd3l0Z2hVd0I4VEovb0RRam5Sa25na2pIV0g0Tis1SXZD?=
 =?utf-8?B?bTBNdStxRjZ3b3JLOW94Q1RuMXZTTzlrQmdITnU4UVhkQ24yeitFVklQb05G?=
 =?utf-8?B?MWs3UXFPL2Zxb3lVNlhNZDdOTktSNFhRRmE2a3J6akdQN2U2dS9KUTB5WUNE?=
 =?utf-8?B?NzFPMlN2aFh5OTFjVmJHYkUwMURSaE1NMUJXZWtyTEx4a2JjWXQxTmh6QlNL?=
 =?utf-8?B?SkIwb0gya0tTS1lFRS82WWRPbmVqWk0vU2RjcWV3d04zZm14Mk1HdnhiOFJN?=
 =?utf-8?B?TWtDV3VQdGRuVFpjc2dQa1JFRHNJNjFYbmJ2bHpDVHI1Umo5VnVYVFR1Tkxh?=
 =?utf-8?B?S2R0RTc0VURLVlczY29EZEdOZkRtS3JBQVQxUW1CWDJ3OThrd2lMSFpCV1kw?=
 =?utf-8?B?UlRoMDNDRndGTFVHNW5sZlM0NTZSQXZ6N0REQWMzd0JBdnJLMklMYVNLMVFC?=
 =?utf-8?B?S1cySWRnZ0NieWJpL0lwMGk4SVZIdS8yT1E0dmpKR25xbFFEdldpVkRGcktV?=
 =?utf-8?B?WjJ5enVPeERGYUlqa1FVSnd1dlUva2dRL1dUc3pKVGhuRGlCMFoyTVlRa3Zx?=
 =?utf-8?B?N3V4VGtkMGY2elBoU242am5FWkJ4QndCYTFMbVN2eWZPYktVcjk5KzNpR3Az?=
 =?utf-8?B?akRieDRDKzRlSXU1UENaTTdBd0xtYkpkTmR0QWNRZGEzRHRVdHBmWEZLVU0x?=
 =?utf-8?B?Q09TRklEU2hxZzJiYS9SNnBtVENrVWZUZStjNUlOclJHNjdKbW5UajE3WUdO?=
 =?utf-8?Q?iPfwhHFv1VcLNxEH8QA3gTXqe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cb71f8-899f-468f-443b-08ddda506e4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5712.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 10:01:54.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yc9okdq7gu+EeVXStzHKLJR80ZzFXPCl3JEI5eLAeMHYDk8BRVV3X5LJV35haqIy5OhPRAHGeJtfBtfwEZACEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_031734_201090_7420BC0A 
X-CRM114-Status: GOOD (  17.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 07-08-2025 01:26, Sean Christopherson wrote:
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
> 
> When emulating a PMC counter read or write for a mediated PMU, bypass the
> perf checks and emulated_counter logic as the counters aren't proxied
> through perf, i.e. pmc->counter always holds the guest's up-to-date value,
> and thus there's no need to defer emulated overflow checks.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Co-developed-by: Mingwei Zhang <mizhang@google.com>
> Signed-off-by: Mingwei Zhang <mizhang@google.com>
> [sean: split from event filtering change, write shortlog+changelog]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/pmu.c | 5 +++++
>  arch/x86/kvm/pmu.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 817ef852bdf9..082d2905882b 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -377,6 +377,11 @@ static void pmc_update_sample_period(struct kvm_pmc *pmc)
>  
>  void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
>  {
> +	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu)) {
> +		pmc->counter = val & pmc_bitmask(pmc);
> +		return;
> +	}
> +
>  	/*
>  	 * Drop any unconsumed accumulated counts, the WRMSR is a write, not a
>  	 * read-modify-write.  Adjust the counter value so that its value is
> diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
> index 51963a3a167a..1c9d26d60a60 100644
> --- a/arch/x86/kvm/pmu.h
> +++ b/arch/x86/kvm/pmu.h
> @@ -111,6 +111,9 @@ static inline u64 pmc_read_counter(struct kvm_pmc *pmc)
>  {
>  	u64 counter, enabled, running;
>  
> +	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu))
> +		return pmc->counter & pmc_bitmask(pmc);
> +
>  	counter = pmc->counter + pmc->emulated_counter;
>  
>  	if (pmc->perf_event && !pmc->is_paused)

Reviewed-by: Sandipan Das <sandipan.das@amd.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
