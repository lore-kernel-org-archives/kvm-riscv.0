Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D776CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6VIvsvm1Nn/q3kQgaRxqu+kkMsbpZ24UCdRGXKOGSs=; b=oYWcEW6hnjH8nO
	9RMfkqU+7rF45PnyNJOpHLG0bQKccOXRhjXuOt0MuPYslAMnpdrorm1cixGkZYIy8WFObAVv/AlSl
	BAyZOG4qZ8Yg4PGuYBz9RJlRnP4zxPzlA9Jx+45t0ptLY2hqoY8G+LH7PQH/Dli/bRcBnq60QOwW2
	LxJAEwiw39oWP6s9vXHFePwRkkdd8v3w7W88KhouFSyP/k5N9BGQRbJi+I1teoY8k9ejGpxz272VQ
	mJrm0Fxetaph19+tUCkqpGSn7SeWTwFC/AQgcpuvNN7RI/vm+HOyH4CqpxMnQHVFO+GLSHYyUEwtx
	TQOw3a62d45xW6WH4SXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbfz-000000055zP-1z3i;
	Thu, 30 Oct 2025 23:03:27 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbfq-000000055yf-0kau;
	Thu, 30 Oct 2025 23:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865398; x=1793401398;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QFPP7kRKWw7XdtlYY08MxW8s/RjwylKsNhDLlkSY3nQ=;
  b=au8nbYFOPhRxi/IbaMRMduBNufG3njP1n5OiqB+SbN9l+XrLko5dssFd
   luOYo7f6hdP/rO413KksXvqzf18qpSaAVmoafksKHVeMvlmFTZnhwNUja
   zFfCC97OdPAYZQJKmhAmKpgccEx6irkaEODu4b12Zjz88Ri2wU/zT2O9K
   eiB+lgRO7kJDTg1HyiHwjPqzMqUjVlNFIOYDnzDrg+xS31gXJhtDKGhF/
   gF5pyBozY26292FDVjr6LNiUltwa4LhLZj50VscKlLjgWl26ekGA12aza
   mXyuh2jZcNMAB37Lrt5iU+SRWV58I6HGavNLZC9CjSPo0qM5VW2AcW8g+
   A==;
X-CSE-ConnectionGUID: 8kOcd9wSTYGvF3WivLF4uA==
X-CSE-MsgGUID: 4GUwQ5/+RvO0SrxGpLbK8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75369921"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="75369921"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:03:18 -0700
X-CSE-ConnectionGUID: uF2NpWbGQsi2i8F9VIRCQg==
X-CSE-MsgGUID: kxq7KfNmTRG0RWgs+yCvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186820507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:03:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:03:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:03:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rphaWh/zi5R3yPasHLAmWhhDeVCNelBNBzWCYI7rkOiypngKz2nn6pBMUfCQQ8Pgn2LUSFEAusg61SQFGKBMXnAkg8cpkqkvfNTdpPHMPO0I6QFNycmdXh9i2y3U4xMyEF2edG/i6OO0cOSl4F400DMBTR8xEXpHdM9pfTdnvEcjl0jCTwYf8tNfqs2/JrlUDsFmEzZraE08Kau7X8UO+9xhi2Udlyz4SGYH/jD4l38P6ZLXgNl2ZRaBKUIJS6P8ZhYy+zOWCqZyiZnIoQFyakmNzk15tlkuXEhcXN2R1910r2sxwAfRHMu8QDAjsUI6HcTKk7t3hBOWfncap9xOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFPP7kRKWw7XdtlYY08MxW8s/RjwylKsNhDLlkSY3nQ=;
 b=FwQT6hTh+Ku7k8cFXQYI5cjtN/dH31bMMUd8UVSD9Lf6v1Q2PI1EwZXBUoahQqtdmBu59mMz49gG4RQHcODKNEH1m//MItNoS/NWbAkvDQR4b9uhDEcX/7LcwOdyUH3A+L7YGy+o1NAQTCuoFdW0naFhc4jARWv/cYO5xrJMKf1Ilwc3qBYGLKPRuv9QARK0Sf0YKK1agBvutIofHWx7M7XIWgtaHpT/V3qJ1Uxv4/lnFjeEEVVbmcgqnoEp/uXZiQ2zbL2+RjuGEl7tgpZ1sfD3aAORDra/BqhKUyjsmwsBTnG/84euBDTtQzjF2LGzBhTE7V0LH93ugQoRaHjjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:03:13 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:03:13 +0000
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
Subject: Re: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
Thread-Topic: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for
 write when removing S-EPT entries
