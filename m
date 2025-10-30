Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D552ECCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkUCX6Wrir7Tk9PkjSRoRW0rVCrk0UguNdbwBDxx7oE=; b=rxWx8vqSM4Y4UI
	rxOE9ncnp/PIUcHswJweCRw2VD6CLAnowkDoRTcAslQzG+yu+GYUYe4+q8xOfATBchhUFG6Oa4xus
	wRKQvPiJJlvGaGyoGMqIhphKAKHud+LqXoYoKykv6L8LjkjW7VgTWZVCbYthF6eYdN2H19HHoNlsO
	+Kn/cL0bghC8dT5oul5pZgGY+QwfxsEof7yfnPK97xF1L+QsIHK7FYhwDPQCY/fD46toGrw+tyDVW
	HB5FOqUuCslBPOtq/lqohS/6mHbWcHTtTqp8tCVSxFcIVEE3ff6Jf2qTgtKcjpz+vF9y+dukSMXqU
	bhxytnlrUS3syCaWqzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaxZ-000000053TP-1u4D;
	Thu, 30 Oct 2025 22:17:33 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaxR-000000053SC-0NYz;
	Thu, 30 Oct 2025 22:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761862645; x=1793398645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/F0+OoAuXlNyFf+QLrjzXhi3p5q5nzVUtr1LLuss5sA=;
  b=E2xKUMjD/eBD/em7qIkM0BgqKFUFoFH8Lule7n8vOiNcMTFJT7CVn1G2
   21wMqY4Miz/Y56wJUzX/D3l07b9R8vEEbVuq5XvMLC8HsL/kxWrWRQX5r
   EW9Mf9rXj1fa0fZ4maifdvtYX7dUIks8aIRPIAxQFuAblP3PE1mwCnD0d
   /2VW7N6uE3depUv5QJOhArWbqPMNetl77wH3E5Fmty/B1JE7m5tYHWy33
   EOBBJpd7PGruvl/X5cA5nJcv5deygJy18gaT7LyKBMfEc4kdckQjJclGw
   ip4HHhAQNFpF0zBN2EWigYWoWjBkpYMUCfxqegzsANJXmXHY8MBp2SlW2
   g==;
X-CSE-ConnectionGUID: qd6o8A7fRnilWpB/e6zkuw==
X-CSE-MsgGUID: DvCuDMZNQwqM99DNfriHLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66632801"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="66632801"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:17:23 -0700
X-CSE-ConnectionGUID: Q5sQPZifT/GduSb88/6NOw==
X-CSE-MsgGUID: 6LFBbq+SS9maX+qW04wDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185344768"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:17:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:17:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 15:17:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr7M/hW87pQz8WTnPq2CDvvbaXB1JvtzpcHVYXoqz5yE5kQbjR3yRme6JuNDxBQ2wUdsUZh8j+YiI950lufa5OngkziN6Nm6wDFq2sgL/XHg8bbOTpG3Uh8Ffi+zf4GGcqiGTiUD52G6z24/e/JdxKIby6CVGm+S1nUEGYDa3bjlwqn0nkDa9hEtNWk5Lg+fKfHBllfiOBeDiVoy0/YfFyeRAy6z/SYaNB7pjZ1Hws/fF1huObSYlpzVH+d4+kaudrAdS4ufHNJdHAv2T9FOP/cRAVjMLPxBviEQC5tcSZREqY/ErWQmZleB93hO6ob5SDsIuRuJS33x9mOKWIfkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F0+OoAuXlNyFf+QLrjzXhi3p5q5nzVUtr1LLuss5sA=;
 b=hK4TCYppFEp/swdQPndsL2QOvsZI0AxpShytuVc/LF2RGylOoiuRFR+8mOTJ7ZQ1aAMCh54ksZ3/2JYAo9Ftl/7VBZWv36SLXKNzY/M2/aWYpAlgS7BUjEYZdJyLAP7bM2k5OSQAj7I39KXkbLDRarjJ9Uurq7dEIWGQYwQcnt8MjiNPwVBCHIbIrbTxub71T40u+GoFQqseavV+sYan+DVrnsKhFPlKOQyWlO9glVDowGsfYMiG1uk7qpBC993abRLL1UOAi9ZjjIT8CqhT4fRYBedvLyPDvI4k/U/hB2ZdTh5Y84m90CMBgwHmFeknuC36BFQdVj1i4fyKiAZsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 22:17:18 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:17:18 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into
 an invalid TDP MMU root
Thread-Topic: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into
 an invalid TDP MMU root
