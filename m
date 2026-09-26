Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F8BC9830E
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 02:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpLNUv2mwX4PIjkFJyyLCgbDvSoZgBiigrPXZt7FmvM=; b=u71x50dqVg1yuP
	JjMGXwa6/dKlowO6CLg0+mWI2w+yPW5/1RSMSuEGehMCwg12UT5zb//Eyam5uCwU17v0QiWmMNaeH
	L1VHGQrowP9GDgNKdUdnHxD7B2f1gRUN26qXKluS0DWQzOfCZipo2T0jvzwGEPZHuZKvYGzE+rSDd
	UftZH6vPtqchbkL8RHBf+T6Jug4q6YgY7h2GG8v7Ht8BVw6zldba+vu25YH8woI/lkQD9c6bYRpxj
	qvgT1tgLzf/VRDBqiBcLjLlfsgTNo+g//L4JFv+bHIBO80Q/ttkUBLoSu+Rs+mNrWnNvMGebt4TD4
	uqiaK2ithbD6z00hZWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAI8Y-0000000Er4B-4043;
	Sat, 26 Sep 2026 02:27:38 +0000
Received: from mail-southcentralusazon11012038.outbound.protection.outlook.com ([40.93.195.38] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAI8W-0000000Er3N-1geG;
	Sat, 26 Sep 2026 02:27:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1c70xJMTTuYA3dwUI1MfJJh51X3JnRHhwsEQA8dBXfQ/ree0Z9qznaIEa7flmBnxin+NJ0i3VEoi+sDN/QXt12WAZgUxI56zZ7Y6kgQ2s337R2gygHqdYJVNDiMbSgsZ7wIgCsV+eAFvas9T8F/LWRDMbQS/H8gbZ8PiAoAfaBTcTfTmssKVYeMa6rgF9ib5CSWF+LIGs9sGpu0jfZJMrFV6lb9upgkHGxEPweJ1aRHDUorY7A8+85zlOOIoesGAStIRrBxmofGcVYft0EDenZkfoXRZNqnBvM6YOlVPAmITUNbqRdHnBWx/atWpAcgYDxLzvAPzWRWmND/YOCjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdnkIQktrQsEkzvEoEGNvPWCmAB3EuvaZFBaN9ZrbTY=;
 b=rg0YiGsEJRv7NkExpZdexMlqkRs1SXFSmeRyWrF3/O/UZFDV1JqlAHw65ytKU3gC/bqDbqZgeyy6gHEQDpDtpLFedgoNHODGm6kBkCJq3duATZDDUkQ2ohaavTcp9AWRZf3q5sAqyyr5fLkzzJJBmOH4OXXVEP2Y/HBVZ9FFHVnIfgtuGg/ztJpa5NdBgk6SxVOLaTEqQtM0eko+A5+f7viSi4UEPQQWOW+HANGpGLSbxKi+Ztm3hFSE1NlwuEMq55CX3loEWkYtyyMhIjcLAVwN1u2VTKDnFQBinTjuTxOUvmymchODiNiFXvl7igb88xJ/2Yz2ZUd7WCxF/Bua7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdnkIQktrQsEkzvEoEGNvPWCmAB3EuvaZFBaN9ZrbTY=;
 b=ACGtYuy/Klhf+5kU94AL8XsywdNSm4hs5oOvoRxHiPEye7tvp6DD9qmOUgiz3wuBiUxL5Z12N2Od4PYsbzT9LaCgXy47RLDEHicCwno+6zz2ObFi6vmeI4ArfVXh0imP0Ok0yOUZy4jgjJsGDXkllJL0frTDOkHsyZ4H5mly0oWm/vKTeWfvFCTwpcw4KoDrJeeOetesPFewdT0rxqtvuR8mrrB+NMZIA+rMZtRfECxyHYP9l8rMaYgh96njoJkNWdyCA4Cw5yOIq6QjkG7T2tNCodaJEl5wrN9nrhObITlZPOcsfLVkbTi4o+z7ccN/lsGM7XJSf7WewBcPoAqeLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 02:27:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 02:27:22 +0000
Date: Fri, 25 Sep 2026 22:27:15 -0400
Message-Id: <DLOW5O2LS4KC.7BAL5Q24VJL@nvidia.com>
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
Subject: Re: [PATCH v3 17/40] mm/vma: add and use
 vma_[flags]_is_fixed_mapping
X-Mailer: aerc 0.22.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org> <20260917-b4-mmap-prepare-vma-flag-sanify-v3-17-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-17-4583d8a23bca@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::31) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 734e9f4e-31ae-471e-317e-08df1b75b22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|921020|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: LZnmr9hoSUcA3e/vhPdaAobg4TPAPg9VScpJcP95oNyjYiOjBzdhGupTrSlMMtVwCcovXWbJX9slwLSm0A+fGeUTDRwkXZx6bpJaoz//Wc8VGJFo/dTLg1weT+hVVgAG0U4AyIHBHSZwT/6MQ2lrfkiWeaIb6SfIftU3Hzhh/V1iDIe3Cg2PZkZIlLnDhoCgvawwUL9Pt44+d8Reh0+Ng98WgsZany95zpRo1jn+jwMhzdqaOSu8fPZYsQ3+TFbmrbueYJYg8qNNQz7syBT3lzDiOA7ZbUBmJQiCsupH5PeM0sC3nI4TvCV8eOAwAVJTJyXYk6LZiA2zM5HRjA++41XD6re0dpwv5PUWZGF/PpCy//4akC1jTWqtNFh2KG6bSJK2Pp+bnKOvVxQVCPcCo2/eYR8cIv4xSk5eP24uBPYbS5MSo8gjHvEuMI/UElfiMNKfdGaPeUZ5jpWDyne2UWu6Tz15o0S8xgEusysJkNpT7fgR2U8DxBvRaZ8oMkon9Bz2xN8USckODjQZ/bwuSAndAjNN+f+09fItyKtuKv3ozTwn0wIIGVNamQP8zCO2NATnyiULPIzJSMXH/T/CToOVJymmDAUYUEbV20iQ4Tfx+40OOFalIZ3QvZDrSCxBj2ygdbG+c3rOYy6DSTlYbd9b/s19bx9jdH8QtXhlSRyiHwhbQFrn9GBcdRXMDRk8y7l7QqY6weQKym61LUbGlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(921020)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0hXRnZDOHluV0V2UDdxYXVud2pneHNBOGZzMERTNXloZlpKb3lMU2tWZmhw?=
 =?utf-8?B?NlZUVkFmbmNnNDd4cHlpUHE3N0RCbHgvS2cvMUh6SjdWSWt5SVdxMFFiSHlE?=
 =?utf-8?B?UUlGZzlxb0JqRXpiWXFlakFteW8yd0dJclFuaU55YjJrekMySXRiQmNYTTh3?=
 =?utf-8?B?Rjl1KzRONERMRWY1S0wrNW5QcytncTNGUFcxb0RSMmJpVUdXdWhUWndTWHBL?=
 =?utf-8?B?elluWFRMd3FaMmVENStQS3h3YS9hWVNLNUxxZFdaNlJrSGlQL00vbjRuZjJC?=
 =?utf-8?B?b0tibWVwaVE1bDBiZS9oSzIwY292cWtGVnZ6SHdjZHhSYWtxaWxzR3dRUUF1?=
 =?utf-8?B?VWxnclVxeFdYZ0ZHMTQ4ckFwUHNQZEkzRlg3eHVWaExoY04rZTVXZ1V4Mmgv?=
 =?utf-8?B?MEFPSTcvbG1paUhkVVZacnViL292Mi9kTm5QY2dRNUtxOHlGUHp4S0JYQzZT?=
 =?utf-8?B?bmpzUWtTcWk1aGx2UnQ3MXN0TDN0SFR3WStSK0tlckczQ2JteU1KVVdTMXVk?=
 =?utf-8?B?clhHYUpKK0toSEY3b3dHUk1SMVR5ejJjUHdOZndRNnM0RlhUTzZ6ZXZpd1dm?=
 =?utf-8?B?SHBsak0xUzZzbExISEUzR1FKdXR0RW9zSUZUay9GazBKNWlBeEdFWDFKYUJh?=
 =?utf-8?B?TEM0TkY4RTVKNzJZRkdqWVRHNUpTcU5hUlkyOXdLcWYyR1crUWhxR2tnVTVR?=
 =?utf-8?B?SENqaTJKNVdWbVl1M1VYZ1VUNktzUDBBQWM5dGxsbEszYWp6SFhBM0NKbVE3?=
 =?utf-8?B?cFY2RU8xR1BBOG5zMWZLTTRaeUthT3hlcVNaNnNFaHJzWnBDWXpzVlVHcTBa?=
 =?utf-8?B?RVBFWGRDU00rM0Q1VG00dkdWemVoU2EycEoyR1djSXM0MmF0QTRSY2Z3bVNU?=
 =?utf-8?B?b2swcE9kV3lhMWozTENDbm1wLzBwcXR5SXBnWEN6bXA3SGFLRE5QdHJXbVIv?=
 =?utf-8?B?TmdxNytsbjg5SnQ0dEZ6OVBhNFZvb2tEQzdsMktrWFBvOHFrdmdrTExwVVhm?=
 =?utf-8?B?VklwSXVoOFhWaW00NEJMZ1hmSEZGLzVpSVZMWDZpVStWY2xXdEVmYW9hbE5D?=
 =?utf-8?B?OE5qRXBXbzhpbzNWcEljckZCVnMzaTF5QTY0bkdqTkg4dkMzdXNFODZLZlE4?=
 =?utf-8?B?ay9HMXBHSFNodkNFTTlNMFJMRTJDblZFV0J3RUkrMW82S21ZK2I3ODhDRGF1?=
 =?utf-8?B?b25GeE1Ycm5kUnEyZXZadjdRZzk0b3hsbU5SWG5kVHQ5cUJTam4wN1RoS3VR?=
 =?utf-8?B?UWdqcHhQa2N2VFk1VkJUMFB3cmdtVXFFbFNzRWo2Mys3elQwWUFmQ1c1dUUv?=
 =?utf-8?B?VWxVQ3Y0NFNGU0VSS1FqUlpoNU9PNC9oVWdaWnhtOG1LZ3I5TmJac3duRU9S?=
 =?utf-8?B?TlE2aDdrQm9zZzNURjY2VHZ2NTlOdUlMemhFWThzd3JidXlXN2x1Z2JWbHNw?=
 =?utf-8?B?VTJpTjREMkFEMDRRVVdYRzg1WmRQUHVoaVE4T3hYNitYM3crVE54R1QxWXZX?=
 =?utf-8?B?V0VKZjR3QzdDbzhieGR2UHdleGdqd1Z5WkF5cHBDYVlNOVE3R2Y4WVZBeTFY?=
 =?utf-8?B?OHZkVGY1a1B3RHQwRlo0S1RGUCsxMG5YU1NyVkorcnpZbTltaklHK0hObitz?=
 =?utf-8?B?aFVRQXNDUllzaG1Qb1liejBOb0VBTG9zbUpweER4eTNYOURPUGMyeXk4RTJn?=
 =?utf-8?B?eDZXcXdXbGNKVXlTeFNiTVZLM3p2N1pLQ3hPd1Q1akIrN0NPOW05cEpkVnpY?=
 =?utf-8?B?aWk0OW1jSEppQ0g4ZUIvQ0RpSUl5bUU4WlRVZjAyYnFtY1ovMWdFNXhoaUdQ?=
 =?utf-8?B?TFZYYUg3aUlUdUJDdTg2c0Iyc1UrUldIMlpqdVdmbU1RY3VyaU5rbUdKbWJh?=
 =?utf-8?B?U1dEOGpHMmJvNWZBVFFMODVCWVZnbnFFcUdkamM0Q1hEYjJiSHV1QTkxeFFD?=
 =?utf-8?B?aGhuZGlTZ0tyalI5Ynp3RFRmaHJEK3NaTzhDZDQ1WFk5a0QzMEtGclpUcEhl?=
 =?utf-8?B?TUplSDhjSEtkSG5ucUJBQVdCdy8yb1JjbkVFOG1CRVRWWGFjR3VORTVXR0NI?=
 =?utf-8?B?Vk1Qc2tDVndXZjQxTVJHOXNwaWxveDhMOUFONUZqWVMvemhmNk00akV6eVJr?=
 =?utf-8?B?OC9NTHFFWXlwNW5ZdkY5Q2RFRWpscE5lRGhWb2lhVm1QUFRheW1ZN3dtQmpI?=
 =?utf-8?B?aWxTSUloRU5hZlZYV3hoVGllWUh5NUFYZjh2cUlZdkQ1Yk9mN0xkUXI0ck8x?=
 =?utf-8?B?VDBSdXlPTndoZ29XTTdCT2ZLUVJ5YzJSck9DV1FXak9xTE5aQ2NiL2Z2SFZK?=
 =?utf-8?Q?e49aF6hcrgD31bxgQF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734e9f4e-31ae-471e-317e-08df1b75b22c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 02:27:22.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVEGDMma2ZaT4p729rVBTyRiSn325lQYcjJJjAC2V1bJ91S2QhUMAGY3QsWoxeXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_192736_501726_F8A4B816 