Thread-Index: AQHcSdlR40unfAJdC0OEvUqexeGhzrTbTwYA
Date: Thu, 30 Oct 2025 23:03:13 +0000
Message-ID: <2a76e282aaa29af234b4aafb2e9485930d3a33b9.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-21-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-21-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW5PR11MB5860:EE_
x-ms-office365-filtering-correlation-id: a683e316-fff7-4a4f-45ca-08de1808810b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RHRFOEk0K1lWNWpJSXpxZVJkTEhzNzNtQXczZ3VZQTREbzVDWjk3WVA1Q3Jk?=
 =?utf-8?B?ZDloTWNqKzBGM2V5Rk1IdW1wUXUwdnI5K01nUC9obUtaRy81Qmg5aFRhYmtC?=
 =?utf-8?B?VTRWYTY5Y1dNM0NGWFRJUks3VVFSZzFiZEh0ZjZBRmVsK1N5ekp0RmVmZngw?=
 =?utf-8?B?RERGREp5cS9YMEVHTXRNemgyL0hSdkMrL1lNWWNjd3dDZk9ydDA3YStuZkI4?=
 =?utf-8?B?NmZFWGdDSUNPU0ErSVo5TTZ3WTIrR2pwWXMydVVUclRwQmhNa3dEVzJMR0NW?=
 =?utf-8?B?TE96R3kwUHdGdVY0bmRBNkd6TTR1NG12V1Jxa1Q5c0ZreGhFUEJOQjVEVy9I?=
 =?utf-8?B?MlBubXpZQVI3bTRpVnljMmVkRG5MT2dCbTFQSzcvT0NMdVpBUWk3L05mUVZu?=
 =?utf-8?B?YnlzWVVkd3AycEg3OXdiTmdqdlQxaHFTQUV5R0krR3d3RVc2b2hTOVVkRXJI?=
 =?utf-8?B?RGQ2bFhsVUFJcDFsRUNFU3VsaGdNMVovNEhQd3J3dTVDRDFVbU9QbGNNSHpZ?=
 =?utf-8?B?RWtJaEFNcm4xajNWSFB6dS92QXBHbWFFdElQNCtUbDBncjh5Z2Q3K1NHSWJV?=
 =?utf-8?B?U3hGOUpDQUF4elV3TEdpOEo0NDlCeGJaVlNjUnI0aGo1NE8vSHFiZ3J0UldZ?=
 =?utf-8?B?RHR2UzRqOWlZekxhZlV5MVl2RkpXMFRHUWNUWlhnVnAxTFFkYTNBbkI0TEVW?=
 =?utf-8?B?MUFEWDdlLzdQMXU1N0dsd1J2YzdqYVBHN2pRemZDOURram5IOTFPNjlMcndv?=
 =?utf-8?B?MjRHSTBDY29jejdHTDBvOTB1VXZ0YkoyaktsWGpHb2NzUzI4NklQYnJLSmFL?=
 =?utf-8?B?V0doZHE1SWh0NDVGU080VGdLWTltQ0J1czJJWEM3NTNucERnbUoyaXMwcjR1?=
 =?utf-8?B?RmQwRnRuVHd3RHZ1U1htVG9ybEc3RzNPek5uNTdRVDRqUi9JOVNWcnp6MEJv?=
 =?utf-8?B?QWNKZ1RSYmJ1dlVvOVA3WVZQa2xRenlENUE3V2ZrUzZzZGZHZjF2TGRiY2ZC?=
 =?utf-8?B?TmxMN3EzN1UyQXo5QWFPMTEyWlpnTHJBZXR5VU8wZmlFUG9XK3I0aGJ0WVZw?=
 =?utf-8?B?bkNiQzdaeFFFY2FYSVJXOTVTS0JsQXc5aUd1ZnRHOTVMa1NCcTZyemRWaUpr?=
 =?utf-8?B?NzB6NEN6MWV2VmpSeGJ0MG5ZMEhNYjM5cEwrTDBHa2pPRU15Q2EwODk2cVYv?=
 =?utf-8?B?SlZGRlkyejZVZkFCKzM3L0RzNUdDZXZCMmpBeDd1Y1dIcjN4UFRHQ3hYVjFw?=
 =?utf-8?B?Y0ZacGRsN25EdG0xMVZ6cU0rZ0kzQlZxdnBkM2d3YjBUZVZOa20wZnRSdmhQ?=
 =?utf-8?B?ek9ob0VZQWVVRHAvZElKQS95bWNLb2FZVXFobDRlTm1uRXV4aVA4SVI5Z1NE?=
 =?utf-8?B?NEdaTk9RMURWVGdZMG9odVNVaGM5aDhHcXNtbHlvR0RuN0JScFlnUkppbmxW?=
 =?utf-8?B?WGl5UzJmclFWWmtFRjZGR0FrK1RYUXRrcHIwYytZam0rTnBQOGdxeGNidmJu?=
 =?utf-8?B?VmhLKzN4SkZaS3ZhbnNRY01qRkFxWVhyTHV5SjR6dm96N2VBWHBsL0NNMHpt?=
 =?utf-8?B?OHVUWW1PbW1TbjFRYWZZemJWaHo0UEhGYWx4aTNYRlVtK1YyWEZtL1ptZ0Zh?=
 =?utf-8?B?U3kybyt0b1pMOGtmY2lBQitZbG4vOUppT1NmYlFvemxNOHJocHpJVFNUU2lz?=
 =?utf-8?B?emtBR2l1ZGdGZ1d1UEl3RWcreHBtamNSYmEwU1dLVzM4WUNibk9ISzVkUjNG?=
 =?utf-8?B?TUF6OEpwdXVpdm12VFpHcm44dWpBc2N1U1o3NjN2VDV0Skhua0hXaXVxS0ZK?=
 =?utf-8?B?Q2FVTFU4ZjJCRGdnTWY0ZnAxbzI3TW5hOTRURVhicGQ0Y3ExT1JXNGwvMXU4?=
 =?utf-8?B?REFzVU80Yk5FbEhYcDJWYXpWVjlvMTRqY0Jxa3ZUTjUzN3p6eUlnS2lJbEdw?=
 =?utf-8?B?V1lqS3dXaGtNcC9CazF4OEp3dTVxYkNZZnZaYlpKbGM2bnlIeU1vdGkxM1Rt?=
 =?utf-8?B?RUtQVmM2QUlta2pQdVIzbmxiTitVY2FCQzM2TlNkUlNTMmRENjZCaldsYy83?=
 =?utf-8?B?ZHJ0OGp4MWxad2x0cGxFOFZ0YUhoL3kxYnpaUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3UrS2c4blZWRDRpVnMybnRjek9xZW9oa2NXdWljamtoL1U2Q2VWcUdUdmx3?=
 =?utf-8?B?YXZsbFZub096N28xVTVmQVVaL0g0cjlKWDhETEJXME9hSTIzKzZQTlRrVXBK?=
 =?utf-8?B?d21PZS95R29mdHBsa1VZSmFnWWFGcDhXSVA3ZEVReUFLLzhybmNtcFF1VmVt?=
 =?utf-8?B?aWppL2xmOE9Uc1JLOG9ONUx3U2F1N0ZZbmtiTXlKMDNQdVdQUm84eHZiL0I0?=
 =?utf-8?B?UEFkY2pqSCsrSStjR21mQkpNSFV6S1E1eGtRcFJGL0VhRENBMGMyZUZjbjhz?=
 =?utf-8?B?UnJHUTFpMU85SGhhLzcvU1J3YUVGNlZYYmlqYmFwUkE3c29iWjFrOHJKU3dC?=
 =?utf-8?B?dDJHeVIxT3ladTJ4amZWUGo1MU92NytMRWR1a1NaSlQzcWEza3RwK29sOHlq?=
 =?utf-8?B?WU44djZCMlI5aWg2UjhHKzFKODNGTUtCNzFmcGpJS2xKUVBHS0VSU1hjd2Vk?=
 =?utf-8?B?aW1yMUliRWxzZlJYaXRRMzlobDlBMXRuSkpSVEdTWnJKY0NteFU3d1ViT0pl?=
 =?utf-8?B?cVdmZVlpcndMN1FRSVRHelhxSXpyUzdCTGZKaFdqNzhxM0UxREY5blZMRzJv?=
 =?utf-8?B?dFhoaFc5c0g0Zmh4TXVzclY3UlZPUDVaZXo0TVF3elVhaE9lU1RXOHg1RFVo?=
 =?utf-8?B?TDcyNTlXZDBmUm84RThJTzVXYlhDWDNYRzRUaGlveC9RN3VPU1RLVzFVcjlL?=
 =?utf-8?B?NjE0MGFhMGFacHQwUFZlVCthK3UwYXpqT0dYT3dlMGdtMy93Zk9PczZNckow?=
 =?utf-8?B?RzBwbVF3SGU2Q1VOUkxQa1BMdEZ6Nk9OYXVUam16QWtmbExwNmQ0Qklaelhl?=
 =?utf-8?B?RmJxNjZXRWR1VGNZeExxMDA5dHQ4NlZnQytiZHh6Vy9VQnpBdGNGdmh3VENv?=
 =?utf-8?B?VzZUOFQyWVBoQzAybU8vL2ZlK2wvaVIrSE85Mm9QUXgwR0Fudmh1dnNkSVV2?=
 =?utf-8?B?VlhHbUZzTndhMkRObW5SZVprb0N6OGljcnRuNDc1Mnl6QkFQRW5tVTg0blAw?=
 =?utf-8?B?SkhYYWVubWcvMnFnM253elBtcGZIMDdoUlBMMVRwK29SRTBNUGVkRllORTFo?=
 =?utf-8?B?aXFCOElPSlJtMHNvRFRNTEV5cFA5R05oWEc5bmpWY1NncUxBUFJ0amcvakJN?=
 =?utf-8?B?dFRSbE1VVmNDZG9ZZEhhUmR0QW5MYmszZUJVTEJ1Mkw2VGJqSG1YTEZFUzV5?=
 =?utf-8?B?MDBuREtrdmdZOW90djBnZ2EyM1B1bHQrYTk3VU5iQ1BSbU9idVp3azlNV25m?=
 =?utf-8?B?WGdtdUdSdWF3RFAyaHNqM3o3NFZydVBtb2ZZTFFJN2d5bWtHWnozOWhVK3F2?=
 =?utf-8?B?QVFrUkpSdzJVc2JYQkpmbTVEb2hyNk05aEZCT1JxS0lGODVVaDB0bGFudE9p?=
 =?utf-8?B?MlRHWkgxR3FhQ1Q5d2xrVmkzaWFYanUvRnYxMkNCSDZqdmo0U1U3Y2hTdDR2?=
 =?utf-8?B?eERLQmNzN2hMR0NBcEtGVWo1cW0xN0lzTmd3ZkVUQ0F3d09TWllGWU1CUW5X?=
 =?utf-8?B?by9Zc25kUEIwRXRuMk1OYldUejF4RmsydC92R1VFdHB6dzc3TDByWnU2N0sy?=
 =?utf-8?B?YXpLOS9Lb0h2NUg2eEZNWFg3WnA2T2VkYXd0VUJDUEpTV0dBNm5nNTh6elZB?=
 =?utf-8?B?STBraDJoWTM3TFBaTWN4YlRhM3hFRnRaZ3lKWlJ5ZmlzMjVYNlVtcUF4STVR?=
 =?utf-8?B?VVgrakdidEdhWUYwSGQ1QWFzbjFNbVhHTFNVb3BZNHN0dkxrbE9peWFld0do?=
 =?utf-8?B?UEkzbDIwSi9LZEp1RTNKZkdnOUVOYmxMenhPMmJpRXFtd1crQWxTUjdyWVFr?=
 =?utf-8?B?TnVjV1lpYktQc2JDUDEzZTZzK09PNHkrdk1ORHp2emRPa0Eya3dhTXNyMk1Q?=
 =?utf-8?B?eE5ua0R2ZTdCTmc2Mm5uakl5aGtXZklnZ1hxQkVsZVR5YnhlT2FwUUFpeFBx?=
 =?utf-8?B?WXV3V0p6QUN1bFZwcXlsdTVMYXgxTnZGYk50dlJQUkpscVNkNnA5S0VwQWtO?=
 =?utf-8?B?aUZCU3k3MlRsd2Q1V0VudU9xQ2g3Vm9vSDU3eW9RWnhMdzRkaTI3aXVCOGM4?=
 =?utf-8?B?Z0Mxb051S1B6am1ScW8rSHpnS0Z4OHhjNVRxOVhuckNnNm1kdmhBUnprSVZR?=
 =?utf-8?B?MnVIVHgwU2xlc01KTjJ3TkpOMjVwcDRCcEE2SlNJbjVSS3JoR0h6cDBSeWdr?=
 =?utf-8?B?YXc9PQ==?=
Content-ID: <1A00D5C0BDEF7D40AEE54D2E4C2AF564@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a683e316-fff7-4a4f-45ca-08de1808810b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:03:13.6574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDow+/eyrRgG89KCGRtIVQ3+gN+CmmqaXxTDGjmPKKpQusjCzqvrxaW8QDsKV/7WYqBSXdP/fH837nH5ZbxTxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_160320_027461_EBB38C9E 
X-CRM114-Status: GOOD (  11.09  )
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
> Unconditionally assert that mmu_lock is held for write when removing S-EPT
> entries, not just when removing S-EPT entries triggers certain conditions,
> e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> Conditionally asserting implies that it's safe to hold mmu_lock for read
> when those paths aren't hit, which is simply not true, as KVM doesn't
> support removing S-EPT entries under read-lock.
> 
> Only two paths lead to remove_external_spte(), and both paths asserts that
								^
								assert

> mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> handle_removed_pt() via KVM_BUG_ON()).
> 
> Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
> the conditional assert in tdx_track() as well, but with a comment to help
> explain why holding mmu_lock for write matters (above and beyond why
> tdx_sept_remove_private_spte()'s requirements).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
