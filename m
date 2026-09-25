Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE60C98321
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:To:Cc:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFJ+Z9/mJK8amGNGHEfe2aTeAzeeZYJ5Dy1Ebwr0ARQ=; b=Frr/a9UmNpWGpw
	VsC5OwqOATrhFJuv6on8qbZwtbsnZhk0oklt6JqbDn9XU2utaf1ePj4s26/sUQOlURTZ5dvoMzxpp
	Tf53mBc2uANdb7St239fSIUgqXY3RbsuexKywMI68yZGuM/3JOBmn7mCsDkq+dtYuHsXRyUPxCfO3
	MroClamhK16t6gN1MyPyDwHo8wFNwmr3bO04HlclQ9d22ry0Xl2QMXQTCQkUj2+4CCxK8OwQ1/VZX
	8Wkp+J5KrQgJUNXGP8sEL8r7WjsDxp89nAt6TTOVD2z5yEjfRVeaYtcuZ9H0y/Sv2drskFPut9iMn
	ULQS7raPtpuouyi5YTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD3c-0000000ESDe-3DOJ;
	Fri, 25 Sep 2026 21:02:12 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAD3Z-0000000ESCu-0GLk;
	Fri, 25 Sep 2026 21:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSN1YvUeJz8JZ7+rYvwHguK61Z5DVBjm4pJakGf8J39leaBgGauyVS5hf1XEACCglSuQ8Djk4CEJUvFuaIDQmSmV355GmZZqlhmJJmMoXvPgid1pK5183whysIjaH+3Jta+LFceqdMH4thLAquh1vbn/a4GuojkSbmSf3C0i3SG70WSDdgdGNfcv3X3jrnijLR8zHDs/tdSiMDhxajbGy/pWpEUZVgmxUHdL2oLoa3o5ZRCiqELLNG2GiMTgVV3kh5dvfeU6W33GrNpRQe4AgLjAiZhJfo+cep0qhVsluxZZC8QKDlw56YsBDe+wjnNR5/636huWK3Tv/g4YcwQUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcqA/8ravJEVTJI6stmpYCqH+repWWqzPh8/7ZJwres=;
 b=uzINNDfH2f/WBhyUywzk9PbTOY/65E23ZtWYxT7fDi+khiP+CVwB606A/+zF2Q84862akhCbmjRToA6Vv2cZLJJb7CnrygibgY28jPYeh35h115r7PNNNCJ+SB9xdmzxQQZsgYq1MlQ3iwgvrBQEEST19Yz97SPLEMVb2GXD5m3L1RbxxAl7iQgPjJNMXgnsOlqVeByY/TcfO5XIyFRO9T/4vAkHHVhQWk43L9kP5WezVqawRQYEhBlj5ZIWwJb+VDAYinuW0FBtTuap/EhitC52pN7bH/R9Fl4ZRYUqcY81q5sXSR1iG996TmMEWF2NjQcquk1iXSu1T0dTX3aQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcqA/8ravJEVTJI6stmpYCqH+repWWqzPh8/7ZJwres=;
 b=qU6hRrBNrpfqQxArV95wP+qUev44jq4pSajvpzCr21DsBnfcmDh/idv1k7N1yFCBbWeZqv3VY4T5zyr2l0ecEKVYeWjdU28TRhKHdAoIC3cU523/i81AEMc1gqjZBZPQWLMeWtqDV21XtzupbL0AIGZ0O2MetyWOEf1OgqCjg3ULQpzXEZxYFnbEFl67qqtM+NJyBa6YrTLqRxwaZtJNZBMQHHWnvoIyALrxe5zHW3uwJcBzAKPf8KY8Ox/8SMWwnLhgdlTIExwRJ1URFhHwRoMAoGrKlWvSQ0ladp4f7EZmfYotDQTg8A/UGld+FAQekKI6iyYwb2VpBs1IXvcTLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 21:01:57 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 21:01:57 +0000
