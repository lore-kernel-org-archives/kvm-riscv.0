Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB163606A32C
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4RlPEvdX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ghXDYUD+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nS46sKZs9R0w4ta7J493CqNgTkh/u/mmhpJLO8yJuq0=; b=4RlPEvdXZObZElbxQ9SjV9Xd5D
	bAhxFsmROOszzU383cF6rPPo6WnOc2/Zy4T8eYvaG5k2HHxcQqU1c+lA3xYHiEitywLtm2hQENGi5
	uu9xMtcrQsyATJ/ED42yrU4lSP3vBtDINM9K7v8kUQkSw2JXXZ0LD3D0UP6n5kpU1IVf9gL4JIe8K
	onVutGk9ajkhLEe3YrXqF/cD1KMeYWa/NrksN17AR3eT8bLIfXZk9VetL/CH8EWgirgDZaY2qq1O3
	+hMQTjhrr73Z6k7uZdGxRml9ctNggx4JnIzaBFkwJYKWd4FCABfdimKuJAdJc6x1gtqi9u7C1g+11
	hnl0ey8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Zp-00000007NNW-1ZW0;
	Wed, 28 Oct 2026 15:28:33 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Zm-00000007NGy-2erq;
	Wed, 28 Oct 2026 15:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM1LdUK4iqDWIjfOU9+Zlvy14KrGpcOTVXQiRXlW5M9DNLMO+97CeMxODBEbnwdEdt0o/cmagX2vEClbX+AWUaHcuGjYPWdTH1w2Dupp1aQHAvvH+n+iLCp0MpB+0fe9Qd+dU0ubcoeiIbvqxPDKDODH89TW5ltzwyVZybM0h7K8yUbIYOZB28ydF9oJ8Dlc1cReZKKYi6rFw2ElTC9O8Wf+dX7ghtf5bIqw7mjqaJhT34RCM3cFawE+JYNlT+s1jMb1otVB0eo33y55jSArc4mPoB+A5MDnUnx+f0ltzpvY07YUY7OYEuZyam2UsHLDuzxES1mvHNZFe67p2GAVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bQAqqG39KtvoprWOAKbHcnK1wB1eM/ch/omrtWvo78=;
 b=g/IZVAfX1+eB927iw00wGdpIxuZYd3NUdJVcUnG14+jXspqJluABvCwqnkvV+D2a95AzfGbsUaMz1SMU63OoVCclWJvug5RzURKaA632kRPwyzRCSh2+H6dTH0ZyWmqsYoKfdkqTN4OyHk8copcJKukSXd/DTXpRYl3KMWyQCH6KFJgO8qL0/PlUKu8xCzbLYhJ2xYWfzRcn8Vp5sqseL1nVlEeCRg5ri/zkc91EAv8PnFfbaLepWdd2naLpdsou67htXg9z/VCi6yGCoOAALUyODwvYCbSIn/lPUMzEA8Y2Rw1WWzZ4GokF51XvcOhVS6Ez/AnzHJC+NtPBS3F3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bQAqqG39KtvoprWOAKbHcnK1wB1eM/ch/omrtWvo78=;
 b=ghXDYUD+vMo7u/ZR3PKP7/nvNZ1yS7NnegIFJtEPNTO9qTVh0LF+QeAA+cdiSM85uYul1SOnTSxOa4M/ajJtd/B/+B60ykLu9ydt+C/kcl/Y01jMCURrsDXN6ZJiF7/Z4tUVMWP8i+nMrb0N8KvHiI/Jn6INLXIUlZ7+sbYzmbt9t+5FBbHi1WH1XmNEaDCd2jPAzo6qmXUxre6Kp9dM/xdbkKYQqKTc00Hea8P9gcmZiHU+91mnFytN0QrSku2TrGdoOr0GnY8vA7gMsMquffkwpWUkwp+M7GvnrnPxH+5chK3Y5fcX6x/bMZAwaqb3OOEIuHCmy1LvMsNfOrkR5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ2PR12MB9189.namprd12.prod.outlook.com
 (2603:10b6:a03:55b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:28:13 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 15:28:13 +0000
Subject: Re: [RFC PATCH v5 07/10] iommu/riscv: Add
 domain_alloc_paging_flags for second-stage domain
From: Jason Gunthorpe <jgg@nvidia.com>
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org, 
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com, 
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@linux.dev, 
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com, 
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com, 
 joerg.roedel@amd.com, tanchi25@mails.ucas.ac.cn, 
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 kvm-riscv@lists.infradead.org
In-Reply-To: <20261020094106.92722-8-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
 <20261020094106.92722-8-fangyu.yu@linux.alibaba.com>
Date: Wed, 28 Oct 2026 12:28:08 -0300
Message-Id: <179320128834.2412245.6365239689333877950.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: SN7PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:806:126::17) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: e83e3ceb-a3ea-4d81-d931-08df35081460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|376014|261022105027099003|261009223027099003|261021121427099003|10067099003|56012099006|261026140227099003|6133799003|22082099003|18002099003|261026121527099003|261028144727099002|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: fyWY8ADo1JcGjs4lSQBO13arMNVtuVaKym1TKMICnaNoyv0C7Qmp9+ZfAYPQsfe27C8nAVU3Oi9QeQYKwHYBEA0JB/wxhjp7xTLRkMLf9iqB5kDKiA9KWkm2C6tOcbN6+Ao8EdHOQ5BlxL24DMQ9buySFLNrSpJFIowv+81DAJjsA66PDJXwYxdwnWXGSiF4DP+yeHsD0RAoOFu45+NFJoJJMiXSsoRU3vX1yxdSXnGfjpgejSR1PIfOwEwSm/6vFUSNUy6UDgnOzlrjX5m86C2ULcaFILT28rPvmdgU9ZNL7WiqKH3YvjXF81I5B85lKTK/865lgHgEcpQycq6g/kaiZ1upgcX5Ek9HRNEzHJR2A2JMLUlKULQeRa+RcMrjFzOAMvtozul96ni4oSNfRQFiuoogcRUUB1J7kONWfOeKyP3+XlwdMnvyy7JiqDCcRACLAB8/qWhg4hW0u+K/vIFU0TgQFT5yu8F+xYd6HLLiYvK6tvH9amUk8U+3YfOKV4wWZ5eokb3ZUnT3SR/5laRJvLfRVbTULtPmSmOSpmYFLdEfFIW7PQXT6IlO9Vw+fHGquFy0+arxLVejrZZ83hnP25MqFJRGE06xqQZmlkm4WCRdAG7jtoBKa5l+Iy6uId9qhuGa5d3EF0GEr25pnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(376014)(261022105027099003)(261009223027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(22082099003)(18002099003)(261026121527099003)(261028144727099002)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUIrbU9WSDhZNGhLVFVheDFoWGwyOGdoMitXWDZwQ3NLYTNFUVJSOG9CeExM?=
 =?utf-8?B?V2xENEJYN05qR2Q3VUZrTDh0RW5peHdsbVlqNFhiK0MxT0luZmtiYlV3NEdh?=
 =?utf-8?B?Mk81TUx3UkZaYUNheGJGVWNBZk1HUGlqRUNNV1JqWnZ2V2x3bkQwM1VBYVUw?=
 =?utf-8?B?NzJrSkhtczNTUlVIZnF4NnJ4dG1wbjZ5V0s0Y0xJdFJVdi8zMEdVQ3JzWlA4?=
 =?utf-8?B?a3ZtTEpoRUdEeEFWbGJZa2VqUlB3MW9kSjFvcUV0ckZ0SllkZXcybkU2WDB4?=
 =?utf-8?B?NFFBT0QwTGtwbTE5UVhwT09HbXUwZ1dWdGZqb3YvWGhFNTYzaHBDSlJkSU5s?=
 =?utf-8?B?aUZFZkJFYzZLUmczdERIcTZuZENQTG0zbm9ZQWQvUThIZm9KbHJWbTBKaGlu?=
 =?utf-8?B?RW5wZXRJY1M3am55TkNsNStSYTRwSmYydzFJTGUzRmd6T29ndDlNa0tRWVdC?=
 =?utf-8?B?WENqd2N3c2NwWDBLU1ZiNnJmTEwzS2tET0VyVTN4QUliam51YkRMRlBVME1X?=
 =?utf-8?B?OXZPZFEwREFGNHo3MEdVdlZ4S0lvRHNtbXJWbGZVUWFJMzlwbFJGbWIvaXFL?=
 =?utf-8?B?VXJhbWZxTlIwdmw2bGRWcWZzV2w2QWQ4b3RjSnVudFphcWpuYXQ5aW5oR0Fa?=
 =?utf-8?B?cGswaDF5c3ZaYk5ZanpjOHNQckI2TkdOVjhGSFBLT1p2ZVA1Q0hXRzBIWUVJ?=
 =?utf-8?B?dmM1SWxwMUY2UmZjbDBVeVBWcUZ4UW1hTVBRazEwSS9jUmc3QXBBcHZVUFQx?=
 =?utf-8?B?cnpRdzRJNXhHOVAyWlFqWCtMdDV0TTNYQkFyQnc3bGlLRzZhYlM4RHRhaG9S?=
 =?utf-8?B?N2M0ZkVTb3dwNFJnSWV5VmZKQ1I3T082WDd1YXV0YmJnRHRSWUdvRDZzRVc4?=
 =?utf-8?B?SnZRRUNIdVl6WVNuMlJSYmt6WlNiUmVkMEEzc1hETVFmb3V4b0lTLytLRHha?=
 =?utf-8?B?S0NUdEFJU2Z2ckRuMjJTU3o1TWp1a3FYQ0o2OEtWSmhjOVQ2U0FRUkRzZnZu?=
 =?utf-8?B?Ny9rWWFaMXhaeFlKYWNCU2RiWDZRRXFOd3JEZ2VnbmhmZ3NHRlJmOXQwbWJ5?=
 =?utf-8?B?Z0hBNnpKSDEwc0cwTE5xV2toa0F4dTMzU3JGTkY5dEN5NUNmRXoyYWprM3pQ?=
 =?utf-8?B?OEtIL1lzOEgxY2ljZ0dHSW10bXV6NE1RdXJXemxEbjFidWFpb0l6cTMrT1dt?=
 =?utf-8?B?czd1QklqUGdVS3d6RkY4VnN2WWprYzladFJjUk90aHp0aEtqTmVGOWNvVFJh?=
 =?utf-8?B?RDJnVnpHVWx0V1hhV1g5OGpiVW1xa3FaWG5Da2taNTlmUkpRci9BT2VEZHpp?=
 =?utf-8?B?b0lnVk56THhFVS82cy92V3FmaGpSd2w1MjNHVXhjTlprODVYREROZXJEdk9H?=
 =?utf-8?B?VlNTTGpJV3RaODBqQm1XVXBvMDIrR2VKRlR6RlUxdnh2TjhIakYxU0xyN0VR?=
 =?utf-8?B?aVpGdUpjOElneHpWcjIrVEo1NVA0ZTVIWjU1V2wyUm1raWZ4L1g5ajNzakZU?=
 =?utf-8?B?aHJrNnY5eXhpSUJEekZrR2tmU1g2S3F4TkpFUXJYdTBBSGdUaXV6ejJxQmtP?=
 =?utf-8?B?dS9vNzJKUzNBMDlnRXRyVkRUODB6RDY2RUlpR3ZUV1JSRnVOL3l1Ulo3QitK?=
 =?utf-8?B?UjBpNHpOMkJMUjV0V3c4TUxlcWg3MFhaZ3BPRTRQcEFUOGlRRVJ6anJTUjJv?=
 =?utf-8?B?STV3dWNja0NlNnZLaTJXTlJMbDR4N3NGZW5CRmlMaytQTk15SnYxOWxXM1N1?=
 =?utf-8?B?clNZemdIdnVPVFJRWjI5U3VWWURpRVp3WGRMUTFidjRQUjV3Y0Z0QmY5NCtJ?=
 =?utf-8?B?azR2ck9oTTZDMmNMbXZBeVh3Y2FzY3RYSHpvdmxqNWFvdThnMWQ5T3FRYUF2?=
 =?utf-8?B?aGczOEs1TW1XOVB3d2QzT0UzMG9kbGF0NDZGd1JmWDJkNU83RHdDSjRvM0pH?=
 =?utf-8?B?bTFoTDNNS1hzdUJ1YUdOSmdOWEFxM1pvaENRT0llYzg0R1MxNmFUQndFUW1N?=
 =?utf-8?B?UVNSb2JUR25iZkR1dGJwNmpORnZ2M1JzQjZGM2RIb0JPUVYzeXk1RVlrYm0x?=
 =?utf-8?B?U0k5ZDhNdEhCZ2V0bFJJcFdsMjFacDFIY2tBMzQycTVDeVRuWkVWVmZ3M2xv?=
 =?utf-8?B?Nm96akNMdmY3em1Qa1A2eFBLMXN3Z2Jtc28zZzcyUXB5NXZRckdxZEIyOFNY?=
 =?utf-8?B?VzRldWRZendmU0dXR1dST2h6cFNuWUVXWlN0YjcybjFxYlFrVFRyUnlOZXVI?=
 =?utf-8?B?bW4rYjVSOEdKUFFWd2xpNmRNcktOS2dMSzRaZVRNL1hTWlg1SjZxTEMraU5W?=
 =?utf-8?Q?p7dyXZ3EV7eBKD2MVe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83e3ceb-a3ea-4d81-d931-08df35081460
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:28:12.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I13n4WeLuQg30r9jqH/uQ8SWyc/O8b7nmbU3z5gaGg5LnZsfcG+uwOgErH+81ZLd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_082830_681500_1AA43785 
X-CRM114-Status: GOOD (  10.98  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 22 lines skipped ... ]
> -static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
> +static struct iommu_domain *
> +riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
> +				      const struct iommu_user_data *user_data)
>  {
>  	struct pt_iommu_riscv_64_cfg cfg = {};
>  	struct riscv_iommu_domain *domain;
>  	struct riscv_iommu_device *iommu;
>  	int ret;
> +	const u32 supported_flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
> +				    IOMMU_HWPT_ALLOC_NEST_PARENT;
>  
> -	iommu = dev_to_iommu(dev);
> -	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
> -		cfg.common.hw_max_vasz_lg2 = 57;
> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
> -		cfg.common.hw_max_vasz_lg2 = 48;
> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
> -		cfg.common.hw_max_vasz_lg2 = 39;
> -	} else {
> -		dev_err(dev, "cannot find supported page table mode\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -	cfg.common.hw_max_oasz_lg2 = 56;
> +	if (flags & ~supported_flags)
> +		return ERR_PTR(-EOPNOTSUPP);

This probably isn't needed since the switch checks it?

> [ ... 30 lines skipped ... ]
> +	switch (flags) {
> +	case 0:
> +		cfg.common.features |= BIT(PT_FEAT_SIGN_EXTEND);
> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
> +			cfg.common.hw_max_vasz_lg2 = 57;
> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
> +			cfg.common.hw_max_vasz_lg2 = 48;
> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
> +			cfg.common.hw_max_vasz_lg2 = 39;
> +		} else {
> +			ret = -ENODEV;
> +			goto err_free;
> +		}
> +		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
> +						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
> +		if (domain->pscid < 0) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +		break;

I'd prefer you make functions riscv_iommu_init_domain_s1/s2() to put
this in, it will be clearer

It looks ok otherwise

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
