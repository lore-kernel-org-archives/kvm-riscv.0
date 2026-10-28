Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD3606A31C
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCQgipMG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ftmLYgc7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q20B0ddtujOpMHtKOtGOKDII7j93yrCdIyvKJZU1Rm8=; b=jCQgipMGVJg3yTc5IyR1KEggBB
	WA34CRN2HMFjBJD1WZ9QFKscO8gpy54IMYbLL3qmR7oEOLia/Cq8eSLqaMqiBhtsSHqiFpumsMBHi
	HNUpHF1J/3gvhhtOUp6lei/6rS4jAAHSfQYi+RwQNpApi+mduFw8ehADiO7asYbdguqh0wGKQdDiG
	/YoA2QQ3zrESOpdOFy8iw8VTVovAL8PMz36Tq/NT1btRIwQTofxYaNiGRDemczeeondSuaKh2VGNN
	RUWeYBEeZzBWdaNRhv1ycOTlQlJA5O5vQwEuNcwt6ENPwmVv5obgV9tZmxjgQf3Ece4tWkdiNV/MX
	suwXaHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Zt-00000007NRF-3gQ3;
	Wed, 28 Oct 2026 15:28:37 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Zo-00000007NGy-1e9T;
	Wed, 28 Oct 2026 15:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+mBAT0HceaL+smhW4sMqUjYORM7pZM8JYzvfebxvIOeuU5MkqmNIU6o1G7c5fbtsLmeJWaZxdb/WqPMU0r14BRMHDzQ7LlKzGmaE+3gBlZXevjRETlyhQBmv3LDQLgVBGJbmlmLZ6YtgwDnkqV4SZQhnmbXtmKfQkQAW+bARZjL/zVV/OTay9Mwn5DRlcH8toUcH7wuBWZthJGZuNl4RQ1kEWMtYDodholrzucXUxT5J5vgzBJbFJsEPh7SpafO7VXiuKBI2ozLLZIGZOehAuKEDOgEdD+5hKCgW9eKe55Ik6ZOy2ZrpgjjHZzulkhE7j/dmB40xXdjbf3eysFc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+57ZPWknnMxCPtw12pLAHjFp/nH2zxmfZ4ngPUekyQk=;
 b=vePsWThKaToKi/YCKt9bMLAQIPMIYZnHP1AfFUGAhADg/0l66I0p5ESzhT33uYkD7UpVmoXl6KLNmBOKeEnN9yuKVIMRomkzB4SCPdh+PZGYwvn1jM65uWqo7+J9HnMl0uUVP4StFBK0q2abPbm9ZlwdkQpdN4cVee9hiJYxA4Stoq+ZUtBuX2LJy3iRPhLEbsFpW/7bNllEe37c+4CuqUoq5tfxEMvhnikiYttggcbguO2e5QEB3SovV6fmcH0HwH+qBoWAz31Wgrq4p4jqRdguOw89zWUMX5khfJ37vOi6XyMvS89FpdMexAT3he5GwO4NvWQMY+oPRnXB3yB/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+57ZPWknnMxCPtw12pLAHjFp/nH2zxmfZ4ngPUekyQk=;
 b=ftmLYgc7NnFbiXBsihL2jEXge8ESdZCCL8uJzAFO1PcSZ3CjRL8Dw5t1pfgNVhmU7SrzqQOy+pdx4xWjd6Ws81fW2EH+Xh9c2g+Oo0hrnR+IkBNVogbivqG2jkfUVAv5W1GPwzPNqdk3z9DF0rzmuKiCP3FYHl6sFGIkkG9bYTbmggaCFcq1fG+uzA6tIgCKbbiLTI1LwMNmJnGUeTdroMAwPoalXa39Y831TUMUg6qIRKgoFEHg6YAseG4mYuEjdEqc/98gmV7RbSipf9sjUO5yM7Sn/qiPRa5dVgjimAbJkbH98CGxCq8XM4o4UbcErLkY7BRkfgfhaHzM2bUCVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ2PR12MB9189.namprd12.prod.outlook.com
 (2603:10b6:a03:55b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:28:15 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 15:28:15 +0000
Subject: Re: [RFC PATCH v5 03/10] iommu/riscv: report iommu capabilities
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
 kvm-riscv@lists.infradead.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
 Nutty Liu <nutty.liu@hotmail.com>
In-Reply-To: <20261020094106.92722-4-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
 <20261020094106.92722-4-fangyu.yu@linux.alibaba.com>
Date: Wed, 28 Oct 2026 12:28:08 -0300
Message-Id: <179320128833.2412245.13619812691469135794.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: CP5P284CA0239.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22e::18) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc87792-c76d-4139-1340-08df350815f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|376014|261021121427099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: iyQrGTt76pW6dP5jUSKZCmf1CrBwkLDl2yTUQAfjcF/39cVzYMBwyY6XB50lz0Kyovg0EHtlMIo/ZwxA6HyYVCjFRpOt1l8HWLcGi+0ki1K2Ev/iiJuloFeOthbR+Bt+AQW25zyJ4LJQbgD/13kY/xsBgphYgGnbO6xpLboJ70iJr8tYwiY9EEFjuynq+t/RibozK4vDeoC8q3enR5pw59HkjFw+VmLUf15Nj22+JlK/hY9TJKu6c1Nq7vVJYKHwhC0XHPCdfs+5loW/9dMvMbWBsoPFE4Z9tUpj2Cd9lRaKt8OZWfSlQxeIDWbTRgwPtOOjY32OP1X1p3uI864c4VmlQWO20IZgeC6mhmu0Wociw/CxjMcOKTa1Wt+AgZoVpcahUjOkmpnXTCVOlHHrbHstlSSdHVkx1iUQFnXc9qtfBoT4dUDzxJ/0PeICHtmCiJzhoDhKqA3oD+Fj23gDbmG9/CM1P+bRn6U80pzK3VlBToMkvu/X/JnUHMuQKcLsiLsldOXMPELu7l9VOYr3ugb6SVDT5DkvEERv0xakowCFVU8C+hn4euTxkOw6RhkhW4a8viLPxHEVduHtK/IyGVUUAYAm9wRjkq8DoNnIQw8XQinxTETRKLyDujbU/eiydAlo1BveZR9YsRff4MA7sg+PyXMK/mu8rxkuXWSMrm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(376014)(261021121427099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2tBUVNhbmNPZ3BUMGpDVXRIaTZKOE1RTEpXTGI2WVhHWUMwVDFWRnV2NUJ2?=
 =?utf-8?B?aEVPdm5tRVN6THo4YStLSWRHUVpaYWxrSUwxMVlWdHg5MldDa0tmMFdCYlpE?=
 =?utf-8?B?enM1SWJtTGg4SUhYbUtnaFdWYmlOOEwzdmUvZDQ4dEZrZ1U4N3ZDRko5amNR?=
 =?utf-8?B?Z29oRERDSGM2M2xDODFhcXhlMWRlYnRPeG94d29TVHhEZ2IxVXAza3F3ZGZR?=
 =?utf-8?B?REZnUjRiUTZTTkgxTnNhT2kwLzhzM1ZxUjJscGhSbE5FQ2FQZjQrUnZMOHc4?=
 =?utf-8?B?NUt5S29OeUZsZGUxeGl0Vzhuc0pqd3UzSVdxQmNIWU9yYlV0bGtaNk9IclRH?=
 =?utf-8?B?L0lZQ1NkM21rdnRGT1FsN2RCYU5oRHZUNkJqWEZvd3dWQUtGdkNmTXJuUTN2?=
 =?utf-8?B?azl1T3J2NzZvMFZ1aS9vVXh6NDRtc09BOXhXM1k1ZWNab0FLQlZSNmJDUkx2?=
 =?utf-8?B?dmoyZlFnaWZpUnBwM2NBeWdMaUZYR2lTaVBYRGlsMnBOeWMvT0JNc1BHdTZH?=
 =?utf-8?B?bG1CcC81TFNnTzBxK1ExdzBMb3NJblJwWVRybUxjL1lOUWEzdkpkM1dMWjVJ?=
 =?utf-8?B?QkQzYVpOTkVTd0NIbUxWMnU4bmROWFJPa0xPZnpoQW01dVVvRStMcWRDTi9I?=
 =?utf-8?B?d0ZjRGxnck1rR3NHOTdQNC9HV1VuL3lkeHIyaDFGa2l5K2JXY0M1T0E2TUp4?=
 =?utf-8?B?K290ZzFWU01GdHFNUVV0d25yR1J1TWxPL2tNc2tVZXVsQmkrcXFVSVJiTEZF?=
 =?utf-8?B?bktJZWJKNDJ0L2tuSEZIdUlCdlMvSG5pdEsvOGE2bHo4SEMzcFl2UVZJaTEx?=
 =?utf-8?B?MkpvNjQ4RTN4cXBVMU5mT3l5cEVuUzVWYlZpRWdxaFhJMkhOQWF1dGdTL2E3?=
 =?utf-8?B?OVQrNi9NaGpvMC9BbVJRdG02QlIwQ0VHQ2U2eHRFRUVHWFVsaE5vcWJrTzJn?=
 =?utf-8?B?dW5STENYZ05DQjF0U3F1bmJqNDkxN0ZOeFExbC9YQkR4dWRmWCtBNlZZZDJD?=
 =?utf-8?B?MlU3YnRhNTd2WFlKRVZjSEVQREV0TTV0NDFzWms4bmZLQURmRDkvakp2WHk2?=
 =?utf-8?B?eG5YdTJ0OCtYQXJzQlRUTStoMFVrdUFnQ0NwWGh2R1U1VjB2TFJ4TzVXekU1?=
 =?utf-8?B?TWhaOTdwa2JheC9MZjJucS9oK0twMy9ESm1rNktydTYzMENQa3VvZjhmTnJp?=
 =?utf-8?B?T1BsdytVU3ExbVpiUDRMdFZpaGVOMm5OY2lTSzNPY0d5TzB6ZnMrTy9UbkFs?=
 =?utf-8?B?Y3ZNU0I5Uzc4Z0k1c3R6Nk5QNVA4Y2l5eUFhdHA3QUJtbTlPaWhGVGRDbEZq?=
 =?utf-8?B?ZWxnMy8xMFNwcWY0WHE2Vm5Xc0pMeHZyZDgvcitnNnVrL0daREY1K2Vrb0xY?=
 =?utf-8?B?TS9Xd01BZ0NSK1BNTGRGd1doZHhWSFROMDFJNUVuVFNINnUrblAvQWc5Q0hI?=
 =?utf-8?B?eHNaa2ZsRHVkdnltbzdINVVvTVNJNERoaTMxdi9EeTlibk1VUitXcjd6Ulht?=
 =?utf-8?B?RTVTQ3FjTzYvcTBaNUZQMThGekVTdmYxZnFZV1VwU1MzMGZ4S2VGMUpoNEVH?=
 =?utf-8?B?NlRocEw4NGZIRUs3bnBhT2NxYlBtYVZaZTZZK2RXWVQwUTlyZ01aV01PNDMr?=
 =?utf-8?B?aUY4OUpGY1ZmcVBNWFpTaFhUakRWZDJCOFpaUEx3MXVRdm11dXFpcytMeEJJ?=
 =?utf-8?B?UVZueWxONHhXdEdTQmJEb0RtSXcxVHU2V0x2ekc4NVVXZktNNk83UUxkSEpR?=
 =?utf-8?B?azZnNzZUcm9DV0VINDFwL2hYaHRGTGRGRTJ2NlRGUEtEWmVwSWIzZ2NRcHQz?=
 =?utf-8?B?b0ZxMW9mZ2lFeU5kRDlMNFBKM0dKWHMrYUw4UzZ3VE56cFdjN1ZBMmZSZlBm?=
 =?utf-8?B?YXBURWE5dTBHME9VYWNsWFN3YStMQlJ5eUNZM1EzTlBIOEpaSTFuOEVueDFo?=
 =?utf-8?B?Z0pyZEhIemt2cG0rZG4rUmRHa2VuaVhqKzNGY1JpZTVoQjBMNGQ0d0ZnOXZ1?=
 =?utf-8?B?cXpaRk9ES3p5djRtbHc0ak5SNUo5WnRHTU9kOVVwVFpjSFlwS05BUjI4S1ZT?=
 =?utf-8?B?RHpvWU9VNU5DakMvS01VbXJHQmdFVlM1dzdYSFBsaXdhSXE0clpMQ1BCSUhR?=
 =?utf-8?B?TC9kVXIxSXJaakYwdFRaVzAyb053L1dqTSsrbldlR3JBZkFGZ0xCQUowbXNn?=
 =?utf-8?B?N2pBcWg1dTBXN3dHOXJBYUJxekJOZVJZampVNlR3UGprZmFrWkNaZ2pzYVJQ?=
 =?utf-8?B?NUNnSnRVR0ZJeDBIR0kra0NKQmNOb1VZMFNmNDVUazJIOEdrRFhLaVllaTlp?=
 =?utf-8?Q?NLYVBTbTQkCNg6VTeN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc87792-c76d-4139-1340-08df350815f5
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:28:15.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeXadHdxRhTkROil/A/YJ6YUls8nWAkWkc423QSL9zme+cGJHFkHn97RYZhb+z/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_082832_458349_C56B0A65 
X-CRM114-Status: UNSURE (   3.01  )
X-CRM114-Notice: Please train this message.
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

On Tue, 20 Oct 2026 17:40:59 +0800, fangyu.yu@linux.alibaba.com <fangyu.yu@linux.alibaba.com> wrote:
> Report RISC-V IOMMU capabilities required by VFIO subsystem
> to enable PCIe device assignment.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