Thread-Index: AQHcSdk+XVigdecBoEyJc2x+yaHh/LTbQjKA
Date: Thu, 30 Oct 2025 22:17:18 +0000
Message-ID: <12601cb031b7a19dfc00463e6d6948dfa6187172.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-6-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-6-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 3aaabd09-895b-45c3-340b-08de1802169d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K2tkQzhvMHpKS0o4TzlteGxOSkl5ZWVkSFArcFcyYUZxbVVOczFpcGJlU3lI?=
 =?utf-8?B?ZWxaSDUvTkV4b05yNklrYjVNeWp4aEErb01SVTUwTE5WNytJcTE0TTZtb3dK?=
 =?utf-8?B?VWg0alJDMFR1VVBuOG5CV0RucW8zUFZicVRwOFFqamgrSkpMUk9YMllVZjhN?=
 =?utf-8?B?UkhxdnIrN0R0cXA1eVJaMzNTSjY0RFdqcmo4cEpxYkZhbUNtbG1qMU9yTkIw?=
 =?utf-8?B?Mk8xdnhkckVkbGxqQ0NMeExRdFFDdU5hR1JlOGpyNVVNemRKYTNJYWFJcWVh?=
 =?utf-8?B?ZUpKcVo3K3pyRlJtd3dmMTdMcHFOYkFYaWtaMG5xU2RLTjFKemtCMjhOS2lR?=
 =?utf-8?B?QWJPb1pCL2tQV2o1djA1OStUdDhrc3l3SWhDeDZ5Z05pWThOK3pIeDRNQVAr?=
 =?utf-8?B?T1hUaHJaaHR6dXFrVWJiaVZWczNRM2JOT3FxM0ZUamlrMkNsQ2dGSlN1TFRZ?=
 =?utf-8?B?ZHd2czhrUzBMVkN5bGhmOUM5dEQrajZoN1U0ZDlHMTdNVjRwS0pTRURTU0pT?=
 =?utf-8?B?a1h1TStTa2YvdXRLeHFVcDB0dU8rVFV1SVpZNVlSaTViNlBrYUttYjZaZHdY?=
 =?utf-8?B?M0piY3Q0eGZJeFJXaTFuSFFydVdCYnZ5ODhNMWNnVmxma0dsNFZ4c2VQOHRj?=
 =?utf-8?B?RVk0MjFRdXRyUkxrbSs0NzV1UXpRVzhUNllxMDUvV01nSTVFSlljWjVCQ1BJ?=
 =?utf-8?B?QThxNHUwRzRSVTRmV1VTaytJWFNBTDdRR1lkTG1sMjhCRGFuM05SUjMxSnI5?=
 =?utf-8?B?WmVtSWJWc1JCYTNTYXBwcWRDbS9lbTl0SzFtMWI0SkFyWk9taExJeEdiYTQx?=
 =?utf-8?B?U3lkcEppRUlRT1FqT3A2WDNoS09ONkh0cmZpVVI1Tm4wdXUzdWZ3ZWd1WGNB?=
 =?utf-8?B?ZzlBRTNxcFZPcFBRa1FqMkw4Uk0zNnVaVzdFSDlQWmpPWFVFaTNsTGhHQmw3?=
 =?utf-8?B?WUUzRW92a2l6MFB0U3hCamN3WFBMdmRyNlF3MkVaY1RaZGU2cDNFWDJoNXBv?=
 =?utf-8?B?RERHZW1DOUJOZkRGbFRGZUx5eFZQL3IreWloQ1dvbHVXc2ZoNS9kNVZBeXlD?=
 =?utf-8?B?RHFuWVNocE5icyttelplR1phcUh1UjdxYkJ0QlJBdUxVcE9tcmp5OU9HQUJW?=
 =?utf-8?B?UW9BdHJwcW94MGNuOXF6QlAxbU51TVNQWnE1RlVSb2lwNzhtS21oYjhsT0E2?=
 =?utf-8?B?WXJ1QVA1eERUcjY2a2ZMd0lMZUl1cWpRWFZPa0VlcWs1NlVBcU9aL25MUEdO?=
 =?utf-8?B?MVBBRW1HclZEUklmVFQ4cm53YlhvaHpVcE5PL0lRc092YUJKeklEeWkyRm0w?=
 =?utf-8?B?S2FGUlh4YjJlaUlTYmlQNVdtT0EzQ2MzRXdUSlptV1FtYlNYNUtSK29pYVhW?=
 =?utf-8?B?QW0rM1dhZG1ROWdqOEhaaU9WVnFvNmZzcXRONmNxcG5KN2dGMVgyK1VvMlRL?=
 =?utf-8?B?K1JFQkVzRWxBdUJ4Y2w5Zm91SGJ6NkxVKzhlZjR1TFJ5WmgrYURMRTN5cXll?=
 =?utf-8?B?Rm1CQ3JQODY3aGFHbDY1SDFaYlpsWHllUUY3K0poYm5ZZFVxcS9wekVQMzZl?=
 =?utf-8?B?aUZkcHQzWStLeldOZForeWdsWHJ2RGFaT0dFRHdMRk5yUWxNWEgzVTJrUStw?=
 =?utf-8?B?eUk4bHp1RjlJclpkTTREdUliOHRDRGdMMVJTRGxGZjlDUmlReDRkaVhVTWdv?=
 =?utf-8?B?eEp2QWxWMzVKU0l1YStGRmQ4RmYvT2lCc2MyT0RYaW1ZVUg0NlRwdjRLMGZS?=
 =?utf-8?B?V2VmSmJYamIyelVIeGtYOCtkcUp0TTQ0YnloNlI0cjd4T2xYS3dwTFpmcDVT?=
 =?utf-8?B?SVFvYjhKNmxZcXUvUnZKOGJlZnR2QTg0bjlFcFBHMnVxUjNsOXFmcUFpdmll?=
 =?utf-8?B?ZnVuc3F2RFRYUnZ6QnJ1MG0vUGZzSUxLcENUZVBER0JjUVZNZjJ0M0RuZjlK?=
 =?utf-8?B?RU16TWdNRFRxYU1jSVRGenpKNituV0plUzQxblFuQ1Vza3NvU2hMdWh6UEVS?=
 =?utf-8?B?UjNPVytqd1ptQjFSbU50YW85NXE1d3RIQllXSGRrazdaSmdBVklRdituNzBn?=
 =?utf-8?B?Y0JWRVRSK0xMQ2R4bldpaEU1M0NNSzFFMDJUZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckdUYlMrYWViY29XSEgxZ1grVG1aUTlLdDA3R012WVVyMlhmOVFpc0hURGgw?=
 =?utf-8?B?SlFwcUxCTkJQWnBmWktVK3BYVkxJQXRmY2NNSlp3M1B2VVhKMlZyN2VOa3Fi?=
 =?utf-8?B?K0ZDWHc4Ykt1RDNsd2pYMHB3Sm1XdVZLWXhMUWlDc1R3TGRzc3RLa1VZKzcv?=
 =?utf-8?B?MnhYVnhUa1YwU0RXM2NhZ1lBczZQazNoNHowY0RXVWVSam9ZWDdhSFJkUVNs?=
 =?utf-8?B?eWR6TG5QOGlBM1VWSTNkUk5yZUtlMHUyakQwSG15Q2d2T3ZEdkVHQjdHSEt1?=
 =?utf-8?B?bk1SeFFXVHd4R2NmUm9oMjBLZzk4dnllQkx6VmJXcjdDK09oM0JjY0FmeExv?=
 =?utf-8?B?bytmSkJPWkJzaUpJeGRGWkRuVFVUQ0hqczYrVm9zVS9HNDRuM28wRTgwTjlS?=
 =?utf-8?B?aW5PSVlhenQwcFhZNjJBcVgxUVNkbjNPNk9FLzZLRE5nV3FGM05hbTMxZkhG?=
 =?utf-8?B?cGJlc1l0UXhWcUpNMDFKV290cjVzenRvRTVNTXkvSWFjT0xvZk8xeDhzRk9D?=
 =?utf-8?B?YzV5dUVFZTF6d05KWE1zb21CUFpsUHJRWFJ0aHVtUVYwWTN0SjRsU0FmaENM?=
 =?utf-8?B?YS9SbVZpaXVJZlQyTXhiSTlybHhwOUdtRy9PRWZ1Y2FUZXN3UGVUMHMzcXBF?=
 =?utf-8?B?REJENmtlN1NQRG1qTDhMeTNpSW9vUU9ESjNOZ00vbWFDSVd5K0FyaHllN1A4?=
 =?utf-8?B?UkRiWlNYRHIxLy9FRkwzL2cvWGNnS2tKNHlwTXBQSE45TkM3SldhaEN4b0lT?=
 =?utf-8?B?bWZyTDFkbFNYd1M1Zk1taEpuREM5allHTys5MGZuZE43OFJUSXp4Q0JWUnNV?=
 =?utf-8?B?SkE0UEppUnVVMStRamxCOElVSDBweXFTZFBVb3p6emRyQkU5NkxvV3F3K2N1?=
 =?utf-8?B?YWhkY2lHb01TTjVBb1BLSjB3WmxGQXdEZUtmRXFXZC9rTVpCNU81dC9TeURp?=
 =?utf-8?B?aXNlM1pzZEEzQXlkc3o5NDlFTDJMK1J5UVJsRVdrYzBUWGpxTHIwVUNRNFJT?=
 =?utf-8?B?bkRtT1pkQitmMUpUaDB3dTVnaGFseExhcUlMUFZKY2p2R3gxRlJEYmF5OGpG?=
 =?utf-8?B?b0RDaUVPa1RRS1FWZUs4RktHK00rOXNXQndJbnVPc1k2c25PZEFyM1ZILzF4?=
 =?utf-8?B?M21QemNrYmdjYmJRRStYamxLQlFWMzRxY01rNWtFTHpxOVRoZ1VKQnZYVUc1?=
 =?utf-8?B?b0Y1b2lPZDVScFhhSmxlVXh2SGY2UGtxU0phUkFLbzZjSU9NNzNCbXVEUWZX?=
 =?utf-8?B?cW95RUtqd21HMWpqV0hTQnhHaTMyTjgyTXU0U0VkL2NuZ1pyMC9WTGRyajZN?=
 =?utf-8?B?dHlqaHY1SmtmRG1QWkRyZFZmcklZemFvbWhlTk5sSFgyRmV5WXhkMHcweHBO?=
 =?utf-8?B?MHBnOGhyc2lqV0FsbU5COHdDVk41UXVUR2FMUlB2ZzluUGtoeHJGbjNqTUJH?=
 =?utf-8?B?Z1BBRGtHNjgxS0oxaWZ2NnNSa0dEQnpaZmlsSVQxZmlDWEdkcCtDVjkrMTlS?=
 =?utf-8?B?NC92KzNrUWpVaWxpMHNMNlVmYklDQy9PUTFBbnpLMlVPTzRNQzFweEMzYXcz?=
 =?utf-8?B?cTZCcUxPd0Q1QWNGdHAxREZiYjlnck5JbzFEWUhHQzFBeGVSRDVReEpSYTk5?=
 =?utf-8?B?RWVCMC9nSkUza2doK0dVT2xhcWJlTWtlTnVyOUNJaFcvZklLdzV3L1JVU1F6?=
 =?utf-8?B?VnF2Zlk4cHFwWS81QTQ0RUt3dERjU0NFYnU5SmF1MmRtTGZyNlFUYk55b09v?=
 =?utf-8?B?Q2FrWVZHN0FmVEUzS1J0enYyWDdYUFdtV3kwRXV5Y016eVBUd2xDRUkzZ090?=
 =?utf-8?B?L2IwZzZWNUJzSkJQSWFFMTd3STV6UXJSTlhaOU5RMHRKdk1EM3JWU1l5Lys1?=
 =?utf-8?B?NVNuYmlNQWZsNmlsTU1abnpWK3hZNE5nNFp1M1BHbyt3dityRWNuS0VzcmMv?=
 =?utf-8?B?MGZaRENncVRDZEdUT3NvSkVZV2JER20wak9pZFpjbVFTd3RycXArRkU4VkZ4?=
 =?utf-8?B?cXVtY0Z2c01FdUhFV1JQNmtnZ1p0M0lSazB1L2JWY2E1TmduQmRDSnk1RktG?=
 =?utf-8?B?SWUvd1YrU2RXck5zQUNwY3VQS0p1VDJEb3kyVTlTemVGZGtLcjFoSmxKOFZ6?=
 =?utf-8?Q?liYUcACbXNMs1mUmbW3yUfZSl?=
Content-ID: <6DD908AAC1368448BD1A4EE2BCFA6130@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aaabd09-895b-45c3-340b-08de1802169d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 22:17:18.1038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKWahFpA2yB7gnFK8QIngOBRGyfbRl6GoSmD2hTKe98hqQl5ziAJU/mNo5ero49NQG2Ko7bn9+PndM4gh7tdAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_151725_173235_20D66FDB 
X-CRM114-Status: GOOD (  14.12  )
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

On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
> invalid, e.g. if KVM is attempting to insert a mapping without checking if
> the information and MMU context is fresh.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>

> ---
>  arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index c5734ca5c17d..440fd8f80397 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  	struct kvm_mmu_page *sp;
>  	int ret = RET_PF_RETRY;
>  
> +	KVM_MMU_WARN_ON(!root || root->role.invalid);
> +
>  	kvm_mmu_hugepage_adjust(vcpu, fault);
>  
>  	trace_kvm_mmu_spte_requested(fault);
> -- 
> 2.51.1.930.gacf6e81ea2-goog
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