X-CRM114-Status: GOOD (  18.26  )
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
> This determines whether a VMA cannot be expanded or merged because what
> they mapped was determined to be a set size at mmap time.
>
> This typically refers to kernel-owned mappings, however VMA_DONTEXPAND_BIT
> is not reliably set alongside VMA_PFNMAP_BIT or VMA_MIXEDMAP_BIT, so we
> must explicitly test for this for now.
>
> We also explicitly test for VMA_PFNMAP_BIT as VMA_DONTEXPAND_BIT may not be
> set for VMA_PFNMAP_BIT's despite the one implying the other.
>
> Use this predicate in vma_flags_can_merge() and in check_prep_vma() in the
> mremap logic testing to see if mremap() can expand the VMA. The criteria
> for khugepaged and MADV_COLLAPSE eligibility in
> __thp_vma_allowable_orders() are precisely those for mergeability, so use
> vma_can_merge() there (with an expanded comment).
>
> This obviates the need for the VM_NO_KHUGEPAGED mask, so remove it.
>
> Hugetlb VMAs remain excluded from khugepaged as hugetlbfs always sets
> VMA_DONTEXPAND_BIT.
>
> Also update the userland VMA tests to reflect the change.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mm.h              | 39 +++++++++++++++++++++++++++++++++++----
>  mm/huge_memory.c                | 11 +++++++----
>  mm/mremap.c                     |  5 ++---
>  tools/testing/vma/include/dup.h | 16 +++++++++++++++-
>  4 files changed, 59 insertions(+), 12 deletions(-)
>
<snip>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 4cd917f77f3f..4d0acd9a1099 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -212,11 +212,14 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  		return in_pf ? orders : 0;
>  
>  	/*
> -	 * khugepaged special VMA and hugetlb VMA.
> -	 * Must be checked after dax since some dax mappings may have
> -	 * VM_MIXEDMAP set.
> +	 * khugepaged moves data from VMAs once collapsed, after they have been
> +	 * faulted in, relying on refaulting for file-backed memory.
> +	 *
> +	 * Kernel-owned mappings cannot be reliably reconstructed from page
> +	 * faults, and fixed mappings (including hugetlb) may not be marked as
> +	 * kernel-owned - precisely the mappings which cannot be merged.
>  	 */
> -	if (!in_pf && !smaps && (vm_flags & VM_NO_KHUGEPAGED))
> +	if (!in_pf && !smaps && !vma_can_merge(vma))

I wonder if a function alias would improve the code readability.
Basically,

#define vma_no_khugepaged vma_can_merge

or just make vma_no_khugepaged static inline. And move the comment to
the function.

Regardless, this patch makes sense to me.

Reviewed-by: Zi Yan <ziy@nvidia.com>


-- 
Best Regards,
Yan, Zi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
