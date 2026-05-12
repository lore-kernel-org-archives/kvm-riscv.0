Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E6CD4851
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Out4diRMf4Ow4vPSEHts0EqtV6Mxy69YjOZb+mSA0is=; b=JO0hduZ+JoP213
	cTcF5QT9noeFgrueViXhsLaLE+wZ/77crm0XaFzBQa7Gy+KWpWjqppXiCL9vHz/Z8kILD61G1c0iG
	z8VH3r5Aa7ahyp03jTNvd+0xa2PkCEb6YMCNwg4Q9yr4Af3PY2GUmcQqzidZN4eQqlWvuWSl31rG0
	L463vgJEa5JDeB4KQ38WcbZDDo4sHxVTT2LaRpfFWMs+ilSwahj/5lVN5moleds+PIOPijxQrIECd
	T+JR9NfGc6raLC8uYSg3Tx3+j3SQ+SSMLexYw0cNhraNlwgZXbEyYQha8qmjoPdPocE8/7r6XMT9+
	3KYfih4bPYTwOLd2F8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmUV-0000000Gi5L-3HZT;
	Tue, 12 May 2026 12:45:39 +0000
Received: from mail-eastusazon11011065.outbound.protection.outlook.com ([52.101.52.65] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmUR-0000000Gi1L-04B7;
	Tue, 12 May 2026 12:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0aTcVtXJ8fu81dEvAOHKqJrvXPnauZkynkhTFv1B52HqQwxl0ipQ2zxHzrdDKX5LPbRS9T9GZIHGKsHv5M8niy7/Sz/nRx/k3OkMwLXtZebWQmCiHwHnG0dVyL33ierRjoxT6MgEJjau7wsehw6e6hYNsvnFlouDKMbmmdfUoRoubIqqRd+qyHmtdAnn6lR9YYZM51VtW+V0fc1fUla2+fgkg5GbsJ5AZ8wyOxWzGzokeeacGiJKAYN4ZivRZPT1XWxudy4UzPpd6bLpl6Xv3lCo7TTJEHtFWDG7jnmwYiYf0+GNbDrErlO6upPuuoN0mulQ11NtVhWQOkQuMTJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS90+hDWkoQMXjPoyhb+n53wP1Mdv1F1aMvPO5wD5Ho=;
 b=JL8ucRKSYAZfwwbpxZJDD7hRNoRC/KMe6IF85abQA2nHXvNRJDkOEnIZyJPM5uuA6Y2HVfLszohCzqmin8lce6yApykOye6LXF9PxXdoUV1fQUt5Jd8da+jfN03Sblz1yRINhdYfRoGPh2HCFeRtUahyz6p8GRT8TMYcsdvfXoSTREJPugocQyb5HzG28bxtC7NphjMprIqwC4kXHjmypuPoBLB8mMZtvFEHyhRryYV7jCv5JuVJweLCAkPTTtnCWpgt6DHem+X+LDgTZ2u054KqtfCXonZIqIx41Khh8Qgh6fdYrvrKZayRh7hhF41n7MzRneDMeR0tnsV9P8FQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS90+hDWkoQMXjPoyhb+n53wP1Mdv1F1aMvPO5wD5Ho=;
 b=iyWIS4BItjEe5YO5pnJ29E0waSsLARzUrf5pOOeydaUNYUS+iMH+OcBf+I7Ib05XtCFWPHR0KAImNVNs4J1MPoLRe0dDR3EbOlLMMSyLGvAa5vTBHUsGdo2fJ8SoQwbDdHxLUBnhZtJOelmeKSijLHui2DTzklbAnaaxTmd79L39OZvsyOGiQfaTJzccS2G2RveB6eIXy45S0mEERtFjJ9rNuZD0rnCk0wJEPp9qTzuf14WQni7fNKXSWX7KVFM1WOuanTaW2CBCoaEQbfhLgczJz61+xJQAl776g80eplrv2kxJIPw4VoCgmDWBMIFyIJe0t1z3FKe+7vhhoqLAiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 by BY5PR12MB4195.namprd12.prod.outlook.com (2603:10b6:a03:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 12:45:23 +0000
Received: from CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3]) by CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:45:23 +0000
Date: Tue, 12 May 2026 09:45:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, alex@ghiti.fr, anup@brainfault.org,
	aou@eecs.berkeley.edu, baolu.lu@linux.intel.com, guoren@kernel.org,
	iommu@lists.linux.dev, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, nutty.liu@hotmail.com,
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, vasant.hegde@amd.com, will@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: Re: [PATCH v3 0/2] iommu/riscv: Support Svpbmt memory types in
 generic_pt
