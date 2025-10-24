Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B048CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deNpEd2O2wiMx/8J/XRilJfh1DO/VXhH9IzQVpYmZtQ=; b=DzNiR7NSiO5Sta
	cEBTqmYWVGkC6rs3WzbQC1hSIxzhOvtFW32X8bxYvnfPre7JGLmNaMbduUPPpmD6ZQQMpzosH4et5
	fh3gHh4oaqtB+M0qRTcvaN9o4javYUXRZOl/FavIichZSYaTYVqOhZryVpW6pZPKjLTvFtq8PzP3M
	U1sVI4/Fai/K2FrKu6F5gYpAimKt3ImDEnIEbGRdN+1JcW/i93KguApUSCSnC09Uq8qHfjMUzC0b2
	9LxYrBZrJGFEFv21n4aVSmuwl3xRBO8sp2ie7j+JLiZfrT3mZuCF5GMvHyM+M4uiszJeNnhLTUq0F
	WXOx/BKoL1TZzxXej3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC4j-00000008SdZ-0J8J;
	Fri, 24 Oct 2025 07:19:01 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC4g-00000008Scm-1WNz;
	Fri, 24 Oct 2025 07:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290338; x=1792826338;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jMhYjIgzI56WFLFbDoemyYsL56xYdbXKmoNZIYBeJQA=;
  b=RC+/8wDMQZYDWm//wGC3/DD9XlPp4tHFjk2koV0B84L1HAq95kt3uCrO
   n2F9dxCta3948t5PkksLRZs0foAvir7P5NUbidCWSWHpl7bY6EtBAasId
   Uv3gWqFhRkKlydCPvFpzH7BkpZ32u2Sv3CvwQBmHtqg6VFTATbCLcXaLE
   jOBf7cXWtI2hhNMNPNOleqC+nnMwYXuU9pXgg91Xs8i0pfxyU/7svgzwF
   kIUvTwUbU6B8Vl0QbABBjJQQFNhInWfWdn6p13+/6wlwzGg8JzNRLfEaF
   zAtG/TN/gbs6ZFNX0UtAfp8rTX1wGBYVv2sQttvkFBv3AJnjHDmJwnGE+
   A==;
