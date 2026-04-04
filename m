Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF9EE88D7B
	for <kvm-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqok+PQKpDSqBu4VzKgovbfOSo7OUssgPKNbDM/5Wzg=; b=LLwyGrW/zxgZdt+Y49dqdLR7XL
	0WEQgr5x4CWLtCr0o2OyVitxkKBG/Px1/u3yN6DPJ6wW8eKX4TvOJcFl61NFRf3BV9Krxv/eY4P6z
	tJMk7EV+A/WDY1Mpq6ih5aK4kHNYtN/qxCkQwdxcLFyP3roHPVFI9ndUstBHUFLNG/YhCIuvc7nJ/
	hOgLWnhMZp8LdT6cO7i01bW+k+1MYkgJTOPnCXvS8yF9X/mD3ZBXzHTEAJzxEaRoJ4qUrt3NXnE7T
	KPFmvZhuf6MNBfwcZEph7yFCCwAkcGQX82MtFH7zwOyG0PV41OtstHv9/Jq0I9UcgIVOgwtm6Uux4
	6b3Idx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8reA-000000034WR-3TF8;
	Sat, 04 Apr 2026 03:26:06 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8re8-000000034VW-3aQt;
	Sat, 04 Apr 2026 03:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKVl5wrNkGszdzmEjrGZv2awyxuzgMkqv1pHyh79ejFualjUn+hK5uKrr0OEFdRbl1tRrRZZhgCSWLTJBAWsj1jz7lD8zP3mP+6L9v8PiYcanqrLgTH6aJOwInU0jOz2G+mYF+mFdTIs1g0zJ7PsSEFLkvZjTVbMs5Rs0hX6sSRPPxFaOnt+9IH/RErSSHtvhdMyJtdqShb7nbcK/o5bbIg9aIb41S0jgOI19qMZf9hU31K89hW4bLNOSkRf+WbQqsm2bW7Bf5bswkih4gZpe7H3h9DXuDuhZtDJMJI1sTgG5Kr1NzKEeyf2CEnEQk7rtmgm6ntCrusyfNx+3YO5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXkRKqNh8UFD+x3ZfS6A37hclc/i0TwEFARDWI10Shw=;
 b=Fe4f0hjWGbfb/JWSCLCdTpGQFr5se79I0kXj7R95JyjWq4kLuHCMDtmJ9K4G6QRzTnBLWOVib4nKSO24pmz359Y8uMkVtOGC1JNgC/5nXlRbneXMujnldof01Io7NjufanP1qe0v3qi6BamosXcvPEoFTvihAnl9FAKC5UM7uOoe/C/OiD/HPNT6lmXW2D/p8RfpVmEZn8rsRY1cj+4i732ttGQzaok3yYF1MppSiizD9skHA7Gfa4omMoxo+JNqoSpLXVv89qAeVjKV5EzOh6EOWqe5HT3YlDmLL1QuHOXAahYZWeFtHaKWK/x62W44zdIT9UBS+fdHajzZZ71NFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXkRKqNh8UFD+x3ZfS6A37hclc/i0TwEFARDWI10Shw=;
 b=Vt066fa384lMjOOM2Hh1ayv1fsdcXX5GtsfP+okKzuEFcuOOccW4oqHnauqHc1705hPCsG209QMq6Ra9TwRtP02rhZxTa2JWrAH1BFwbwfL7yYk371YvFnrdwIT385sopTkM7L9+RVCGz0EzyMV0c/qo+dXLMVFf4Gk4jGUNwfK1MG5tvN1sxNxpW9rHLVOuAONK6/Et0wU66kSCdiQNss62o/Ilr9gpcq6n4LFNrJ11cdNOloCm+u74btN7ch4pmJWA9vMLO4d5m8mKicQoEpzCUs3WhzJIdZYMbYJUGnvydmd6rtwp6d/AAoWK/zuGuVnPG6AbReqI/fQ5Vl6i1A==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by JH0PR04MB7622.apcprd04.prod.outlook.com (2603:1096:990:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Sat, 4 Apr
 2026 03:25:53 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%6]) with mapi id 15.20.9769.017; Sat, 4 Apr 2026
 03:25:53 +0000
