Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE6BCA5FAD
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 02:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:To:Cc:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp2W9tW4Hlw7DKWpLdDWB+V9QYGiGEVUsmJwpsk+uCg=; b=VZ0i7I+FdPbqzw
	4mC83JU4Fk2rWBlODyR4Wll9hCqJ7xwpj7nzk4DTPCbVOduIptv8xlL1Y1h3Vdcr3bpIrtKQAAy02
	BSy47sh1L5AwTRZZQVGtrOikUUm9LAVL4z5T00Js0jdSQHQWwz9R7hJAwgK0a7ist7FK81b1AUI9w
	l33d8snAsvRr3Gy+xYyKN0ba5EMR6tqwLDKgQrEOIosmC1jrRXzizPrgzIf2+4viMMvJnJ1twryk8
	997+6uvybxo6NJjptA19OdyTzW9mPaEfmI6j8NWb8hslKpTyvWaj+uBA/JEwrwuEsZhcVEVGwv6hx
	cPKoZ0FlRoof0GQeZ/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjcj-00000004tSq-0B9P;
	Wed, 30 Sep 2026 02:00:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjch-00000004tSJ-1SjM;
	Wed, 30 Sep 2026 02:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:References:
	From:To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C8C4go8E0RZzT+lyzfFvWXB7B6s98fohaHidZDOAA/w=; b=DSaBjxGsx8r7Vu6JlR6NN4L+k4
	Br8aP0+GIaSR902+RJ/zq8MrovcjGsVzb9uuC+92+BCfvucvvxIEsRvlJhxp3mv3w7JNFL9vnTuwO
	JlcL6xdLM5Yyv0zyWL9gF+iI/JFM3RGlqy40TMCAmaplc+EvmyBhakEx9uHTn0uZUqqDGRUdppel1
	W6BfIICoZs6x5WUdyBZP0pYvHf0HHdqGeka1xa1Wr2JDjSxMbmsUwycSuQJDS5VUaczz/AfyBF4Br
	gbmeWQ/FvLKbpfu5wY8a2mDm3mUI0YS6gzFdsElcTUViIkD1Wv6BughYPQqNvEbyXCz6K8rMxMC64
	YMUmuvqQ==;
