Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CB6CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NycIDvLr4t5f42/bbSh996jG/Jevq87OiAnrjJQ/FJU=; b=efYHNsjnX+9gFk
	rkjoshCFDkFUTIyXozSGvAPZHGsH3+8KVfisgN1Il2JMA6EH65dTDEx88Lh8bVk1ANQ3ON76H1Yny
	VnLPigYZYzrmsbNew8QPJThuh+dr+YHex+6Buv4va/sy1zU8arDTFGMKIamPkrExPKaZeP3EzHcJn
	r+LQEfBdFNsd9p/cMBl26GeDvv8HQ6uIO98cRMuPK6HWWILHjCd1kJnOrwsnO6K/DLOB1PJbbRD6O
	g/lUXIaLXRXllGgnwha05eCIhyngyeQrr8bXa2ACWBS9q3vauc1p53yS6ncnAJuZicJLHzOJpUHMM
	Xbj6pancsYgsN1jlyuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEm8-00000008zYP-19fT;
	Fri, 24 Oct 2025 10:12:00 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEm5-00000008zXo-3p7E;
	Fri, 24 Oct 2025 10:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761300718; x=1792836718;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Mt0dYBJ5XwglNznseNq0Im6YWBjS4wvoWu43UdoDPlU=;
  b=UGgtBPZ1YHntj69ta7vk/yi9AhWWp2HntXDW8mwozevs2UzWItuH46Ow
   cPUNDiKickyh8EIL1J1G6bCdD1GDZ25cKyIqAdlr05KBiBw7epxh5dNIm
   VZPVOHF/76l4q+xRYD78RnU7sXCpKAboHvVqPMU9nznlyB7bbw483I/Yu
   GQ6GOY98OonDO5gY3xJhREX/pzfu5h7hSlt8LNNfC0kwdkeGHhrxgWSTC
   kKqQqhAHxmxgVJmevT7DMBelY11DiMOOgmhE8V21KA9VHjwzk3UbzYU31
   4Uoxmy59WWi5ZCWI4PC9ag89gPPRcDzQBdT4MTfcpObmh7PCVndaUZj5Z
   A==;
