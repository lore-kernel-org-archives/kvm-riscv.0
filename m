Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D00E88D7B
	for <kvm-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 03:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTUBITiGPz5fsxwkbOnJaTUwkQCiPw5tQPNHtvZeF5Y=; b=jjPFyS0YpOKNLOt9E9LFeyhF/h
	H1ZpA8H/BzCz9WAfvaigt3evfc9ae1tltR1mkzm/KjEF94rJUSnz0b/MpffuT1PhC3facROQqUlad
	5mUkd0sCEaTnNsI8H1fBuhlTBeTSQK+nKno8w7CoOfqGVg9o5eUm6dJUxjGwuYxk6G277dTEJLt91
	Ewf840XK66foDaEOEvu2YgK5QJaaOBznaZFevd3lEjcSh+TaKIT+mrzzNnP6VYgPTX7lG4UR9pEzm
	jB5GDGC8xZ6Y4r5RoBOu/W9TpxlREz9QWtpn/+M9NAD8ja9oP04pIbKsTca+a5ppuxm8dIJyDp2hq
	Xxynr7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rds-000000034TZ-1Ces;
	Sat, 04 Apr 2026 03:25:48 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rdo-000000034TA-21xO;
	Sat, 04 Apr 2026 03:25:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhgkaW/EjraOQXn95PF37eV1zM0kcIYOuLbYO2AgefwWXuGGFkiaDTpbxpTZJj79GEb7+7iQvhuefTCmAp/tXEy2O8/dtOMknnL/KjqpEPdpsR7c18uVptFM+de0Ku/SAwVTuLaCEELdWNqxNLdjF62TTA7+ccisSEFzF9+LFQ7fzdz5RLmqAFvkkw8B0LI6fD9GgdxSn3J1HFgm25xl7p1LF7YTO+EvONXGGgGq3fG2lTG6U+5rX0VER7EbiInp8jy1pjLkFk18PCJK0jdHRgQq/CXIgxFXw0oZ+D2yb4i+L9B7lv0aKx0PLq9HUBZDienMVtDb3tkERQnj4JXFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrFIcKDpFoR7YyZHPbXBLvTmGe0ugEmr5TDUTobTuq4=;
 b=vPIFZWsal/j0c279fCCpGj/ecNrEeDzH7UbEbyrSUbyOq97Rd+D/rUMusSD2pRjkVLzYMpi6a9N2g/KLSG51A9UbFTg/vZYEOpdKomHkYDCxO54Eb/rveF+gwlk9z4iAGd1f2cfuuowM3DVVcHTDBUeo+yq3LUabmxwmgVkRIxJx/vVgzFXro2dtDUinpLdQxn/XAPJ4VE+VJdU0Xmy+kIB1ONrnNVY/Rem8rVeVmzGoJcQqc5miChj2T+0WmkNss35W7yhqnL/+wNoybOdkmgSEBGCFNDmWiwYX5Me2crRvkErkcAzBCYq4Z/tpHEUCvgJQIO2Tiyg3pmEYTtbcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrFIcKDpFoR7YyZHPbXBLvTmGe0ugEmr5TDUTobTuq4=;
 b=ZU1hQsOFqfVnHdT+CS6SqvPwDXDPRNrxkLDg2DPNo/ag9MGFEQBoNKAhbANSBqQFNnytwS/yU7t9vextTD5ROGfVluzb7zCoI1P+bzpOGfA3lbY32GpNUXja8gQZ1SGewOdyYnRvKE1NVPN9aL9loigpk2xm/Uy0p0b/BjTh4LGKazPXfB4KyYXVKey91Boq6hqmA5dk14Vsa3wLbpM5ngX4EIPuunLRwm08u2rBGuJuyT07+Gu/VIBHap75C3E8950SMAdAFzGeLqmQSNp7zWW6HZt8R+nHSk2AsoX1vXlnsuKpI8rPczHoMHvejROzTq6xGiPqFWiAhOjoukwBUA==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by JH0PR04MB7622.apcprd04.prod.outlook.com (2603:1096:990:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Sat, 4 Apr
 2026 03:25:32 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%6]) with mapi id 15.20.9769.017; Sat, 4 Apr 2026
 03:25:32 +0000
