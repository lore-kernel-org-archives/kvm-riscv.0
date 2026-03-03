Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B43FEB365A
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 03:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6DyrW3xsfw1YvocobvKtzfjiqOJVjy2VEYakg5994A=; b=XYzM3PkQY4FEGZQ60Na6o5BFin
	FODspo2IRN8L51zAJloYg3JgPQsQkM6waM04hv4hIuCu0kzu8AXbaUvsLguaKiZNs1C5e4eb0PhnG
	By9JVtL39dDpiH/AZr1WtBH1eR7uuuAnILftiPUBxo99eXltmwh/BsPu2nXYFGZHZaFaLAlF4gxmm
	2/VYchi/Kok7aiTjOeWIZhh86BT6phtcmJZ862+xcnd9Ij5ZFtX2HKIcBCFLc/cCbDauWvfBtcN79
	oQN5prz7S8ASj+SmL28lj6KxceiZ5CDAw3sl5bfsPAuCpV7QCZqamDTgeBcoiOSuCdZ76rsBTuUTu
	voq7G//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGD8-0000000ERUp-2IfE;
	Tue, 03 Mar 2026 03:14:14 +0000
Received: from mail-koreacentralazolkn19013080.outbound.protection.outlook.com ([52.103.74.80] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGD4-0000000ERUF-3bKq;
	Tue, 03 Mar 2026 03:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtZ0YY5zn3d/uOLwQUg4iOLC/UnEE6ERpmC21wZlAsb933DHn0Ar/F8JwkdZtSv5AmzLAirwk6k0j+X6gE3CohFNxLWmglepeQUt22N+DcwUHCTJR7fnCueq6piGnAxRbjwrIqhsybK2yGrSbVzQk7EPqt0I6BG/NZnsJVb1/p7iccGZJdrhUY6mo7GRVmwstzK6XEvX3DBHwTIlQ7Eg4IvPzJFAixTKrD7qLcQRk+GhYpfTNr2uZ6Riucbg3VrPKXQhlqsfWL4x8HyftV/zU/Eiv3hAOJhJvM44jzXkbSALyR43Jheh19HhJKhL0DYlY82FILVc33cPG5fnZNetAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7z6gldFoDPqXep6CI3CRw3HqWNMcQjvha6YzD+yjQ4=;
 b=hmq2ossX2BruiCHzkfOE9LxpmacUolutBheewGvWlFfwYaGMZNvRkivBSqHNfhDhWj6Zd9vy//+36eSplp8Q9wE8h+3h2CN6ke8q3YWzIG4v68sWnPgnhlLdZhz4msVujAj/82NzMVOSXAcYDli+2vdTm0zPOVVQCwfQhsWSXrAHAIUDMusDxoQC9Oixak+YlHpbD4Rnon+aDc4iI3N0kPtWc1AXu5f2QetmnkV1WyGs0FME6sk2UWRJa7eym3mafDEQf9fQGGqIcD93IYxqDsVDUte+nPLlFBqJu7xG+ERu8uRWd1FBQqnwFZAHdKhGj/qtM07gSfuRUnGXr3yElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7z6gldFoDPqXep6CI3CRw3HqWNMcQjvha6YzD+yjQ4=;
 b=RNiZv6pPqeweFTCwqF1a5mVhPH4pg4GM4ceYs0lNfCE3IiDl6UMrQEgqwSgZzereuF2qlHx9zWo+nacLX1rvt4DfO2IBDcGjbEHQ5f6NM0KOAS7ZYkSZ+Yt5maoRWpm8FRlBLCQ9CfSGKxqNoZVEAKDSmFnQ1UUTJ5KCpL6ARNiiRh1ygZUtQfIyvgK3zCHzv4ySkMTtCSD3kz8XE+YT3slpPaRQ84kI2qgWXDNV2Ti0ZqGxW/ZLR7JjPgt4CIWvWeJL0tbjGjiUVgj2H7fDmOsp2aJ76Wi+1JYd0dfggwZIF/u2K5if+fRo1EAoE9k7W+Tp8bc359t81hBuYzBuFg==
Received: from KUZPR04MB8925.apcprd04.prod.outlook.com (2603:1096:d10:46::5)
 by SEZPR04MB7650.apcprd04.prod.outlook.com (2603:1096:101:1ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 03:13:55 +0000
Received: from KUZPR04MB8925.apcprd04.prod.outlook.com
 ([fe80::e3dd:6f77:3be9:b71d]) by KUZPR04MB8925.apcprd04.prod.outlook.com
 ([fe80::e3dd:6f77:3be9:b71d%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 03:13:55 +0000
Message-ID: <KUZPR04MB8925B405C8AB50882EF915ECF37FA@KUZPR04MB8925.apcprd04.prod.outlook.com>
Date: Tue, 3 Mar 2026 11:13:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
To: Jinyu Tang <tjytimi@163.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Paul Walmsley <pjw@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227121008.442241-1-tjytimi@163.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260227121008.442241-1-tjytimi@163.com>
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To KUZPR04MB8925.apcprd04.prod.outlook.com
 (2603:1096:d10:46::5)
X-Microsoft-Original-Message-ID: <8973079a-7ea7-4ab5-879d-8852e1a0edff@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB8925:EE_|SEZPR04MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf8202a-96e0-445b-8c5e-08de78d2e641
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3mCsD4RYpiBXP8G60zXrCmR3nXwQaUIaBlNYECgnPqZeGccEPc/LWboYsIHAzfHETXeG5WvYeA5HDP1cDzzt+HwK1fdG5ihHwp8e9wyjY53d5u84t/LhzRvFyylB49/Jn4cQHVjFrYDkUpMdEXe5eHHBEUUiRVRI+nLxqlQMER8iyPH/AcyYr7PzsZN/DBXVpHecKSzfzSbAFZ/DgtHtDntBQonqtXRlfGArb3zVTIbFAmOVZpeezxDNO5IFB4ox1C4eGfa2fGy4E3TtyW5y/jMStQPJkisSKb7qMe6iy6lWsm/9qCyfjue8/H9nR4SJNAIaq7pOd3MGROBldDVw30a1X/U+r9Goay4SZaV576hNOdtHH7lKfdF/fslWgBPtQ56pxmwK68W76SeawwNz9HAujdSRamQ7Cpy5YbSKwtiLXqcZ/nAucZyZM3EJ/kca8X/vSU6vfzhOe1epEM9YOnF9Ij+8+IMqjpAA8S/8BURqIbY1JJ7DQbb3gy6nAdBHjYmIKIts4dVISca2WJzPUDaGl06qst78JfmAoQwcfNrxZOeC6qxtm4V/wLvTy6kkdTldxLXi91I5SmZnMgkDz4JAGVHYpvvMR2BKNmRTt9Qdo3uGvOqE9NEhTFaNjW9XS7QEHICVoQMIBkEj8WAmuvjKzzDOhaETBt50vqmQKMe55Uoc3GbE2TuIrWH5NklYtGHSi+tkJHeWFZM78dxaJfSoz+nnjNtH0mZqlp28XyffOM8Xxve2KeNP0FpkCm8B+6I22mVmFs2u8JDDCbQpaHx
X-Microsoft-Antispam: BCL:0;ARA:14566002|12121999013|23021999003|7042599007|8060799015|15080799012|19110799012|51005399006|5072599009|461199028|6090799003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW1IUUt6c2cvUXRvMmdaS0FQUDN4ajR6SmtQVVhDd3d4cjJJTTg1N3B1bXVv?=
 =?utf-8?B?aTViNXJWc0pLWXk1YUpYY0JyMmM1cm9weUxHY0tNdDJ3VGVEWU0zcncrZ2VC?=
 =?utf-8?B?UU5ZMm94Nms2SDdGd3B6MUpYVnZKcGIxd2tBSU83SUJ6NytXa3YyL256b0x4?=
 =?utf-8?B?UVZzVEtubzNyempXMUtNR2M5L2hDVi8zT1VmNEk5eXUyaHFTZGNlVnh1dWsx?=
 =?utf-8?B?ZFR1S3BRWHBGQjQxanAvNzk3cGpudDVjQWdXdDZXMG5WR096MVYvOGtjdExE?=
 =?utf-8?B?Tko3RGc2d3AxV05pMVlaeUNrMXBEb2kySWh0aWtzbmJKcWtRWGNVZmNnbUho?=
 =?utf-8?B?NWNDYnRQckdQTjkwcWNWbkgzTDRNc0F6RFRzL1pkQzVJaTVsa3d2Y0c2eVZs?=
 =?utf-8?B?L0R1M2syNThPOUN3WVZ3azdUWTE3MlVnSWFIc25jZURVSXpRQks4TVhaRVRU?=
 =?utf-8?B?dnZpZjlnenBZekJhUEpxb1FFNjA4Yk1tdjQwL29FVUlRN3doR0U5bGdhRnFq?=
 =?utf-8?B?bkpWVlZDb1Z3TTc3bFpMaUxqRGRBUmNITm90ODhEdEVlc3E2L0o4Mml1M1Y4?=
 =?utf-8?B?MHJDamVBWXphek5oZG5KTEl2SnBYL2NhRTRuMVNleUtKbDBBRFRFZnpVdGc1?=
 =?utf-8?B?ZTMzMXpxWDZJbldjUU1HdkwrL1BFOFllRWVlQnpTeXRHc3k0QVkzQkdjZVJh?=
 =?utf-8?B?U1F0a1RTMXl1MGcwRUpRTWpFTU5ZK1h5Sjh1R0tNa3hya3ZVRjMxbkw5V0NJ?=
 =?utf-8?B?dGJseVJZNmt1NEFCZS9MczFEc0tQd3lBSnJJVWpMekJELy9YRDh2U1pzTXc4?=
 =?utf-8?B?RVRLWmhDVk83MzlnRk1yL2llMkxzUFB6alBWNDc0amp4bEZqei9SVSs3Rmg0?=
 =?utf-8?B?YXdZNGllay8xR0lmK2laM1dUTWJaTktNRkpYYmgzR2hnbW8xNkRlbkl4Nm9p?=
 =?utf-8?B?Q1Zia1FFSWFsMnNWM0duSnVKNnhkYkh0UHJ4Nko0MFNtSG81SU1BRDNWbmM3?=
 =?utf-8?B?ZTU5NmIwcEFUSkZjaHpzbG93VzZvelNueStvQ1FITDJNR2tBZjJDRk5xbnli?=
 =?utf-8?B?Ry9KNUl2cmFoSy9JbFk4SVEzS2V3a2hBVk9TWExBcHRGbndwYm95c1dFalJN?=
 =?utf-8?B?dXlJeXk3Y0k2ZHVOZ1BxdWRqaDR6OFVXYU9pK0xOaGRiOW1pcC83eHpYaDdR?=
 =?utf-8?B?VGpFd0VvYktnbGJsL0ZFc1JUbmZ1a0w2R2dXT2xROTRaY1Z6QVlyaVJRT3RZ?=
 =?utf-8?B?VHVBVUlnbHhacGhEczJTREQwU21iTThXczhFRUlVam1rY3NyR09wM2d6TVh0?=
 =?utf-8?Q?VI63/s1c2WwGw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9NcVVSbE5xaDU5OUpEcWpqRVp2cWNtb3UxNGtieVhYaEhVcjZUSlJFVzI5?=
 =?utf-8?B?dGFocDlaQllUNFFuL0tyUG15eEoxbU9PRUt2ZlJkOVJJT1hoWFpLWFY5MjNV?=
 =?utf-8?B?Q1VxSkNEQndHbVRFejlmSzcvSlU3N1hQdHRpL1JQWW1zQ292ZXdhbStsMndG?=
 =?utf-8?B?bjlia2N0dG56SytGQzNROGYyZTVIUDFGSHgxMU1GdEptVEZFR2c4WU1heVY4?=
 =?utf-8?B?RlFtaHY5bTNpVzZTVmJsYXVkK3NtMzNCMndEM1BjVW1nclpndDdFdTVFK0hr?=
 =?utf-8?B?SDU5bjdWRkMwYy8yNnN4K0hkTHRPSEs3Z1BWaTlObTNQWU5nUlJRa3VEV0Zs?=
 =?utf-8?B?WXVHWG9Ed2N2NHNURW1qSXdCSXF6ODVpaENEV3dRbEZDeUlFWm1qaVN4UkhS?=
 =?utf-8?B?QjhmakN1dnZUQlYxOXp4SWxRVTcxcm9zWlNsSGZGUmdkVk1HOUMrNjNEKzgx?=
 =?utf-8?B?M2s3U0w4S29QZlpqcFMxamxOaHo2Rnp6SFpsaXA1RXBHbFBKZ2hhM1h2U1VG?=
 =?utf-8?B?YUFRTElnNHcySkhxQ2NVSDcyTExpZUhqMXFtMkZNeVFQaURKWitFTTdBNDBq?=
 =?utf-8?B?NGJuZXNJWGV3Q1hVTFo5bzVsMklGYkQ3ay9OeENVL3NwMDFxbng4ZUxGTkZQ?=
 =?utf-8?B?VWowS3BDZ0k3K0JGbEpiQnRDc2lpNVpnY3loVks2VEF2VlJEVnliUUc2Sk50?=
 =?utf-8?B?bFkrT2t6aEJaZW15THFjVVRHY29SdHFlRitZMjR1eXpEUVN5dm1JbmQxUmFu?=
 =?utf-8?B?NXVIMEYzQ05uV0o1UHc3OUxycDRpczVXQTcyUk51VXpDbnJyalptVmw5dVhR?=
 =?utf-8?B?ZVFMblVZRHJ4VTl6ZDNjb3lPeUZwaVRiMlEzVytISkx5ZkJRSVN2NFhyZmJB?=
 =?utf-8?B?anluWGVTTkczcWpBR09DSVQ3NEp3a0J2MmhKc3R5NFJQOVFHZDBZaS9YWGRH?=
 =?utf-8?B?aUpZYVpvR3loeldtSk1FYzlYam16ZGQrWmt6Y3NuazVLdnpQTUY4RGY5NlZs?=
 =?utf-8?B?bmxHRjdkaGlqMWNKVGkxQXByQ0NzL2wrUWVmUGNoaUF4cCtHakRZam9ReTFK?=
 =?utf-8?B?Y3lIZGlHTUlwZElBUnpUNTBiaWpmN3RDRzBsRmNzMUx1WVN0QVowOGlPYTh6?=
 =?utf-8?B?bGp2QUROWkVHUUJScnFjWnNqc3pRZ1pyS0FqR3hxcVI1aGFKRGFYRDNpSitX?=
 =?utf-8?B?V25Xa29Ua1NTOThoY3lPYUhPTWRVbThGc0V1WEw0RjZPaW5qaStlMmVRUjlT?=
 =?utf-8?B?N09uQzI3WHY4bUZpTVppMzljM1g3bTgxZ3NaUkJNMFVPOTNkVDVIOG82eHRv?=
 =?utf-8?B?RThuZElqVTRzRmJFY1VVRkc4MjBmdHZPYm01RTZPZHpqekZ0OEVESmdGMjEx?=
 =?utf-8?B?QndmWmhuRnRibml3VjRhU2xSeER4ZWlkWVNRcTFOMFpXRis1bEdYdFczOWRH?=
 =?utf-8?B?NkZESGlWRkFnMkFGaVA0Q2g5OERObTd3dlA2dEpIODAvbldzQ001RCtza0xO?=
 =?utf-8?B?cVlNVzM2R29nQ2lCSWRnNWNxd09lOW9CNFVqK3RhTjc2Ny93NUh2VXFHdXdn?=
 =?utf-8?B?M0J2c2lLYUFRZWhlVzYrSUcrbXpXckNibFk3SjZiMVJvS05jb3E5d0QwQ3VH?=
 =?utf-8?B?WEFIMitEYmJYeEU4OVF1eUEyMnRidXdYMXplbmxIWVJvNDFBd2xmcHJXRTlz?=
 =?utf-8?B?V0o1Q24xdlMyZzVvTHJmS3NtTjhZdEI5QlRCazFUOVgxUitjd2NJVWNLdHVv?=
 =?utf-8?B?K0pJeHlmenU4V0RjSEpjRjhOT2t4V1JVdC9hTjFUaStwN1pCRWZCbDJrS2p6?=
 =?utf-8?B?aTVIdGZUekhZL0lVdFczdGJycW9xMGVIamc3RC9YRm5RVENSMjQ0R3FCUXp5?=
 =?utf-8?Q?q8666QWs+WsLm?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf8202a-96e0-445b-8c5e-08de78d2e641
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8925.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:13:54.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_191410_928340_07FDB833 
X-CRM114-Status: GOOD (  22.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIvMjcvMjAyNiA4OjEwIFBNLCBKaW55dSBUYW5nIHdyb3RlOgo+IEN1cnJlbnRseSwga3Zt
X2FyY2hfdmNwdV9sb2FkKCkgdW5jb25kaXRpb25hbGx5IHJlc3RvcmVzIGd1ZXN0IENTUnMsCj4g
SEdBVFAsIGFuZCBBSUEgc3RhdGUuIEhvd2V2ZXIsIHdoZW4gYSBWQ1BVIGlzIGxvYWRlZCBiYWNr
IG9uIHRoZSBzYW1lCj4gcGh5c2ljYWwgQ1BVLCBhbmQgbm8gb3RoZXIgS1ZNIFZDUFUgaGFzIHJ1
biBvbiB0aGlzIENQVSBzaW5jZSBpdCB3YXMKPiBsYXN0IHB1dCwgdGhlIGhhcmR3YXJlIENTUnMg
YW5kIEFJQSByZWdpc3RlcnMgYXJlIHN0aWxsIHZhbGlkLgo+Cj4gVGhpcyBwYXRjaCBvcHRpbWl6
ZXMgdGhlIHZjcHVfbG9hZCBwYXRoIGJ5IHNraXBwaW5nIHRoZSBleHBlbnNpdmUgQ1NSCj4gYW5k
IEFJQSB3cml0ZXMgaWYgYWxsIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0Ogo+IDEu
IEl0IGlzIGJlaW5nIHJlbG9hZGVkIG9uIHRoZSBzYW1lIENQVSAodmNwdS0+YXJjaC5sYXN0X2V4
aXRfY3B1ID09IGNwdSkuCj4gMi4gVGhlIENTUnMgYXJlIG5vdCBkaXJ0eSAoIXZjcHUtPmFyY2gu
Y3NyX2RpcnR5KS4KPiAzLiBObyBvdGhlciBWQ1BVIHVzZWQgdGhpcyBDUFUgKHZjcHUgPT0gX190
aGlzX2NwdV9yZWFkKGt2bV9mb3JtZXJfdmNwdSkpLgo+Cj4gVG8gZW5zdXJlIHRoaXMgZmFzdC1w
YXRoIGRvZXNuJ3QgYnJlYWsgY29ybmVyIGNhc2VzOgo+IC0gTGl2ZSBtaWdyYXRpb24gYW5kIFZD
UFUgcmVzZXQgYXJlIG5hdHVyYWxseSBzYWZlLiBLVk0gaW5pdGlhbGl6ZXMKPiAgICBsYXN0X2V4
aXRfY3B1IHRvIC0xLCB3aGljaCBndWFyYW50ZWVzIHRoZSBmYXN0LXBhdGggd29uJ3QgdHJpZ2dl
ci4KPiAtIFRoZSAnY3NyX2RpcnR5JyBmbGFnIHRyYWNrcyBydW50aW1lIHVzZXJzcGFjZSBpbnRl
cnZlbnRpb25zLiBJZgo+ICAgIHVzZXJzcGFjZSBtb2RpZmllcyBndWVzdCBjb25maWd1cmF0aW9u
cyAoZS5nLiwgaGVkZWxlZyB2aWEKPiAgICBLVk1fU0VUX0dVRVNUX0RFQlVHLCBvciBDU1JzIGlu
Y2x1ZGluZyBBSUEgdmlhIEtWTV9TRVRfT05FX1JFRyksCj4gICAgdGhlIGZsYWcgaXMgc2V0IHRv
IHNraXAgdGhlIGZhc3QgcGF0aC4KPgo+IFdpdGggdGhlICdjc3JfZGlydHknIHNhZmVndWFyZCBw
cm92ZW4gZWZmZWN0aXZlLCBpdCBpcyBzYWZlIHRvCj4gaW5jbHVkZSBrdm1fcmlzY3ZfdmNwdV9h
aWFfbG9hZCgpIGluc2lkZSB0aGUgc2tpcCBsb2dpYyBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
aW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+Cj4gLS0tCj4gICB2NiAtPiB2NzoKPiAgIC0gTW92
ZWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQoKSBpbnRvIHRoZSBmYXN0LXBhdGggc2tpcCBsb2dp
YywgYXMKPiAgICAgc3VnZ2VzdGVkIGJ5IFJhZGltIEtyxI1tw6HFmS4KPiAgIC0gVmVyaWZpZWQg
dGhlIGZpeCBmb3IgdGhlIElNU0lDIGluc3RhYmlsaXR5IGlzc3VlIHJlcG9ydGVkIGluIHYzLgo+
ICAgICBUZXN0aW5nIHdhcyBjb25kdWN0ZWQgb24gUUVNVSAxMC4wLjIgd2l0aCBleHBsaWNpdGx5
IGVuYWJsZWQgQUlBCj4gICAgIChgLW1hY2hpbmUgdmlydCxhaWE9YXBsaWMtaW1zaWNgKS4gVGhl
IGd1ZXN0IGJvb3RzIHN1Y2Nlc3NmdWxseQo+ICAgICB1c2luZyB2aXJ0aW8tbW1pbyBkZXZpY2Vz
IGxpa2UgdmlydGlvLWJsayBhbmQgdmlydGlvLW5ldC4KPgo+ICAgdjUgLT4gdjY6Cj4gICBBcyBz
dWdnZXN0ZWQgYnkgQW5kcmV3IEpvbmVzLCBjaGVja2luZyAnbGFzdF9leGl0X2NwdScgZmlyc3Qg
KG1vc3QKPiAgIGxpa2VseSB0byBmYWlsIG9uIGJ1c3kgaG9zdHMpIGFuZCBwbGFjaW5nIHRoZSBl
eHBlbnNpdmUKPiAgIF9fdGhpc19jcHVfcmVhZCgpIGxhc3QsIHNraXBwaW5nIF9fdGhpc19jcHVf
d3JpdGUoKSBpbiBrdm1fYXJjaF92Y3B1X3B1dCgpCj4gICBpZiBrdm1fZm9ybWVyX3ZjcHUgaXMg
YWxyZWFkeSBzZXQgdG8gdGhlIGN1cnJlbnQgVkNQVS4KPgo+ICAgdjQgLT4gdjU6Cj4gICAtIERy
b3BwZWQgdGhlICd2Y3B1LT5zY2hlZHVsZWRfb3V0JyBjaGVjayBhcyBBbmRyZXcgSm9uZXMgcG9p
bnRlZCBvdXQsCj4gICAgIHJlbHlpbmcgb24gJ2xhc3RfZXhpdF9jcHUnLCAnZm9ybWVyX3ZjcHUn
LCBhbmQgJyFjc3JfZGlydHknCj4gICAgIGlzIHN1ZmZpY2llbnQgYW5kIHNhZmUuIFRoaXMgZXhw
YW5kcyB0aGUgb3B0aW1pemF0aW9uIHRvIGNvdmVyIG1hbnkKPiAgICAgdXNlcnNwYWNlIGV4aXRz
IChlLmcuLCBNTUlPKSBhcyB3ZWxsLgo+ICAgLSBBZGRlZCBhIGJsb2NrIGNvbW1lbnQgaW4ga3Zt
X2FyY2hfdmNwdV9sb2FkKCkgdG8gd2FybiBmdXR1cmUKPiAgICAgZGV2ZWxvcGVycyBhYm91dCBt
YWludGFpbmluZyB0aGUgJ2Nzcl9kaXJ0eScgZGVwZW5kZW5jeSwgYXMgQW5kcmV3J3MKPiAgICAg
c3VnZ2VzdGlvbiB0byByZWR1Y2UgZnJhZ2lsaXR5Lgo+ICAgLSBSZW1vdmVkIHVubmVjZXNzYXJ5
IHNpbmdsZS1saW5lIGNvbW1lbnRzIGFuZCBmaXhlZCBpbmRlbnRhdGlvbiBuaXRzLgo+Cj4gICB2
MyAtPiB2NDoKPiAgIC0gQWRkcmVzc2VkIEFudXAgUGF0ZWwncyByZXZpZXcgcmVnYXJkaW5nIGhh
cmR3YXJlIHN0YXRlIGluY29uc2lzdGVuY3kuCj4gICAtIEludHJvZHVjZWQgJ2Nzcl9kaXJ0eScg
ZmxhZyB0byB0cmFjayBkeW5hbWljIHVzZXJzcGFjZSBDU1IvQ09ORklHCj4gICAgIG1vZGlmaWNh
dGlvbnMgKEtWTV9TRVRfT05FX1JFRywgS1ZNX1NFVF9HVUVTVF9ERUJVRyksIGZvcmNpbmcgYSBm
dWxsCj4gICAgIHJlc3RvcmUgd2hlbiBkZWJ1Z2dpbmcgb3IgbW9kaWZ5aW5nIHN0YXRlcyBhdCB1
c2Vyc3BhY2UuCj4gICAtIEtlcHQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQoKSBvdXQgb2YgdGhl
IHNraXAgYmxvY2sgdG8gcmVzb2x2ZSBJTVNJQwo+ICAgICBWUy1maWxlIGluc3RhYmlsaXR5Lgo+
Cj4gICB2MiAtPiB2MzoKPiAgIHYyIHdhcyBtaXNzaW5nIGEgY3JpdGljYWwgY2hlY2sgYmVjYXVz
ZSBJIGdlbmVyYXRlZCB0aGUgcGF0Y2ggZnJvbSBteQo+ICAgd3JvbmcgKGV4cGVyaW1lbnRhbCkg
YnJhbmNoLiBUaGlzIGlzIGZpeGVkIGluIHYzLiBTb3JyeSBmb3IgbXkgdHJvdWJsZS4KPgo+ICAg
djEgLT4gdjI6Cj4gICBBcHBseSB0aGUgbG9naWMgdG8gYWlhIGNzciBsb2FkLiBUaGFua3MgZm9y
IEFuZHJldyBKb25lcydzIGFkdmljZS4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCB8ICAzICsrKwo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0tCj4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jICAgICAgfCAgMiArKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQpSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFp
bC5jb20+CgpUaGFua3MsCk51dHR5CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