Message-ID: <20260512124520.GH1116784@nvidia.com>
References: <k6k2ufkol6trxucf32qxj5i2v7safcyososquomqr7vavqwvr7@s4b6h26htu4x>
 <20260512075339.18339-1-fangyu.yu@linux.alibaba.com>
Content-Disposition: inline
In-Reply-To: <20260512075339.18339-1-fangyu.yu@linux.alibaba.com>
X-ClientProxiedBy: YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::29) To CY1PR12MB9601.namprd12.prod.outlook.com
 (2603:10b6:930:107::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9601:EE_|BY5PR12MB4195:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac02bd0-9de5-461e-eae0-08deb024556a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hbwu5uaqN+4JY08dG7GmV+t+UixAGxDAYPWJVwUPlG3Ohok3APFLa+u4HLOYRYid8qjkmXlSWM/QW1XeGnpIJl48Zgu7xEAerleircvBOdJdRRl141ufgy38qnx9QFnZiV07r8ZlKlN9zXP8ltBeEoq0xGppv6lvhh5czQv4kOBcNC3ywKjLTaSNiQp/u7F4dPaMWHiU7mWBQfwAOXEL3Bgh9ljJR2PMB+vbHTZ4tS0hzESdMGRJ+C4SbQM9wURO3OoUDVMP804WkWgw0fbYb9eh6ft+XxLjhk4BlggKWE6o7Ib0lEBkWMaQ26OAFMj72DeERBD4SEmSEET4f701ssItt3StcUz7b95RWVi24m26WzqcJEV+y1j4myBVe+wAoZmD+z7/SK+VyqMgA+hJBh47ScmqOBcvL3tFH3QqVkpcd/a/beE14Wuy64XqFihiICT28R2zZHx54aF9zSWKPFQvs5E4ndssNCoHF5sosBuslAtrPDcDl4nMnxJoUb4/X2EJ3hsDdES08McMqDHPYRcMSxSi4CoBPLN7HCtk9f3OoBszCwfG5PowDru155QMts2ijbsBd4JGLOcxcOc17dYAf8oEyxACxOEkZkQEmiGyi7kU7UaBdgAQ7XuNRv3whPVUtHFLwbZpCICD6uH00/eJMUz0br6Aw/Z3rL4LzbX9QU6tCZQ5EAsbQ162hVrl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9601.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW1pNTRpeFI2RjdxTUF1aG84b0NsVzI3QmZFcEwxVGw1WG56c3ZSV0Raa0do?=
 =?utf-8?B?Z2NxcHg4QVVRRXFKeUVZb2NQTTAwYWt0d0ZIZnBYdFhFNEFyT3VUOEhMTUNY?=
 =?utf-8?B?dHppRFJqQ0JsRzBBdGQ5U0ZRWnpOaFBWZklyS3dMSG9iM3NhYVMvS29JOHpi?=
 =?utf-8?B?ZStyQjBBQ05DVXdBRmlaRGNycEdtWkQ3amZVOHdtaFVwakFFbnZDWm4vbXBu?=
 =?utf-8?B?VXRwMzNVeFZHeUpvTWNCam5OMXVNZE1oMjlIZUsybEFxanFtb0xEbUdybXdY?=
 =?utf-8?B?anppQ2hNOXkxd0lrTnBXK3N3RlFqNnRYQXRBQUpUaE1obHpPTVFHUUpkenBV?=
 =?utf-8?B?Ky81anQ2SWswSXdBazA2bGRLS0lvdVJld082djNqeGtiRjdpNndOWnFvU3Jp?=
 =?utf-8?B?bVdXRWxDSG41UXcyaC81N3RLemZtUzJ6a1NVVEo3Sks4aFEzWDNSTlZRMDRh?=
 =?utf-8?B?ektoY2ZsVEs1Q0hVNmpNMHJNS0NFRnBQaW9Fem9wSFZlMXprN0dhZ1hUWEtB?=
 =?utf-8?B?MUYxRXNWcVlTNVVySGFoWTdteEpBWTRNTko1NFFvZXN0V2FaTnFmNkVScnZE?=
 =?utf-8?B?dUVJV2VDVG5zakg3OUZ6clhhSU9ySkJzclZkQUZWZlNqcGpwMVkrWko1dHBl?=
 =?utf-8?B?YmpRUzg3bExDckVsb2ErOE04UlM4amU5eFZmTmVmT3duVDJjaHNkWWVnVTVv?=
 =?utf-8?B?bHkvM05kdVEvSGNsbjN3VlhaaTZscDZKcEY3Q242cGJtQVYzQWt4NzBMRnEz?=
 =?utf-8?B?QWkvSi9SaGkrWFBZQy9RN3JpRHk2UFgyRUpmdVNQWjdkYjA4QXRHYzkvaXFO?=
 =?utf-8?B?ckJ5SDIvNi9qeTBveGlVcDRSSmVmTWRud01JODVVRjdYcFRJeDVnbythODlI?=
 =?utf-8?B?VlZ1TE96Wnk3R2F1bXpGTnZNSTVYU3I1V0lBTzY5MEdNdE9UZ1pXVjdCQ0xs?=
 =?utf-8?B?QXI1ZlV4Y0VBakZNTmxJNWxEdWV3VGtwdk1zTGN1Q3J5bkp4RzBZd0xRSGp6?=
 =?utf-8?B?T0dmb241bzdRTUlhazNpY293L3UvcnJML09sYStuRmw3RFNJeitkemtYanVJ?=
 =?utf-8?B?ZjRzR1poeHR5QTh0QUw5QWUwWXhDT2kyMEN4Z2Zzd1g2dDM1YnVhcVFYNysy?=
 =?utf-8?B?dkJVajN3STdYRUJBRzJEaGlCQ0FxdnoyWUxTZ0NVblZXVkltcXFETGlEMHRD?=
 =?utf-8?B?eWZWMy9CUmtheUt3aUdEM04wVXN4YzAyUThJUlRJSUpnV1hHcG1jVklOMVEv?=
 =?utf-8?B?UkJTRXMzczBpeXRITkdLWkFNeDhucVJlcmpJc2pLOFpvYURyeGlvQ3RKWmVs?=
 =?utf-8?B?K0MvNUpSTDB0Y1d5VlBiNU05akI5QWJSL3QwMmVsS1ErWW91Z09BUndqaEFR?=
 =?utf-8?B?K0h4T1MrRFd1TlFvL1JUUXBVWk52TmV2WkdXL2F0bFJXYnFObnh6eDdYRDdt?=
 =?utf-8?B?SjhzSWZJZFdpb2NxVzNPejRZTkgxWjR0U2pUeWk4RjlYRjRSNzZhbE85Sy90?=
 =?utf-8?B?LytrdnFrWWY0RVhmMXhtWmFYREpJV2QwVDk3U0wyd21NdVY0SldKVkNQR3pV?=
 =?utf-8?B?SkJManpKazh0NXUrOFVaSURadys1bkhONmhaQ1RQcGFieGtCWHo5STY1Vzdu?=
 =?utf-8?B?bzFvT1ZCYTZVZzVQVVlqQUwzME5MS2FFODNXYUphLzVha0dVWVpEZG1KYWZx?=
 =?utf-8?B?WGMrTnQyUWhialdjeUtoZ0MxMGRCaTZ1MENhY1F5emlVNFI2NXUrQm9Tc1Jz?=
 =?utf-8?B?UmV0am9LNEo5ell1Mkt1ZXVJRUxQZi81Q2djOWJOMWxwMFRUUnNFemx3M0Z6?=
 =?utf-8?B?YXJOTTcvRjh0QmJsVitiWEZtOXU5VFR4eUZVeVdzYXVkWjhvWkhTUzVYVnFz?=
 =?utf-8?B?T1haMFZ4Z3pTSENhTDBqSTEwbEFFdnp0dzlOcVVMOENXbGZOK2ZxVHBqV1dJ?=
 =?utf-8?B?UjV3bG1laWFtRDNGSFRHMC95ZEEwbUlYbEJuMUg2ZlVpZWVxQ2loSk9KNmdL?=
 =?utf-8?B?R2FabXJ4MU56THE5QXNRSkdUWEpVVU05SWRUaWtKT25HZjdVekJkQkFDZkFF?=
 =?utf-8?B?Nkx0TVdyVHYvNzI3d3dTSHhHdkhlVUFVS1pkQUJMbzJXQW5naFFKbWRtRGt2?=
 =?utf-8?B?aEN5Yy8zYStIb0lIVEF1bUs2MFlxMEx1bm96R2RQUmNwcFVVaDBOYllvTzlE?=
 =?utf-8?B?ZkFlSDU4N0w5Y00yNU54OE9BYXowTkZJUFhsYW4wMTA5czA3eFRITFY0RVRH?=
 =?utf-8?B?Qk5hL01MMnlxNzlLYXBSeXc4elJydDl4Ky84NkNVNjBmcms4cmJ0RHlNR3Fx?=
 =?utf-8?Q?/TgF7WTV4VKkLPqsAj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac02bd0-9de5-461e-eae0-08deb024556a
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:45:23.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS2DbdSqWhSf13tTdwYyPVKZ4ruW4peE+8UDMllWJ8fAIjp9oGWYcfATUIbS+wfR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054535_057790_DFD28559 
X-CRM114-Status: GOOD (  12.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMDM6NTM6MzlQTSArMDgwMCwgZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tIHdyb3RlOgo+ID4+IEZhbmd5dSBZdSAoMik6Cj4gPj4gICBpb21tdS9yaXNj
djogQWR2ZXJ0aXNlIFN2cGJtdCBzdXBwb3J0IHRvIGdlbmVyaWMgcGFnZSB0YWJsZQo+ID4+ICAg
aW9tbXVwdDogRW5jb2RlIElPTU1VX01NSU8vSU9NTVVfQ0FDSEUgdmlhIFJJU0MtViBTdnBibXQg
Yml0cwo+ID4+Cj4gPj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaCB8IDEx
ICsrKysrKysrKystCj4gPj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAgICAgICB8
ICAyICsrCj4gPj4gIGluY2x1ZGUvbGludXgvZ2VuZXJpY19wdC9jb21tb24uaCAgICB8ICA0ICsr
KysKPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID5BcHBsaWVkIHRoaXMgb25lIGluc3RlYWQgb2YgdjIuCj4gCj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3IGFuZCBmb3IgYXBwbHlpbmcgdGhpcyB2ZXJzaW9uLiBJ4oCZdmUgc2VudCBhIHY0
Cj4gdXBkYXRlIHRvIGZpeCB0aGUgMzItYml0IGJ1aWxkIHdhcm5pbmcsIHNvIHBsZWFzZSB1c2Ug
dGhlIHY0IHNlcmllcwo+IGdvaW5nIGZvcndhcmQuCgpTaW5jZSBKb2VyZyBhbHJlYWR5IGFwcGxp
ZWQgaXQgdGhlIG5vcm1hbCB0aGluZyBpcyB0byBzZW5kIGEgZml4dXAKcGF0Y2ggdG8gY29ycmVj
dCB0aGUgYm90IHdhcm5pbmcKCkphc29uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
