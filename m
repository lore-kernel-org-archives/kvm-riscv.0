Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF65606A31A
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ONwN+r/Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QWk1k0xb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k23RJymfHoU8moou9BNJuHvaneGv/SJXDCTqIU4bQGk=; b=ONwN+r/ZiEqCxIC/lGVFIlCosa
	iC3wHzr35/XpG9FlmZJjGUhVx3LThlT7rD5YebDv1hhJdm64VFaYBw+EgncDdtV7MyEjiobfPhIFk
	SAbmfRXlNYRB7Qcvnl5gfB8ZYjhcfx7AqqzpNW1hFIfVRk6ObtV5ygOsuCquxK+a8yERW/S49MMqn
	jotepgaip0bt8c844/BXqylUtAbszaBdtcdjbbXLZsszNOmr5dFD4PDPv6skBuF0ZheG0eWCEf07L
	k/oX6Kh2tWXlGJ9WjDTrM5EO9ZYGPJyrKwbcdsXETfRcKx5QGD4nRzS26kMRjdkSdlM8N1wuVJuib
	J+CEkONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhvM-00000004zsa-43NP;
	Tue, 27 Oct 2026 14:13:12 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhvJ-00000004zr5-17WI;
	Tue, 27 Oct 2026 14:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY3bRVsb65/Qf7Rxs4iKJnFP1nIU7dZzJHnXLy2nrrcuzlmfbBWrb1Wj9wNND3uOB+toBoP8wju8DcqAYrK5STX264wyT4AeipuN8XpOB2VeEefIU37rP/DASR96Xb1DPibKLUwdNdLIE9dg2WcoPWJna8TLge2DEaj4iSO4q0BJFjxysKSlzNClZ26cwNeu49X8RPiubzuJOUw60HsXEo/puMvlGOWeE4c/tJFUDR3azxeTodJxaPzcpwa92ffQZxk6gPH5hryvhokMptgDz89z8GK5S4uRnaucTkHmI33hCI4pB9EZ5I+DUJSp48KQrvLOhXSjcmpwZ33QMlUeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m252L1yGfPzKK9vRZFfuJTcivjrY7diGrC57vJPHvmE=;
 b=XEHJqWTlcfkgiutib6VOFXWWQrGlv7r2ox7DvYba2Dv2IuKA+csey6HmTkXHbJBLHt+ilCVmYfAMiwxjqVLL5GOLj/pgvIqXPkPS8gdK9pu9nwcZO1GYeg8TcDpSsDzUcvf0+z41B1t29lWYSkepcuppBVuVjGOm5ae6Fz0c1M0UWmMa+iGazUmqG/gtT9AhJL/C2B2ran5kVuXU99M2XqdSsjrCB1gDVeu0gT3YsBx1kzz6264PwMUshbgIV3EC7ZgZ5yD0SBuGx7nYWbm1uiyiqMeXbvnRCX6UO0WiQfpYsve+4vKcZvS193YyJcLGD7i4O/SJfUZMvvS6u6mPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m252L1yGfPzKK9vRZFfuJTcivjrY7diGrC57vJPHvmE=;
 b=QWk1k0xbILlR92dybMheV01ktYdWyoweetGK2huhPPii5Sw47/2l5t93JoVUASeXGX6jO697bIskLTw31uwxg7SHbS2fB32K+2HME366X7nLaFvqt189jF7u+FARnZs7KnxT7imtwvhW6LVzdH9DijbaqJasNV2ayEzKo0O1Ta+sz5i6tWk2QwM3KG9Wg8PBGS2IvpyAI9c27YRKIdNqHW6MKq0GLImZnQlKONVpN7AYvGDR7jLCAXBYs/ZAA7CP2CC+1GO/P+UylPCEFmD2DurkeHRwsVk8Ljs6a4VH1bMbGL2JviokPwgI9Ua/YyTQ4JbrA+1ukSC/5Vsy5VZNDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ2PR12MB7821.namprd12.prod.outlook.com
 (2603:10b6:a03:4d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:13:01 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:13:01 +0000
Date: Tue, 27 Oct 2026 11:13:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: fangyu.yu@linux.alibaba.com
Cc: gong.shuai@sanechips.com.cn, alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	gsh517025@gmail.com, guoren@kernel.org, iommu@lists.linux.dev,
	joro@8bytes.org, jroedel@suse.de, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
	tomasz.jeznach@linux.dev, will@kernel.org, zong.li@sifive.com
Subject: Re: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping
 helpers
Message-ID: <20261027141300.GB2338330@nvidia.com>
References: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
 <20261027140837.84112-1-fangyu.yu@linux.alibaba.com>
Content-Disposition: inline
In-Reply-To: <20261027140837.84112-1-fangyu.yu@linux.alibaba.com>
X-ClientProxiedBy: CH5P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::19) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d87452-abdf-4a4f-af28-08df343468de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|11063799006|4143699003|56012099006|261022105027099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nDOt8ZzMoIYW7+sbHfOYBK9jlcumDHq5iPvI3LX4kyvU1aaaK4SlKU7q6Auvw392motPJkRk5Jbyda0b3bxssiqLtLQzwUrH86tJMg38CrcKiZ2GHhZYiF7uSrzqcNI5l3YIO7juHTF5UCjs35/OXBXta4PQhaJ0xZlyyFn+A576mRQqWPkILusoP3TmR6Pcz79tDoKM52Ft6akG5hym9Y0t5fcPneRzZ8Ld5Tn+ESuu/UGXx5gfjCcjl4Oi8kiSFnkK1dOZJGUPzl1X1MOMTdWKxbKYzA4j/yWBpNw3++iyfC1eJa8U/qgrq3eqG+4dZS46YFlw0YYGssKEg9VnAZ0KuUv7E2gYvqBbhCcfkG5Dmt1pKhFghtRjY8tN3ZHxvvzUX8BbmxyH+CSoFHocaXcLr+20P1WbcJ9w3zOLozzGo2M1MZ5/wlyhdlPmEIbmJcbiJM8OevO2boyRAYJGkl1hPUtjWdMf8uhQr4gKa1FKaYb/2/LwGR2z5kSowAi7V0r0s5RQ9qwMVsdnqWoFCYeTiWiab/TKS896QYD3FTqeMQ/wlWEZCiO4gLdp1BT2Y9O5y8uIMTAafeCHEz2Ft/7O3UQiJs5PvvDtsz6SthsJRuQeNvX+H5AToBI021tI6Al8zmq82a5OMwt4L2aGy2u2b8YmdqKDrtVc3j24Wpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kWYzt4FHmycec37JSVXzEWk8HF5zoW8XbkLlUlPV2n6nTVT68U+51k3Xhfi?=
 =?us-ascii?Q?iNt540wzeau3I02WfiUw0FBfw4kn3NUJYBVRRKL5KMcmSpWKltgU2UGIH/wc?=
 =?us-ascii?Q?94+9sKByj1pdxw3Lq6xuUIT6xL4dve7NsCnXX3fyPQDtHxkMllqz95nCCNq1?=
 =?us-ascii?Q?BL6qLwI2k2a0RZ+Wo1eTgp/aeWLvvzThCitcva9P1WrrKAVtythwa+nM9+47?=
 =?us-ascii?Q?zRU5jCWwbj2ToJgYR/n4VF3cBfYlS8dLNcKWwM4IHpCnw4W3iDdLhWyea83Z?=
 =?us-ascii?Q?xDpvIK5j84MpfuX5i5C0nc0k+nBxFh+vD8MCtd9ErdksDNYkDiabIWxOdcTt?=
 =?us-ascii?Q?rB0R2Zs6f4exsOmpZm45AlhxkyqRijytpFqCtWISiAImCE8KfRVQ+ZGA4f3U?=
 =?us-ascii?Q?EG7jYwUSKVpNFdrB5cCSMgurPLI32LtWd/qqakd/778es3AmMs3JL8Lx8JLa?=
 =?us-ascii?Q?aUCoXNJILX4IIR55uU4g7gjzQRCat3sFSSHclkj4Xzu4yxJlyf2xjTmQqbnC?=
 =?us-ascii?Q?auy/Y3j+Z6obDyB8zdrAXNaOveS1cwAjvLkFvLE2i4HadAbTDWJBi5pXK99h?=
 =?us-ascii?Q?kuhu1NQmJFpJTmEOhAAn4qQdz7nfnLidbDcdWlVig58SwMqNSJwcl+0gCC2y?=
 =?us-ascii?Q?vtw4o83PHVx0lOYbksweYpv9e8r2lpstBzGuAr7lrnt3KQSh8QuvJ7CtfQeU?=
 =?us-ascii?Q?D8O1ClOQ+3pTsF6OwqCGTLpWv3fN78vl+Pim9BCBltwG/erlODGK0On90bQz?=
 =?us-ascii?Q?qRmrF7wQwEwyHtTdP0G6txzi4OBEOBCvV4sDHmhxNNs0GaOdzn0mH2Yn6YqZ?=
 =?us-ascii?Q?nTLR61giy8Z7C0rFDoGAW74/EMgFBHiehgn9r5h/+0YvMJ4YAqilRr6Ia+qa?=
 =?us-ascii?Q?FPPf0oLIUvA3wpzslVnVwmSpwXf8w3Q0YtjdnvlbEh8gAaxMpWRC5uJC3fJf?=
 =?us-ascii?Q?ehBLezBJJQAW6/LAcKvCfCAmLeu/Ob/Wf7ttWC5NSaWjVLnzD84Qt2b1PC0U?=
 =?us-ascii?Q?EZw5CYwL/1Ah6pNC0iibBe17oKKIBiQkDM+3zVw+EdVFSD8b3TVc3LIiKWJd?=
 =?us-ascii?Q?nMwFcrztY23JTMHpZXKIDCqFftuYTsnxtUFi4ti+RKVaJaoAnoBynvkQ0+Lm?=
 =?us-ascii?Q?EGNAZdk6lxPqYA4TyvgPvTs4GM3dIUSoM/gWTyvg2V8Y7cXhh/Kz3B2k95ZQ?=
 =?us-ascii?Q?vYn+79VfMKG2vS69z0i4MCGXi5fh4atzByuqDwjBaC5EHHqZEU+pkthNxIlH?=
 =?us-ascii?Q?uDuH72wdQoJ2sIdxwWhGJW9NqmIhQaEH9r2CUUzEAnX6aPPNKD3obW4LAxUW?=
 =?us-ascii?Q?zKN6LAKQI9lq+c5y7rZyu3LUObYnfUCMRddsqWLJHVcMaltn01HXZWRZFHlF?=
 =?us-ascii?Q?bpI04XUhmZk6x1fAFqA2+XlgpHrHK8UfMENdci9+jEPPrHq+SnmRwfx3Cguz?=
 =?us-ascii?Q?A9ZMFLlchmst9zkwXqAUtB8Vt6mrgB2R70cC0hD0LSSagwEporwNCNUnyMwT?=
 =?us-ascii?Q?wwAbGUY3y2Z6zSGsGaCUbd0liiF87wj/CgxQhINX9NT/o2TBelFbom2zZV/z?=
 =?us-ascii?Q?nDlOzt8aguShXibQ5VbA+yaMIA60u6ZYTLvuVb4wN+QrQ3EZnn0BbYd04SlT?=
 =?us-ascii?Q?WPgcbowCD19ZabUs7lBtnwQG/9BkZYEPB0P47mhvFgM/mU91aEbfAyDOB3u2?=
 =?us-ascii?Q?/2XWgjQXQ77zu6eYXdafjN4TFKb3lo9MIbHfh6oKMoCZ4C4i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d87452-abdf-4a4f-af28-08df343468de
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:13:01.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tj8jHnGveHY+6gD/LDX4QjikglwEYbqOe6RKIamtXrzkf1133pQRbSX6fRYhWUra
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_071309_315331_7A6627B9 
X-CRM114-Status: GOOD (  17.64  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 10:08:37PM +0800, fangyu.yu@linux.alibaba.com wrote:
> >His concern seems to be about who owns and maintains these mappings.
> >When the RISC-V IOMMU driver calls iommu_map directly on a paging
> >domain managed by iommufd, the mappings are not visible to the domain
> >owner. This makes it difficult to handle mapping lifetime and
> >hardware page table replacement correctly.
> >
> 
> Hi Shuai,
> 
> Thanks for the review.
> 
> Before going further, I want to make sure I answer the actual
> question. If the concern is about who owns and maintains these
> mappings, I address that below.
> 
> The iommu_map() and replace_leaf() calls are not a separate
> mapping facility added next to the forwarding code. They are
> two steps in the existing interrupt-forwarding state machine
> driven from iommu-ir.c:
> 
>   - first FORWARD:      flat -> MSIPTE written /
>                         noflat -> S2 PTE installed
>   - UPDATE_TARGET:      flat -> MSIPTE updated /
>                         noflat -> replace_leaf()
>                          (only if the VS-file page moved)
>   - last unforward:     flat -> MSI table deactivated /
>                         noflat -> S2 PTE removed
> 
> So the lifetime of the S2 mapping matches the lifetime of the
> forwarding session, which is the same rule the MSI page table
> already follows. The driver is the only layer that sees both
> the forwarding session (device <-> vCPU) and the paging domain
> used to translate guest MSI writes, so it is also the only
> layer that can maintain this mapping.
> 
> Note that the noflat column of the last row is not in v2: v2
> only frees the bookkeeping when the domain is torn down. In
> v3, I revoke the S2 entries both when the last forwarded IRQ
> in the domain is released and at domain free, so the entry
> lifetime becomes identical to the MSIPTE lifetime.

The big point is interrupt code has to live in an irq_domain, not in
the iommu driver, and the IOVA allocator is not part of either irq or
iommu drivers.

So you have to layer this properly if you are going to even attempt
it. It sounds complicated.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
