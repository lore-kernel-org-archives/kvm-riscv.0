Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29A2CCD1AB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Message-ID:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trII2smeLyXYk68Wpii1D2Yc1feEow0ODMk9TV7PvcM=; b=1rjTfWFz0Xewmc
	/EI8IsTJueJOgJm3/iPpxGQEJ/oW/mLa5sJlpSNkVebCqyHpWYxyl8V1sRPhxZiNnx+VO2C5q08BJ
	cwEQOIKhBLUkBPOyrojIcBlq43wA+NpLLOXwH4dHOI4QJCE05B+oGCy6yEGUUX2rx3rhibtu5ma7n
	pxaaBwCQQx3LxAZdYBP1GmjQcvVHgaF70XsvSa605z6aQkVljU4UL7ejCp8O0A9r0aPUhESp+vZRv
	RS/+iI21Tz6T485gJ0gMC2eXq8J7q8aVgaGNTBpQt4yKRAL/jgDG8QmpfSKLxtAu6grlPOBkQqUtT
	bdbenDzlhx+svIY6+psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUW3-000000028rc-0nPK;
	Wed, 22 Oct 2025 08:48:19 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUVz-000000028r2-2rfI;
	Wed, 22 Oct 2025 08:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761122896; x=1792658896;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=tpoLRRGotezLojgU/KsjfCu7fHYfodSaASGSTxYVAho=;
  b=ZMv57A7UnfuWJ4x2lwe+vfgsZ8kIq7DbPzrMtKY79TGmx9a8kX4ZmFxI
   v1+BRLp69y1TxaVPVTAsZG65Oje9vZ6QbeXlFJ/txcsK2Bylf93bIIYmu
   CBphaJgXpuvXvQIE/FuoZFo1F26AW3CM88LsBJWD2K/uJr3+REzzhjz2U
   opNUD4223juNWzChyH8bh6EWD+Sxf+IZcP0DHmf68G+6k3CwbblxJqXRA
   dG9TzWn5XW93PpfaQGcYFsVQAiagOHp63aRFiRUaNcXpE2Gj7TLxfYL9D
   +LWQIGMiULy/4cgysp2IQ1bW/qxbQzQMmyOJRJ8+oLu5llWVvgc3Jq2gk
   w==;
X-CSE-ConnectionGUID: xML7CXZ0Q8WGOyWrE1SUFw==
X-CSE-MsgGUID: hzXq3KXuRR6kLwVaRs9oyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50837684"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="50837684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:48:15 -0700
X-CSE-ConnectionGUID: dEXOs9L4SMKbGH8oPazRQA==
X-CSE-MsgGUID: Ngk6H6drTwSiLuD4Q0QXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="189097325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:48:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:48:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 01:48:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVYjtSvbkE6wdm49/b1I4D6hi4PvHXQqtymeesbWc84R1LuuIi/CuZYfBfGOK5ki8ulFHCwkcqsagct+DyTK2TsSvKnPhsTUivEiOl9xe3dilMolpq5YSpDQRwgfIYg06zq/LcIwvBzp3IvItoC0mntDJnGVMIprRQP463sStXEgFDBKhrxM4F+eT5FzX6Q8Xt47xQxOLM3PR0aRJyQ/6mM043UF7eh+3ANebTfRpfhEyLjM8j7N10SCd9OgA8cMR6SD1377xabjqMqZy3702Q1GSxT//ATXVmaSP78AgtIFBuxEDHGWSPWsKbM45jE0DyyTD41Q+LXnfVUzcrQoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CF3j9IDfanOoUj6MJ4RXqDdQyt1YBEgMgXuC+4yGTw=;
 b=Bz5ikREeRBRehYgqd5aIk99dTn6cJGlwatfAdh/DSVVkVSuGdEQwPAuppe1qTkImS9tVq0CRQUiCID9XAoKxhFQA6/wq9oqUxKxTr+S5iabrYF6oma89ffcUWOwpsZdU0aN7sFaqsPJhHHkBEtiCWXLey2imIc9idCbY+xMpudCwtnMCF9n0uJJEdFhUgZG348VogzSw1U7VBMhqNmz0xp1LdTENA3ZB/P9jL34DILsipxPZZkUhqWU6MuT+KMLJRxNVc4WLlK6WmsUa4XUyYLwk2gjNRnG1we2cM2hcuisvdxu1H20paN+W4pQ9DjP0Sf6b7tYFDGCrtCuUH+KGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 08:48:11 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:48:11 +0000
Date: Wed, 22 Oct 2025 16:46:16 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from
 kvm_x86_ops.remove_external_spte()