X-CSE-ConnectionGUID: m+eQDvENRDuujTd7gD7cjg==
X-CSE-MsgGUID: AK0Ea4H1R0ePkH8c9bcUUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67114335"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="67114335"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:18:56 -0700
X-CSE-ConnectionGUID: jzKOJylaStSArALb6GtW7w==
X-CSE-MsgGUID: 12zIbcIKS9yI+YkmEbfw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221563191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:18:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:18:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:18:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1p5oSUOD7JY139fN1zuFVrIUlfpjsflAbodv3rsDPFvrIdYGPSaI4jKK9is1O0iFLr+6UPctbPS3paQKZmX3OGDgFivpyZZ2w8k1wRTXaZkvhlO8Mp4k0JbNqNXCIAP32nfQI1zoMXM22RWz0flB8kk3gs5J82Yl2ye5y5fHAWQGFC8H4KWxXK2Tkg3Mqny60QzsGFa+A+P6S0bEvH9eZygEdnDKNM5+OaR/jfEY1/r+XODEmt6b2IuraCFmaN11KUwxXtevydkmN50seBlxS3y8yFFFw9XN2faaf3izJiZPtG2gGgKhIewNQPJHeZIzDA4LnyUJIrQSkWwXe/95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMhYjIgzI56WFLFbDoemyYsL56xYdbXKmoNZIYBeJQA=;
 b=Zh2uUqRV+uhA5OFQu5ljR/mPrCbeQNONjiETBM5QiLAQxbGTSIpCCsHALVlW+cVKrekPbTpI9SVQtsERqPyuJBDvIHPAGPjWfIw/+2CN/UPa2BCe6Ri9RZWNfGtoamdC1EPIeq3VCHDttVoZfNPtju1Zg1iGsQZAu0edSvuam1n+Arx6cNc8wFe1qFax0AOlAefxY5OBZrTQPCoGfQKbCRMG57piBbO3Vw/cCJEtkmAa1C4gZnCyBw8bto1sfBtxf6f3oJivecYPKJKl3NGJVli/8gVeyTUsFKVkL9EfQOpq/Qbd6YfH9f+sUhY+qEBVXeSDx2MItwmzaa/I8m8hHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:18:52 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:18:52 +0000
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
Subject: Re: [PATCH v3 15/25] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
Thread-Topic: [PATCH v3 15/25] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
Thread-Index: AQHcPv2qqi9Jus2wYUe9WIJFI4OQ5rTQ7ueA
Date: Fri, 24 Oct 2025 07:18:52 +0000
Message-ID: <c2a34f05801ec5e3a9c51f0c585b368c82c4ea43.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-16-seanjc@google.com>
In-Reply-To: <20251017003244.186495-16-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH3PPFD6B8A798D:EE_
x-ms-office365-filtering-correlation-id: 576b7a9f-7cdf-4884-203d-08de12cd95d8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MzZGWU5oNmx5YnRaNnFNNkYwenZranZjOVZFWWoybnBRL2oxSkZRUC9zdWhS?=
 =?utf-8?B?MVZDTkRkSlZlcmVOdG9zakswUWdrV1ZydERzVU5mV0tHYjB2WmtaUHM2ZXFL?=
 =?utf-8?B?YWhORGRua2tiTVNOaXNpb014SXNZTVdPR1U1eHE4QUVHM1JJT1Fzb0l2Vzdi?=
 =?utf-8?B?NVY5UHpCeW9VZGkwYm9OQlJsck9tWmEvaFFFV0FBa1lkbFArbFZzUXBzUUYv?=
 =?utf-8?B?d093Zm14U29FWk05MTEvUmJCZnM2UllyU2U4bStQNldScDJSNWtPSVVGSGRB?=
 =?utf-8?B?ZFplRFpiYmFOb2xHZE16NGlxUEtWKzdCZDZBNUsybmdTbFNLR0F2RnRBd0JC?=
 =?utf-8?B?S1BWVkZEV2FiazJFRFY1czZoYVRzTTMxNFI2b1pTNmppby9DSVJ5bTE3Z2ZZ?=
 =?utf-8?B?S0FYV2NhUytnb2ZaMUx1T0dKMjlRaE51eThGc3FsWUpjL0hZZjMvSm9iVTIx?=
 =?utf-8?B?ekdGQ3Q4MTkzSWxjZ29pMXFKWGgxckltS096eXpQVFNpS0pVOXlyRnVOS1VU?=
 =?utf-8?B?bzkxOGJXV3Zvald3NE1Pb2NWNkc4L3hidEpVSi9Na2lVTStkTnkyVE80MnRC?=
 =?utf-8?B?bTYzditCSlZ4b1BLbHg1Niszb2dmZStwRENBa2drcG8zNzNQU3lnbFlIQ2Fu?=
 =?utf-8?B?dzZjT0tpMm5maDFnOWsxYmFRczM4b2p0NFFQcTEzTGZKMWozc2RybzhKdGk0?=
 =?utf-8?B?L09obGIzbW01bUhmY3UvS2l1Nm0rS1pOckZETW5jTWZQL3N4Z29XazB3Z3Er?=
 =?utf-8?B?emNmUzlycWxPUWpIVktJRE10YVVGR3BicjlDSFNyNk9rUXNrTEVJVjZiRjBM?=
 =?utf-8?B?QzdnUmJkU2VrcHRnOE02SVZKVTVnTHo3cTNvdFRyUDBUaHdzMkV0K3BFUXBj?=
 =?utf-8?B?ZjJ2MmRhRE93Sm1GMHBobmxZeGZ5NVJ4RVRPM1BHdG1OOXVMeEtTeFBLSktR?=
 =?utf-8?B?WkMrTFA5d0k5UVhRSFhKOUwvVkppV1FlOUJjU1QyR1VsNFJ5NXlEQ3J3aERD?=
 =?utf-8?B?RnVrOXlLQWd5K2ppc2V5bEpEdE5VWjFycGhKeHlUendqcE03ZkxscCtQV0Uv?=
 =?utf-8?B?Y1I0YkJiYnp5aVRnOWlwbWhZZ29PL1JhT2MrYlRIZTlEVjMxR1RmSXFIVUV2?=
 =?utf-8?B?dlBDVEdLMnJ2dy8ra3dXQ0pHRVdGYkVkYkphVFVvd1QxSnBFNjVtWHM2Mmda?=
 =?utf-8?B?RnVxMDZ0WmlBZHVacEZUTHZBSURVYWJGSy9MUVpxRHFNYVpkOTRCOWNWM3hp?=
 =?utf-8?B?VENXUjBjTks3NVdWZ0hWekIxQ0ZGbGF2MFRxYXZ2b2pRQXAzUnVZZGtNZzNH?=
 =?utf-8?B?K04yaC94MVltK2hmNUVmblk4V2gvZGRZRDU1OEE4WEZVWlZtdWJ6WGhXeE9M?=
 =?utf-8?B?dlJQQ0hSclF5QmtNWkhIcHdpU1V2a1h3TDA3L0FVQXFBaGVVejdpaWlUOHlm?=
 =?utf-8?B?ejhVMXZ1ZTAzVDNqSzZGVEpuV2Yydkd0clJPa25LZEF4aDZTZFhPMmx4V2V3?=
 =?utf-8?B?MjhubjB1VWU4ajNTWTYzQ3JoMEVxejljMXJJdGkydEwzZHEvTHZiWldheldp?=
 =?utf-8?B?NXNqZEFhVHl2MmkyQ0ZvNDVhMlU3S2ZJbHBacVlCREJienRXYU02SnViWVl1?=
 =?utf-8?B?QUZjcGRremZSUFYySEUzSC9tSndYaU8rR3duUGlwWHA2cHc0RE16SEdGSHd4?=
 =?utf-8?B?anhkTHNqaHBtanBnSzhMVjlwNlFoK2ZoeCsyM3RTSGUwcFZNRy9ibkIrdHU1?=
 =?utf-8?B?NFUycm9Oc254KzJsZmVaTERBdnZUejZqWDEvWGhvZ2E0MXk5VkVlSGJyelN0?=
 =?utf-8?B?WUtHOURpZ3ZadkhvSllwZGM0QVpRV3grNVNGR1VsZEtQRkt5OEV0TndsVnFD?=
 =?utf-8?B?b2NES2pOeU5za3ZRejlzUXpjSEc3WVlycWdCWndCcTlGRkM2TUlTekhIaFlD?=
 =?utf-8?B?OG9MQjBIYkRrbmV0R3E1a3ptdzNqWVZLbzVhaWFUSUtOVVRZaTNyamlYTjNU?=
 =?utf-8?B?dVJMSGsxMUZyOWVBekdHRlRKbHVCeG96dVcvVmQzd3BxSWh5UkRkQzRPeE5x?=
 =?utf-8?B?MGdlZjM5eS9oY3VuQzZwMnVtS3F4Z1BmOFhQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG1HeS9RQjZvNGlTNHJrSkpGVGhFeERUY3Q1MllmdDZWN0tXcXpCTzdYZTFK?=
 =?utf-8?B?dlJLWENDN2hFaWtnUlZDUzJrSC9XVGdpYjB4M08ydnlwRDJacWlaVVlJL3Iz?=
 =?utf-8?B?NDlXNnlkZmkrWjhvbGYyWjhyUCtOZVAvd0xXQTErVlMyNlF4RUlGS3hjaDJs?=
 =?utf-8?B?QTJRSzU2bzliZVltSytRSzRWL2RzRUZuZUxCRFg3OWhXdG9PVEpzSWMrRmsw?=
 =?utf-8?B?RmdQaHVya25wTnBXQlFjSjQ0VmdpckZ1VE9MMUNqTTJZNzM1ZmluVTJSTElB?=
 =?utf-8?B?S2xMME0ranRRclh5azBYUjM2cmhkblhLMUJyRjc4R1JwcDlIME8vRzltM2pI?=
 =?utf-8?B?bFphcUxhTjhrbjhYckdQSUVRRTIraUtpanJIUjVaK0xyRzd6Y0tJUk9qSFpH?=
 =?utf-8?B?ZExqU2ZvK3hPMHRoZy84NkdMM0MrOXhrb3hzUmhzNGFBaENRUCt5VGpJVWkw?=
 =?utf-8?B?N3JrWHMwTkRhRkY2RHVVK3hkWXUrVFMyS081ajBsNytqNWp0eXJLNGRnSUlQ?=
 =?utf-8?B?bS8zL0x4cERNTlc4eUI1REJWTmIyQnBteEpOdE8zeUd1T2JqWHp2RXN3OXFF?=
 =?utf-8?B?Q3NCSmVJczZLS2xVME5jck1UVU53T0Vxd0dFRi8yRlZBdzJCZlI4bzFvb0xD?=
 =?utf-8?B?YUc0U2J5NEUya2E2Vmd4VlNYQ205eTdKRCs3QXk5akFHQiswNzFSWGFsQWdk?=
 =?utf-8?B?WlVaU21WdllWL0o2bEdpemVSMDFhYzFjTkViSDY0bmg3bTkzeUtOaC9tMzdl?=
 =?utf-8?B?bGprOGRBK2lzTjkrMUtnSlhUc3ovZERJRE80NG1kd3Iwd2x2MlZlMDJxKzV3?=
 =?utf-8?B?MW5ONWhjc00wTnNZckc3cFNiUzVYVGNjWk13dGR3L1JYcEd3SFpOM0xLcjVB?=
 =?utf-8?B?Wit1eDRGZ1llYkZ1N1FSWTRBaEpjbjkyek9lMWJQWXc0RzlKSmtTK3oxNHRJ?=
 =?utf-8?B?UUUrRHI1MUNSSjYwL0k1dzBzNFB2UFkySTl0dGNubzV4RktZTW5iT3RpZlN2?=
 =?utf-8?B?ZXZ3YnQyMWIyWElQZjJGMGxGWWc1ZHR2OVhHcHdENDM5RzVJSlZhT2dpUHBY?=
 =?utf-8?B?K05CdEVEbmtsTlRHNTQyMlZyd1NlMkhHcHZJcEUzUVZlV2pId1UzQWUrN3Na?=
 =?utf-8?B?TFJzejM0V21KYzl2WFJuSm9mWStUYzRGU3U1dzBkZzBTTUVjNkUxVDd2RmxZ?=
 =?utf-8?B?eURWTzJEZGd5bXdBMFR0V2pNeC9RcEhEYVc2L0NycjFaSXBWRkQzcWcxc0ZM?=
 =?utf-8?B?TXZCazMxTkhNd1BmQ0dnV2d1b2FlaFBCbFVZUnRuUzcxQ1NPL1ZFdndUR3Fu?=
 =?utf-8?B?N2pNSVhyVndpM0MwUEdUOTJNTkEveUZHVzcyZ3czTTVkL1lVOTA5M1kxb0tJ?=
 =?utf-8?B?YUJaSUZ6MGltakw4OG9tVnRsL0psdngvWkRnVEFDRVZ5alFqc1Fkd1pTcEpy?=
 =?utf-8?B?VHJjeW52am1BWFdqbGw3Qlk0bzN6eVovZDVLMFluSnI4aWExeGh1dmpDcGRC?=
 =?utf-8?B?NXdqMGhyaGZPckpFMDl5M1hpdVUxRW1Eb0JtRlM5NGFCQXp3NHRMUVJmWnA1?=
 =?utf-8?B?WkxLNm1WaFJTSHJkZno2bjlhY0VGbzNSSW1GMGhTY3FJNStTOTJ2dnZqZWJW?=
 =?utf-8?B?bkVManRYUFBERTNBWFRUcmlQOHhvZVU4MFhkWmlwbDVLeE1vWE0zSzNSaEhn?=
 =?utf-8?B?Y2JkWmZqV2V6V2w4bEFpMkozR3hJQUV4WCsyUTBvc3RuQUpqM0FCVDlvRUR0?=
 =?utf-8?B?RU5JMFNYcTFMOHZrMWdOQ1ZaWHppMGxSQktHbkdhRVBTdktqRTNOMnVxQVZ4?=
 =?utf-8?B?ak5zVk1HTTRCS3BxWEZUNzVzRlRUcXdndnhlcHdpUnVncEpBV1cyeVRtdjhx?=
 =?utf-8?B?cU5MNEJFRU9aMFA4Sll2d0R4eEppZmxUWFhvVE5YSFRYaU43VHdFOG9iRC91?=
 =?utf-8?B?YjM5Q1ZGeU9EWCtoZlVJa1VURm1URFNaYmxmOUcyWmlJMEd6YURwdXZ2bUVw?=
 =?utf-8?B?VFJ4b2RUSmxpdldxajlSZWVqelNOTVlnejB5RlJOMHV5RHNnU01tTVhETnlT?=
 =?utf-8?B?cjRFeHpuZkJiNGQvem9RN2dZK0g0MHNFQlFGbkhWWFg0NXVDVzF6M2hQQmlT?=
 =?utf-8?Q?OdRMYFooqTNTKmq0A/s0ej7Ne?=
