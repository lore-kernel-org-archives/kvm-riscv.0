Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1366CAC5A7
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLiRdKrklSuiWOdsV7YL4XEYe7C0/cvXfLCoOrWpxMI=; b=kwwbrw8+KC+Agw
	iaSagpohjZRWhwTOzSQsBOSPziAHFtqE8lOqBBCCUPBGZdVl7Njc+VjutoI557GyzvyqJNc8AJ/H3
	WCTahUhzW6szIctEhf8Pg1Qd0TSDsTlnym1PndKamW73qqbbFZs79jS5SKeKYG5WC8muRZbOy0tc4
	jLlGakn1Eu2o6zNTUcwa4N4EluqAmO9a/mSMa5jqgeysqu+3KRajYk1LadCAAOblZJF80QgAsPGAW
	N0olbSsCEWFn7sIMLw5XXjKvyw/aQzBCRNHQqHq4o4UwCtrvx48+YFG5hzrS96XogDSq0HrTAp5W9
	HsW2AKMu1dccyan2LKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15nf-0000000EFtU-2UGx;
	Tue, 23 Sep 2025 16:23:31 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15nd-0000000EFsA-2L83;
	Tue, 23 Sep 2025 16:23:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llCasDgSRgNzxFhKXjYPYElu+sZ6SqodTR1GJTyEfr8raGbQ/ISLtcJ8uSBbI38n39AS9CyneleC288qi6GFlQpQ7Geeddp8I3TgLmf8PirUu/CFUeOvdCrfRgXEL3okg3uVGD6InIce/3ett453pkg6fmtVu4j431NA3SRGt1BuTh2Fi6KgHI9IhFSM7WSE4Txaj97Dgf9QGNEIqma5VnPaOr3Fm9oONTteo9/0EOzyRo6cARin03vTG8ubt0vW81Ff/SrZHgvCLfa6t2+s4hNXfSF5u1T5fWSnpHcMaZBMcU13DuJ+5+76t9S5tedKD4wcrDliXs155Si71nbFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjgR2OzECULxxVT0Kw72jgxSBepbHvZ2N+ekWJXA7W0=;
 b=QtYIwQ7S0rn3HZmwV5W6wQ3zinZ4h8jXbdIFkb2hkOHTwu19Dzglzk7LQoEd78/qlpEOYx9D6tDwkIu90e+igK8DH0wBt674X4ugpfCZe+tO/f4iAE4CJYwUBwH9iavC2FUwvULeM7adK9MCc3K8QIYBNDrcmMDI3HyezlmJB5OFBn9CsjQSAaI2hWuAVa1s7/F+rW0cQ++mOvP6Pnh5ivsiIizrHSnA1P91NnLMm5jN9YkbLLa3TUZm69BfNM5nDuK5Dnt3DJ0af9Bd/rbJ4AfKqUfXUs6phnQfF7diwXG7PaCsZtyZuF32/oTvfXufg2CdMhnJLi9FpBAsAVLo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjgR2OzECULxxVT0Kw72jgxSBepbHvZ2N+ekWJXA7W0=;
 b=pkuvilvRLA4XF0oyYwavKCcy2o2RSzBj+jPm1PRxT+wPtvzTLNsJKIevv8tHs6G38yg/vOLQSzqAzkGW+VNC1kdjqO+epwVx69IhzH0wHPiQ4yDc1X02ZI0hjxBZ2rKyjh+eFDbo5YkLTBZB0x5lgYk14F3BI9DRus4HAT/u9U4pz6Xm9riQ9sOX5sEFYJPQ8iMESCfxLy3uQkiNYs2QGf7R4Fdt+stguJ1Tv1geYP65hWvpsMFIiWx0u02+xpr7VuG7t9To6UlC9anyQyeROxn7HYM4nVZUeQam4m8RxFnEEbYE3k9l6IUMjBENYJK5AkKPKpW/0VVd61GqCXO+SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 16:23:05 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:23:05 +0000
Date: Tue, 23 Sep 2025 13:23:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
	atish.patra@linux.dev, alex.williamson@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923162302.GC2608121@nvidia.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
 <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com>
 <20250923-e459316700c55d661c060b08@orel>
