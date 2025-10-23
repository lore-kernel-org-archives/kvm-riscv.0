Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB9DCCD193
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edotTYvBueg/vpm+tMfEN5YxfaBuIAhy+HnM29TuAPw=; b=FsV2evAs9aEV0m
	dxn0LpTQ2DJQ66w8yUitzq9UhTGXvnCp8JS6t7av8MVLnBpT0gjuNnrI8L5YGOq/LSc75rJGSk43B
	IA9ps7hHutq8tC8oN4HdvKAFJt6Qi6Y78DAP1j2PBSgWRlRmoylrgL/kQLsj3YamKBbGMG8YSERMR
	1NgYm9v8NaMco6U8zacadtB2dgFheQ2aEYF+kkErpck2f13prAz9dZ06bzlqDZ4QfDIRaGdQbNnKk
	Ao9IETlozSLZ2k7Q1HaWAiDoAjYDZoTrQhTTgpPAW6ENwguH0ur7VuctkHAkOtcw3aS8Ch2nS5TB0
	i+cPdFX5HmC0NV1UgjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3r4-00000007kB6-1kl4;
	Thu, 23 Oct 2025 22:32:22 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3r2-00000007k9M-0Lu9;
	Thu, 23 Oct 2025 22:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761258740; x=1792794740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W+LFFGiwSu9fEZD6KeyiOMy6c8XIsgghGEHUL05FBCI=;
  b=Hrnpo2Opj28bR/NpuE69dOb9SMddXjwcM953TH5ZBshaBA9U/VQO9ZSc
   SPt5kpqvghQQGUnMRrLYV9v6uIT1Oh3QgFBTArJsUM4o9LyJ6MatsOvjl
   77mjLNXFM6k36CmO2yoOOgYSjAZjPop34Oamin0cSEgF958AOfEcbSqc0
   owgqjm9RuQIhjKZaPB5XtNrSGAlm13jEPKw2dl5CV4fqEQc2uL8p+pr9A
   bQry7WnrtzlyfmwG+k9DZS2qGvdoflg3eQCY4jq1s78qlnOjooRYj9sDB
   4qlEg17y8tp30ibBRP9/CqHHnOyUQBCRAkjMh6i4uZgXBIhm+6Yl/zE6D
   A==;
X-CSE-ConnectionGUID: 2Zn6cYi2QSSwXj3s3Pn8LQ==
X-CSE-MsgGUID: Z5GmDdExRY6u/Kddt1TNYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67277692"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67277692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:32:19 -0700
X-CSE-ConnectionGUID: J8G+cwKVQSaLWZiQzmXlmA==
X-CSE-MsgGUID: yiIWE2HoSeuxPpmXTTDoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="207926129"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:32:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:32:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:32:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:32:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukKnvQn5UZ+qXsQkusOfnIwNxSJi/NwhVWQnXeBaZ8FNisqxw0GvHTjJdXoe+WCpM55xpOVVpIqVU0gQYrPNyOUV2tL9FfOf5UonPLvkjCHK3ZKL4Iz8NmordoPk5jS2hjecu9Mdv6Fhk86d09IpmQHXgXQTYYi6PQ2wsusbs3M56mhByN4jPhi/TyqR/1JShMpqnWh7ZVfYIX3fdyjiVqNzVCuDos/T80K/EWaQIGM4Y8UxnAZa99jXdyPE0BW+MCe21huFZM7BaEeWpW3hjvl1dMjB0KprzHpTGHdEdgkA1rn6gJbVK3IBrDnbdqW5t7JsG9JXtbEydLtRNHVAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+LFFGiwSu9fEZD6KeyiOMy6c8XIsgghGEHUL05FBCI=;
 b=j4fJO1iow4T5CN5VvRaubksZQF/JrPH+gNhM/LlD2IVYBOvOvkbM16fAWcYb8aUBeFGvgDTsidUBsJnHG7kqqxWeIuxml0RFmiYgKz7asSJTMIjpWkB2XBNKpCzgXxXOm4hCJSfN2e+ZiW9RKiVFKmpATURh3NA28WJhAp5Dw8gT9/JcIlyT1CmPEzxETOhfekWzlEJyRskW8YKifI1r/6sBypMa5z4zHBmom+ZweQ3HWDxBVJYNy7Qo9YkGqlKTfL0ifNiVhdpyifmqg/S0qkNAEOsKFPUknZpSPrpI2Q/eZSlxrZcjyCyMaYNi+8QtESNh+Fc8ECx0eLONfe2TyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Thu, 23 Oct 2025 22:32:15 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:32:15 +0000
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
	"michael.roth@amd.com" <michael.roth@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Topic: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Index: AQHcPv2n07zQi2kCh0qwUFWmoDYx07TQW8QA
