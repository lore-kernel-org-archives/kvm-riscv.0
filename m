Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E864CD8C90
	for <kvm-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V174nO/N9LnDke01+MpwL/ms2lloRnczHAIK2paMJ4=; b=yeeNa05Z7Zpv4tpPUcbDKkxq9g
	9UMV4LuFntbOH3KdvGVkfYw3yYFLX7l/utqB28CAhJ78qZ5L9L2hCVC4JlU9RJS1UV3GhjKJrv7gF
	u6N+/AYi1Q1xAMs+DgipY/ekrfulUk8JgKgrdvzOrKFS0KvlkE4kV0Xjxht2pVY9dUxuiuftFI0/G
	qrp24gvWpn5LeMjwnNtIUjZ+qi3KLDzcCmFArv3W1kN7XTfdhHPsFbBdULlsdAXGzNLwfIWgPOtkA
	ZujqsmgMuHLz2zR9GzDorhlxLQPwbcYAfVonJ24ZSCo9VOYbPutBVDelOLevNnVslazhJwC1Jq5Gs
	4FKEKNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNRN-00000008ECw-2AaI;
	Wed, 10 Jun 2026 18:14:13 +0000
Received: from mail-centralusazon11011062.outbound.protection.outlook.com ([52.101.62.62] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNRK-00000008ECQ-02N0
	for kvm-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 18:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT369nfkbHNw7KmVRlTSq4RQKqCOE/jKD30QFDpVPC+vYzmnMjTGIAthqlMRsEaanv4sxiukPjKnxasiOkP1w0JohwnRAhNzlzR13FJ9qj+IBjpxsKMt/F2zCb7WKCL1fHd8AGEmjhUURvqnp02wOPhLtkje4MdpSaRhgdwUaG9WAFnciZwrryDO4YMkAkS0RgojT2Jyb3i2uwaGj6PO7AKAExAeml5HC6udC54oMU1mEz5AEU0AwusCvitvQetmy7AadFIx22uCiBlmHZNByWOo+VxZvwNeH54YveSHjcDXT/bZXnX7LJHvfJZbLj3LVfbWt2UnU6btaEmunz9Ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkS1FTd+qbaNr9HqaYWVqCBsm78oGqOVbxJkY8Ve68Y=;
 b=g25dqjAmevSWxqBgZXiGBB7ZjMC624tFM/A4u7fLTSLvsaG/PanBUU7YUhcix/j7wmgp8wymgAnSt749I6JBb1lrFMXWKO3YnD7yCLgWyxprsESZuPITj1fwBIT1zGF4mcDdoNyLzJPewnWGDcCEnD9Vv+0J8zMO8tV29txpDOpsJeO+yqClHxh9j/E/41HThe1HimZ1bfaKzTexnAZDKVs6qCWR3rGW2Snq4Jt0PsBzy2bZvlP+j+uMn1f+O0vGVMe2+Qf/fkvmY6jpY2nxTqnDlGS4RXWcA6zooVsKXhTKbQf8TgGcXbAiynz8NZCwKUSywDsF5qxOW90PR8dp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkS1FTd+qbaNr9HqaYWVqCBsm78oGqOVbxJkY8Ve68Y=;
 b=VLO5u0YpzdY5MiuzFIRaEu6JSGGiiRpjua7AecQFkFBVMOVip0aPhuJq9lH4VVC9XWnzHYnq6Gz6W0D3Ksn0csYNdWx7LSGmCutAyv2+YHrcntfG/30bFDir52IIsLlYMoaIscPG2KFhS5/2fHHJBlLYSsyiH+OiSRPOlBwHVnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 18:14:00 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 18:14:00 +0000
Message-ID: <3c4c6c24-ec76-4085-b6da-cadfc8a229aa@amd.com>
Date: Wed, 10 Jun 2026 11:13:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/60] KVM Planes + SEV-SNP Support
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b4ca4c-1c34-4f54-d74d-08dec71c0b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 85rVobyKmzAiMmj0x9bsU7nkxs2Ql9SZvtnsjHoHirXMbPzb7KoTTAbXcInHr+dDsC0rWdRdA1MPfbMB1ZYC9yjdt1OM9u4tM+Y0HNvJmjeFxeRqxtmu/byzJPJMWDkO07lopvy5zRxgFWAHixBUvaTG5IjxBxEJwa9+Biex/XMkB7ktzh6JnoNa67BUbSZ/Oa5nTvDJ2zpRjOIfjqDzaii+bjGz06ndPhpsrmWpbYYhHdkRkBEjSa9SP0QutITV1PnaJp0o7E5UFBICbi8fd6Dib0b51H/BHuoScV7lKiuWU1QgGaf9PBoA6/xGQdD4pR0opRiONWOZIj5QWCGuNlqNJ24M2oViLZ/yy6XITXhZ7FD+9uz2u2rm36xzhjpmanMI6gQmPxFEQ/d3ut1vSQq28QgxyP386sM/ljUl6MTRxMGJJIafHmhmarRuu7BKrplcMRibayOgdtLJ/uJa9tDjYv/VmLQmhoVjgQ3Twjz8q35HMx+GLg/csoWWir1OPu0Oy/OphO52+6Ap7OLhkiOdnrYZzbO2xkCZwc7TtbGTo5nmOYFWkB7mwfBTmyXH517lNvTU/PIzeWyaD9bqCwWo0vpAQG4vLyiPpfZRLyzkHDqnqwOcw+2sAcJhoaHwoKZdKi7+FUXeQolCRkpHJ5ieXCm7I+gDkdPPu38XknKKOTBWloB3KmQ5LngJ4sxI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJwYndwY3ZQOE1aeHkxbS94cGp5NmRvd0k2QVppNmZhMGdGUEppUEpkTlMv?=
 =?utf-8?B?aUFWdGZoZHU4bk9yUWp2RmpsczJycFpKcmorR212TFZNVGo4QXQ3ME12Mjg5?=
 =?utf-8?B?aXZMdEpjNURVWFN2enhSM1lvZEhLazE3QndQN2p4VFg1aVE3c1RnVUVQRGl0?=
 =?utf-8?B?aDZUSkJXQjhtVldHOENGdVhUbVphdzRsRjdPMVYvRG9hTWR4SStKL1VFN1Fy?=
 =?utf-8?B?OFJ3TGttU1MxK1ZHVlorRWh0UXE1VzRmU2JNTWUxdUFWb1ZNWEcvZjd6OVgw?=
 =?utf-8?B?d3F1TFN3QmR5ZlJodXVsd1B4bFhZVHpySE9zbFliMklubEt0K2UyeWl3eWhh?=
 =?utf-8?B?OTZGQi9BOCtTQVVacm5vYm55ajk3M0tLVTFIc0JFeCtYNkF3aVRYcS9IcWMz?=
 =?utf-8?B?eHNPakswelpFYXo0YVhXNmxZOGNNK2dEaUJEZmdXTzJtNDJzWGFrd0N4Ty9y?=
 =?utf-8?B?ZVdrUFV2ekNtOTB0ZnFBd2RTU2hTVXFDcHhjNWs1a09TQ3IzbzZnQUJnckpS?=
 =?utf-8?B?SWRhUkJOMzV2Nis5WGVIUTBneEtSZkkvY0RyVWI0R3EyYVJjTWV3VnorNDgy?=
 =?utf-8?B?YWNXNy9QSHliaHJRUFFDcUxYVTdBNHJTWUErSHRDeGdhVUFNUTl3LzFGMGdW?=
 =?utf-8?B?aHNWczh6YTRaeE1JY1RKUzVNU2U4Rmd4OWxuUHVpdjZFL0hKcVArV1BUcDI2?=
 =?utf-8?B?eW01b2NDTFVQckxFV1p4REs2M2pOcnVPcC9TdGxjR0Y0M3dSamhSa1ZFVjFL?=
 =?utf-8?B?TzRWaklxNWN6MGJ5Zy9WYmJYdkZ3VDVOdytQK1VBL05zOFRxcVcxQTdLbTlK?=
 =?utf-8?B?clIweGthdU1BdDV5ZlBTRWxJa2crWkdJZVIxMUZWQTd3NXBTS3Vrbk5SakFD?=
 =?utf-8?B?aHIrZTM1STE0UUNmMGlOcE96ZVV1SzlCaFUwbjZSeFJXZ2hVL3c5Z3JseElm?=
 =?utf-8?B?cy84T1R0OTc1ZzAwVWppVXZTdjNqTW54dnlHZjY3Rk1aS3JHYTdBR1BjSDZB?=
 =?utf-8?B?L1VTcHY4b3NYUGU2RUh1RnQveCtadHhPeHhGZFNTV2NEWVZxRUZHRVF6ZHpx?=
 =?utf-8?B?MTYvNDNRdy9vck1zWVEydS8yOU1JZnlKeUYwT0VJbGdzU0hnaDQ4VldVcjRJ?=
 =?utf-8?B?UXR2bU9KYThnZ3BIbTBka3c0V0M4dFRUZVVEbDdYTUdxRFdiN1BFaWFwWDBI?=
 =?utf-8?B?UHpXeFBIbndNd0k4OWZlZXZJQWxqZmZhRC82dG1WRzFKOFhxQmN6M1ZKcmpp?=
 =?utf-8?B?OEV0dzFFcEdEVWNJZWZoYnlWa2kyKzZnc2djbHdBK3RJdncrd1ZpRDdKZTFG?=
 =?utf-8?B?WU1KUlZTZllOckM2T210b3IvVDB5K1hNblZIT3BGQUxWY3M5aUFhaWNOc3hP?=
 =?utf-8?B?Q3NNYmpFVHRvN3RyMVN0dHVxNWdnSUN6TmxTbUg1TzN5dENPMnhwZy81REs3?=
 =?utf-8?B?NHZvbDFXQ2ppb0JocStzU2pPNHMrdjE2dVR1UlFxUFZMTHJMdXNka09zdG45?=
 =?utf-8?B?d09aVDdiSzY5SlliVHpUbG1BYVlmWXZ6NDBoUExDRTc4UTFzY2FpdTdCaS9x?=
 =?utf-8?B?TXZoR1l6Y2w4VHoxSmwvbXlpVmY0MGZ6eGx3ajZUQnBhaTNURWVmN1ZLZHh5?=
 =?utf-8?B?dU5LT3VvSXpmVk9EVkVDT1RpTDZrU3NNOGYwbWRHRm93RjZBM2FaVXpxdzEz?=
 =?utf-8?B?Ty91SHd2d0NaWGN2WDdWMmN1VlRFT2RSQ0V1aEFtQkVwakI0bkZIZGVNSWgy?=
 =?utf-8?B?MEp3cC9YaVRyMCthYUpNQjNOK0F5QWF2VlNtRU1Cdnk3OFB2V0lucTJZK293?=
 =?utf-8?B?b1JpTFpxY0w4YTJWWmQ3Smc3MHdMYmRlTkYxdURPaDJ4K3VORjllWDZjZ3dF?=
 =?utf-8?B?MGZkRHNFOVdMOGpWaXRkeklmbGVRWUpnODU0MTVrZzlzNFR3WkJxSmF4S0pz?=
 =?utf-8?B?VS9yTmpnZnlOZFV6VGFtVEpDM0lVTDkvSURxSm9ib1JiQnQ2S0Y0Rmdvbkhk?=
 =?utf-8?B?QzhwODRoOWxCT2dncXdhMWJRb1F1VGxETFpMdDJwU1Z6N2doZExCc2R4cTJY?=
 =?utf-8?B?ZndhMVg3dVpFOWVJT2pYV1pRWlM3L1R0VE5rRnowenlZd3J5Qi90TzFqUE9Q?=
 =?utf-8?B?UDdvNGZnOHRHVHRMdVI2bWNLSDBwYmZnYnVIN3RXbVBLVFFCSVUxWmFyb25H?=
 =?utf-8?B?TEg3ZEtpLzFpNlZ3Sy9zY1lqM2VNbkczVlJjNVB6cmF5dU5ZcTJQQXc2R2Vq?=
 =?utf-8?B?VnpVUXZMMkNJTzk0bnJVL3h2akJUNFprQThPM2QzQ2hzTWp5Z2dkVnZhVHdO?=
 =?utf-8?B?eHh1V3NGekowNUx1aU9jRCtZSUNrQkJLZkVGSlJ1WGNRbHNTWXpZZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b4ca4c-1c34-4f54-d74d-08dec71c0b89
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:14:00.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+Rg3KGvROGFm1p95CNRxo1p8Fw3mpQCssxc/9Xmhd4JJxA6pqRX6qTQQvbV0FtEYTz03B48tas2e9pYtD/xLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_111410_190808_4BBE6D4A 
X-CRM114-Status: UNSURE (   6.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiA2LzgvMjYgNzo0MSBBTSwgSsO2cmcgUsO2ZGVsIHdyb3RlOgo+IEZyb206IEpvZXJn
IFJvZWRlbCA8am9lcmcucm9lZGVsQGFtZC5jb20+CiA+IC4uLgo+IFRoaXMgY2hhbmdlcyBkZXBl
bmQgb24gTWVsb2R5cyBwYXRjaGVzIGZvciBzdXBwb3J0aW5nIHJlc3RyaWN0ZWQKPiBpbmplY3Rp
b24uIEFzIHRoZXkgYXJlIHJlcXVpcmVkIHRvIHJ1biBDT0NPTlVULVNWU00sIHRoZXkgYXJlIGlu
Y2x1ZGVkCj4gaGVyZSBmb3IgY29tcGxldGVuZXNzLgoKQnR3LCBJIGFtIGZpeGluZyB1cCB0aGUg
cmVzdHJpY3RlZCBpbmplY3Rpb24gcGF0Y2hlcyBiYXNlZCBvbiBBSSAKcmV2aWV3cywgd2lsbCBz
ZW5kIHRoZSBuZXcgdmVyc2lvbiBvdXQgdXBzdHJlYW0gc29vbi4gU28geW91IGRvbnQgbmVlZCAK
dG8gcmV2aWV3IHRoZSBjdXJyZW50IHZlcnNpb24uCgotLSAKVGhhbmtzLApNZWxvZHkKCgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
