Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BD4CF2564
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 00:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Fk1qgLZOqT7JJaTW0ABVbtYyXwZIW2JvwUUeXA/iTI=; b=QfFrrxScBagzsM
	l51QgrVowriE1QmQa+OEweFf2V+j+1fYHoL8lvnd+JbYelZ0jS8dH/OezGbnknK14WO9v8hfNWJXw
	A+u5SFX2r1H4VKTFQbIKN9TfQFPelqh8pkfDQEBN0FbSIuE8zp4BGsHK/+eNIXGnhvT9pEHNNdeaw
	H0+KI7haSeuasNEUPcd2ynDhtAjAFQd4TWCm/Nr1QHKnp8Gr0G2Z9rnEwCmuSGjNZ1tdQLKeCtt5z
	SnUG0A4LEFg9zOn3UsRgzee7VZYEtlJwCyegrVGlp0Hvmj2nHMEX+KLPk+B4haFQkkvwxyP9o0uP/
	vPDm1b+PdzUnF8wG5WdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVei-00000001GN8-11Um;
	Wed, 19 Nov 2025 00:02:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVef-00000001GLy-2OoE;
	Wed, 19 Nov 2025 00:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763510557; x=1795046557;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6ehWNyduTbrTPdiobTvLtfvXjYlMQdG5MBQdV8VUGZs=;
  b=R64hRj/fK08/IiM3xq6hJfL53wyEBbCdBU8mdADE1j4VvFvekTeBX365
   yKFI9Fj3C0rhB98F6Uj5R+P2/OuotM5KbiYUG2qVineXDY4eWqQ82hYU0
   08szHeXMD/+mwzPRicBlLwCSC2v1MPBx4p5P+WPvda4XrGdZtWnMTiS13
   duwl1eTVgF9mHIqVG4mpFa3qLKYxHoypbhFDh/UA7zjVrpkrdLiEqfB54
   t3o8ZStfFDboG6bkxKrpovEphe9mUnUenPKrPJi6ISNVLTHrqCv8rmcf3
   kA0VxysC9p0BmoSEdhn6wwytIGLqWmaS/9GeZGGvbAyhiXtwpcGrG9D2d
   g==;
X-CSE-ConnectionGUID: CCG5vKaTQ6GQ/+uSpR1q4Q==
X-CSE-MsgGUID: AcQD4aC3QGCxYouy/V09rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65249241"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65249241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:02:37 -0800
X-CSE-ConnectionGUID: PQQh8ih8TIC11BTVXC6jxA==
X-CSE-MsgGUID: WnxOkT5+S1Ge56tV/ILoZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195827206"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:02:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:02:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 16:02:35 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:02:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fp1a0js+QW1hQVnm5V8UFXim5pxxioBdgUzX2yj97QvfRaeBIvsEtDeMApu8zgnEA6hE5Aooo6NRhSlaGmO0ubqztdDUeDf+7pjqSYjoprT0FOQm3ncrkPcR0MfwEFmeG5aH5I7QpTuLeiTg4WDIbn+hqCwfUl1WhxVxfBC4Y91+kFt4bfQR1wVyz+qokIqYFND4In7cMUasavFO6PC4c5Jr6udo+GMmLr0hXMYB4sQJQZl6De11vWtAlAJlvCkITkPhVDxsVFsFUdvThUxKfivepQ5k8jR2QykQZzRppGTTatQcqK5P7Qf/XwMDgtmz4GwMJ5p3kiju8PPQy430wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ehWNyduTbrTPdiobTvLtfvXjYlMQdG5MBQdV8VUGZs=;
 b=EN0Ppf/ZwLnuhrKYK1oG20QvW+bVL52csxhcUY7sW5M7yFYtKyjH2AtuD+7KoAdlHY7F39WTB9ypkeDVraq2o8KweYGqgCSEEOMz/ihFtxpI6klKnwLcXT9A1kpXYOF8oihaDeuhlc/8xWClSKjZgTcjv825DvKyP89OUw1J67eDWBoZS6Xw7CFE9Rg2O9bZv0ISJqgHBw1TIENTxDYXLDUBZKDrdPzwgif7O9G/h/gYfnmyZBemdnroXOnPqxKMHYV18+knkZ0O4xSjsQFai3XaQZnd/trGdAkjvP6GNRnqXHqV8wNZFZb1eixN2nniNpB8NCsLGhvDIUv8NOyLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 00:02:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 00:02:27 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "Annapurve, Vishal"
	<vannapurve@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"anup@brainfault.org" <anup@brainfault.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org"
	<kas@kernel.org>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Thread-Topic: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Thread-Index: AQHcR6HQe5TyQjVg+EaivtbibGxV/rT5N6EAgAAINIA=