Content-Disposition: inline
In-Reply-To: <20250923-e459316700c55d661c060b08@orel>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: d59f2327-9ae4-4cfa-f6ea-08ddfabd79ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P8ZCB5ls9AsDUJ7CrtTXy5Zn4SnhSeJAAF56jecwk6/ll0KiahBDFEr/U4kL?=
 =?us-ascii?Q?rnxooDBAvLUHSEV7/yBkWd8T8alzIZh43Z0OelGONwZfkyzKnkovozd43jbb?=
 =?us-ascii?Q?f5V55G/3ZELHe9+otzx1jtEi29BszDiKjpKlznXOGfsZaVP/ZVPNWY1WYZcL?=
 =?us-ascii?Q?Ij1H2iY+zB4FGylCR4sPToYuoJvs8fwji5kNw623wFq4dSQ6hSpGOagIkFy3?=
 =?us-ascii?Q?MUIWX71YfwTfxBAKD+oCohoX0+2ynPC9enLG/iKBJ2DK62/z6ZLZWvpHmqJW?=
 =?us-ascii?Q?ViRdOtubsAVEQYiNP+/IEispnwqwbq6k1ucMovK5TQpVHeEkzu62UqmcVS/b?=
 =?us-ascii?Q?l3lhBVQlve5acsprizF1aEzifuIXNYc2TAEzfiMC7H4Vw/8A6Jy0iEfh8I4f?=
 =?us-ascii?Q?M7Tv4wjVhnTruW6VDN04zGjBOMwcMFOid+LKn+8lFN4SJ9q/22zaMh68IkbU?=
 =?us-ascii?Q?6y71oTJktb8O4G2NGqmBJx9rdvn6um0kMuaz3mkKwd5xES4Z3dLOklSfq1Zd?=
 =?us-ascii?Q?DGQGBtfIEB1DDNvFwrLxRUjbXN9eBS2ExVpqllycR3QcUKNZNx5r0njjjm1Z?=
 =?us-ascii?Q?/09JZO5Ya5ArnbMgjd6pUgSpcIXxbTZ/TYkUn96tWwvmBWqayl1fVAjEfDFJ?=
 =?us-ascii?Q?h+nAj3wMucQZqszgUAet4rbeYy3dg3OLb9ZCYxdY8lhMFYOOVW/pRfVMyqcI?=
 =?us-ascii?Q?bgor3HCkiGho+GaawhqzdBuuOKJhu8skUiSHKv9+i7sgFQrADF1fO9X/0jLO?=
 =?us-ascii?Q?skoxqZK3n1NA4RO54djafTKkPnl2vTeEz3hR3eWlxvq7jsJ1+iGJXe2pbQ5X?=
 =?us-ascii?Q?/wnaxkPvnMpqQ04FfZDORB8i8Kks/Ofp9RvpdaiJPsGpqQsmeiYjhSGgu+GJ?=
 =?us-ascii?Q?D9wGOTSUCciW88LCWdewjbWDVsINuK5GHUe7uXM4iKciRqMDQxlaf+S44Wqj?=
 =?us-ascii?Q?+cweiGNTjkZdyxkkVQ1HgmDUI7Lw7BaNCwMF6rzU0vNqpGJsZzVgP+6C3kmP?=
 =?us-ascii?Q?erQHonP5FBdadOe0NOo7KMyHa1VtA7h6cG6DcDlVlgUxl4A82pC3O5iqQnHr?=
 =?us-ascii?Q?90WXhV8uNGTY/KPeYlD+2N9ME4FBDzqsOShE9IQTJcbf42Q+EZnqhAxZELJ4?=
 =?us-ascii?Q?kS542Xh0+w3D10m/kbja8wSAgkZrX1cBGfUV1Fch1YWh8B1jfh/81g0Ih4E+?=
 =?us-ascii?Q?9eUs8TjR3nMRUbEKi1Ppk35GXbXhOBM6vKjY+JA8E0eqHCvrg7beFF2MKYjA?=
 =?us-ascii?Q?ViGBwyahfmuCbDbcV9P2UZj5TuNOKuFfzTrZxWYvpusyiRM8PCsRFzirDy4F?=
 =?us-ascii?Q?H6kgzt8SD2/IeXmRi3kE90ivhqDFFtQgGDTmRQS4oNMHIjcerIU85xwpnx9Q?=
 =?us-ascii?Q?F184MiKvDy5kDxsFbWZe2zX1gBgE2gJ4OHOZ1AfDUHVXJOQdBW65bM5ScUl9?=
 =?us-ascii?Q?1MnlRkwlvrE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMRNhT+a08cn27i4kIjGKSstq8TRNq96wdJ/ZF2UxD+Ya/4OTZsA38RVYC9f?=
 =?us-ascii?Q?l/2uFxYObV//eo7sm9QCJmQ1Q4IDPE8o0BdLUTGtLvXvpNcaJApUOJw8RDpQ?=
 =?us-ascii?Q?uROj+1soWblSjhZt88CUL3JXiLaNP6XV+1ItIB1WQwQgDCy0Ucw9pcl0i7lb?=
 =?us-ascii?Q?u8oqH/btwFBMYidtldv840LAp4tIIkOtTW4yi0caA3kslqaXtwIFHdoBVX/z?=
 =?us-ascii?Q?SNRE4l4MQ+pazCQje8TinaQZC8g8YeWM4NZOnXUpNmBnHvOpCHnj8N6UfRty?=
 =?us-ascii?Q?A8Ofzx3zjHzdY49qs/SdzpplGUWFpXP+r4X6DbVAFepGIbXyAyxTdy98jYre?=
 =?us-ascii?Q?5UMNtjNaQ+BxqdxeuluzH8bvI+LIKX40Fb0hSZN+Y8t8f7cPLC51HuBX2VIK?=
 =?us-ascii?Q?nrQsJ7YLsF7SDL+Ti7kCDuat4pOCwPf5z3tp8o3oYCnPKVRQ9UjFcir9jcfc?=
 =?us-ascii?Q?teUnTuMPWPsz2vNmtpMWtE2ycpjoKY0PJQE+hSmusyh1DY4UClqOhAtke9C8?=
 =?us-ascii?Q?+AZipHbz3m0kDtd2mx1Vj/zbLQCxfdc+xrAVMzcUCJ8U0xCakSfQf3ZDZMHV?=
 =?us-ascii?Q?HCTIFqDeYcaoSff+58P8h6PVsY0cEwGHpZlucMpZHDdvcxa4/iLkhFzRP7Ej?=
 =?us-ascii?Q?s0Mc/Z+BJKGDKOIEumBnmOjlARt75+SxLDFJQSOzrs48QsaBBf2xVxsjpmnp?=
 =?us-ascii?Q?capKAdA+TatCkLVMMAiZz6a1xW+XE/F6nJybkJg1djDqBKrOf62Z3A8dK7Xp?=
 =?us-ascii?Q?rFap9jkmsM0M89PCG3/fHh9ZfXExl/jDNeXjpAfzhB75J3w1htnXuLENu8SE?=
 =?us-ascii?Q?vIsbIwxkMCgjQBfgQQV/FymPX1w8B2A+9/Yc4qaLWtd/TCOcROgr6hkWYAoc?=
 =?us-ascii?Q?Yq5OozSwpT/F2+mP6/ADzNNLbZHCLvXQ3FLKeiDi1SQvIl1mZips6uA0QAMZ?=
 =?us-ascii?Q?WoLIrHXK7E1ko0H+txuXQLA2OpEkQaTrHKwOtFjciTdZavmbLdXeIvC1oMwQ?=
 =?us-ascii?Q?33N9dPULhoWXiRZZlo9Gl5hOIgh/LaR74fyDtIEEGyojoJUwDXMSrzzJW+Ls?=
 =?us-ascii?Q?k26jMh6rL+Za+GZYpyxQcT0IkY6FD3RP0MMTN95ZZ9AtVLIyUrdKErMjTkDC?=
 =?us-ascii?Q?S/kX9lvJFDhaKTTx67rxvbdE6C31M/7ZDCenCVeS+xuEHnGYOWEj1fzU18Nj?=
 =?us-ascii?Q?GQlwvulY784na36CPP0LWpCWa3C/q5E5W+K6mfnUx3/GSBKDHfBJy/tkHST/?=
 =?us-ascii?Q?nzHoGBKhK1MQXzz7zwaubT/wO9uAHzNKK+r8c9n/Nkmtrmd1u9h2GGzQ2GjB?=
 =?us-ascii?Q?q30AkLVLkQJSIM8e+2xXOXGxDDeEMNKu1FBNq0ToBASTXb8S4zpigaoXUojR?=
 =?us-ascii?Q?bqPR1qwfQAPwZkYQ8HOdjahtuuYAv61iRdX5IQ049qmW9kZL1snf/NhRk9uT?=
 =?us-ascii?Q?XH2iG/zX0ISOjuCAHgWQSTcwb1ih+/ATl/6ooF4k2e9p1Cp02v3bNdlLwedF?=
 =?us-ascii?Q?JlXBJOci6EM3Emwu2JY9ETAqoZ7Op4mVVcxJKxnLun0sTaNg6eSK06y7x65o?=
 =?us-ascii?Q?OfSW0Jv83wMJ7RXH5XMP66w0t/rh/i3BfcoIc7vR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f2327-9ae4-4cfa-f6ea-08ddfabd79ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:23:05.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPPyGUz5g1dhhhgNXYINeStOmakIOGLb9zxetx4GfChKS+2To2NQYSg6wQw4XNEU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_092329_600162_5D05DF25 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Sep 23, 2025 at 10:50:56AM -0500, Andrew Jones wrote:
> Yes, this is the part that I'd like to lean on you for, since I understand
> we want to avoid too much KVM/virt special casing for VFIO/IOMMUFD. I was
> thinking that if I bit the bullet and implemented nested support than when
> nesting was selected it would be apparent we're in virt context. However,
> I was hoping to pull together a solution that works with current QEMU and
> VFIO too.

You probably do have to make nested part of this, but I don't have a
clear picture how you'd tie all the parts together through the nested
API..

Somehow you have to load a msiptp that is effectively linked to the
KVM reliably into the DC for the iommufd controlled devices that are
linked to that KVM. Then synchronize with VFIO that this is done and
it can setup KVM only interrupts somehow. This kvm entanglement is the
"virt" you have mentioned many times.

The direct injection interrupt path is already quite a confusing
thing..

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
