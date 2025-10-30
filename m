Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFEECCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksd2jFmaAnVnW36jhexCYWUOF28+D7P9mkzhcpNogHk=; b=dC/rJVvlk84Eky
	ZcZ5ozL6x3u8bxQ1qZFWD4xU3KpZBK4j649DvjFkpVmNAT8reFVMwv+FzTGaShZyLgbo7y/K6SUsY
	kjv40lIjTiRJma545Aw00uQ1gOPcv7sQc2IPaYgnx3Ys/1PZzNdVMjOZ9s35IS4aPQ0zmwNbzTf1M
	9lKtkfUIxRdsxesrElESgC9+8yA/6IV1MbpZaUJwO2OMYpkg7vNwry34Oa/1X51alhy6CTd6N97xh
	DZJDTXFy3Nscur3QPoegsvWZqfMBKdSepmwaDqDcZ90rZt65KTeA1uohIM2NREU7Z1RtKXrWL7nSu
	sva46B9UGaXz5B2htZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbmR-0000000577N-0F1s;
	Thu, 30 Oct 2025 23:10:10 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbmO-0000000576V-16fn;
	Thu, 30 Oct 2025 23:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865804; x=1793401804;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+BeOnDnGAXb4JFe8uf1H7AK/d1UlyEvjiYcxqwtF698=;
  b=NWKVTAqkHau/hvyDfOWEthaPMXHFUG8qOa4qP1R5IFeRixOsOUSMNu60
   IxOsIZs5zWTjvj3i14iwXpQ7N95VXlHmKQYPYwMrp9xlL+q7qr3XoNkob
   Q+TzTOs3kkn+QlyYquDrJdQY4Xswszzh81y5IbWAJDwRWfG4PeCo0NQzV
   jEfk0iv+y4Q6J7DIz4ncekDrVRWK4OObhlJKAbShHYskpdNsREWGE20cs
   MtbTOlKaVNLUJ2eTWV54C3v6l2bkN/bbWc6sNUJcVD88pyATyGKGHM3LH
   Urp4w9xdfHEy3FGRu7lQEk3Ty55rgmh5s06jX09E7cJIPZQ4UTEylYbFD
   w==;