Date: Wed, 19 Nov 2025 00:02:25 +0000
Message-ID: <047326fd4ba8e96d27796543ca20bf0fde58bddd.camel@intel.com>
References: <aP-1qlTkmFUgTld-@google.com>
	 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
	 <aR0Byu3bd3URxzhu@google.com>
In-Reply-To: <aR0Byu3bd3URxzhu@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 75d85000-f8b2-44b8-f8bb-08de26feec3b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NGJYQ2M5S0h5Nm93ZkpuRXpCVDBJUEFFcEFQSFdGTE1NdXRDVE41eDdTVXEw?=
 =?utf-8?B?QjlUQkVsOGFqem9IbUk0SXFpYjhCZjVnRFpYajZmOW0rN2haMnN1ZjdMdnBK?=
 =?utf-8?B?QW1FVHJjaEt0ZStlQmtyODgyRjd6TW9NUXJkb1pIazl5R0d6TWx2ZEkwbmN5?=
 =?utf-8?B?RTI5QTAvTGdWaXpNUnNNMEc5NHpQeCtoY0RScXlMNkRCWTZPVUdUL3RaRU1O?=
 =?utf-8?B?ZjI2VG04TEtvRHJSVEtrVHVVeVVhOU5VWWZ2WG5RUnR5Y2tBV2dXeDdtdzhL?=
 =?utf-8?B?NWF4OHJaL1pmSllBM1ZBTUNIdWFVaHlQRnJCalpreUJtYnI0RWhZUlZCcDNR?=
 =?utf-8?B?eFNpSGt0N2ZjRzBuWE5PRDRDd2llNUQwUndvcVhvU0dBbWFFR0FHWlZRZzhC?=
 =?utf-8?B?VDlOWm56K2VhRHFZdGtDcHNKa0tEZzNQQko0M3kyT3pnQjhsdEVYSGhpaUZm?=
 =?utf-8?B?L2VycGtIMC81OUZrVy9kRThBaS9KSmgrSlRWeWVkdkIyTHJZRGRRSjZmMUNp?=
 =?utf-8?B?Nmc1bjB2a3BBdmZqMjIvc2lCWDA5c3FacGphNXlGeGZHUHBTd3h6ZTBzUTBv?=
 =?utf-8?B?Nk4wVGxzaEpqMmphOGNFOVhLTldKOUVKVEdlSTF2Q1UwVElrczhKSEtLTXdZ?=
 =?utf-8?B?WjFaTlgvdjZhbHV1WHk5TmZEeS8zUDdiMFVzVzgxUGpHa0xvVmpSVnhzUFh3?=
 =?utf-8?B?YzI5UCtRZ01qdWVMWWRNN0RaaG1hSnVIK200K0ZhYUdXemhFYU5NMEFOODY1?=
 =?utf-8?B?ejRCWXQ5T0pxSGZwMk91Q2ZqS3VIL0tGOWtWQzA4MWwrVGxYcXpWcTNCeElI?=
 =?utf-8?B?WTdvK0Z6dmh0MjJibWZKNS9hSzZ3eEpSSEcrS2ZSZ252aHFXeFFLUWNVbWRJ?=
 =?utf-8?B?MUZiaVh5OHM0YWtXTmN1ZHJvbDhLNE1jWEduanRPSm9SQ1EwQTlnYUdPbTZN?=
 =?utf-8?B?RTZRSHpJZWxySHJ3bXRHOUgyZS9iSVF0Y2d6L3BNbDRXVWNES2dabnZ1VEhn?=
 =?utf-8?B?NjdEUnh3MmV0VzBuTTNBd2tQLzU5d0pCak8zTzNZbFZER21WcXU2TU01bFVr?=
 =?utf-8?B?RDBFZVR2R0d6aDJiSkZqNXhEVnpSVGs3enpxMTE2RmZhRmhKVEx2Q2FLRHI5?=
 =?utf-8?B?RG1JUzdJblQ2QU85ZDhmbjZkL2YvL2M4UllJWGdmbHlBdmgxZVZxTDJxZFBO?=
 =?utf-8?B?cWhXYmM1TGhVclRyb2d0UisrRmJNekxPZXFETWpwTmNEMnZEN3luUENBeitT?=
 =?utf-8?B?RTEySDFpOW50K3R6R01KUTI5MmNRbUxxNmlkYkhPcjBkeG53Wk1LM0FSL2xx?=
 =?utf-8?B?cGVzTXNoL0NieTFWTkFscVBGeGlPb1ZGMGZBcVh4U2FSLzNqRlcvK21mWk1m?=
 =?utf-8?B?RXF0bHZCSElrUkZnaGpWNXB2M3k2OHcyamdQL1NjSXh4WlBhSW1Pa3VpRzhN?=
 =?utf-8?B?bk52SVBYQXpoMk5HN2JuUmFjVmk5cVQ2NThTV2tKWis4SnlYRHhQU2JVL3p4?=
 =?utf-8?B?RDVvcTljMVNpbUxxeDlPNlNPSHdZQnY5dmdVV0kvSzBKZjF0RDNFVVZBVTM2?=
 =?utf-8?B?djVsMHNnN1VDbkszQU5iVWRRdThKYXA4MkJaQmJIdnFlaVZNWWxuQmorV3Ju?=
 =?utf-8?B?WTgwRzFqSjZsVE5taGlTc1ZpOC9oY1FwTUxlbVVBeG0wck91bkhFcnd0cTMx?=
 =?utf-8?B?czdtbmFTTEZrZW1oeC82QUd6ZUo2WWhoZy9heVhkK2wxUE1ob0F5Z1FwdmYw?=
 =?utf-8?B?Wk5tekd4b1BlaGoxVzRqOFVxWmRSWFFDUFJlVmE4dU9RTldVemRpTnVpMFNO?=
 =?utf-8?B?VWw2czdYT2huR3ZHblViZjhHVENlVVJqSDlrYXBCaTNia2kyT25xNm5LWHJF?=
 =?utf-8?B?UEZKRGg2dGZPS3p1eFV2M1k0SG0vUFgwL05Pd0tLd0szZlVBTGVtRW8wcXVh?=
 =?utf-8?B?Q3ZwZ1c5RFZSYUNDNm1Hc0RqQzgvQnFkOUtCS2VuT3BDUXRYN2hFZDUrWVpP?=
 =?utf-8?B?eVpienVYVU1BejZwZDNIODlRMjZ1VjNVZjBOK1MvS0xxa2EvanB1aVJ6bnRF?=
 =?utf-8?Q?77ixul?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGZXaHdhTWdYeGFYWFdwRGU2a1BDVWFVVCtyek5JNGU3TjVKVmMrQTYwWDAx?=
 =?utf-8?B?SG1pRnVkejZRdXBUKzRqL2tJZW56ZjVBbGNQcXAvY3RzTlNTcnpGWTljakN6?=
 =?utf-8?B?bFErV0RDZXZZVlNrN3V3VG41T25YSTl0VDBUbjVNNkRJZ3dWRXIvZzUrWFFT?=
 =?utf-8?B?NE8wVUJhMG9reWw1Tm1uRnphMktXUXRwTDY1QkVYb0dKTmJPZllLNVg0cEhs?=
 =?utf-8?B?UEhXQUZtZkp4QzRrMEdMMWhDbjdtQjRFcHlFdGc5TkFUR3RRaDJKN1grQTJh?=
 =?utf-8?B?MHpCWFdTeWRVMXNUekxtTGtZZkxUcWNzT2k3S3FzcEQ3OHVKcE10TG5TU0Vi?=
 =?utf-8?B?cHlNdkhudE5ERFFDOFRjbExEZWZnbHRqVW9LSklldWtzRlpEb055WGlCVjBt?=
 =?utf-8?B?ZUJzRXlhRlhyWEFTZEFkc2o2WGF5VkZYS3dhNi9kT2FLckRndGdvb1Z1R0RB?=
 =?utf-8?B?aGZueDNSc1dDdEY0NVUzMG5xVlpaMnRoOGJxUHJWMVlIcGNkRHA5TzQvRVJv?=
 =?utf-8?B?MXBoNXBSV1gveG0vNEpPTUNtaTJzUDZPV0hwVWgvOUpMWWRCSTltUEJ2ZWF5?=
 =?utf-8?B?cXIrS3h3aTY0WFBNNjFSVHpBMmJSdmxsZS96d2ZtZS9EZFpiNzFFSG5QQzFo?=
 =?utf-8?B?eVhFQldhMzJWQ0k3ZVlocVFQVTBCQmlKRDlGOGhUVS9LZHd0NWFROGk4VWVl?=
 =?utf-8?B?dHF1TDNJWWtiY0hhdSthS2lvZmh5VFNKNGFsWnM0ajFaZGNMRmRHQ3BST3dQ?=
 =?utf-8?B?UWEyRXBRU2syN3FqajQwdGo1UXErZ0d2UlRPN1dUaDQ5VWJ3R1g5bTVXOWhx?=
 =?utf-8?B?VjJrVTN5WUkrUTF1bWdZdXMvckRYc0Qzdk9lT0VlbmxuY05tWlJkeFZhUTJx?=
 =?utf-8?B?ME8xSFJvWFcxOExzdmp6aVk1UnZjeG5Gc2RiVm1TWUxpNE1lZ2R2Yjd2Zzgy?=
 =?utf-8?B?Vm1BVlFQd3Frai9VQ3BERy9pWlBmNzF3NE02NXlyOHkvTHA2MUhsM2sxVEo1?=
 =?utf-8?B?cWltYmkrL0g4dS9xMnB0UW9YMUhKRXB3L0FMUFBUUmpiUmV3ejA5QkxOR0Rn?=
 =?utf-8?B?QTZsbDhNakg0S0p5cmFUQ3ZaWlhUd2UycUxaSnQ3NUg3czNVMFBEM0JhOTc0?=
 =?utf-8?B?czcxcjdKYWE4RktMcTdpNnlvYkMwbks2bmdYajdKclIrN0tJV25qV2JyQ2Y5?=
 =?utf-8?B?dHJzUlNNM3RseitYSVZNRDVCK1pUOG9sNlBjcVRFenAwM0M1L3NTclIzT01z?=
 =?utf-8?B?SlJWeFl5d05oSDNkR2tYSUxIMTAwL0NHOVVoVEd5VERadEp3ZjZDN0I1OUVk?=
 =?utf-8?B?VjdxNjJYSFFsU0NLSXA5ZU4yb05uV3NqK0wvVUlhZ0RHVFZ6NWJlWkEvd293?=
 =?utf-8?B?aGxxVDRRSnBVVHczdllQc1laUENaUTA0a2p6WTZINnRHc1BkVFNtb253VTVy?=
 =?utf-8?B?WUtiNWJXKzhXMWVuL2ZwSTdPVi8xNEZiVWRCYlQ4MHVoN0ozaVRoZzk4SjMx?=
 =?utf-8?B?eFVLMGtjZFVsaVRvVXRGUloxVWR6cHdhU1l2QVFBMVI2NUdtMXVHTWRNWFJp?=
 =?utf-8?B?QVVwc3F6aE5YTDBYSjlJY3JoejFxclFFSnVoWlVkMzYyNHNHYUxWejBVRWdh?=
 =?utf-8?B?MjZ2VGJDSDBCREZIOVQrTHdNYVJGbTUxZUhNb3RYWW9nZk5ER0hRbzJhL09t?=
 =?utf-8?B?Y0NqbVJlaEFQMWMrbkpaTzJLR3ExVXJaS2oyOHBlaFpZQXY4OXUrMWpWdng2?=
 =?utf-8?B?TWZMVHVYMngwcU1peHk3aWgyTjBnRUt0ZGI3eGxSMTVCN1BtSWE0WUh0REU2?=
 =?utf-8?B?WWF2ZGtPWjkzMk14RkRKbTA1V0UvMG1oOHViTEw1aDhjSnM5Yis1K0xjQnZs?=
 =?utf-8?B?ZmtYKzRhZFpsQy9ob0pSRExVVWtwL1YyZHlsZFhvKzdyM013bDlvMUN5V0wv?=
 =?utf-8?B?Yjl6ZDF0eHdhZ1lyVWl5NVNUSmQwdjVOTFZLU3l2MUJZODZxV1RLaHdDNUxz?=
 =?utf-8?B?bkZ4T3AybXlHOFNDaHBvMExaMzU3Qnk1L0NrbHhGanViK2xSVW1MSmFrT0xH?=
 =?utf-8?B?SXlmN2owNEE1TFNZT2NmU0dMa3VGSjZzV2JyUjd0ejg5QmpMUEVFM2FoNlJl?=
 =?utf-8?B?YjNPeVVDUWtJQXhwdC9sOC9VajlDVHJON2ZCVzFBL3l2K0ljTkZ6Z0RzajRI?=
 =?utf-8?B?dUE9PQ==?=
Content-ID: <73FCC8549A2A504CA4575EA90A3CBED4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d85000-f8b2-44b8-f8bb-08de26feec3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 00:02:25.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5ZH2AOXTzlIKq6Wubv5mYp0gNTH3ee9u1fAgd0WkEQzmvQUQwFOQn4N5HooeMoL0wGSJ3AiuZM6FXIqG0B1E/wPiu/mY8wtcHrkKzj6X/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_160237_694795_57CC8768 
X-CRM114-Status: UNSURE (   6.71  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2025-11-18 at 15:31 -0800, Sean Christopherson wrote:
> In the future, please don't post in-reply-to, as it mucks up my b4 workflow.

Sure thing, sorry.
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
