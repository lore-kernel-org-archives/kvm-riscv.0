Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94685CCD1BF
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xF4L2x2QnKc5dNcdBR9yAKhnmbAiAqWONV1io0x0kkY=; b=2RuLGpJ0lTNH8x
	DsGQ9Qip1WnYU+b7gwc1wechYhRX1pu26OdHdE3aQdWI/gC5R6juFaq76zZXt5jeK05XOGJ1+CA7O
	nSr5kmbY5HFAS7H0bcli10l5KKQ+hUuEpJ5T8AWBbk3VLv4Ydf0u98r4E7GPSE4MkkXiIDXNR9Syd
	1zo7KvQBzuLSAlYUylOEGQDlc1IBd0WD7T3ZRuoAg3i5AFISXhMIatf4b8X08x8N4dYF6iLgQKT79
	hhU+uHtIaW1mOvaSqxi7RJe3Q5QgoJ/e6hb2OpUbpWyczOW2/JfMARBB2MAiFk6m+7by+4cPVrtay
	fl4e9lqETHdWJSoH/fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC46W-00000007lVm-0RIW;
	Thu, 23 Oct 2025 22:48:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC46S-00000007lVC-1iis;
	Thu, 23 Oct 2025 22:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761259696; x=1792795696;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/avYROLyqweXbDC8Lb5fy7wQW3uuZI8eTbii/2y9ivA=;
  b=bxAmZf9Fy5L14Ui7KfHpQPlepPfel3gzygIZYPbDjwXDMxK6Nb/zK0+I
   d9ozgC5xa1H8mwoj5gJVmbJNLGShMSHhTK1kKx8l0YH/VdFHWZ7fixbv0
   X881f4StR7rVNMizmhj3loHWUc1ZcDB6ZjATLGxAdDN+Q3uTuwqA6bGBS
   gAb6v50EZBVbSo8f+bjVaLzWchjzXQjzExlUL1vw+6vLOygcDmeLE3oIJ
   psxwFxIWOW/kP6fo/JinPeMK4RVGXApIulnPYLc7CQcfrQ6SEUZOseUxv
   5qhtG/KMneciXnXS95z/qJjQAPv/hPtR1Vm7fUqz5vxBKgnfaQu1vzvV0
   g==;