X-CSE-ConnectionGUID: pIQ47Kg2QmifrkvmJrcyig==
X-CSE-MsgGUID: vs8GQq7vTCuTqNqeEdkScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80915125"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="80915125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:11:57 -0700
X-CSE-ConnectionGUID: E19r0EvHTXil6ErEJuEOyQ==
X-CSE-MsgGUID: +Ya7FPI4Qk2vla0hCqGtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184774062"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:11:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:11:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:11:56 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnz7ic4UIaGiNqZaHFKlsZyc021DdSMYWJA06gzpc0B7xNb1aAPsvgXFy0710GJRipfNDN1JVuPz+uCtizfd2jb+z6cmOAlNGKoc/0t5P5kK/CH6NbNMajnW8+1iDe99OoDZWq9mFmGQp9QB81rDV7RCFGYdDulMMsSAwK9633Ie1oG6CBPcKMxDEV9cDZ+tCPNKQHTX7SI5q8jNRPbpCMztOFLRlaMt0Xs0i8TCjxsBx47MHox73teeLXUc4fDL/rooL+3J/7tOXl8+7HBdg+to8cOaga2DAQk6Yh6aIWPp/cGS4/PhBNWAbTjPnRMuHKkJqOnj6TxvlB5WbLJQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt0dYBJ5XwglNznseNq0Im6YWBjS4wvoWu43UdoDPlU=;
 b=IXA+MvFqqEr2oNuv+EDz8woGgvd9M+NlPeB3AdhuLNpTA83egd4gI33Tp1Eh3rIVu+uKcral6sn/viIv+A/sPk5Ojpaib3OLdV2rprbY0uQ3NuB6G6MIBFE+AwfP9wUKn9ibPOyhAOZWX6v4332F5+K2J9LrAFj29zR/ZJAIuZ0JWmp2L0ziQ24aOKIN24KJceSiTwPWKjnc59ASEmjmZGwhjRUW5OwVxQ43cek7m8hU8CGk78hEvD7JjZlqewOIOIvqMosP0FDPWrAZFUpT0a9kxnMH3WNzYDVtTpIc0n/WLugHFhoo40ocTiilCXd+bwo0vmQAjfzGWyff/boniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:11:52 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:11:52 +0000
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
Subject: Re: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
Thread-Topic: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
Thread-Index: AQHcPv2utspTzLCJqEqfJJNzotAjoLTRHz2A
Date: Fri, 24 Oct 2025 10:11:51 +0000
Message-ID: <9b15e66856fc1fda2bbb849afddddc5c05e2741d.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-22-seanjc@google.com>
In-Reply-To: <20251017003244.186495-22-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: 549e4384-f76d-4b46-2c63-08de12e5c085
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QUdIS3U2dXJCNGd1Q2pGQXcrUFBzMFNrR2FsVzc0SmlvbS8rbUg5YzRnZXhN?=
 =?utf-8?B?S0pBSkdyTDhZenhDVFQ3cUxjOVZPdEo3bklOc0tRYStUTE1wZ3JVbUUzNWlx?=
 =?utf-8?B?SG94cmFsVUIxNkJnUGJOUkUwNFJ1TWNLcjYyYlllOWwrWitWOVpDVlcvSFly?=
 =?utf-8?B?RHIrOE1mY1cxb0RTSXhTNmtSdVYzWmQyb0JsQTdaV1ArL1ZoM1BIeXplNHNY?=
 =?utf-8?B?dnY0dklCSUtNNXVTckJIZS9UdHlFSXdBbTZYNXl3a1A5U2pudDN4U2hTN1Bm?=
 =?utf-8?B?NzVSbEpHNFBLNDhTZTFaaDdNUDAyUzRWUWpjRWZlS3RrNGZkMmE0NTJqL0Rl?=
 =?utf-8?B?TjFtNUY3V20wWllXN0lUT3hNci9ZRVMwZUlVYXV2ZmhJMUk4SnQ1YndRNUxq?=
 =?utf-8?B?aGU2NVVIT2QzNS95YUJSb1Y4K25oS3puZ29Lbkl1YXdZNVhnVHBiMEc1bTZ0?=
 =?utf-8?B?Mmp3dTBrR1Rnb1phbVpXRVVCbzBPemxSd0x3V3MxSm1FaEkxZ3Q3QWhCQ2Y4?=
 =?utf-8?B?Q0xhVDVEcVg0ZWpHSFluQ25pelBOY1VrZWdFTjM0UmphdjNKMTIwZFI0S211?=
 =?utf-8?B?MWM0Wm5VQno3R0tTZGVpTTZETkFEN2FRRUw3U0FFR0FUWGJnaWcxaTVBYmRh?=
 =?utf-8?B?QzY4Wmp2cE0xM3ZDUnpMUlN1b1pJS0taaTdwY0F6dlpGbUs4elg0WURaM3RW?=
 =?utf-8?B?aldNWTlBemcvaUNhcjVKUmNYaDRMVGowOWpHTUNTZjRLUXVFalBPZnFObEN5?=
 =?utf-8?B?QXhDdEJyQk1ZQkVoQ2R1MFhaSmJkY011SmNzcWIzNmRBc3k4ZnJZUCsveElT?=
 =?utf-8?B?VEZ6TDY4NWl0TGZWSE8reDZNcTNPWUU0QWRkRk9HcEZYQ3RscVBVYzdVTUZS?=
 =?utf-8?B?cnVwRnNWTDFRcU93NDZoVHRYV1JnTDdsaFJQVlFyZm9USTc3RkpTY1cwb2Rn?=
 =?utf-8?B?eUVhWU5hS1VPY2hKOTNHZzZkdjdGOXdWb2R1eE1RdVNhM1FDKzhIbm9jaUNy?=
 =?utf-8?B?ZTRadDlrZVlZYkVucWNqTWFFUzVqdU01TUtveDZZZHRLSVZMbmp1Rjk5dkxx?=
 =?utf-8?B?aVZieWs1SWd4QWJmNlFZdG41SVE3NXVocFhRWkRLSmgrakg1WEFGQ0pIMm5W?=
 =?utf-8?B?UWR2QWN3ZkFnQmNEQ0ZFOVBtNXlPSE5Nc3cxRWFrSGNTL3h0c2ppWmpWbjlk?=
 =?utf-8?B?ZUNCdXQzL09EZE03YW45aXVMKzdGK2lKSVN6ajhUcUcrckdFNDBzd1BRUG9u?=
 =?utf-8?B?TXNRNE9vZVhleW9ENWpyVld6VXpwT2hvTmFEcEozZk96SVFCaTlaU1pFUXJB?=
 =?utf-8?B?QUMvazJLNnZ0QkR0SkZBcFhERE1RQnNLMVpQUFQrWFhvWXNERnNJWGgrRVBl?=
 =?utf-8?B?eTlRcmg2UHhZUnlXZStFdlRZc0RGNnZyTkoyalY3M2cwN1IzbGp4RXlPWEQr?=
 =?utf-8?B?MjRCVHdYWUVCSGttN3lDZFJpeVlFS0k2KzBpaUJPaUlPOUhVbiswdklENXY0?=
 =?utf-8?B?ODJJd2lNN2g3U0c0V3lGLzhNeU9PTjRKU0UyelVyQlZzU2hUakFOUGdOSmtn?=
 =?utf-8?B?SEVXdWRHcjNsamtrNHF5ZlZ0MTVpKzlyTFNDZ25iL1RGTDNvSUxzYVJMM1Fy?=
 =?utf-8?B?SHVrSFZIYkxVM2FDaGJ6MXgwLzFveEEzQTBZNGp0alllUVpHQlhVUmdrcHVt?=
 =?utf-8?B?c3JpaDlWTWp3YUF1YWJXZU5vNGNJWFB4TWVLTkN6Yy9SV2lueXJITkMxYW9v?=
 =?utf-8?B?MEdCMG51OTVRaHh4Q2x4Qjh4NEplZDBObFNWMnFWcTE2TFhxVzJQajJJYVUx?=
 =?utf-8?B?djBNQ2t6eHNnbE9HeDAvbzE5ODJLMEY3d3BuUkhYQkI1K0ViVWlGRXFxeHVE?=
 =?utf-8?B?c2g5NkNmdzQ4aUVaQWpXWmd5dzlkRi9OcU1zUGxTeERlN0RYMFR2YnkvV3Vj?=
 =?utf-8?B?NHY4UXorUDVFVWhZOW80ZmNlLzVCYzhuanBYQXJlTncrTXU5ODNWWjM4MENR?=
 =?utf-8?B?dXBEMHFhKzAvamhDcVdKbWlkbnJzcFEzcWJhc01MTE9WZkR1RGVmd0NLRHkx?=
 =?utf-8?B?MDdqN0R0b1IyVG5xQ1EzbjB3Y1M3VFVTYzA5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V29sZzRrYk4wZ2p1cUtpZXZRS1YzWWpadU5hNXRIU1MzQ3JuanNyaDN1WXEy?=
 =?utf-8?B?U0hINy9SYTNXSkYrdGN6aHZsSmJ6Wk03QlQzREduQm0vamhubWlMclpDaUJU?=
 =?utf-8?B?RjVtTW1FSVhWbjhxS1lqazVKRXVPTXI4WnNLZndQc1NuVFR4SmVrbC9kRUk4?=
 =?utf-8?B?TEV3VGpYYjdKQWJBM0s4ZGRJL2NVNXcvOVZJbTYyV3lkbkxNazBmbERhODNE?=
 =?utf-8?B?a2ZOVEJsVlRrbmpPb01OUzNUdDhLaGJLUkFlZHJKT1NwRThOM2xsa1VmSlFs?=
 =?utf-8?B?TU5ka1FsN0dZd1R6WFlmVUZqNU1NSXdmMXlHYnY5U24xSG54TWljTk9KVlA1?=
 =?utf-8?B?anprbzk0NTE4aWpKSGV3bmxQOHQvV2pvRmN4TC9ISEQzZzZtc3BNUG1iZCt1?=
 =?utf-8?B?S01lb29zcUFXRkc2cnNyU3dpWndjV3c3ZXZlTFo0aG10UkVyWE5CL0tiZ25h?=
 =?utf-8?B?L2k2VUM0dGJzZ0hVdTg4aUNPeXB1ZWxCMDkybzFMbGpaWDJNTkVkU0UwYytw?=
 =?utf-8?B?VVhGeldCd0YrcmFmNjdCUmtBZElGTmZteEJvSWN4UXB3eHFhbTdFZk1GVC83?=
 =?utf-8?B?VHRibDBtRkJjditBY0dvY3Z2emhkMzFpOFg2TTJZTHExVW1VNDltUDBQK3lY?=
 =?utf-8?B?eG04NkhORkpuUm9HeFVGNU5hTEtPSU9veFRxbTRFenA4OHAvTktQSVpzazl4?=
 =?utf-8?B?akh5SlZNK0kyWkFJbnpST09EWUpLZ280aHVOU0RTcTlMQ3NFVExubW5QUHdI?=
 =?utf-8?B?MG1yU3JOWU9tWis3aGFWV0d6QkwyMlRiYnhWcDdIR2tickpmR1JDYkdCZ0Ra?=
 =?utf-8?B?OWFEektMK25tQmRDM0ZaOXYyaG00VUs2bXNCVWVsVnh2eU5HcDJiYjc2V20w?=
 =?utf-8?B?U2lMbWRlWFYrREpmRG1nSVAzbnRFSGF5U3cvZVd4UjBqalNKbWdPalFqUllY?=
 =?utf-8?B?NXRaWXZFcFJpQUo2TGU1V1E1OWZtOXRyemVUVWx6T2hYOVFhQ0o4M0I2WmVD?=
 =?utf-8?B?cmdXR284Nmp3cjJLTDhRb1VoaHdWenduM2ViMDZGM2lkSFVUQkhhUTdMZmxM?=
 =?utf-8?B?RWFvNStKWVVwdzdNY2FrQkVWRVFwRWM2bTByOEZjMUI0bUZ1OTdsaGx4aGJs?=
 =?utf-8?B?T1haZlczYVVRRGlEbUVwRTJnSjIyckYyR09VT0VnV1U5N1BxTlJnNXNPcmhv?=
 =?utf-8?B?NHZTVVU5blFoMDRrLzJxZGQzSU54TXhYU0lrTW13RzJrYU95OTcvWHkrTldy?=
 =?utf-8?B?dkdtakVmd1d5bDVyM1E4OGoydWU0aHhUdlM0M0s0RGRLR0dudUpkR3FEaUZy?=
 =?utf-8?B?SnMyRTVJK1FwVHhGUWdtd2l4REtYUzVva1N2QXQwNml6ZzN3SmVUM2ppeWFB?=
 =?utf-8?B?TXlEeTN6Q3B3WTlPR3BTbUhCbkxEUzZaTzVmRGtoZml4U2FNYWZBay8vUFo2?=
 =?utf-8?B?dU5KMEtXcUFwbFgzS2JkRjFXTS9TdHFkcnpycjA3U2dJeUFGeFErM3ZSRFI0?=
 =?utf-8?B?S29YYjFINmtkdUlZd3hxZ09NUmVaTU1pczNKdHJIYkRiNlBWaVRpRmttaUdP?=
 =?utf-8?B?NlNtZDdDSWJKR0RkUkU1OWppdDFrc3pQdDJuMDBaOTJSSnpXelRlU2xvbFZx?=
 =?utf-8?B?VHE4SlU0TWpPMkozNUdYL1ZYUVlLQzVmazVsNWhPVW1nNXh5NllFK1V4cTBK?=
 =?utf-8?B?YUpNRjExc0svMFc0NHZKTUhEVjBlbkUvWTFyd2VUemhJVGFLTjFkTlFlVlFr?=
 =?utf-8?B?UXA2eUplVVdXcTVERXhWVlVCazRiMFRhRHlyMkYxczVEcFBObXNiMTE1L0dY?=
 =?utf-8?B?d2RjL0V6UUVaaW16QitvV0NibkI0YkJPM1dwa2VKbUEwcktzYnVIc09jYWFD?=
 =?utf-8?B?aktkZW9pNjlaRkZITVJtMnFDb0FGUVJIN0dZcTNYUW9HY0Fmc1pjQklXRThO?=
 =?utf-8?B?QUlHREpjd3B4QnFBNTB0S1JBb3ZiSk90R0VHRmVDNGdQSHozeE1CNDNtTGR4?=
 =?utf-8?B?Y3d3UnRtRytTZFZOWnN6a3I4bmtwOFNzV1M4TlVhSzBXNnNJR2NSN2RzNHpK?=
 =?utf-8?B?d2FJbjZTQWZtOU5kRkh2enBnSitLekx4aEZnTzdTNFpuTm1JN1ozY0J1b3ZM?=
 =?utf-8?Q?Iwr/fGYWMdv1KikakH+tHSEL+?=
Content-ID: <FB3C6B9E58CE344E875EEDB6A95588D7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549e4384-f76d-4b46-2c63-08de12e5c085
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 10:11:51.9404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjhShBLmE9d7PRb/riiNVhSSgyrerSZDvo6uqZTmeM17BcLYKf/4pXaezZP0JdDBNESFIGKbpmBMWzuyTRLnBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_031157_995617_BA8286AE 
X-CRM114-Status: GOOD (  15.97  )
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
> Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
> that must-be-zero fields are indeed zero.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>

> ---
>  arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 2e2dab89c98f..d5f810435f34 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
>  	return 0;
>  }
>  
> +static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
> +{
> +	if (copy_from_user(cmd, argp, sizeof(*cmd)))
> +		return -EFAULT;
> +
> +	if (cmd->hw_error)
> +		return -EINVAL;

Nit: to me it's a little bit pity to lose the below comment:

	/*
	 * Userspace should never set hw_error. It is used to fill
	 * hardware-defined error by the kernel.
	 */

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