X-CSE-ConnectionGUID: hTqoE8eDRFKa03AOGtSxRw==
X-CSE-MsgGUID: re6BSRSsQp6tccfHkkzn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63228622"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63228622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:10:03 -0700
X-CSE-ConnectionGUID: VdwqMYgDTBySetp/BUvYmQ==
X-CSE-MsgGUID: CJCu2dDKSh6d36djWa9tTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185741838"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:10:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:10:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:10:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPkCDE2XX6tfiDTE2ddp29k4IpOODNKkN7Z42wtAaKFAFU6wfwNIsS3O95j3TeBP2+mlnorF8FPT+MZVOt0WRY9DIHQgfLnVEJZLscZxI67a68bmBu09Co8XO13GBE6y8M0SOIDJJS5iq46eAw9U1fMuF/shLsX1HQAPct0pdduEkhgFPyB223aiiS7LLrhU8qywi21wpNaiydxZOeDB59iARp1sUqIIiVWwAfEo83NOYNd0Sa2mGDtnAcd/K7+G5JkvGkR+zmlLbpgUZ+n2DT+sIxFNRnng3vrd2ga84mXTMoAnG0V05cxY3fFn4EFvJZtNqxSMCqZQ3rk0UL1oZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BeOnDnGAXb4JFe8uf1H7AK/d1UlyEvjiYcxqwtF698=;
 b=nkuBE7t6LjjDvK0e7VsW1S1D/LFHabJqNE9CcVx6YgfCSJgn+fd5y3JdWJJ2NF9YSq3ZaYc1Bgs/4eekoy3+9pipoW71V7qLdU1itXgRNEi2oAZqEkGA8GzZ/pkdIE1q5rJjG3u2PZFQIiDp+wjjH6Z4ugEGFx9YaPfXsF3HF+xqJ8cafQLGX/HMJ+Y2QOvmzfjHlTCTDMDP0eRsfMCHOyIe9re8hqiapoD9pBQrkbvpJJc4hoFVy873vQn4QBKaEoRsUukEjNFbmbfNS5vjZLGjCXtBQtfXtb0XAnQSx0zVDmgkJ1hZNbQ44vjXZjydx6r4dty/aKNVDv4RB0H3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:09:58 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:09:58 +0000
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
Subject: Re: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
Thread-Topic: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
Thread-Index: AQHcSdlalNabKR9xqkqe6NyxmIAbV7TbUOiA
Date: Thu, 30 Oct 2025 23:09:58 +0000
Message-ID: <0adcd41c6c9356bb9bbc5e7dd2f7eb650ca90c9f.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-28-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-28-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS0PR11MB7484:EE_
x-ms-office365-filtering-correlation-id: 26885882-0cf3-4dc8-d43b-08de1809723d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dTRiejhyVWd3dEZkNUpIem9sU2tYM0RxZ0YxWGZKU3ladlNwaFhQMVFrRjhu?=
 =?utf-8?B?UzNYRkhsMDhkUlhwZmdOay9iNWlxSFRNMFhtSWNudkFVL0F5cTJBUGU3dGN4?=
 =?utf-8?B?RFBWME0xbVZRL1kvSFlqNnY0R2FOaHJ0NDBxZW4yMnZlQXhTLzI5MExDTHhR?=
 =?utf-8?B?VWQrakp3QXNPSEF0Z0Z2QllPakhIN2N1ZXJmTE1NbG4zR1pFK3VJVVVObWRx?=
 =?utf-8?B?eEJ3SjQ3OTBvUldKeHJESFBSMTVuTTl3ZTJZL2lpY04zbUtVVGJJNmk2QmQ3?=
 =?utf-8?B?T1ZPOEJOY29PL3JmYTVTR1lBcFNZZmEzekltNVFCSlFoVS80L1QxZlJPS3Ji?=
 =?utf-8?B?dnp4eUtlVzA5akdrQTNqak1XaEY5bURlU1E0Vk9saVozc1R4a1M5M2JLQzFW?=
 =?utf-8?B?a0pKdjlRcTA4cFFvT3dkVXhKQzFCd1R0TG9FYlFzYUh5M3lBeTg4VG4ram52?=
 =?utf-8?B?RmcySFBQZ2hOYm4rc1JoajJpdk9FczhOK3JkRmJFTHRnQUU2cU1VM2hZOXVP?=
 =?utf-8?B?R21scFc4RExTYjVqcjBQMksvajVWTGtmY0VyZ0NtTkhsSnpkbVhOVjVHMzFJ?=
 =?utf-8?B?Wi8zcUNEQnZTenVHeXdFUkNhaGpHT2N4Q2kvR1RkS21JVmlsZHJOYnFaWXJr?=
 =?utf-8?B?K0ZUenVsTGpZdW9ibXZpTG9teEo5RUVuelJqNFVnN0F6VmJjei9hUzlpZXFq?=
 =?utf-8?B?KzhrWDh1ZHFsUk5kRDhnQUJWdFRnZnE2cnhyZkVsblErd3F2Q3VzaHczVUNV?=
 =?utf-8?B?QnNvdWRYb1ZrUTFiVmpGTmhGVFNBMVRJaUw0V2dEYkRtcjF5YVVEVTRHdFRK?=
 =?utf-8?B?Mk1BTS9JRTdURUlEaXpoUWhvYVFXYWc2SFo1MkNsbTh0ZXRXWnBjNi81ajVl?=
 =?utf-8?B?MXRDMWF6MzJIMDBjZUcySEw3MzhnbzVNQkk4dVlocTJPY0xrenJHa1V0NE1x?=
 =?utf-8?B?M0R4aUt0dEE5a25nb2JDanpSSk1NTjdsWkJkcDc5S1ljTlFmOWZUeXBud013?=
 =?utf-8?B?MGp5VHU0U2lIbExyMlk1WEw1RGtISmJHdVJXaExJbnBOVkZjUDgxSDlFTHV3?=
 =?utf-8?B?QzI0Z3pjcmduaXptV1J5d1I4Vm1tTTRDMVhVNC9xeEFhVWZyMmE2R2Y4S2c5?=
 =?utf-8?B?S3REY3Zpd1RWMkRtOTlqb3NJeGlmdlMvTFYwY0drU0RWeGpWYUJPcnZyNk83?=
 =?utf-8?B?cGpLR0NGbFh4bmtydy9EUWUyMXJXd0tQMUlteTZqb05ERUhibU12Z2VoREpi?=
 =?utf-8?B?eGNPWS9XTjJsTGxEZ2hZWGY1dk1oRys1SS9heEdKR1o4U3VlVjRKbC8xeTFt?=
 =?utf-8?B?SG83Y1hpamZvcDZ2c2lHRWI1M2pWcVdBOFpUZ1pHQ1R0T2s5elB5elNJUnhM?=
 =?utf-8?B?aHpSYVliWnlQUUZvSk92dWtWcWZybU8yTjJLbGNNanRNVHVBNGl6VkgrZlor?=
 =?utf-8?B?UDBGYU5ROVVKbktTbVk3aHpKdTRhcVhwaHovbUZQOENwL0xWQWQvUHVxMTJC?=
 =?utf-8?B?eGo5OXA3Zm1Kb2dKOVZyYjQ3Vy84Z0htM21hMlJ3OXlxUEJ2Y1JUNERGRlVD?=
 =?utf-8?B?UUI2bWw2MWhLQkdXUWRuVjc5VXJGc0txUTN6VVJJUGZRR21jRTRRS0Z4TVht?=
 =?utf-8?B?dlh6dHFOVzlUOWF3MnByTzZrekJ4eTZCV2poVVhrbUJCVXpxMVRZQ0VQN29W?=
 =?utf-8?B?ODRDbVJaRFRmU2h2anVZbUR1c3I1cU5iTW9hL1Q1UkNWKzFhbWVabWVxZjZp?=
 =?utf-8?B?Wnp5dFZQUDJkdmc3NkRoVVJaVnBFQ2llK2pZbmFObGUrSEgyRmJkOWRvS0RO?=
 =?utf-8?B?MW9EaDRXWDB5a3dLVGNodVRPNGJFaS9pajN6SmErd09nNFdZRDZhRzZPaUpl?=
 =?utf-8?B?aTQzOE5LTFRENkVnY0FiMjNPQVNIeVRBczhYclJyb0t0UTI5NWVoZWJhdmxz?=
 =?utf-8?B?REc4NUJzSjdBdlI5cFVuS3BPYjNOU2NTL2hvZ3NhVk50U05BL0w2dGVVVkpT?=
 =?utf-8?B?MTBLSjIrWEtHZnRpSGhvaGY5NTdsYVEvT1FKcXBGenR5NnkzZTBnN2tsMTFk?=
 =?utf-8?B?Y1kyM3VYczFIUTBDNE1YQnE0NThpUWtZeml6UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkZadzdWeUpaUDZBS3RMZy9MaFJOUnoyM3REWFVkNmhuR25iOGJTRXZlbG0w?=
 =?utf-8?B?SEJJMDNFRzVBNHFNa2p1R2xWRGdOMW80OVFwNUx5RzlaU2dSczY5SlQrNUVR?=
 =?utf-8?B?WGQ2dmc0di9ob0JQbzd6TFJpcWM2c2RQQnpxOXA4bGxyK3lIdUpOM2tNbWVW?=
 =?utf-8?B?enBSdEE4TTZYSFpPcXY2YWRlRHFkY05JV2hTalZkSldHMzdpSG50ektUZi9T?=
 =?utf-8?B?WTNCZjluN2pLbm9sVnBYTU9lWjh6dzlFak44TVNZb25rdXdMK3NvMkVkcmJ1?=
 =?utf-8?B?dGM4Q3hvZ2FaS2lkN051aEsxcExHSy9hVEVLRzJub0EvT0NtdnZmM0ZaVzNT?=
 =?utf-8?B?UXgzZ1Nid3d4MjAvYUJsZlF2WWR2YmRQTHFyWCtTZFF5eVpwNW5Xc1NqQ09B?=
 =?utf-8?B?Y3pZUlg1bkpEN29MeDA1SnNIaVlqTWd6bjJjQ3IzYjVzNWZBLzNIMjEwYk9x?=
 =?utf-8?B?bTZHeEFVRTg1NFg3QWtFUmtOYnMxY2V2RlNyQnJZLzdTT2JFZklwK1VnZGtm?=
 =?utf-8?B?b0JIYmxQa1YrMm5wOG5UNjA3ZG1LN25UbGtkTTEzbmlFdG52bEdwRkM1Tzdj?=
 =?utf-8?B?NTJmWWZIVWNUaS94NWs2YVAwSkRYWFJQNlVZNVkzSzNEbjBNMFNaU2liTmk0?=
 =?utf-8?B?YmNMSmU2cS9hVTRaVkZhbktjaVRNMTl6ODhDUWF6T0JnUEMvODMxZURIcTVu?=
 =?utf-8?B?SUdKNGlUY2pYRytPcDV1akN3NTR1cUZTOWNSU0ZjemhJbEN1bks1TG5rNFhp?=
 =?utf-8?B?RUx6Zi9ZVGlLelorc1JPdGp1cFNGSzd0My91V2tmZnNLTkdrRy9jUHRCQStL?=
 =?utf-8?B?eFBKSlFTVUlJNVphWTVuOWlqeFN6dWYrRTRhN0NXVFpibkZVbC91dmg4NTNx?=
 =?utf-8?B?eWtaais4VkFKZFp0cVlhUVBhTGxjREpBeUZWZURyZkpabmlqQ2ltdHdHNkpJ?=
 =?utf-8?B?WTdiWlNTQzJHVEVQRURGRkVRcEFBc3QrOE9CbXh2Wkk0TDY2M2tPSU81UFJR?=
 =?utf-8?B?ME8yUjR1S3BhYXJNN0pBRzIzWm5KRGJkUjg2akJRUVF6UE44SDJ2Q3RIN3Bp?=
 =?utf-8?B?Q2tRb1VRclV5a2lZYmRkOVJiR1I2NU1Bdk1lak4waHNNRk5CbWF5ZmNsZlMr?=
 =?utf-8?B?cGFtOGtnK2RDNXZEd2N5U0RFbTlPNGhCaU1pQW8zYjZHREJhQWZEZWExY1FO?=
 =?utf-8?B?eEpOWDg5TC9KRG80RGNYNUlhdW5WRmZpM1BmRmJGZm9Sd2pJYnZCNng1alor?=
 =?utf-8?B?UHU5bjVSK3JvWGNqRi91OERjb1Q0THZ2ZGxFTGhyV2g5azhmVEw2TWRiU0x6?=
 =?utf-8?B?b3lPcG93YkxIWWNKL3ZIUjlzZm5XQmtoUm80SFR6aDE0Z2ZCQVpZTElOYVl0?=
 =?utf-8?B?VmJkTGVxRmNEMDcxUkw5dndpSFlXUGlJUlo1RjBTZ3NvdW5nMUxrajQ1dENT?=
 =?utf-8?B?bUZ6L3ZLMyt1Q0lWZUhSWVhISE82dytMb1BJZENMbi9IdVQxZVJDTXluQytY?=
 =?utf-8?B?MlhDb2Ztdks4NHVMU3pvOFVtTVl6YzJLTWorMERCbzlTUytFU3ZDTkhiaTJi?=
 =?utf-8?B?Z093NlBOSzlpWXhiRkdPcll2RlQyTGtYKzNEaVpoRlRzUyt0cVY5YkdJY0xn?=
 =?utf-8?B?NXVqMEVrdGxENFN1VlI4aW5qVUZiUTNjNTc4aStPd3hCWnhtVkw0SFpUU1lD?=
 =?utf-8?B?QWFjWVhsTDk1R0NVc2VvakEvYXFrbkluajh2UUhJdGxENmpSNlQzOWtrcXQ1?=
 =?utf-8?B?cE9abENJWnZWSXZqc3lUeWY5WUpBK1NKbmY1M3QvRUxTOGpneUxXTllyNmlY?=
 =?utf-8?B?Rk9WWWVJQk9HZDE0SEdmMEJ1Mk5SelZwQW0rSXRVT3hVYWFycWQ1WWttMXN0?=
 =?utf-8?B?SDB4akZsdE5NbmltT2pCajdJL2c5NlBLM0VZdC9HVlEvdjJqSEYrc0tCY2hM?=
 =?utf-8?B?cFQ0UElvbDl5US9wUVpvN3VDRWt3VnVweFE0SU9Tc1NiWlR3OFAzbFpvSzEr?=
 =?utf-8?B?eklUUFd2SUdTS09FbmxRekRxdUZLbVdobGJFdDRQSnJrZS9WNjhGQ2VSTWF6?=
 =?utf-8?B?SjF6aXVGdnp1bzZsQU85SDVvRmRENklNYjZQRTdJSGJZSnBYcld4VTdxWUNy?=
 =?utf-8?Q?YlecBhMZh3QF4hQm1wyIoEyuI?=
Content-ID: <4E1DDE2D0E4D5A418CD0D2E1E16025E0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26885882-0cf3-4dc8-d43b-08de1809723d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:09:58.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDAa9O4dalQvTCL9xUkFHHehxOVCNkfe9KcJaNw8WHiVBQEO/s2kRaBdepjXyOBEVIEPOu0CHHOF00WHMOhoYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_161004_337304_1C7B685F 
X-CRM114-Status: GOOD (  18.75  )
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
> WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> measurement should fail if and only if there is a KVM bug, or if the S-EPT
> mapping is invalid.  Now that KVM makes all state transitions mutually
> exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
> mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
> tdh_mr_extend().
> 
> Holding slots_lock prevents zaps due to memslot updates,
> filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
> VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
> usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
> can be used for the initial image.
> 
> For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
> exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
> for kvm_noncoherent_dma_assignment_start_or_stop(), and
> __kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
> VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
> and so can't be used for the initial image, which means that too is
> mutually exclusive irrespective of locking).
> 
> Opportunistically return early if the region doesn't need to be measured
> in order to reduce line lengths and avoid wraps.  Similarly, immediately
> and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
> needs to bail entirely if extending the measurement fails.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