Content-ID: <30D5410B4A0CDD4BBC495359879C03E2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576b7a9f-7cdf-4884-203d-08de12cd95d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:18:52.4007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5etMHUjyuWFbE+YGrOKGfMMbS4sIlov4NaGJ3QjdqsJl4RuKut6X//bDLvWyovPfSvlyYeE2tLs7mmk4O9uPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_001858_458517_8FD4A2F3 
X-CRM114-Status: GOOD (  15.60  )
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
> When populating the initial memory image for a TDX guest, ADD pages to the
> TD as part of establishing the mappings in the mirror EPT, as opposed to
> creating the mappings and then doing ADD after the fact.  Doing ADD in the
> S-EPT callbacks eliminates the need to track "premapped" pages, as the
> mirror EPT (M-EPT) and S-EPT are always synchronized, e.g. if ADD fails,
> KVM reverts to the previous M-EPT entry (guaranteed to be !PRESENT).
> 
> Eliminating the hole where the M-EPT can have a mapping that doesn't exist
> in the S-EPT in turn obviates the need to handle errors that are unique to
> encountering a missing S-EPT entry (see tdx_is_sept_zap_err_due_to_premap()).
> 
> Keeping the M-EPT and S-EPT synchronized also eliminates the need to check
> for unconsumed "premap" entries during tdx_td_finalize(), as there simply
> can't be any such entries.  Dropping that check in particular reduces the
> overall cognitive load, as the managemented of nr_premapped with respect
				 ^
				 management