Date: Thu, 23 Oct 2025 22:32:15 +0000
Message-ID: <233d0250d457abd153cbd63cc8227f67b9a3a933.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-14-seanjc@google.com>
In-Reply-To: <20251017003244.186495-14-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DM4PR11MB6503:EE_
x-ms-office365-filtering-correlation-id: f045fd42-15c2-47fb-99f2-08de12840486
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aHJqcjBldyt0Z1lNUW9PbFZLZTNvNkgzTm5LK3lkM2ZhdTdzcFc2LzhTSjZu?=
 =?utf-8?B?NWRvTUIyVDNWbVUzUjI0QWwyYmFBcnczY25IdGh4S1FtMDVJa0pXaGxVNHd2?=
 =?utf-8?B?QTRGaWJkNzFZaEhHWmVIRm9PV3QwRy82QnBBV3JLeWE2RkpZa2dhb0xRd3Fx?=
 =?utf-8?B?SUk4RThNRU5FZ3ZjR2lBSFp6TlMvYVlrR3ZjWTl3bjNkNjkvTG43M1ZVaENj?=
 =?utf-8?B?SjNKUVNYWXpWNGdpSG42cnllRmpCYXRLM0JXUFNlRHI2L3g2cDg5ZVBLanNo?=
 =?utf-8?B?b1hIWVVWS2hybDRhNG9IQ1labXhLemdFd0lFcTdqU3psck1rbEEzWGRYbk9s?=
 =?utf-8?B?cmtna3F1SDlyTHdzYUdBb0I5TktmbFB3bTJ6cmx3eWxjelBpNlBtMVYrSURv?=
 =?utf-8?B?YmpwUWJ0ZXNEdXp0cXE1cE1qSHphbXdGNTFac3JlYndpL3NqWFpNd0lVSVVl?=
 =?utf-8?B?RXNxUy9nVkFMYU9MQW1EV2hjekNNNktRYXhFTXUvOVlTeS90MFhDYng1TlRM?=
 =?utf-8?B?SStSTmdHaXh2amZRUkJ3bFp3RVJjbUl5bkRxMWJGRmp0bUFKcUFSNjk3RUg4?=
 =?utf-8?B?L3lCaGtlN2RHMXFGVEdDamJGYURUemd2NEg0WGE2QlhNRHRVYzJvL0lwYkFL?=
 =?utf-8?B?WSs5Y3V5bTZQSlhTYUIvd2JkR1RkOWFSbjhFM251RUxkWGpOTEt1d2ZhR1h0?=
 =?utf-8?B?WXVjQmFoMEJWVmNxY0FUcnFCbmg3cythTFRJM3lIMkR3Ym9keDhRL0RxRjdk?=
 =?utf-8?B?UkVVTlZuVVdSMUFNMmNsZWV2eU5jSnJJdlE4L3A5ZktsVmQ3cTRDZTJlSzBT?=
 =?utf-8?B?Ym5EVnVQcUJMcEhWcUovR1pESVIyMVZnNUgxNWhqNE9iZ1lTMDIzTFBZRkNl?=
 =?utf-8?B?VHF2VzZwbFN1bTJzY0N4MXhMUkkyMWFCNFJQWFlyNHg5c0JiZ0h6Z1lieW40?=
 =?utf-8?B?ODZmT3d1YTBydzArbk1QR2FJSWhRWmZZQ0I2OEpvTks1WWN6OGs5Z2JJbHA0?=
 =?utf-8?B?NmhRc3VtWm1JYzN2cWw2bnZiY0Jvb2g2Njhjd0tvajdIYitnOGtWVzRHenFI?=
 =?utf-8?B?K2cvT1J6OXFBYzFnaUQ4cm96TkxKRCtBbEF2TG1UZUdGMk0wZDA0cWZ1bjRt?=
 =?utf-8?B?azR5Nk9CV2d0cWQycTlhdjVGMUpEWUxKRXc0bmY0QmhzL0lHazROaGdkZTdE?=
 =?utf-8?B?WU1xRVZOMzNwMmFtTlNlT1ZkaTZxWGZ2WjhISktjWDhSWGVXUk1RdVRNVS9r?=
 =?utf-8?B?WDM3RWRaMTJLdnRwdHdaVk95TlRJdkRJR2ZoaFcyTkp2KzVUWG9qeFJpSHJO?=
 =?utf-8?B?QUh6YWZ3RkhVSVVXU0JJZUpQSmdPWmJwNmtkd085WkFFbFpTVDdjNnJoeWty?=
 =?utf-8?B?aGZ5dWl2NkxvQ0lmM1crVjcrNFBSQUJWQ2VFL0JHdEswcC9BTFpkbmZIWWVx?=
 =?utf-8?B?cyswNVVnTG5jbHNMVDFwbjJiWjhqMFJNNVlLeS9hNWN3ZTRzSDVqR0V6SGRX?=
 =?utf-8?B?L2g1MVRmTHUwdVgxOWpObEx6WGFLdmVJajV3L2FIa3hHdDJJc0pmM0M3eHZV?=
 =?utf-8?B?MVZLaG8zaFNRQnZFcEV2MXdycnlKelgvZXkwZW9NODBOSEY1ZkNrek95bXpF?=
 =?utf-8?B?cEN2WTdyVGhiZjJwQXIwcVZ3YlB3UnlpYWxYaUJmNWJKSDFhSGQxUWY5eHpp?=
 =?utf-8?B?TjR3UGRycGxEZCsvd082emIzcUJiMGdYNkhDZjBzK2J5S1VRTlhJd3hhQTMw?=
 =?utf-8?B?Z1ZOeUZpUFBvNU0yUGVHZnRSS3hFUWdQNFNTa0ZlcEdzcjZ1em1Xeisvb3dx?=
 =?utf-8?B?dXdTUWRITWpaTmJpS08vL053Wk9GUW5sNmVmcy9yaEVzOW1QZXRxaTRhbWVi?=
 =?utf-8?B?SVBVRmpEQTg4WFM2WUowNkRrcDFsTS9SR3FFY01pZTI2dmxoT2phWFhocXFX?=
 =?utf-8?B?NzJrNE1mWG1LcDZUUkNWeDVVR2F3eGdxbkpTb2FNWkkwZ2VOUnNlSG11NVc3?=
 =?utf-8?B?SDFFazMyZzJQcG4zcTh0cVFlSGxXTE9TNmEzSFdudVVzUFJFUnE5WFByV0tL?=
 =?utf-8?B?VVpSc3k4K0JCdjlnbjUyMndMRmV2R3JiOGl0dz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjdRZFNyeEdBc2NtTVFCc2ZxV2pXejFxSzJqWlAxVURSYjlKZ2ladmFuYTc0?=
 =?utf-8?B?UUNLN1EyREJMZmUvK3FwU2wwSHdLYkV6M25VdytPZ0phQm4xdjJVcnUxVlhB?=
 =?utf-8?B?aTBuZ2JRQWU0MlAweXZZVVh2SXFrb1UzaDNkalJwQm5MV0tCWmZFeHpMak9p?=
 =?utf-8?B?Wm8rTFc5MVM3R1FOVjcrTllNeWU2OFlRYUc4MzdjTG5XRXRaalV3OGMvbEQ3?=
 =?utf-8?B?TWtyOThIaGluZmpsTldWejBVMitoWUlWV05Kc2lPYnlEcTBBNWtTR0pEOUdQ?=
 =?utf-8?B?RDBtbXpoZG1MREJubWJyb3ZKd1ZMUW9hMEFVUVNPRGprY3I4SEVkMVZ3RS9w?=
 =?utf-8?B?RzFmd3crUGRPRkZYOEowOFozTkx1QUZ3ZlFkTWJ0L0ZmS3VFbTVhV2J4R2Zk?=
 =?utf-8?B?R3FHTm8vRjN5SGh0cHBHUGxGODF1NEI4ZDFhZDkxYXFaUkQzODJSaWU5dHNr?=
 =?utf-8?B?T3RrbzJyMFFSeWpJU0N5dTFLSnZMUGs2alVXb3NkYzFwVG9CR2NycENsZitj?=
 =?utf-8?B?UXZ4VzBiWE9JM29LQXdCOUJidU5ESkYwRFowY2ZYY3ZPbzIvMEkweUJIWmZY?=
 =?utf-8?B?T09mczVoL0svRlFBdGlMVi96bGZRaVEwdm51SWFsSVJjc0RLZ2NCU2g1cWhu?=
 =?utf-8?B?SU1qRTVZNVZrY29palhpS09HRGdaZHMzSDRUZjRpaCtCdDVaWGNxdlZTcFVw?=
 =?utf-8?B?VENZaGpaaUJWUXFRUHVOOGhoZ0dzaHA1aHFNK0NWN0RVelI2dlpoeTg1UE5J?=
 =?utf-8?B?M1Z6UTM1T3F1NmVOVFF0YkVRVWNtSXh1aHFKeTJwdmJLWHNKU2tqaWFlZlJV?=
 =?utf-8?B?UDdMUVhmM3U1KzloZXJvbnpoWFlNMldRK3JpajBFMUxHSURUR2VEYVNqUjE0?=
 =?utf-8?B?REV5ZFVkWDAvSHJybWZUbFVvUjFMN3JQREZsWnRtb3R5STdsaWtEMlRBQXV6?=
 =?utf-8?B?MUwvRkpCaFFvN2swMVlobDA5QXhLUGQ1N1BOam9zU3psYzJYcTZGMmFNSHd4?=
 =?utf-8?B?K3RXdmM5N2U3R1YwcGl4WEpqSHB1cGNQNnBra1Q4eTVnRy9Pc2ttenhNNloy?=
 =?utf-8?B?WlNxY0djeE1OM3JpdVFsckVUZWFIeGRBK0w5SHlNVGQ4Mzh6VVAzMjMxSGp6?=
 =?utf-8?B?aHFnbWtiSndmUEo2VnkrSEFQU1p0cnhjWERUYzN3K01zNVN1Y2pXd0QrdlFR?=
 =?utf-8?B?YU1sQnkxSUU3bFJGTHRXM1Q4eit0NERVaitIT2QrRmZwS1dqQ3pQR2F0Nm1L?=
 =?utf-8?B?ODhYVGdvNVMvM3RsUXBNRk1xbTEyWmtyeEVJaVhWWTVnRDNsT2k3am9jN0Zp?=
 =?utf-8?B?c0tRVDRuNCtCLzhvdUtVbCtsZjd0KzNqemlhUytTSXkrN09WemllT1FkdFBQ?=
 =?utf-8?B?Y2pnc21hKzlmSVRMWHhDQkVJakxsMysrY2g1NytzaXgzbEhNRC9TdnA1ZThR?=
 =?utf-8?B?UVlNcHVhWGdrb1J5ZzB3MUxVWDI2RWFqL3QwWUlXZlNPYUpjYkJsai9GbVBC?=
 =?utf-8?B?cDg3eEx4OFpPaFNNTXNTS2l5SmNwUGtnMkV2b1RPWTR5REVzbDZXU0RyMkZK?=
 =?utf-8?B?ZmFnb1V0bUtiY3M2T0FxRml2ckNQWHBEKzZBZ05Jb0ZwamorWmN5NmVsVmxH?=
 =?utf-8?B?ZVlVZ1YxZWgvQmNqcTVJbW5WMGJRSFFRZ2UxTnRxcFI0dXVBWVkxYytXQ2lx?=
 =?utf-8?B?bGpXeTBveW9ndHdQekJkNFpqeHBzY2hxeC9sSVpVcXlpcHNwL25uZTZwMkhU?=
 =?utf-8?B?dGFGTU1JQXlVQndvazhZTTc0Qzd5NXZtYTlmVThid1dqZGNsWmlGQnYrWXJr?=
 =?utf-8?B?WmFQaDc5OWhxR3NkWUN6anRMMDk3VFBNVXdBTlZQWWlldXZKTFZrZ0ZYOHlZ?=
 =?utf-8?B?K050bVZBK3NtY3NrVDlQSGJKUWRCNk1HOU9WbXdkZUFSWHI3NEZSWGJVVTNO?=
 =?utf-8?B?Vkdocm9KaGV0N01TdmRuTVNXSzQ2d2FTOVovOFp6WFFDUmNYckp2TWIvWWtl?=
 =?utf-8?B?b0ZUNjJwRk1LLzk3bWVLY3B2SjlDemhmeU5abDJ3RFpGRlFlRGpTZndhZmgz?=
 =?utf-8?B?UnVHc1RIT29mOWZSejRPejd5OGpBNEU1eXN6djl2Y2FJSC9GODFRcTk3VHhN?=
 =?utf-8?Q?gYdT6QrSmRIIYDoxhpBKynOxl?=