Message-ID: <SE3PR04MB8922EEE514B57D2D54BD7AA5F35FA@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Sat, 4 Apr 2026 11:25:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] RISC-V: KVM: Cache gstage pgd_levels in struct
 kvm_gstage
To: fangyu.yu@linux.alibaba.com, pbonzini@redhat.com, corbet@lwn.net,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 skhan@linuxfoundation.org
Cc: guoren@kernel.org, radim.krcmar@oss.qualcomm.com,
 andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
 <20260403153019.9916-3-fangyu.yu@linux.alibaba.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260403153019.9916-3-fangyu.yu@linux.alibaba.com>
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <50c24bbb-d6c4-4775-beab-2ea42bd85741@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|JH0PR04MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be47d08-fb62-474b-903f-08de91f9d366
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT97+9kgwgO/mqEGtcymhevmECRKaMIBi/81O2VrwNjzpMYq5EZpkgoGMGv5ThI7lIuGug8TrgcZRiTH2VVAeN9uFRb/rHVoIChcMJo3jHJiBu8yslKz3roweEGr4rllAiXukCp9IKEZCz4f0BVeQfVdH5c7P+xNLWHp87hZlljgjWOG/weZo5/QP9F/s4d5uVVsz9gV/rz6R8ARJodGNtu2RkieZuKoA1xK0kzWBLOy340mZ07D73I3wTxnlUKEkwTXhOqPdY4usOAfA5ITG2OL3z6TkBdDPDslPXnIj0wbVhhQ/MNfgDPNWZ1fmsj1URz44U4ka18zybIHl9ioQgVZ4OTODIhhIkPt558lE7+1lAtSLNBLkrp+OV8w0kjX7hfeqbzvbgFpm2YiUyFy+k0xB4/E0sGFaNHNH/4VJXXeLQDOTTekfGiucRiWAuyCseucVe3OA4pXhzPvh5fpOdm+XJdXqe5lqKeVO+s0Hcxsoyr0FETxf8r6Kxwtw1J5FuVtFipulOB5oUA8xj2Y477qJ7cISVDtQF850L8JvsWjjldNJ/soztTCMe0fo7cMXbdd2fw/8198oCcCkSoJokMtTKT57ZsdspGBPQF7JvH87OQdA/jDMeSvNm4SaB77g1VEB9AQdTUQuVDZKqP754aXlM70FOMFNlyD4IuyekYrd5nTzN8s93Hlj854PgC75PhdE4D8BlEzdEimXDx8yniyqYCFuezF4GLYY+tFjqX50wFzgYFJiL1nBAdmOsBT+4oRoyIpj520p4Qnm72G01o1LpUQibOQmmu8GtSc/Halwm4ebvTpWOXA
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|23021999003|19110799012|41001999006|5072599009|6090799003|461199028|8060799015|7042599007|15080799012|40105399003|3412199025|440099028|18061999006|12091999003|26121999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEZ5U1B0UU1xOUx2NFNCallBbXUwRU1yVjVVR0lLc01uLzd0V08zU0I3MFY4?=
 =?utf-8?B?MUhxdFY5ZVFSY3hMazI0bE9remk5SmczKzZMdHFZaDB1RW1lS3VkOGlXUDRx?=
 =?utf-8?B?amJCblpRc0haOEZCQ2Z1WkVhaTN2VGRscmpMbHZ6bXdVeWIwNlpNQUQ4aVN0?=
 =?utf-8?B?a0RyM20yYkgyeFl6SlJMN2JnUGQ5WW9UenhoOTJGUWVyZ1dIS1hBaG9Lb3Bl?=
 =?utf-8?B?VlBlRFdxSHRiWTAyWmdVMzBHejRXWmxuY1dGRWxON2pneDVXa2p0amRkYmpU?=
 =?utf-8?B?cUN6SXNaQ2V4YlRJNkljandHNytuMnRocmVpblgrSWg2enZkQlZHMEZTMlJG?=
 =?utf-8?B?ZEZWR2dYaDV3VTZLMlpPTFlHcy9MbjZHdnZFWWp3a1RVeUE5VjVkWWZ6Snpt?=
 =?utf-8?B?KzF4YWpYTnd3NHVVWnlzMXVpRnRhK2hod0oyM1U3ZzFzcVlhdEo1YXZxZWN1?=
 =?utf-8?B?YXU4TDNVUFE0Y0VEMFBhem5QaURNVGQ1MFpNS0dVL3NlSWFUbllkK2dMTXFG?=
 =?utf-8?B?dEdWc1dYaTNMYUpaYmZsYkptWTJlWkQ5NmduZ1pPNlVHaGFxSVUvN1JNbk1u?=
 =?utf-8?B?eUVWdWF6WTVJYU1VZkEzQWV4TVFiNmNSWVZCUHAzS0lzNlhxNWdMRERzdFpT?=
 =?utf-8?B?Q3d6SUIvUFlYM0ZLbHFqWm4xSVlSbXJqeHhzMElwMjU4eUI4Z3dJTUpiOFZ5?=
 =?utf-8?B?ZVpBeXFiekhRNkVrNm81eDdBRFlvRjVhaUJVM0lLM0pzTFlCMFpoL0xJeXNj?=
 =?utf-8?B?UGJENWN3SStMR1dlZnVMM2h3VHVYdU5rV2c5QUlIVXp3alhmVSs5aDA3RlZT?=
 =?utf-8?B?OFZ2LzQ1UHV1c2xwN1phRE9XN3RFOFVOQmJFQ0MvbG0yNmlwOUVWSE1DUDhw?=
 =?utf-8?B?aVZLSUVmVWplM3JRVDc3bU8zNEJ1K3pBNzVWU3U2ajg5SWkzQzdZU0hLdDg1?=
 =?utf-8?B?MllXc054Z2JSbkdpaDRpZTZia2ZMWS9HWVVnRXVnSWdFVy9ZODJ5RGxXMWp6?=
 =?utf-8?B?d05MRE5vaGhyYzZTU1NuYmg0WUJMS2RkVm5xUDFjY3g2ZlFBc3VvenVqUjBI?=
 =?utf-8?B?L09raHAzTUw4bVZBMzF5a2Q3RDFJaVIvSll1NEhyN1o4Z1lqenVrb1d6QU96?=
 =?utf-8?B?RVBoL1NEd1JDVXgxbTl2RllOMm5UNGtmRGFKR1Bha2RWM0hUcGtPVVQ4WlR5?=
 =?utf-8?B?ckhTSzZPZ0NRdENIcXVrSlAxRFBoSHNSUkNGL0JOdHd1S2tQUU1PeE9zQk02?=
 =?utf-8?B?dXZzRGVTVTN3bzFYZU5qQUNmbXBVV2pKdmJzaktKb2lla1hsVElJSmluSk9a?=
 =?utf-8?B?ekJRdStkYVBiUXJwL0d1RTY1VnE1QWRVbUN2aWY5WU0wZVpyeE0zWTJKUUtS?=
 =?utf-8?B?RkU5WXNERCtyTVZXbWp6bGQ2cFEzSUlLUks3MzVuS1JsYXRQLzlZSGk0TXJk?=
 =?utf-8?B?WThKNnAwZERUMnRUalkxejVyMnZNTjN2RHhyejJBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhGNnRLQXlxNmV1U2dqUVhnT1ZMR2ZsY2d4anpGbHJVd1I3S2FTa0xlMlJN?=
 =?utf-8?B?LzNmcFErWGNxOVZzaEk0WW1UVGc4S2pLazRyUlFuaHJjd3VkYlFBU3IvZ3FC?=
 =?utf-8?B?bGltRVhSRW9tdmRnQUNmN29Mdi84U244SUQ5ZWVxV2ZvL2dSdVgya2t5UXNY?=
 =?utf-8?B?NnRDYmhDcTBEeUJPMzJ6c2dPSmhFQVlhQmJKdUxWYzdkY1FNazcreXlpam0v?=
 =?utf-8?B?ZFcrY0d1dXFEOHJxSGdtTWJDVlhLOTZMK1BiM2pxRHV2anJUMGFVeWhZdmNX?=
 =?utf-8?B?MUtSSDBTTlcwL0RWRXBZU0tpNU9DUmM2YTJoNXpaYlhaakFPc0ZsaTlpV2I0?=
 =?utf-8?B?Vk0zQ0x3SnNEbUVoZk9tN2VKeTZPSHRSQUE3cE1NVkRkNWkzTCttVFhBaDVW?=
 =?utf-8?B?ZGNIMUtSeGV3c2RrcEFsNjRMU2MvRFFIYkYxYkNaVWdmUzdxc2FJa2V5QzB3?=
 =?utf-8?B?cnRibUN3N2s5dzJnYWdhcFBEUmNsUEJSNXE5eGFLOEx2dXFpSjYybm1oUDV4?=
 =?utf-8?B?N2tYeHNwcE03TlpOVFM5UzkwR1ZxamdLQVk3Y1RiZEpIM29MUTFLeEdZWml2?=
 =?utf-8?B?K3NmaTJXZE1SSXVZTlQrSWJpS0tZMWlESkh5dlRoaTJCNlREV1BUeFJlZzZs?=
 =?utf-8?B?a3ljbzNFN0NlR1Z2eE5mN1krc0tIM0hsK3lqdHkrNU91QzRqbnowS3R2alh6?=
 =?utf-8?B?eWJDbFNNRVNrR3lFZWNJQXM2NnZYUTV2WWpJVlF5MXN4VUhhd1p1L2dDL3lQ?=
 =?utf-8?B?MmpPWVQzczBPRlBLdkF3M1NHOVllZDVwVmppRVVRYzBxMkFhM21NTEhxTXpC?=
 =?utf-8?B?TmtZWk4xTW9TTHA5bnRoZ2REclkzbXhyeEdybXlZMyszVDkxeksvdmsvMHJG?=
 =?utf-8?B?cTB5R1lnSEZRcXduaS96cE9nVFpTcWhLbFRJaDRWeGVhM21ZYjJnRTZxSXh1?=
 =?utf-8?B?NUdmMkpSb2pTTUY4cS93dCtZMEw1RngvS1ZPbkdsRHF2YU9ZNUU3Q3BMeGMr?=
 =?utf-8?B?c1AxVEhQQ0ZRc01PVmhMZ3FYTnp3M3NHNWZWcmZPM3BjR1RuY1dNZWpBeTZY?=
 =?utf-8?B?QnBHR050WWo5TWpTdFc0YzNuQ1NsTnJqOUhIOGFZU1Z6L2VmRFYyYnB0TE5u?=
 =?utf-8?B?K1d6Y1BNUExSZ1grQmFsbDR2d2pRUXZ3M0Q4S3k0cnR2bFNtdmlTeHpTZ29I?=
 =?utf-8?B?Q2tWQm9BREtTY1Fsd2FDR3JVdVFXOENZbU1rTGtuVVFOQmdBQnBVa2Q5aUQ5?=
 =?utf-8?B?dUN1RHBnSTRyZHRHb2c3MDhqbExML0hoZHRodzFZanVFT29BUkxKRmt5MytP?=
 =?utf-8?B?dTUyYVg1VDhRUDd4MHNUcmg0UVlMWUtuYWZlZGFHTVYvSmY0RXJnN2VQRHhz?=
 =?utf-8?B?NWVSczZtalplenQ0b3A2VWdSanhBTWdUT2QwL3dSUHcrRHlKc0hQTDlYYzJ0?=
 =?utf-8?B?SDltKzdwYzlEMVJ2NGlDMUJtTUJEWmNTdUE1MzhCUjVZclE1NXRXWEhNNndR?=
 =?utf-8?B?N2ZIT0tOYWphQ0pCYXB5U2tlSVVYQy9FUzM5OXdRUVRRZUx0YTBIU05TRG1I?=
 =?utf-8?B?RytiWlo5STRmbjNwUGN5LzY1UTZxakZEdWo5dFRGYUMzb3VUVyszdWV5NjZu?=
 =?utf-8?B?Sm9FQ2F2RXN1ZXdZQUxWMTE0cTM0alNidUplNXYxcythcnFXMXBDbm5RSnBL?=
 =?utf-8?B?TkM2d3ROcE1FMjZrWmpVd3ZOeHJtZXJmcUIwMFB0THhFL1dBUEVxVTVEVDY0?=
 =?utf-8?B?aEZnR2lzTVZPTGdNeUFiVUhsTjNJanVMOGJSY2FJMEVJR1NSdkNyaDRvbm9Z?=
 =?utf-8?B?TWdDKzNPYWk2T2czMTZ3UXErZy9DbE92dUpZdGl3bmdBKzkvZCtYSk5HUnBD?=
 =?utf-8?Q?txwHWET+2Kvdg?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be47d08-fb62-474b-903f-08de91f9d366
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 03:25:31.7445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_202544_664971_85162F5D 
X-CRM114-Status: GOOD (  20.12  )
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