X-CSE-ConnectionGUID: lCZp7AiDTxeLok7HApbF5A==
X-CSE-MsgGUID: Ta6aWb9fS2mZ98lpCepWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62472621"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="62472621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:48:16 -0700
X-CSE-ConnectionGUID: FpjFb2JBRYy5904iCG7lJw==
X-CSE-MsgGUID: Dp14wHN0QHqbSGvr4GrrMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183886151"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:48:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:48:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:48:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6RwV3U4vkq62eD1VM9gmnDH18MpY8+zMC6k30LeoTj1M2n5qKUa8oOqIZ9DX5lVShy+9tF62fIaaduYr3ix4NO0iYb/jMP1N45KoZe2I8Pl5g2Fx0oXpicpdxRl4IhwKn/Ua6qbDTO4V8jCsYBdzTGRk0WaVozza2IJo1KY2gx48CViKzThwmnjTIN223u9k81I2ilmu/ABE2MszXPJ4mTExh5eic6ox2CNqcpHI7j8LFsUkcLl6a4amuNV91p/lK4+VFEn0k2/YmSjpLGvRO6bO+1VAqqUN/jH9xJDzjoyib8dFrcryeyZchXLAd4F4Nhet/onPQgUP54CCQwPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/avYROLyqweXbDC8Lb5fy7wQW3uuZI8eTbii/2y9ivA=;
 b=wRH/Fr837Ciats8KVich4QfGoeH8hlYtLvN3eF9bGbFZ7tw2aOTwKqUp7oUDt7SWd7K1FVLtpckd0laQPu+Xmo54Q4uBvymsLPO4kBrl5XJgV8j9vDuqylsI6NIU/Il3eTHMIWuOBtgAfStDKFMkFlHGdhv+5Poa4ww/rxyLnnqkBp8w0UYHsjQDLzfRNqABjrvHa+VU21JqoodFutMLoeHTzgPqiLLZz4vw9Re0BFvYVk04OOu2X3AhWAxBo+ph1P2IJPSp745wMbkmOIdgwIFyr5LL/x8n7MFZXtFyWxpEHj38wIfufE/WjqZ17RPZI/MBbLszNPA/hO5hbYEbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:48:11 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:48:10 +0000
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
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
Thread-Topic: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
Thread-Index: AQHcPv2kFQRkmR6NlkOuPIThzOpsirTQYDeA
Date: Thu, 23 Oct 2025 22:48:10 +0000
Message-ID: <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-15-seanjc@google.com>
In-Reply-To: <20251017003244.186495-15-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA1PR11MB8594:EE_
x-ms-office365-filtering-correlation-id: 3b34cdc5-3bb8-40b7-4cff-08de12863e08
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dkhabXVYdVBWcDQ1azZGSWRGK0RsT1lmcklpaFJvZm1XWXg1WTR6MzZCekdX?=
 =?utf-8?B?TXNCa2hVQXhTWE9Ua2pDVlBMU0FRTGh2L0pROVkvcVBmK3NoZE1xdDBBRVdx?=
 =?utf-8?B?TC92UmhDNFJhRWtEMXI2bG5VKzMxcXJhajZ4R3hoWS9TYTk4ZTNMNlhJUUlM?=
 =?utf-8?B?MUczNkNCSVFsdFMwaHZMb0dMd2Z1Vmk1SkJTTm1YRHVDcVFpUmF0Q3cyTWVJ?=
 =?utf-8?B?UVhIOUliVHJ4R2NraU0yWm9iaXU2MHdLc1FLUE5tdFJHcDFDeVhudFZBTXIv?=
 =?utf-8?B?ME9JeWFrcCtOeENHMzZ0ZU5IVWdBbklCK3pTdlBnWEczWkZHTC8yblhDMUhy?=
 =?utf-8?B?Z3NBOUtKYTc5QTdUM0RPanFJNUZscTFIbzNSVGFEK3ZuRnJtbit2MXRzanJS?=
 =?utf-8?B?MjdNc01TcWc0Q25PSWtWbDNmTVlMV2U3bnF1RWhlTzB2RkNEekx4NzhCMW55?=
 =?utf-8?B?dVYrbDVhUEZBNHVFZnBXTmtmMFNuS3J5ckdCY3Vxd2RqMWJHOGZ4TTgyUXdU?=
 =?utf-8?B?cGx3RFhKbXJtWkFITkRxRXlaRDAvWWEzb0ZZMnBpSWIvSkhZSTErREhBUlow?=
 =?utf-8?B?R1BuNWpURlRSV0ZRMGF5NFY3cG5OU1VjV0RDeHBMdk5hbFRaQm5kWitYZnlO?=
 =?utf-8?B?WURndElobVlEbkZkOEYwNy9EcUJXR2RoMEs0dTYyQktkNk9WZm41UjY4RzdZ?=
 =?utf-8?B?MHB3cUpoUGZ3ODR2NTB2WC9NeGxpSUxpSmw4M2JaR2hJVXFZaExrSWdEYktH?=
 =?utf-8?B?VVUvNDZSa2pQalJ6Um90NFp1VUp5bW02akp5dGpIUDg1TG45MzlDWXlPMUJj?=
 =?utf-8?B?NGtxNmdIUDN0M01LSVEyMjlDdC8zTXc1SkNjNzBVT0xMN1ZYMGJkN3RCaFZH?=
 =?utf-8?B?aDZXclRhdC9rQXNCcExoYUQ4eXBRckYwK0pDVDEzc1hvS3BENFR3cW1NOUxz?=
 =?utf-8?B?UExlOGlWcWxuOGlOODMzZ1FvY0RtWWlET0F5SzRxWWVSNWVLSCsyblZVZ2VC?=
 =?utf-8?B?QW1nMFhpRVBQa2wweEFscHZWVWllMmRNUW1jQTM4Q3BLaWZVNDlib1piZUNG?=
 =?utf-8?B?emJSdjI1S0FMQmZ1UEJwM3duTXh4M1Azd0dkYTRsRW1PbHlvV3lKOVoxU25O?=
 =?utf-8?B?QzlscFlaMnNzUFMydkFKa3dUQ3NqdlVJNlgvL2x2R3QvS1JIMkFlMEl5ZHFC?=
 =?utf-8?B?WXpYYldGVWt4MWticWp2cWEyVEJLTzN1ZHo4d3J2cTlnQ1FWNDFneFpwWlVx?=
 =?utf-8?B?eWJ1Sk9SNW4xMDlmd3dGeWJjOG5sQzk4UENIMGorZXA4dUgybXB1T2ZCUGls?=
 =?utf-8?B?RW9Va3JpWitleldOdXozZFhrTHEwSDhmNC92SGZPZWw5MEEzSzFvTmFnKzVa?=
 =?utf-8?B?a2NWd01BcWNJYVhvcUZ0RDJaL0Q1RU5WTWJTcjRxUkNOZEIyeWdSZjl6VTBj?=
 =?utf-8?B?YldGZ0pHNTExRkF6eTVOOGJqelcwTVF0RmI2TlB6TEgxRE1Vam8yb3UxRWV6?=
 =?utf-8?B?aGhWS1BsU3hybEFTZzhMREo0WnA0NHhiRUpHbnNRVVZuZTBRU2F1a3dCVU9k?=
 =?utf-8?B?ajFQS1d0Z2JxTUc2Q3ROelAvenBrcW1NTkROTFZ5Z0RiL2U5NEJzZGlzK3o2?=
 =?utf-8?B?S3JLcHlJV1NtcURVdElVOW5jc1FuU0NtemtYOUpLS2hGMmk2Q3dqZElHUHll?=
 =?utf-8?B?MXp1VVBoQVBQbEVsK0VIUEYwZEpaM0pmQVlsay9UNnBQZGxwakd6Z1NQLzI5?=
 =?utf-8?B?M2RKL1ZPYTFTbVlReVlGMEdvUGVyUEhUSkc2WXFTTHBaR0NWOGt3T0RoOTZW?=
 =?utf-8?B?bVZXVFFGNGVvVUFoUk02aDdHK0hOTEc3SkxLT2dYU0creDBhYUFuOHI4eFhK?=
 =?utf-8?B?dFozVEJpaS9mYUJTNXRSUkthZTBETitkM3dTeXRWcUU3cVpRVU4vRDZPM0JM?=
 =?utf-8?B?ZXRjbWUydWg5Rm45VHhiL0FUS3o3SGQzdGxOU3hoRmtzZysvdnZjSjhRNyt2?=
 =?utf-8?B?YUdMMXlUdEZFT09za1l1TGZpL3djWFJ3aDJCcTFhYnJvSUIwV0NHM2dxcVdm?=
 =?utf-8?B?V2pGUFBnQnl0SWRCRTA4KzVFbElsdUkyOWdGUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZIZEc0a3dTMDliRjVLVExXUWxVUm84eHl3US9YL3o4YmdjSzBieEFzWXkw?=
 =?utf-8?B?MDk1MFIvUGQyU1Jsdm43U1ZKYWlIWTR4eEM3WXNNdzVOQXEzVUFaVUFPRTU2?=
 =?utf-8?B?TnNVLzZNVHQrSTRUbnJnMXVzZDJVajRhVnJxN3JDQUlKRUNGSjYzVkVaNUFI?=
 =?utf-8?B?bDEyWUNNZ3F4V0phaTVTRFhJaVZ5OWVyT015YWYxamVDTzlFbWNPWXYzaEZO?=
 =?utf-8?B?dkw1QmhzUEFRYmtBWjdpNG5xNEpka3VldUZvbjRGZmxReFRxZEVVVlVxNDJn?=
 =?utf-8?B?WkJZMldBK0dHSFVBTENXTlJwTzUwa0FTZHNqckgxWUMzdGM3cWQ5dkZBeE1D?=
 =?utf-8?B?OU42dEwwd3RKSHQzc3B5ZHhrUEQ1bDROZ0tGWDFxUlVSUjhCMFdvZ0lnSndr?=
 =?utf-8?B?UWt5YzUrZ2xieUtwMVZLcEJsMEtsRUNQeW81eDh5THBjZFkyNTZDcXJxRHI4?=
 =?utf-8?B?T0xmVTdPZkhPMGIrUE80VWpCZmIvNzRsSTZPUDd4RS9jZlpEeFBISzB4TTlB?=
 =?utf-8?B?OURISFNvM2lvNDl0RHVTQTBEN3lMelRDS0dReFhTWGJJWXJMYThQNTA5ajlu?=
 =?utf-8?B?RlpFSDd0UVJwenNGdkhFSVFETERCV21iUEM1NTMvR3pSRDBXVDd0R3FBclVX?=
 =?utf-8?B?SU5hQkFFdTIvMDBLdk1sdkVlc2NOSmh0MHQvdytxVExZK01nRFBHTkZSbkJ5?=
 =?utf-8?B?WmxzZzNwZ1YrMjVQUUlSRU96enBaeXowR3NYMzFYOXZlM1d0NVgwMFhQK3dp?=
 =?utf-8?B?eHFrNHoxSjJhbS96UzNyNzJnNHJkZG0wRHdpMXMzbEF4Q0dwYWl3QlVZdEph?=
 =?utf-8?B?QmRjZmtFRUd1QW1ScDh1c0pvTU9ic01YRGxJMUlrYXo3TEFMK0ttRmVia2to?=
 =?utf-8?B?b2JBVXpNWUlkbTN5VUgveHRTWjdNNGJYOFRDWVY0bTJMNVZrelZoWnExU1Vz?=
 =?utf-8?B?b0tJaUcwKzhsTzQyWW9OY0NqcjJEVE5wNFU4QWJiMTAzdUMreHpaRFRkakho?=
 =?utf-8?B?THFIa0REbzNqS0ZsY1hMRk9NMFlPS2FraFdobHNDZmFjQ0hpVFVudUpmZWV6?=
 =?utf-8?B?azd3Qm51TVp4bHRnWllDQkNnVERLYWlDdEVOdmIrdndCR2tGdlk5UStvdHhI?=
 =?utf-8?B?TFI0TDNkN3NYdEs3MHFhejgzUDMxdFM1eEMxZUFjSDFRbzhWbVlBaXRFVTBG?=
 =?utf-8?B?WVppN0pBUytRVmEzVWhjSEZxemtHZmc0THhWNVpsRTlXQlhXdVQ2N0srMCtR?=
 =?utf-8?B?dEx0WEUrTEg3VFVMTXFrdnlkK01KRHgwQXFRcTQ3Zy9ud1NFeGJReWkrRXJn?=
 =?utf-8?B?eXRoa1ZtRCtHcDlBYnBCejFPalBkYk1qU1dvNURPeTlQUURwc3JUSzd2NEo4?=
 =?utf-8?B?Y1JBcEluNGhObEE4eENvMytoZXNiaStxbEtlVjhTUXdMKzBuRVNBSkMwam9S?=
 =?utf-8?B?WGJxb2dlc0JXMHNkMkp4cmcvYUpiL1NvaktmeTJwcGtuZDNrTmpPS1BBQ0RK?=
 =?utf-8?B?NzhJckhtR0p0MnBuWU83SHp6cmZKcVMwZFZIeWZzRnBxSDVaaC9pQ0MxaStO?=
 =?utf-8?B?RjRYTzErN0x0QzhMekcxMlIra2grSGNjVW9DVlNmSVh0K1JrWlppcXl1d1Jn?=
 =?utf-8?B?SjZNNWhpQmlPWlJxSkxsYm54MEYrRUxNS1RZSnpId0ZRdDZuRlNQSURNTWNa?=
 =?utf-8?B?NGJ3VXFHelZaL0hjNVdiUVJFSE9OZy9HMUd6WmtyYjk3TGhHSDFiQTh1QUFC?=
 =?utf-8?B?WDEzdFBUUmsrZnFMWWNhMURIdzZyczhabHZQTVhWYUNXczYxbEtselcwcXRm?=
 =?utf-8?B?Nm5UdUJQNUNzblJuT3crVEViS25vWWNMbHlWckozTktzWmNORDJKYTlpSjh5?=
 =?utf-8?B?UlZSaWVORHI5alNmY1lJQnVkakNuZjh2c1ZTemF3bWdIRmpSUHpob0hTeWZn?=
 =?utf-8?B?eElBa1hPREZnYTNMd1ZGdGtCUWJTbUkybU5WWjdMQjJMK1RUSUI0TmpiWTNR?=
 =?utf-8?B?MkZNYnk1OFpHOWcxWTdqY29NVUdwaG9FUUFCelY3WEJENmo4V1h0RWRvbXlD?=
 =?utf-8?B?eEQ0UVc3T3Jja25BTHV5T1d0ZzYzQzBFSVNhZFNtdHVqR1d5RldaSkM0b09j?=
 =?utf-8?Q?qQ6v6XLqOgq3ADNYLpIZYlioL?=