Content-ID: <5D51797E45D8FF4FA0920D397A90A708@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f045fd42-15c2-47fb-99f2-08de12840486
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 22:32:15.3750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7h0yBg1Yq+r0qFMpfpLv92TwmSAEzIIi6riEwssZyQ0rcT9NmjFBIVmGPajSsKVed7qwZMklL2eeOvCqQdlUVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_153220_209721_719F3DFE 
X-CRM114-Status: GOOD (  16.39  )
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

On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
> providing a one-off helper for effectively three lines of code is at best a
> wash, and splitting the code makes the comment for smp_rmb()  _extremely_
> confusing as the comment talks about reading kvm->arch.pre_fault_allowed
> before kvm_tdx->state, but the immediately visible code does the exact
> opposite.
> 
> Opportunistically rewrite the comments to more explicitly explain who is
> checking what, as well as _why_ the ordering matters.
> 
> No functional change intended.
> 
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>

> ---
>  arch/x86/kvm/vmx/tdx.c | 49 ++++++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 6c0adc1b3bd5..c37591730cc5 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1605,29 +1605,6 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
>  	return 0;
>  }
>  
> -/*
> - * KVM_TDX_INIT_MEM_REGION calls kvm_gmem_populate() to map guest pages; the
> - * callback tdx_gmem_post_populate() then maps pages into private memory.
> - * through the a seamcall TDH.MEM.PAGE.ADD().  The SEAMCALL also requires the
> - * private EPT structures for the page to have been built before, which is
> - * done via kvm_tdp_map_page(). nr_premapped counts the number of pages that
> - * were added to the EPT structures but not added with TDH.MEM.PAGE.ADD().
> - * The counter has to be zero on KVM_TDX_FINALIZE_VM, to ensure that there
> - * are no half-initialized shared EPT pages.
> - */
> -static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
> -					  enum pg_level level, kvm_pfn_t pfn)
> -{
> -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> -
> -	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
> -		return -EIO;
> -
> -	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
> -	atomic64_inc(&kvm_tdx->nr_premapped);
> -	return 0;
> -}
> -
>  static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
>  				     enum pg_level level, kvm_pfn_t pfn)
>  {
> @@ -1638,14 +1615,30 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
>  		return -EIO;
>  
>  	/*
> -	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
> -	 * barrier in tdx_td_finalize().
> +	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
> +	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
> +	 * arbitrary memory until the initial memory image is finalized.  Pairs
> +	 * with the smp_wmb() in tdx_td_finalize().
>  	 */
>  	smp_rmb();
> -	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
> -		return tdx_mem_page_aug(kvm, gfn, level, pfn);
>  
> -	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
> +	/*
> +	 * If the TD isn't finalized/runnable, then userspace is initializing
> +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
> +	 * have been added to the image, to prevent running the TD with a
> +	 * valid mapping in the mirror EPT, but not in the S-EPT.
> +	 */
> +	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
> +		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
> +			return -EIO;
> +
> +		atomic64_inc(&kvm_tdx->nr_premapped);

Nit: the comment

  /* nr_premapped will be decreased when tdh_mem_page_add() is called. */

is lost.  I think we can somehow embed it to the big comment above?
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