Received: from mail-eastus2azon11011046.outbound.protection.outlook.com ([52.101.57.46] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBjcd-00000003Fs9-2XzB;
	Wed, 30 Sep 2026 02:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz6bMDrTSsJCjw/YJlCnePVsGUPyTiy5egoH0kWPIaDhHi17m/ATFQ23D7kRYcUCKJbtwdrPNPj3XWmRndxsGKFhA9t4kxyq4zx4yadkNWH2MWogGB+MAJhtur0NAKxkQfHhKGTMa0eEQEDZvXq85p2LAMyWV30ahiXu21AuByV2ypBPcdZDxrz+Q92mp6ml4NXpykQRyZdwW6LWaxEVay3jq6gCYL3U8eexulHkNr3an3EH3UkIQyC6sdKZbYYfUnD5r4bRwsTUnDBL/4e3605GJc30D0ssfmlIpwMkyWB4sIoAmg0zjWJ2d7J+I8a6VzZujffgIiqVsMIsdfTaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8C4go8E0RZzT+lyzfFvWXB7B6s98fohaHidZDOAA/w=;
 b=KZOxlmM7yRSQuDtwKavGG8SSC0VqL76FM7Tl1Ys41bq5pHnQHiMGCOhjowLeLj5rtlVkCGKidFUm4vaRxxcvAVQCUuVPQOsMTGcpZ/BkKvwm7JkSIjg+GS0IM9xoXd1hMc4mfu0l6F8hR/Xl3EQjNQs1SqBsjCWWJkkV14oZfkE8cbK3Z4rqd64PRc07EOU0HbrBClQf1ZbRO7Icap5kWoJVTUCfzPuh5/P6nAPCbMxJvHRg4ukurqtX9gJXTFj1MSghtGSkTz+rAmKBbj4s/8TvpmIVLeszWQTH4RDkNAXh7rUdqpVgIiOmoVWJhv06FxTn2zGz3Y1F4Ih6RwX3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8C4go8E0RZzT+lyzfFvWXB7B6s98fohaHidZDOAA/w=;
 b=ct+So3rJDkU0SqKtyNlsQMApkkYbhC0FnHr+dREN+i0KQimHQqPVPgrigWHJjBk+V9T757jAFM6eq8gnpjdhrc2WJpznUlvQ7wrS/u0VwNKOaSdytReGI44osgbms04GLAAlSXmykaPFpvhDp6/S1Ly4nBQfZ+NKEk1Qfq61jUypan+0Jognlk6YsGGTwJbu9LSE0uTwtO1ioHtzAidk1pE2iwp8MYzqWO/RV9s7X5A/JWZnP5OFqlagnuwMvmv0vyKefROu/mMFwxIeZB8FtdLjeiQAMroqSXqFhdjJDWK9xsD1Ua5XfrYD+2KCHMFoFIT1X4SNmx5m1yVAPc2SjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 02:00:25 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 02:00:25 +0000
Date: Tue, 29 Sep 2026 22:00:20 -0400
Message-Id: <DLSA38L0GZRA.3J8T0HX37HNQX@nvidia.com>
Subject: Re: [PATCH v3 31/40] mm/vma: introduce vma[_flags]_is_persistent()
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
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org> <20260917-b4-mmap-prepare-vma-flag-sanify-v3-31-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-31-4583d8a23bca@kernel.org>
X-ClientProxiedBy: BN0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:408:e7::32) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ0PR12MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8ca4dd-8368-4532-03e0-08df1e9697c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|921020|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9UETUuqxC6BxW+AaorBBKCVEMTd2k9V9YibvYTnUVINMFcXVpJ/rYiWoXlLMJbE3TkiXa431HZI5MgF508iEqHgpNayB+mPCIFDBXsYUSBC4D3y1jXo9MJOwQ1usPWLG1Da5iCEXLNLu+Bihu7hkyBABUQcBLEdlWpqCNLc9EaVT+YfxH7U8IE9nFSw3IzrhcqZvqrgRaoeso5lpQfJapKliwaJXBR48CcjcOYNLubWfqJ1efgFYj4SHPSaR+BIpR2FlXKq+NbZ8iuVZKcaNQh1Nd4/Rkzd8JyD9QF/EJK/XstJY8zb94bJIiWYmJFpKWkKN5ateZBj6gj+VtP3oSeWEUaHA5LjPcWk03OXaBW2lzP/CTyw1N/WlthRVf+2Uaqq0r1pC1PRKlyURBcs1s6gLHA/gW5mbuTtDKX9gEPc+vf0M7WABgkUZy2kd9fFNjJGItWRB4HXlP+8H/bDyBX8j9n0Mn7wL3CVO6aDI2O0Av84JLvxtcsvHR08XMleNDopfzfXISTygNgu3botbE+76rh2SEYB59vqlDbJfTXZnFs9PsmTASogutcfYYIssKMXE+2rS4M2LKebEmyEjvBQ91xaCD+Kox+9w7SF+RzG4NjcYPzGMpW1qJSDYVHCypsWAL4Mzjk95y04SY4YTI/ElC2tLctNvH4VulxA2Ef9eR1RBx7L+bvPq5V/7GHAN5WHtOLBRqoyDBMhmsk4sLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(921020)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVLZ3A2R2J1Z2ZHYkg2NHhiWmhjaHZ5UXRLRU1JQlpWVmFac04va3c1bjJM?=
 =?utf-8?B?bVRjVldMTXdKSjUzMXlwK2VkWHpmTEVvaDhnUVdISG56MXdkQ1ZmNVNXU01C?=
 =?utf-8?B?Znk3NXg4cFZWcVoyNStmbnRka3hVZVJCd3VCeC9laDE5MFRJcVMvREdQL1RG?=
 =?utf-8?B?amE2THd1a24yWFczaGc4akE5eHFkZlo4R0pWQTFma24wWnh3bHUwT3lNMHNC?=
 =?utf-8?B?MS81ZHZscHJNVUtGdVpCaVI0N1JHVC8welRHc0dtTWlZUkZYb0JuY0NobFln?=
 =?utf-8?B?UlBxNElseFdzZG8rdGJwdzJ5bGJiS2gxSDF0SGJUd1kxa2pjbG5XcG56U0p4?=
 =?utf-8?B?V1ZNRi94M0thNTR1NGE0SXhRYXpYcjliM1dzeE1TM1UydTNyU3c1R3NHR1Mv?=
 =?utf-8?B?aEthNzNsb3BXZG1wNGdXL3JUZ1NpWVZZN01DcDFXUVFlM3BuSFhIYlI2ZzB3?=
 =?utf-8?B?ai9qc2tqNXlyazZkbFVZOHVMZ25kQVhJQzZyRnkvSk5qaS90VmsxTjZjWmhN?=
 =?utf-8?B?NFg4Nk9vVXZYcmgxNXdobHBTSnlJV3VDK0hnZm1JS0dxeUZWcW9ENzRKRDh4?=
 =?utf-8?B?eEVMUVpkTFRzYlRJNUg5dVY2RTFpS1k5SHJKS01UZUYybW1jcFdGM2p4MTdP?=
 =?utf-8?B?OFkzaGt2VFRjOVVyQlNSQzFYZWptaEcwbU9vdy9OaVc0UzJtQ0RMRm5QM3I2?=
 =?utf-8?B?dDFWMUswZU9PVjN0R01HenFiM2xOMzk3a0hzY0w4elJxcEFVdjBLaW1OaEdp?=
 =?utf-8?B?Vkx0dGZ0TFNXOW14cldGd2EzMm1UWVR5aVo0L1h5ZGFEY29VdWVCUXM0Znkx?=
 =?utf-8?B?NWgzUGcrNWFjVVY0WEhGWG1vbWltS3M5V1ZrejlwVFVyM2p6eVcwTUxRZi9L?=
 =?utf-8?B?MWJLQ0I4bUM2VE96UEhJOGpvTEh5Q1JMdVp1S1VUbUEzalprT1RUZzQza3ZP?=
 =?utf-8?B?RXhBRWREZGZ0amhlRVEzbzhwaGpMOUt5U0d1aU5Vc3RncHNLUXB4ZTBYcVRS?=
 =?utf-8?B?d1ZyVXVCRU1RR0NIbzVUSWY0dGhFU3lza0hsNHY2TzByTktjSmRST3FMTUk2?=
 =?utf-8?B?WE1Jc1p3T0d0SFhydVEyd012SGhLczgybTQvSW9NTlQ3VHRhWUdtd1pZU1BO?=
 =?utf-8?B?ZktxUURiOSsyT3Nwem1lYmx0NWZXalBVU3NjdFBTQWdVaDVQcFdJZlBPN09n?=
 =?utf-8?B?bUZ4N2RFK1RzNkxjUHlkWnFOVzYxNVJ2VVluWmFpdHNQeGN6YmR3cElzOFkw?=
 =?utf-8?B?SFIvQ0lodCtyWDc3K0Z4OTAzSnlVUnFYQTlsemRhckFPQm5lWGNEMkZMd2x5?=
 =?utf-8?B?dUNoaStJWXgxS3kyTm13eDRXOUFubUFJTnF0ZzdDNjVEZkMrTjNQVjVucEhO?=
 =?utf-8?B?eEQ2M2xKNG5VUFhHNlk5akpxbDBoWmpVYXduZFJ3Z1hSbmpWVzNJbXVWc2hP?=
 =?utf-8?B?WDdubThRdEFVb1J6dGhJZWFpT3RlUVVkWFQ5YU8zUVJLaW5CbkNWL2pibUxS?=
 =?utf-8?B?UGp3ckYvd0JuTHRsYmRBeTBmSElyWFVrNS85UTlqd3lKdXZsaERmaDN6QUVy?=
 =?utf-8?B?a0UzT3ZEMk12RytzM09wekhDNmVjK2RzK1pJTDlqc0VuMXgrS3pxT0N3eUxW?=
 =?utf-8?B?ZU9YZGVqVXduQUtvMmFmZzJ1RFE1QitSS3N6bHFWM1JXNzZsdjZZc0pyZUtG?=
 =?utf-8?B?VloxTDZRMnU4RXpubTArQ2QyOUdSVjR0bzZuVTRDWGN1YjRrdURIejM4YUpN?=
 =?utf-8?B?SERYVkx5SFNHYlhZUEFIeEZweUlBa2k2WnFXQlF5WFU0eUd1VDFUVGNSRGxC?=
 =?utf-8?B?UFVVMEJZQVAzWjZQSEVNMUVtcWtLK1JDbnovQng3OHRwUFM2RjV5dzN2T1gz?=
 =?utf-8?B?U3pIaEZ3S3hPdWszRXdBMGZHWUdEVlVobU40eHU5MGpPdnQ5b2J5M0huMFoy?=
 =?utf-8?B?dlRzUWtTUXpOTHhBYUxnOVFIcFJNdk91a1g3cm51UjAzRkh0K3Zzc3ZHaHE2?=
 =?utf-8?B?MW9TREFzMzVXZXBJZElVaUI4Ni9WRlJ2WGtDNWxiSUZTOENxS0hINnUrTGN5?=
 =?utf-8?B?R0NQNGJHeCtSWHlmQmNHRTlKNE5SRExJUVJYa0ZKUlh2cUhtQS9tUzFmZ3p5?=
 =?utf-8?B?c0hHMjFFQnlZNExwRlpqclRTbGk1RWVNOEFncVFScEJXY29SL2JqMFhKb1NH?=
 =?utf-8?B?NXFWUnczdVJ4S1RRZTNsSjQ4RXN2OUwzV3RoTFhreUtyUG9HdHhROXY2STVz?=
 =?utf-8?B?VCt1djFlRXlDRmRTWnN2SldrZEJIRE9ncVovMFNoRlVieTcySDMxdUNUN1BU?=
 =?utf-8?Q?0z6NrChSeGdg8Lhdr7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8ca4dd-8368-4532-03e0-08df1e9697c2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 02:00:25.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpgzFGRK+a8ufYfR4cKWq2uXAP5cOmiWR/+CojWNyW7YTQ5GV3Qk1KgEKWMsZ2cl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030040_087325_8B8F0427 