Content-ID: <ECD3108AD6331440B0A3F7B89ADF1E42@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b34cdc5-3bb8-40b7-4cff-08de12863e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 22:48:10.8731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dllTsczdz5HCLdQT3KrWhpHTalRRV0cBIqTGjGl6fmCxr0U+IlDCuyjplJnhe/9pGpv8DZN+MhebDJwnmmhl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_154816_506325_A650E26B 
X-CRM114-Status: GOOD (  17.27  )
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
> WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> measurement should fail if and only if there is a KVM bug, or if the S-EPT
> mapping is invalid, and it should be impossible for the S-EPT mappings to
> be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> 
> Holding slots_lock prevents zaps due to memslot updates,
> filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> entries that can be used for the initial image.  The call from sev.c is
> obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
> so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
> __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
> image, the APIC page has its own non-guest_memfd memslot and so can't be
> used for the initial image, which means that too is mutually exclusive.
> 
> Opportunistically switch to "goto" to jump around the measurement code,
> partly to make it clear that KVM needs to bail entirely if extending the
> measurement fails, partly in anticipation of reworking how and when
> TDH_MEM_PAGE_ADD is done.
> 
> Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")

So IIUC this patch only adds a KVM_BUG_ON() when TDH.MR.EXTEND fails.  How
does this fix anything?

Looking at v2, they may have a relationship, but it's quite confusing w/o
any explanation?

> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index c37591730cc5..f4bab75d3ffb 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3151,14 +3151,22 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  
>  	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
>  
> -	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
> -		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> -			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
> -					    &level_state);
> -			if (err) {
> -				ret = -EIO;
> -				break;
> -			}
> +	if (!(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
> +		goto out;
> +
> +	/*
> +	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
> +	 * between mapping the pfn and now, but slots_lock prevents memslot
> +	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
> +	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
> +	 * zapping flows are mutually exclusive with S-EPT mappings.
> +	 */
> +	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
> +		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
> +		if (KVM_BUG_ON(err, kvm)) {
> +			pr_tdx_error_2(TDH_MR_EXTEND, err, entry, level_state);
> +			ret = -EIO;
> +			goto out;
>  		}
>  	}
>  
> -- 
> 2.51.0.858.gf9c4a03a3a-goog
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