> to removal of S-EPT is _very_ subtle.  E.g. successful removal of an S-EPT
> entry after it completed ADD doesn't adjust nr_premapped, but it's not
> clear why that's "ok" but having half-baked entries is not (it's not truly
> "ok" in that removing pages from the image will likely prevent the guest
> from booting, but from KVM's perspective it's "ok").
> 
> Doing ADD in the S-EPT path requires passing an argument via a scratch
> field, but the current approach of tracking the number of "premapped"
> pages effectively does the same.  And the "premapped" counter is much more
> dangerous, as it doesn't have a singular lock to protect its usage, since
> nr_premapped can be modified as soon as mmu_lock is dropped, at least in
> theory.  I.e. nr_premapped is guarded by slots_lock, but only for "happy"
> paths.
> 
> Note, this approach was used/tried at various points in TDX development,
> but was ultimately discarded due to a desire to avoid stashing temporary
> state in kvm_tdx.  But as above, KVM ended up with such state anyways,
> and fully committing to using temporary state provides better access
> rules (100% guarded by slots_lock), and makes several edge cases flat out
> impossible.
> 
> Note #2, continue to extend the measurement outside of mmu_lock, as it's
> a slow operation (typically 16 SEAMCALLs per page whose data is included
> in the measurement), and doesn't *need* to be done under mmu_lock, e.g.
> for consistency purposes.  However, MR.EXTEND isn't _that_ slow, e.g.
> ~1ms latency to measure a full page, so if it needs to be done under
> mmu_lock in the future, e.g. because KVM gains a flow that can remove
> S-EPT entries uring KVM_TDX_INIT_MEM_REGION, then extending the
		^
		during

> measurement can also be moved into the S-EPT mapping path (again, only if
> absolutely necessary).  P.S. _If_ MR.EXTEND is moved into the S-EPT path,
> take care not to return an error up the stack if TDH_MR_EXTEND fails, as
> removing the M-EPT entry but not the S-EPT entry would result in
> inconsistent state!
> 
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