X-CRM114-Status: GOOD (  18.42  )
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
> Introduce vma[_flags]_is_persistent() for the purposes of identifying
> mappings that are persistent in the sense that bytes to the mapping stay
> there, and bytes read from the mapping are the same unless changed by
> actions taken by userland.
>
> Kernel-owned mappings do not fall into this category, as their owner may
> change the contents without the user having initiated it, and nor of course
> does memory-mapped I/O.
>
> We exclude fixed mappings as these are singled out as being unmergeable and
> so cannot be guaranteed to persist user data.
>
> hugetlb mappings are fixed mappings, but their contents are entirely the
> user's, so they are explicitly carved out as persistent, as the MADV_DODUMP
> check already does.
>
> It excludes droppable mappings, which by their nature are ephemeral.
>
> Use this functionality to update the madvise MADV_DODUMP check to test for
> persistence rather than open-coding this.
>
> This replaces the VM_SPECIAL check which means it no longer checks for
> VMA_IO_BIT, however this is safe as we have established the invariant that
> only kernel-owned mappings may set VMA_IO_BIT, so we implicitly include
> these.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mm.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  mm/madvise.c       |  4 ++--
>  2 files changed, 46 insertions(+), 2 deletions(-)
>

LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>


-- 
Best Regards,
Yan, Zi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