Message-ID: <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-11-seanjc@google.com>
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-11-seanjc@google.com>
X-ClientProxiedBy: PS2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:300:59::19) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2436652f-1d90-43e6-fc19-08de1147bb2b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZioBAm7bbsHKt6rHA/h9fdRze7fJKQu+n2WLO0b/ellmmEKrAAFuG6MTfxa?=
 =?us-ascii?Q?93vD/SkyQKu57ggrN4cv3wkEzJoI3esrnZ72Xz7sfn95xkw3cTeK0SIdK/rE?=
 =?us-ascii?Q?49oXLvUf6BaYkzcIvIo03Qp/ix2VYZolTr2N48RVNnWacbsrgonVLOZEMUcj?=
 =?us-ascii?Q?wMWhRYk1ENXjnvNoQ6T3BEu4TO2TRaGoCFOVm0vmMP8atAkA0E6jXVj0KaEm?=
 =?us-ascii?Q?oJNYWdpW3Q+govARKOYRIw8FVvaL8dYeOOWqSQe0N/bWIaKe1TwNPrN/L0c5?=
 =?us-ascii?Q?ZpqdvdQ6e1f2k36uLqf9vgAxY3CKenQy/qirD7Hn1PWClBLfmGrI4CH3ur3A?=
 =?us-ascii?Q?BVck3UUvOZp0suYv03WvsivzW6EjIlYrlegl5F67dJfaMcmyzkq2HBLdvY0Q?=
 =?us-ascii?Q?KZlgcuon0gDXc+GNR8R55MUuX+RkLPgElGMUCqDPjqqHc0z3aegqpuyxeJQS?=
 =?us-ascii?Q?pjTCju8VmlrarARBSUy+37SaacomN0IyARke6ltYr7WjoKZf0fXR5LL9wqnI?=
 =?us-ascii?Q?QmwIDypJ3LsgrxrxodVd7rHyOlHD78aU1HKtC3OaK1Qu/VyXIB0XRaim0YNV?=
 =?us-ascii?Q?c19uXqb8XlmsMlT1FJJId4ORM9rlWI6utrgKoDWoIdYPWXGyV14DO+eEKlsm?=
 =?us-ascii?Q?imXxvrwKeYL9uMWkZrO9aAyurine6QLkWRsaVwjAAHpQlMnn344Fx5d3ucRZ?=
 =?us-ascii?Q?Y3+QyD4ZyfJSZTViRd7MG9Fs2MXGBy0NZgIBWu4zMN2/0XNbRWl/kYPASt2T?=
 =?us-ascii?Q?faB3ieCayYEo6dk8e0LXAzIsmPCB4BhgfhDb07UO18BDm0V+baQt1Bwlip0h?=
 =?us-ascii?Q?yc0lz23Lbb5dbRQvFvB7aKzJerWU9qQfqjw5s99znlFxYhBwvkMUvqrbTrwJ?=
 =?us-ascii?Q?glvgL5I3iJ9fRvQS7BCMpD/2BVHbew2gQAa9Z/AnyzBjlZYCicQ+c8YKGtvP?=
 =?us-ascii?Q?0MSlCV4WrKF0QgiJeiF+HbiZafF9E3YWX4CFZIyBKg4tWcGJd3XG9eRpE6kz?=
 =?us-ascii?Q?8P/+GIfkMd9KylVB1S3nznmCQNjVLLxZMwbI35bCtdUFfo8ztu/z534BaVKR?=
 =?us-ascii?Q?BBDs4d5lx7zR5BZdZcSeVzFL/TQqvaUSFQnRd7WUK2ovxh3Zp6bnnVx1aPBe?=
 =?us-ascii?Q?vrpiKexFWqngoVIxw9ymkGLyvWINwOGMxKdUXMOMFOlpyTOXzdKZY4/e4QNs?=
 =?us-ascii?Q?gwy7puQiED/WR3+lZMamREQ+0Hsv1nk5PYa7Upz/8pCR4p0CUQqecrYRbyDu?=
 =?us-ascii?Q?S10tEmVZ1MIOG98uPxbHjbzytgRq0Qz47f5L1djeMV+cQS81YPTHyBB7owTS?=
 =?us-ascii?Q?hGg9hjmK+i7qnnlk+nu+/nF7NzoZsb1oQnx7EVlvhXZGUXPS6mVYjFAkEnq0?=
 =?us-ascii?Q?gQ+TXUDv9P0VQ9bApMRLQU4/Z8goD+R5+V8pKhSLynCbr+nuapaAAvYxQ/6Q?=
 =?us-ascii?Q?MwHh9vPSYHMrc89LDXton7ZxNsHsQH4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i59JZYiUMqd6ltU8KNcxYrwE/SpwuyY3dtuFjR6uUz/ue6LKgwCSi5b8Qvaq?=
 =?us-ascii?Q?jevnGVuq3+JLmuc7kX7rYOBU4M28+WuL8zeOy5B2y/049e5Jj9qy0v/z4rBn?=
 =?us-ascii?Q?ca2+e3ggxRPEbCbaQvRAFSgh/nYBWNb8r0ij/T3cEb0mC1UeubmrNAQPAE/v?=
 =?us-ascii?Q?cHqm8LswLIT+dShvPoDK4Xl6QbeBwGGZhoyE+OQ6wFyWFd8fLfXoQgU4MriN?=
 =?us-ascii?Q?fB6w1ix6JbPSrf5eUm3L/88Mf8R+r6sLUPOtg/UxvmvEMs9ubcLx3z07un6r?=
 =?us-ascii?Q?x5xY7H0oCthjKIB7oDzx/p1B9O9yWg6cr2YUuT7IuMBR+34su5lioZPumzhH?=
 =?us-ascii?Q?qXcOP6LJKCT3/WFXMX5vMvGNoZV+o6DBJYczBPf0ocEEG8nWfbeE2pMiMeq9?=
 =?us-ascii?Q?+7UFPOfnZofWDf/kttcEb9LZ2BXu00J32mMT5BsAlSpDz3NAR5T6ksIB/MXk?=
 =?us-ascii?Q?1BCatDknQwjH0FUM8sRemc8Y09tSqTvdmKg4tWl1OA+cFh4wByBtHmAigxb7?=
 =?us-ascii?Q?j8/QOtsBN7t9gBxhG3jUFh/ZLuaHWY5gFnzv5/3uOtC7R52OFlQZ6nI4th4G?=
 =?us-ascii?Q?AYt2hXBdTqbqZuAVzTk1R07L+mL7EaAVUshQdbRqR5LajsCNGmt1kK6bbD/C?=
 =?us-ascii?Q?zGKcj4rDoYShXE0+iWb4knPLc7r1AWbcf/VjuKTSYvC60JqNYM1pwC4PjFmr?=
 =?us-ascii?Q?+OnMMB7QhZx6e8Lwc4B9OJjT/EzCyTs1w6R9u4aGZcN54XNE7zvBzakU6AlG?=
 =?us-ascii?Q?LjrioukLipRSahCJzozKk2+S1Ut78uVNVMCRHnLh8ckVdEis4IiW4hhmSPhV?=
 =?us-ascii?Q?gx+AsC0OR194LM+b7cYXHfPLWFa/SyarW7QBviNgeWAtHWhLJNq6MitttT+o?=
 =?us-ascii?Q?dJFWMYNi2JGxBHnROeQFCCe3H80tHaMm46hp+2ZJZSKWErTK8yo1Q5tV4CSt?=
 =?us-ascii?Q?dprWBRe5F2pQgDrk3xhKWW/ZWEL+lla6dg4P3dhhIU4PmESJnwsJ7lg/qiJr?=
 =?us-ascii?Q?A0zso1D3bgUUP+KoL/rK387VEt8rxkx77zR63TSgAO0MKcsUAwBY7ECHaoiM?=
 =?us-ascii?Q?3A8WVj3qrHJXwO02hYh2oapTNR2JJHMquKkILMDUqZTHbOmmII4uEVsmIEk5?=
 =?us-ascii?Q?y6T8Lsmhzll93oD00Vf4LCApHUT3BdxNHa+TDqIzvPSAOTvpGMH1k1TnV/D6?=
 =?us-ascii?Q?2/b5UMoniEEHouPtRE8jboz6890RUp6sM63pTiK2KUSOmDF4AQgH50zHwqb+?=
 =?us-ascii?Q?vsTK2YYsRtolGDeA6MnW0KYpmvA9w3HIcX+AQ8taU934uemMoFFgXRcc74FW?=
 =?us-ascii?Q?SvjkD+qWagwg4lsI/0euT2TWh6DK9apSpXRpLOnAbn3RzBv+NlImc+ne/qc6?=
 =?us-ascii?Q?owj+wCyRWm5xwZh189t4Kx1BaVcUSnURuGubzTfahMUzUjq5o0PSsxc/8o+5?=
 =?us-ascii?Q?p5OikOMSQBnqwFQSE2GjL31apHteL+8Iv8Omb+cnpvZ8r+A9CcRUkK74VVBv?=
 =?us-ascii?Q?PT9v8jZlAkswhZoQFx1C7aP8wxog70pEefjmN8WiFkJzF1MRD89TaOBJgFZH?=
 =?us-ascii?Q?j1mCJZqABPxaonHgj60w2T5o4FImJ9/yb93Z7JM8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2436652f-1d90-43e6-fc19-08de1147bb2b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:48:11.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3IGt4AlXV+ST532hjcGKNFDGG2L1nlJrLdJb0+rq1uAXCei59bzqRTkm99MqVOzA8b+sqBKPfFTlgH25/p3PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_014815_951756_8806172B 
X-CRM114-Status: GOOD (  12.99  )
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 16, 2025 at 05:32:28PM -0700, Sean Christopherson wrote:
> Opportunistically pass the spte instead of the pfn, as the API is clearly
> about removing an spte.
From my perspective, "remove_external_spte" means removing an external SPTE (not
a mirror SPTE). So passing in pfn_for_gfn seems reasonable as well.

Additionally, passing in the pfn eliminates potential concerns about incorrect
spte content.

> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 48598d017d6f..7e92aebd07e8 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
>  				 void *external_spt);
>  
>  	/* Update external page table from spte getting removed, and flush TLB. */
> -	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> -				    kvm_pfn_t pfn_for_gfn);
> +	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> +				     u64 spte);
Also update set_external_spte?

        /* Update the external page table from spte getting set. */                
        int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
                                 kvm_pfn_t pfn_for_gfn);


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