Date: Fri, 25 Sep 2026 17:01:51 -0400
Message-Id: <DLOP8IH392ZU.2X2GPOP2NYK4X@nvidia.com>
Subject: Re: [PATCH v3 09/40] docs: filesystems: update mmap_prepare docs
 for discontig kernel pgs
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <selinux@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <fuse-devel@lists.linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Pedro Falcato" <pfalcato@suse.de>, "David Hildenbrand" <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Jonathan Corbet" <corbet@lwn.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dennis Dalessandro" <dennis.dalessandro@cornelisnetworks.com>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "Stephen Smalley" <stephen.smalley.work@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>, "Doug Gilbert" <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, "Jaya Kumar" <jayalk@intworks.biz>, "Simona Vetter" <simona@ffwll.ch>, "Helge Deller" <deller@gmx.de>, "Sebastian Reichel" <sre@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Peter Xu" <peterx@redhat.com>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Oleg Nesterov" <oleg@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>, <x86@kernel.org>, "Arnaldo Carvalho de Melo" <acme@kernel.org>, "Namhyung Kim" <namhyung@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Rik van Riel" <riel@surriel.com>, "Harry Yoo" <harry@kernel.org>, "Juri Lelli" <juri.lelli@redhat.com>, "Vincent Guittot" <vincent.guittot@linaro.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Will Deacon" <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Nick Piggin" <npiggin@gmail.com>, "Arnd Bergmann" <arnd@arndb.de>, "Muchun Song" <muchun.song@linux.dev>, "Oscar Salvador" <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Jan Kara" <jack@suse.cz>, "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oupton@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Anup Patel" <anup@brainfault.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Janosch Frank" <frankja@linux.ibm.com>, "Claudio Imbrenda" <imbrenda@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>, "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, "Andreas Larsson" <andreas@gaisler.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Matthew Brost" <matthew.brost@intel.com>, "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>, "Byungchul Park" <byungchul@sk.com>, "Gregory Price" <gourry@gourry.net>, "Ying Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple" <apopple@nvidia.com>, "Chris Li" <chrisl@kernel.org>, "Kairui Song" <kasong@tencent.com>, "Kemeng Shi" <shikemeng@huaweicloud.com>, "Nhat Pham" <nphamcs@gmail.com>, "Baoquan He" <baoquan.he@linux.dev>, "Youngjun Park" <youngjun.park@lge.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Qi Zheng" <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Axel Rasmussen"
 <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>, "Chengming Zhou" <chengming.zhou@linux.dev>, "Michal Hocko" <mhocko@kernel.org>, "Miklos Szeredi" <miklos@szeredi.hu>, "Xu Xin" <xu.xin@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org> <20260917-b4-mmap-prepare-vma-flag-sanify-v3-9-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-9-4583d8a23bca@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::23) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: edf265e5-c947-4645-88d2-08df1b483c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|921020|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FLtaJ9ZALhQwBsRFcwzKy9Kd8SxHnIIhzOQ8HriAP9dpabnDLWKsGYRowv0fjoYUxwJCaMRFzrIfUDLr5N1P/kvxXSsqXdm4SToGyG14VSqQOl1mIVJ2MeAarZ+54ejCYdnMshw9AREQzKC/su/8bkJ480VpxGK0rmrv5Qnzigpbj9Cfmc2c4C90qGbarsdIlccH4JsOe0pKYiTmPi7cn0ybqWeeAC1FWJzqPFJdZBqdvZ2kR4nVq6tXc/9hh9VQcaFz26L54FSEiOG6ZGVlyjf3o5lW/Lk7l3KVV47jQtsOz4gY359Rovoicr3eTx2NglgLKGg9Hdr5PWWuzerLzvIF9S1jHJaQzlpn6jx3O4N81fC6NS4vzx0NJU3PDL7mX0Kg+jjNUUuIJbjtt8TMJHujV8GgCwClFc/4h+GcbEmFIRhgqeLGcpCceZGnt95ptDWS8P6oN6MYdzfIvHeP55GD0RiAa49YKBW9ccm7vK5B/S+dJmfmG4LFS8BRfAoevDVlLAvZQocQUm8Zps58jCwISlELvek36MXn/aCVp6u7xdXo6wEhe4i/GdmZ2Ow8FGbWUYucFqL3UHnF6Mim1x8Hai5EQh/sTqvhnqciCaLnhqPZL+jQLRuJt+uagZxvFyQkLvpHjAD4P6skHW0Arb/FoLz3gIzM3QERf/941OekSNSWBEIgLvVgYySqfw1eAxg+dFvwoA6YFf7XHIg2qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(921020)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tRYitWYnJMc1dRQUQ3QStxOGkyNXd3eVFJSnFXSE9QRXVQVGpJZ1pBQytx?=
 =?utf-8?B?ZC9nUUJzUTlvcnM3blROZUJQY2Zwd3NVS0VUVjNkeWkzekNIVExVdjRWNU9Z?=
 =?utf-8?B?dFUrTGxiK2c1bnUyWWYwOFEzS3ozcnpVaUZadWwzKzNjbkVnYlJyOHZDdEJi?=
 =?utf-8?B?RU13eXFidW95b1VWaFNHdW1DWVNmZUxrdzNvbG02ZFdGb29qb1FYb1dxbFg2?=
 =?utf-8?B?OGZaaXpjQ0JvelBnUFlhQUQ1WDlISUhCWFlSNi9uVDg5TTJZN2U2aGdqR0g1?=
 =?utf-8?B?eTF4NUljUXorZ09Wc29sNHczRE8yZ0xycEkrOTI3YmF6akQremFFZFkyRE1G?=
 =?utf-8?B?UEhFRFUwLzNOVzhVdmE4N0gxalRpb2xtOVEydWVzRlRHN01NWDlnZ0UvbmJE?=
 =?utf-8?B?Uk5BOTVldWpwVEp0WlBOUnBGbkhsb1dGT1hTSDlJS0taWnExc1dqbjdyN01z?=
 =?utf-8?B?Q01NRG4vN1lSOFBEY0hSeTBnZUI0OVZkM0FKVkxINkY4TnovblBlSldHb25m?=
 =?utf-8?B?R0lQV01IS3Q2ZEJ0UUpyakt1Tnh6aHZ4OHpQM2UwWTB3SkJFU3hIOWpCak4w?=
 =?utf-8?B?UU5rVXNXVno1ajJOWURTcmM0WTEwdDBxTHBQM0M0V0JUK0d4T0Z0bWM1NTl6?=
 =?utf-8?B?UWk5dFkzREZJb2pPS2VKTVF2Rng3ZWVJTlFnNVEzTGRTaHhXdGUwUlQ1Mjg2?=
 =?utf-8?B?Uy9qNEtSdTFMMDZXZ1QvQ08xUW5aOVAzalc5V2hYc1BVOUFvS0dVcjQyVlNM?=
 =?utf-8?B?K1hDSnNxbUEzMUtTWVI0Yno5UVZSblNoK0JzRjIwZ3ZsSXk1OStSaktVdVNw?=
 =?utf-8?B?SEJEMjB4bklaNWkvYkVpVDltdG1JRGkvRXJpYjFocTNNZndCRnc2d3paMmVX?=
 =?utf-8?B?ZlFCakk2dGNRcHNkRjYzeVAvcFNTenpmV2RYejUya0JacFNRQm5CM3RVM3ZO?=
 =?utf-8?B?KzNYcWZXUUk1ckcrWWJOdlpXNTBoRS81eTEvdC8yYm9oUzZ2VUhGRmR6bGtS?=
 =?utf-8?B?ZERqUVovZENLbmR4V0RiZjVzNmhLOXR2bUVLczdONWI1ajE1c3BpYWtyNlY0?=
 =?utf-8?B?SEVsNTU5UUZNUVBHVHorQlcxN2VpZ1lGbWxBRlR3TVJjcTBaTW1yOTg2OU5q?=
 =?utf-8?B?dEpsVExWVHBVQVNCZ0JDMk1sU1dkV05QT0xuWkh0VDdpTko5cFlQTGFvNDNn?=
 =?utf-8?B?ODJVanJGNFlIbTF5QkJpUXg2aERIaUFKaDBsYk01L3VzOS9HZmZqcjNidkZD?=
 =?utf-8?B?Q01pNW15UlRuZEtVak9TemJoUi9JUCtUaVRpaVliN25CZ0NxK1hjMGJXSVh5?=
 =?utf-8?B?dnlPNGJOVVdxVEJoYXJ4MnZtYlV3MTY4Y0Zva1hZdzJTc1Q3aDBLd2hhNll5?=
 =?utf-8?B?ZnJ5R2x6RlVhcUd2M3dxVmJJTFVKcHlFMjZpSk1YZDFHU0RiY296aFErYjNu?=
 =?utf-8?B?NFJYVjhKWDY5a3FBMEJSWGgzNDNuQms4cUl0dUoxTWI4ZFpVa2p5QkZVYndi?=
 =?utf-8?B?MWxOc2xxSEhCakhvOW9yb3B6VTNGNlFWTEVCU3V2TG1RekFuUUhMNmpySEVk?=
 =?utf-8?B?YVNJeUQxSVFiaUFQZWNWdFBXWWxYKzM3cWhCV1N3b3VnQkFEenc0bDZVeTZ4?=
 =?utf-8?B?ZitvVFk4d3A5R2k5MHZESFFtcE05cktIUmhNOHJSNGtjSmt1NkpmbzJTRnQ3?=
 =?utf-8?B?dC9ZNyttWXc3UCtZOCtJRjNzeTU5NGxnbnBFOGUrbFNsa1grQk80NVd1MTN2?=
 =?utf-8?B?ZXp3RGc0c0hrMTVibk5tWCtqeVp5TWsrMmE1UlI2TUJodEx2UW9UM3dWNWhI?=
 =?utf-8?B?OGVWY0dLUHpiakNYZmp2RUI2OVZ1T2RMNUY2dncrSndyY3ErZlBqSzFmaGFl?=
 =?utf-8?B?aHk3NXBXdU1tWG5ETHhQVmMxSFhNMmF5WlpVNkF1YkpEWjRORW93dkQzZjFO?=
 =?utf-8?B?OStlRXFRVlE5R2d2c3ZqbmIzSlA1SC8yTXltS2dIQU1xQ0d3OGg1N1p1cnZW?=
 =?utf-8?B?UGEvemwySHhpdk50cXdPbXJhQkR6L3JuSkhSSjdYaDhYR1kzVE1NREIyQXI4?=
 =?utf-8?B?TExkVmpCZTNYTFBseGtnaEJ4UE1wQ3VCMHpVTGxnT01WWUlaTzB0MlNJTjh6?=
 =?utf-8?B?YmxacmlxSHAvQ0hNdDIvTlJtRlV1QlY5VStON1dXbUlidVdGMWlkazB3K3c2?=
 =?utf-8?B?V09lVXpQemY3VGVkZnlkZzBSWXRzUHIzWHJXdytwSVROUng1bTV3bUtkRmo3?=
 =?utf-8?B?bXpUSUhVM1pCc0ZMYzV0ZVpqb1hXUENXYnlWWVFxZnFrMW5YRVdaY2VpdTRk?=
 =?utf-8?Q?omsE94nfnfBSyzrqtw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf265e5-c947-4645-88d2-08df1b483c68
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 21:01:57.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEqkynh4TwubVa662mfBuxGxlo66Ffe0nJf8ROqgloPDEP1qMa83mZpLKehx6Pig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_140209_177046_41F75E13 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu Sep 17, 2026 at 12:22 PM EDT, Lorenzo Stoakes (ARM) wrote:
> Describe the newly introduced discontiguous kernel page mapping mechanism,
> detailing how to use it sensibly and how the API looks.
>
> Explicitly detail the various discontiguous actions available and how to
> use them.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  Documentation/filesystems/mmap_prepare.rst | 81 ++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
<snip>

> +* ``discontig_kernel_map_page()`` - Maps a single page, correctly handling
> +  compound pages (if the compound page is bigger than the remaining pages in the
> +  VMA, then only those pages that fit will be mapped). For a compound page, the
> +  head page must be passed.
> +* ``discontig_kernel_map_page_range()`` - Map an array of pages of a specified
> +  size. Note that if the number of pages specified exceeds the VMA size then an
> +  error will arise.

Why do mapping a compound page and a page range have different behaviors
on the bound? Either both do partial mappings or give errors when a
given input cannot be mapped as a whole in the VMA.



-- 
Best Regards,
Yan, Zi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