On 4/3/2026 11:30 PM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Gstage page-table helpers frequently chase gstage->kvm->arch to
> fetch pgd_levels. This adds noise and repeats the same dereference
> chain in hot paths.
>
> Add pgd_levels to struct kvm_gstage and initialize it from kvm->arch
> when setting up a gstage instance. Introduce kvm_riscv_gstage_init()
> to centralize initialization and switch gstage code to use
> gstage->pgd_levels.
>
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
>   arch/riscv/include/asm/kvm_gstage.h | 10 ++++++
>   arch/riscv/kvm/gstage.c             | 10 +++---
>   arch/riscv/kvm/mmu.c                | 50 ++++++-----------------------
>   3 files changed, 25 insertions(+), 45 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> index 5aa58d1f692a..70d9d483365e 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -15,6 +15,7 @@ struct kvm_gstage {
>   #define KVM_GSTAGE_FLAGS_LOCAL		BIT(0)
>   	unsigned long vmid;
>   	pgd_t *pgd;
> +	unsigned long pgd_levels;
>   };
>   
>   struct kvm_gstage_mapping {
> @@ -92,4 +93,13 @@ static inline unsigned long kvm_riscv_gstage_mode(unsigned long pgd_levels)
>   	}
>   }
>   
> +static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *kvm)
> +{
> +	gstage->kvm = kvm;
> +	gstage->flags = 0;
> +	gstage->vmid = READ_ONCE(kvm->arch.vmid.vmid);
> +	gstage->pgd = kvm->arch.pgd;
> +	gstage->pgd_levels = kvm->arch.pgd_levels;
> +}
> +
>   #endif
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 4beb9322fe76..7c4c34bc191b 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -26,7 +26,7 @@ static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
>   	unsigned long mask;
>   	unsigned long shift = HGATP_PAGE_SHIFT + (kvm_riscv_gstage_index_bits * level);
>   
> -	if (level == gstage->kvm->arch.pgd_levels - 1)
> +	if (level == gstage->pgd_levels - 1)
>   		mask = (PTRS_PER_PTE * (1UL << kvm_riscv_gstage_pgd_xbits)) - 1;
>   	else
>   		mask = PTRS_PER_PTE - 1;
> @@ -45,7 +45,7 @@ static int gstage_page_size_to_level(struct kvm_gstage *gstage, unsigned long pa
>   	u32 i;
>   	unsigned long psz = 1UL << 12;
>   
> -	for (i = 0; i < gstage->kvm->arch.pgd_levels; i++) {
> +	for (i = 0; i < gstage->pgd_levels; i++) {
>   		if (page_size == (psz << (i * kvm_riscv_gstage_index_bits))) {
>   			*out_level = i;
>   			return 0;
> @@ -58,7 +58,7 @@ static int gstage_page_size_to_level(struct kvm_gstage *gstage, unsigned long pa
>   static int gstage_level_to_page_order(struct kvm_gstage *gstage, u32 level,
>   				      unsigned long *out_pgorder)
>   {
> -	if (gstage->kvm->arch.pgd_levels < level)
> +	if (gstage->pgd_levels < level)
>   		return -EINVAL;
>   
>   	*out_pgorder = 12 + (level * kvm_riscv_gstage_index_bits);
> @@ -83,7 +83,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
>   			       pte_t **ptepp, u32 *ptep_level)
>   {
>   	pte_t *ptep;
> -	u32 current_level = gstage->kvm->arch.pgd_levels - 1;
> +	u32 current_level = gstage->pgd_levels - 1;
>   
>   	*ptep_level = current_level;
>   	ptep = (pte_t *)gstage->pgd;
> @@ -127,7 +127,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
>   			     struct kvm_mmu_memory_cache *pcache,
>   			     const struct kvm_gstage_mapping *map)
>   {
> -	u32 current_level = gstage->kvm->arch.pgd_levels - 1;
> +	u32 current_level = gstage->pgd_levels - 1;
>   	pte_t *next_ptep = (pte_t *)gstage->pgd;
>   	pte_t *ptep = &next_ptep[gstage_pte_index(gstage, map->addr, current_level)];
>   
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index fbcdd75cb9af..2d3def024270 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -24,10 +24,7 @@ static void mmu_wp_memory_region(struct kvm *kvm, int slot)
>   	phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
>   	struct kvm_gstage gstage;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	spin_lock(&kvm->mmu_lock);
>   	kvm_riscv_gstage_wp_range(&gstage, start, end);
> @@ -49,10 +46,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>   	struct kvm_gstage_mapping map;
>   	struct kvm_gstage gstage;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>   	pfn = __phys_to_pfn(hpa);
> @@ -89,10 +83,7 @@ void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
>   {
>   	struct kvm_gstage gstage;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	spin_lock(&kvm->mmu_lock);
>   	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
> @@ -109,10 +100,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>   	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
>   	struct kvm_gstage gstage;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	kvm_riscv_gstage_wp_range(&gstage, start, end);
>   }
> @@ -141,10 +129,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>   	phys_addr_t size = slot->npages << PAGE_SHIFT;
>   	struct kvm_gstage gstage;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	spin_lock(&kvm->mmu_lock);
>   	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
> @@ -250,10 +235,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.pgd)
>   		return false;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   	mmu_locked = spin_trylock(&kvm->mmu_lock);
>   	kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
>   				     (range->end - range->start) << PAGE_SHIFT,
> @@ -275,10 +257,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   
>   	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
>   				       &ptep, &ptep_level))
>   		return false;
> @@ -298,10 +277,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   
>   	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
>   				       &ptep, &ptep_level))
>   		return false;
> @@ -463,10 +439,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>   	struct kvm_gstage gstage;
>   	struct page *page;
>   
> -	gstage.kvm = kvm;
> -	gstage.flags = 0;
> -	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -	gstage.pgd = kvm->arch.pgd;
> +	kvm_riscv_gstage_init(&gstage, kvm);
>   
>   	/* Setup initial state of output mapping */
>   	memset(out_map, 0, sizeof(*out_map));
> @@ -587,10 +560,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>   
>   	spin_lock(&kvm->mmu_lock);
>   	if (kvm->arch.pgd) {
> -		gstage.kvm = kvm;
> -		gstage.flags = 0;
> -		gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
> -		gstage.pgd = kvm->arch.pgd;
> +		kvm_riscv_gstage_init(&gstage, kvm);
>   		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
>   			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
>   		pgd = READ_ONCE(kvm->arch.pgd);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