Message-ID: <SE3PR04MB892204ECD2CB1D923631D931F35FA@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Sat, 4 Apr 2026 11:25:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select
 HGATP.MODE
To: fangyu.yu@linux.alibaba.com, pbonzini@redhat.com, corbet@lwn.net,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 skhan@linuxfoundation.org
Cc: guoren@kernel.org, radim.krcmar@oss.qualcomm.com,
 andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
 <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <37f37e5e-fa3c-49cb-a509-1d14c05c4923@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|JH0PR04MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: cad1a44b-4253-4002-48fa-08de91f9e062
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZmcv7cN2CQdJd4XVKwegu/4uZqsT57xel9pkl4vqKhhE9AxmF2a76BUFbSMnKri9nrWT2FQ24PiNftjXCCPvGJQb40Nfe1TL7FQ3haDSK1/aXxdRcvJxr9bRCAUaWU9wxSBSsRWRYpUbLTy9/lZPiCRrtrbNaTg/w2ptmWxmQAGDwEI4t1JYM84pMZU49E3uN9HGtNMjvw6dl9ze1FmEl7VEi2adJyQjafyd3baxRMreKUxatR0sJLpkNGh7Df5pJFbJ6YuVFPHUIBvm8yMzlwtXpww3SDBcAaAmgQb9bFUwELNfpYlsmcJfHIK62iGqp5A1X3l6P0FQpasUFn92Cc1mOO19ekNqzHUXGBXUzLbqDlzl7ebJbU384hIC4ofWSafUxhEQ+0ZrmGwNzcevU66UhfrtLDGabfc/3u9Mmr0CvjRF5uhJBiJvn/PeAthVn+HzaOQAZBaFS11vqZrAE/32VWK51NZTio8aABTi8ThX3u9Ap50Xv654VeEufAYay0z6rf0uM7lnA7XLzsLYI6Gbjx65KnhTH1gzEdmcX+vdkrI/CcDMFOZTOUoSkEpSCCVxfq1utRTzsXD8US86wv4dILU5qKIHzmCsmkQCtYHhUsfXbx9hkcN6SHYFv7QD1iDqTxTraXFpt4Og4QpxsfKpTIyyjZF36pVZo0bYW34HsDUrSc8sZt+Z5igJHU4ma24Rm6jJR8+FrZX3ZayY0Ma4CrucNA1nRYdqM4rziItfMsUmdIO6wZfCbG0kFsw+sZ3tklWhRFlEh5UCF5DDF2Bnjf/svJooA4WN3oz8WUtYfo4lgdQ9FOM
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|12121999013|23021999003|19110799012|41001999006|5072599009|6090799003|461199028|8060799015|7042599007|15080799012|40105399003|3412199025|440099028|26121999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ui8rczJ5TjRrY3A4d09pZFpNeGlsbFMwNGhWM1ByZklxVXM5OVljYkhpRWxp?=
 =?utf-8?B?K3BNRm5XRERyQVhkM3JWcS9vYjc2UTlycEYrZEhuNUZyamRyNGROVkJTTkYy?=
 =?utf-8?B?Mzh4R0FjWCtuUDBPSjZtbkRNd2gzNTVpNEgvclllc1J3MURBUkJHczJjbFZN?=
 =?utf-8?B?b1N6TnE0MHN6RzZnNnc1WU1iRERHSGI5OG1zbTlFWTZQcTNiNlkxb05DWjRz?=
 =?utf-8?B?MUV2YVB0cnpCT0JSMmZuSFVadlQxVENFdWlWbTZMMXA4SEh5b3Ewa29zTlBo?=
 =?utf-8?B?S0dQVmthNFdmMGhjUm5keGVhOVRLQ2ZNUWpodDFzdTF2RHZVWWRIdnk5RnRh?=
 =?utf-8?B?VWxPSjJva0RHeWxYQkE5b2tVZGR2MFM2RUswUU50STVoK2d0ZHJRd3l4dW0y?=
 =?utf-8?B?cEZXb1ltSnRSV1ZWU21JNXdWVlJncmVtQU5QTWZyYlRLaDlwdHNoTVRnQS91?=
 =?utf-8?B?Q0pvaTNpYVlMQ1E2YVg4elY1aTNqSnhwZ2dVTGV1c01HYWJnakpQdkJmakww?=
 =?utf-8?B?YUx1ZGdJVHZ3MGVEMjNyTzBlZ2FrZGlhazNwa0pVcHNsUGZZVnVFNTk5d1ZN?=
 =?utf-8?B?Y0lSU1U3eDJQKzNqczBRSFFpSmNwUWxJNzk5aTczMzMyb08xT1NEUWE1L0VO?=
 =?utf-8?B?WCtRbFk3VjE2Y0NiK2s1QWtqMERUSlBQdnBHR0JpNDEyNXdpSUg4ZmJWNVJr?=
 =?utf-8?B?ZXRnWkRselVLR09JV2IrNmlhd0NZY3VjSkIvaTdaRU9zUDlkbFVwcU1GRytW?=
 =?utf-8?B?MlBXVElBYnBWZHR6Q0l6cHNaUUkwbWdnQk5DVGZkS0ZCKzdjRUNkaFFHa2Vp?=
 =?utf-8?B?Q2F1YUtUK3BGa25hOHh1REVXZDVYT1VHT2JwZldGS215bXM2cWxVd1dLOTFC?=
 =?utf-8?B?amdpSnNXT1RkWjlqcjdyeHNWMVRDaDgybnNPS1NsaEVwb1FWSVhpdGhBQmE4?=
 =?utf-8?B?RGxMbVNYOVRIazIzVmE4WVhBazhxTUhmVGlsZHJoUk9zTDhKaWVrTnZHNUxO?=
 =?utf-8?B?cmgrY01hUGNaajdMc3hyVjhjdG5pdVhHbk54Nkdwdnh6Q1dEZHNnRm4wUnFS?=
 =?utf-8?B?QmhJR1BWZ1MwczhpY2p3UDJCOXIrQUY4ODVuTW9IUW5leTZ0L3ZNVTIyNEU5?=
 =?utf-8?B?Zk0vUnd1THVReCtBRGRQemZzT01PUzhoWVlRdld4MS9UcDl3TitZemFYclQz?=
 =?utf-8?B?YU1NV3l3OFdyTDllc01BWnAzbEZFdHRpQ2QvMkdSRUg0aHU5cGFWYlRGZEFn?=
 =?utf-8?B?RGRVenNZbE9jYk5xV3NibGNCa3Nta0hpWkxWeVRYOGxCbk12dkxZN1BndmNr?=
 =?utf-8?B?TXFMRmpFL3dVTG1HR2V3aE1QZjlSZ2lVM3dtMktjeDJLN1J3YWhZQXN2dlJI?=
 =?utf-8?Q?Tys4T9THH0U0k5u1iDRn6AMCpRn8Q3Jk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVsZVd1WnU2ZmtyTXFsYkp3em9nWCtjY3FObGwxcTlvWFdyNmpXb1liK1pR?=
 =?utf-8?B?SWNFMmVHNlZ4UHR4MUNTSUlJeUdqa1Z1c2NuZGZZeVJLNnkwZ1ZBTXh5ajhH?=
 =?utf-8?B?dlFrcXZCc2lnQzVOakdDdnVSdnZtUlRMUUF0Mys0cmtBK1dlbThHbnJQS3JE?=
 =?utf-8?B?RkswMzBvMElLU3E0L3FKQTJTRTRSeDI5ejd3cFFmSDdHYldESjRNcWx3Ly9M?=
 =?utf-8?B?b0I3SXRmZUxYSjZHM21IY2JYd3BTZ2xuSGVWd2YzUUhVc0pOMHJTUFUwK1Zq?=
 =?utf-8?B?VHMyV3lGdVNpYVQvbUdSR0lPNUxYYTl3c05jRVRjTURMQlVYY2crL3NpYzVF?=
 =?utf-8?B?RXM5dnU2OWR2ajhtTGZoZVkwbmJrU0ZvNnRrZVdGY3M0SUs2U3RTdFZ0R0t4?=
 =?utf-8?B?VlBub2dUclVZaSsva2Z6WVN3S3kvT1pCMXFLL2k5bVJwVGoweUhRa3gwbkdr?=
 =?utf-8?B?UkJJQVdLWHEwbE9Ua2Q1OUhCbWlWYUgrK2xRZlhUeTZrT1lFS091M1ZBZllM?=
 =?utf-8?B?TmJyQmo5bFhCK1RvWjEzb2pscHlseUhCVUk3UmRUNEtHc01iNzl6VXordTRL?=
 =?utf-8?B?U3graHIzZUh5bE9wUFlnTUZDSHVIMTQxVVRoakx0WmZ4WndmaVNHWlEwcDNn?=
 =?utf-8?B?Vzd5TWhCTENpb2ZVY2hVSTR0SnFMZ0RoZGJDaE1CdkZaM3dQbFNWSWt1WEJn?=
 =?utf-8?B?RDJlQ2M1TUgvZC9RUW51WHZzc0pyb000QmdVNkFxYTI5cEZpVWUrQ1NhT05j?=
 =?utf-8?B?ZWJJMGxOYTZQVm1FQVd2bDIyWXFCYlFubndkWTQzeTBsTnRMaHBGWERoUktI?=
 =?utf-8?B?N01WVEYvcXk1QUVoWG52ZHZxQ1NpN0oxbGl3UzVqeEwvRE5RSExwZnVQb0o3?=
 =?utf-8?B?T1FDZ0RjajRjT3FoUVNFWEdsSDVmdVhMUVE3L2dCVDhJZW5ST0R0UzRZQkxY?=
 =?utf-8?B?M043eUJtcllibTVKQlJBWjI2Z1VqbTJERmxBVldBcHY4OEhjWGZram54bnRv?=
 =?utf-8?B?Q1NaMU1Id3dDK1NaNDRFVWI3UHU5RXd4UWtZVTY1ejh3YkxHTjUrYmtrTUZW?=
 =?utf-8?B?cjdKZm96dXNHWk9COFdOSThtcGliT3RTUG13ZEV3VUVCV3JtV2lsTGpncFBS?=
 =?utf-8?B?QTlhdnQrWkFBWitsRGYydjJxeStFWDg2UWZxNEYzbWEwbVd3Wmd5V2JYL1Na?=
 =?utf-8?B?TlhQQXdvR094eExpd2tEVlZKSXVjMG1KS3FvSkdXa3h5VFhZbWl0TTF0V3ZV?=
 =?utf-8?B?Y1ducXdPOHk4M09WeHBVMzFQcm1tYmZoTW5ZZkpUTEc4N2RtYS8yZmoya2ZN?=
 =?utf-8?B?cTA2MFd6WlVkZm03NkZTNWdQS0IwT291VXdNNjFzaHNhNzd0VXQvWTRVaUM5?=
 =?utf-8?B?RmdLSnlJc2JST0ptcEZnVnFxQjJzTndSMVFqUnVwdkFnY2VqOVRVRVFxd3hG?=
 =?utf-8?B?ejhXMGpBVUxienloOTJXK2FWb3BrekV4VnpBaFoyUE4waDVQRjZrK2gvcUtK?=
 =?utf-8?B?cEFEb2hFWXhFdXZQZG53cU1UcWNWUWN6dFBUMjBPUGVJNUxBUjJtN1FlSHFN?=
 =?utf-8?B?L3hZUElmUHpJQUdwMkx0OW1MSzZWbGVnMmhBcEFxU1A2aCtkdWtSZ2VQLzJk?=
 =?utf-8?B?MDNPQmd3N3dyNUVaczVsVmkzeUZRb2FwUTNSOEhvTE5DajhJY0l2OThqUW9i?=
 =?utf-8?B?S1AwUGczNjkzU2FjTnVnaHJYN2ZVcmFIRHpacEdyOXNaclFiL0lyU0lxU1pB?=
 =?utf-8?B?WllmbjduRnllcWJtWWJwWERYb1JHYVUxalIvTkZraUlkYjZOVXZCWDdONkl1?=
 =?utf-8?B?MUN4M05kb0RVZVVEL2RUSXltSmN4VjlnQy9DSjBxLzJZZXVSYUtwUkxER1kv?=
 =?utf-8?Q?KJdOn/nd7dXoP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1a44b-4253-4002-48fa-08de91f9e062
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 03:25:53.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_202604_912061_64A35D87 
X-CRM114-Status: GOOD (  17.03  )
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
> Reuse KVM_CAP_VM_GPA_BITS to advertise and select the effective
> G-stage GPA width for a VM.
>
> KVM_CHECK_EXTENSION(KVM_CAP_VM_GPA_BITS) returns the effective GPA
> bits for a VM, KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace
> to downsize the effective GPA width by selecting a smaller G-stage
> page table format:
>    - gpa_bits <= 41 selects Sv39x4 (pgd_levels=3)
>    - gpa_bits <= 50 selects Sv48x4 (pgd_levels=4)
>    - gpa_bits <= 59 selects Sv57x4 (pgd_levels=5)
>
> Reject the request with -EINVAL for unsupported values and with -EBUSY
> if vCPUs have been created or any memslot is populated.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
>   arch/riscv/kvm/vm.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb7c4e07961f..a9f083feeb76 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -214,12 +214,52 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   
>   int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>   {
> +	if (cap->flags)
> +		return -EINVAL;
> +
>   	switch (cap->cap) {
>   	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>   		kvm->arch.mp_state_reset = true;
>   		return 0;
> +	case KVM_CAP_VM_GPA_BITS: {
> +		unsigned long gpa_bits = cap->args[0];
> +		unsigned long new_levels;
> +		int r = 0;
> +
> +		/* Decide target pgd levels from requested gpa_bits */
> +#ifdef CONFIG_64BIT
> +		if (gpa_bits <= 41)
> +			new_levels = 3;        /* Sv39x4 */
> +		else if (gpa_bits <= 50)
> +			new_levels = 4;        /* Sv48x4 */
> +		else if (gpa_bits <= 59)
> +			new_levels = 5;        /* Sv57x4 */
> +		else
> +			return -EINVAL;
> +#else
> +		/* 32-bit: only Sv32x4*/
> +		if (gpa_bits <= 34)
> +			new_levels = 2;
> +		else
> +			return -EINVAL;
> +#endif
> +		if (new_levels > kvm_riscv_gstage_max_pgd_levels)
> +			return -EINVAL;
> +
> +		/* Follow KVM's lock ordering: kvm->lock -> kvm->slots_lock. */
> +		mutex_lock(&kvm->lock);
> +		mutex_lock(&kvm->slots_lock);
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			r = -EBUSY;
> +		else
> +			kvm->arch.pgd_levels = new_levels;
> +
> +		mutex_unlock(&kvm->slots_lock);
> +		mutex_unlock(&kvm->lock);
> +
> +		return r;
> +	}
>   	default:
>   		return -EINVAL;
>   	}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
