Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F026CCD1BF
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 17:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBX1NWz6Ew6A1jZ2WwTsqsJ/CUw3N/q8x4+Rg5L8Ld0=; b=RDSgPepEidOnVT
	LoIyJDK8NewRND1IEGcptigycZ5ZSDGsdV3YLC6VtZUZ5Zp7m9Ge4hlPptHTSnZC8Xnf1SnG7cuH6
	HPxbJFOUla8YcOqbvawnrvMBghiFDuV+OZRAMO6SsVVa8W93NXxPoH5FZ86GAAkIpD0gZ9OSuCRwf
	+9umXWnUfEGFkf/CyroxSPmPWcAdWkvDACZAHQjdCnyoC5c3/7mqZOa4R7F+FSdmQ38qe4nIPea9s
	I4q8SuXZ6Ph9ULnS02MpMhRpHDVrfc8ZFEevTLSUEOhwehm1RDUMq2D8/69XyUZ4FiZcDB0gi9LB0
	t+C2w/BQqZQNVTGRtQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDngr-0000000GQ8q-2CiX;
	Tue, 28 Oct 2025 17:41:01 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDngo-0000000GQ8K-2e5M;
	Tue, 28 Oct 2025 17:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761673259; x=1793209259;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LHkZKbNXktIhDByTGL9Uz92CbXTpBLK2bwElIG9foRw=;
  b=Jt0FIRTvBKFoLNHiMy17bZ+ic9qMhlJqy993QR0ewO2zrqLgtMHsItAk
   0vpbe640kWbQZ7zCDp8d7T9qAeT67RnTEC69j6AlbFTRNBdS29sYoJVZC
   1HdJpIhkCebJHSKoHsizBAaBsSPvuPPnqSAFmNMunaPfh6e+Hs5ouJxub
   yZ+KV98yfHOjQu4JrUug5I98VaJRt1NCWjvklJbZrRRV39UL224CtPEBN
   OqYKhLr120IWXrWwwolm2qEYccHQc/HYk97XmWXDv+oARJJvgQvGaTqdR
   8pBUIXn0MIYkANT/V9CgQrspSONIzS3L+pWkW54t46wanib6VD6GzqQci
   A==;
X-CSE-ConnectionGUID: 5hmPD/vaSIGmnzZ7PA/mvQ==
X-CSE-MsgGUID: bbnheMc8Tq2xlGiSe9gcdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75230231"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="75230231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:40:56 -0700
X-CSE-ConnectionGUID: eynKFN6NSS29LCkdxGR0gA==
X-CSE-MsgGUID: QMgLcTWvTiOlivEX+Dp2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="216073839"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:40:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 10:40:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 10:40:54 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 10:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoQB/lPBCAYf9jfk3TVs02THtuOjF5pudye2OgtLLXu/j+0bW70z2crjUnIKxcqCIH36ei0QLtBtBVW/iUuvUrv3IatWjoVLFGPjQEyeUQvWb/hQM93M/vAKH1nqYgqS8vUQQG9HaKKyyzbteBN/IpVnqCUNXfe2GQpAr1v4qChc0jKcTyZpI+3A371BuMFS4g6fplgwlGcUNu9oxthVa/805Z3Q+ryK6sOCjdeOy/VAzlcqio3aop/Xi7sVbF9U7FrjwfLinmwojq8lVVK5iuM0DpzwXdYJRUCqfUhfGvhog2e5vYLelObZoQiY1vAU63UPg+n8eTr75pEg9/vU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHkZKbNXktIhDByTGL9Uz92CbXTpBLK2bwElIG9foRw=;
 b=b4fiynaDQy16JQLEl25+/CKmP+DJsLgvsdbvlRds7KmeOPBDDy8xlWay+l71G9gWu/RNKqD6ViDulGmojQHYOm48anL/A4m9ft+FhnPjjrqIX+y6B3R+dYdCvhCEFI+Lmt623UdWYL/qSKg62xDSp9Zk+Ze64Sbh4d9emYnQ1SpOtvJ6cEQXKaBuRYa6JF17YKWe+VOpnx2Gq2H6N+JRa0Ewj/6qnhVPSj/7fKEw6LXbisVqO7vXFuMux42/222sH48nFx10yTuhgw0YVW1SVYmM8jssij0N3EuT81nlsfxMhfTY5UYFqpQ4KIb+ET6Hwdxp08lauJxwjVtlT6YuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB9519.namprd11.prod.outlook.com (2603:10b6:208:5d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:40:52 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 17:40:52 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "x86@kernel.org" <x86@kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "Annapurve, Vishal" <vannapurve@google.com>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "seanjc@google.com"
	<seanjc@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "maz@kernel.org"
	<maz@kernel.org>, "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"anup@brainfault.org" <anup@brainfault.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "Huang, Kai" <kai.huang@intel.com>,
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "pjw@kernel.org"
	<pjw@kernel.org>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org"
	<kas@kernel.org>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Topic: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Index: AQHcPv2w81uMmlMzI0yEAMgtbEXDh7TRHKOAgABz5gCABDjwgIAAi6mAgACDnYCAAQ1IAA==
Date: Tue, 28 Oct 2025 17:40:52 +0000
Message-ID: <41a8d3d0b30404fb0c617b53cc91f537b990de09.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-25-seanjc@google.com>
	 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com> <aPuv8F8iDp3SLb9q@google.com>
	 <aP86sdBZxXm5I17f@yzhao56-desk.sh.intel.com>
	 <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
	 <aQAeQV+xrQB5IFBF@yzhao56-desk.sh.intel.com>
In-Reply-To: <aQAeQV+xrQB5IFBF@yzhao56-desk.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA1PR11MB9519:EE_
x-ms-office365-filtering-correlation-id: 35fed47c-326e-4a76-0fa8-08de16492423
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZlJMRDFIRk1wNnF2UmtSdFM3ZlE4djkrRHd5S2dmaUljdE9ucDB4SGVncyt0?=
 =?utf-8?B?ZVFLSThwdng2cEFQaGhVYXdRRlRkQ0pvaS8zWU93aWlVRkxnbExOR1F4SFIr?=
 =?utf-8?B?WjUySGxwVHpUTjlqdEhUVitEZWhJTzd2T01yYVoxb1U2U3FLajNidkRWZGtz?=
 =?utf-8?B?U1Irc01ucnZ5RFJyRlFsUjNZZ3poaXhyUFd5UytLdlRodEh0SVRRZnBzQnpP?=
 =?utf-8?B?S0luanZHQjBkeEw2VDlzQ3dDc1lCellKVTF3V1FySlFxREE4VXZLUGRURk0x?=
 =?utf-8?B?Nm1rNTJraGtrSStFKzJIa3Blc01DRWFORDdINlpVaTNzWEJrUDQwNlBOdUtz?=
 =?utf-8?B?M1lQUjRuZWZicXBhYkt6M3dpSjZRVlpXOS9vWEhWWklMNm5QbStsNWNvbVRt?=
 =?utf-8?B?OWxIczAzUUdrVy9RV29Gd3hSS2l2SzFyWWZFMFZsM2xpMTRuYlNhRFZBMXlz?=
 =?utf-8?B?QUN3QVllK0NueHJ5RHBHeFk4NjVjemlTc0dCNktRRnArRk5ZcDJFa3I3MXoz?=
 =?utf-8?B?K2ljanRJWTMrdWpKTUJiUlByVS9GN2l4eEdmRGpDaVVKY0ZENWRTS1IxQm85?=
 =?utf-8?B?M0JkYkY3L0JTeHZCdzZCWVRxcTQvdnVzMnh3ckwvVTcxUlRJTjl5OVJhOUNu?=
 =?utf-8?B?bEN5Sm5VOXl4azNNU0xZd1hUNm14Qk8yaWpPNForSFRmdUFKS2s0bFJURVp0?=
 =?utf-8?B?UkVUNDVESTU2cDIwalA2MUpEbnZZMG9NaGVHdkc2MStDT3pQdEtVcldTVW9V?=
 =?utf-8?B?cUxpZlhDSjhPUUp4RlcvZlhoVmMwTjdBV3lFeUNyWmQyYVA5MUJlMmRWbk80?=
 =?utf-8?B?ZS9Sd0VTbGU2bWFUUS9PMVoyUTZSSHo1M291dEJHREJPVVFFUnBoMjltMGo1?=
 =?utf-8?B?ME1GMzNPNzBkR1lpYTA0R3AyeXJ5SFkzWEIvbWFCVmo3NUhLK2p5RXhiQ1hX?=
 =?utf-8?B?OHUvWkE5SWVVcHVKQkprWEFRbmpkRmNwWkNCR1dDWGdKOS92dFJLL2xHNzhz?=
 =?utf-8?B?ckpkbGFGdDNPWVVLM3R0TGJ5aUVWZ0RNdXFXTEtzRTdxVDhsNVRKZTkzMFNM?=
 =?utf-8?B?SmhBS0JWV0lMZ2d1bm9OajRmeno0ZmRCd1daN3F5TUo1amhPVWRFK3Q2UzBC?=
 =?utf-8?B?UnhpeC9qNHFxc0tRd1NWM1RMUzczbmxReEFiZCtQbjAzRjR1TnZ4VFJ3Qklk?=
 =?utf-8?B?eENWY1BKSER4VnFTeXFrWmpuUWVsUmE0S2pkdTBtamIyZHdzNjVMZ1o1dmVG?=
 =?utf-8?B?QnBVYXA0ZXgrS2ZsOUdJU1owRTdKSVlLbWRYOUhrS1hWd0ROQlpkOTNnVHQr?=
 =?utf-8?B?RHNEcXRpelQ3OTNDR1J5ZzdHSHV6YTFyTDFFeHlzdGd4NG13MHZaaDNrajNT?=
 =?utf-8?B?d0xIZ1lNZ283RHR2YUtNQVhVaHRtMnp4RjNPbWNLaHI0WGs4eXVlMlV5RGRy?=
 =?utf-8?B?dTdPUU9ZN1Z5cTdxaCtDcDNFOWVCTUx3SXVFRkxReXB1VzN4SldnVTE5ekF4?=
 =?utf-8?B?TUJScDBCcDVwNW81SUxJdU5McHpBZXNraFh5cFhCSDJqNFBCMGV4NFdWZ2cz?=
 =?utf-8?B?RnREbGM4Smc1NThldjdGK1IwSnQ4TnlxdFcyVktJWGR4UVdrYmNvZm9mUlZy?=
 =?utf-8?B?Q2c0clM2T1ZCSDR4SVo0L2dCdUFXekcwcnQ0SitoL1VNYllUME5UaE5LdVVG?=
 =?utf-8?B?eXVRTVpMR09OSkZuTTk3R2g0VUtQVjg0ZzlFbnFNOC9VQXE4WjF4UXhRdDVx?=
 =?utf-8?B?c0JQbEROS0ZpLzF6NWprdFVDckhwNFZKQW1wUVB1WU5nemtYY3cvMXZkdUlV?=
 =?utf-8?B?MVFoZzlKbCtYRnNkSjFyUTVuU1RSRi83SjlrNCtiTm1ROStmYk5NLzRvY1Z4?=
 =?utf-8?B?QVptYkkrOHN3SXkraHowcnE4Wk02YmxqNDJXZFo0Y0R4WS92Nml1TUZ0bWFU?=
 =?utf-8?B?L3JzMFpLQ0l6V1I2TDk2TWU4dFF5RVg0WExHenZTdDV4dGlZSDFOSWMwNURM?=
 =?utf-8?B?TE9LbW5rdlNkWEFucUJJUkVoMTB2TERsOUZTNUJxbXdEZFVyWitWci9FdFRr?=
 =?utf-8?Q?z1SWze?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MW5qRDdJQWxieXNBekEzNlJhRnBKR2tvTzhnVjJya3JuaUI3aDhYTzNQa2pz?=
 =?utf-8?B?NFc3SUpPa0pxY0pNUUFhVFZwcTlBNkgvZEg3QTVwRGo1WlZQZFIyTEg2R01v?=
 =?utf-8?B?ZTFKc0ZZOE5oVzFhVHdEK3kwSEQxVGowUVFqODNGaEJudHFncVk3Mmpua2NK?=
 =?utf-8?B?U0VXa0ExZlBISGgrMmh5TW1taUlqQ2lUY05YL2c0RVlXK3MxZWRvNnFTNUM4?=
 =?utf-8?B?R1ZBRzVzT1RQeHFncjBWSjI0eUxnUDVqSXF5Wk1OOUJ2RU1zQm9CUFNRSnE1?=
 =?utf-8?B?RFBPOVgvdk1RbFhrL2tidy9EZHZ2cHdQQTZtcWRuejI2TE1lZWpFRjVMK2hy?=
 =?utf-8?B?MzVDMURRWDRBT28ySENlQlo5cWh4c04weWpYUFR0NUhSZEJPT1dNcGREQXVV?=
 =?utf-8?B?MERVU1BhbUh0dWZrak9WVFFBbndKbUFVWkpkbEkwL1ZNczJLQWRDMktJSEFa?=
 =?utf-8?B?aTRDVGpqOWlEQWZTNjRKbnhFeFRIeHZPTy9nRGxLdGc3MGJDZkplT3VKdFJi?=
 =?utf-8?B?ajVKeEpaTkhNR1F6MDhjWFVKYXg0NTBVRFExc3gzeXQ1MVNEdFgzY1ArQit1?=
 =?utf-8?B?MTJGdWEvRy83eHh2aHJEYUJQUUZPNzVUTHJ6ZEhsQXFMS0lJaVloUUlhUlpM?=
 =?utf-8?B?bmRIR2lXNU1GKzlUVDRhb2JGOWF0Nm5WRDB2REthRU1EUVZvMkUyWVRJSEZr?=
 =?utf-8?B?eTVscWVmaXNLaWFEdDVWcEY4M0Q4Yzk4ZHk2bHQ3eTZsazZMajEwQVlHNi94?=
 =?utf-8?B?MUJVZDAvbjBvNWNtU3ZzZW03REFWVmI3SUlxNGNGQmJuWXM2V3pVY1o5U1FV?=
 =?utf-8?B?ck5rYXVNTzRkemJaY1d5cnBGTC9RMXhwWEZuU09NOTJBTkVydHg4TElROW92?=
 =?utf-8?B?d2FMNk9lTUhzcmp0ZzdPcm1ZYkhwQUFTM2NzT0pVUEh4ZTJTSFFJbWd0RHdx?=
 =?utf-8?B?VEV6eG5kcnlIVE4xbTJLUjFuK2JoMTdVam5CclJNQVRmQzJZaGpyUlQ2ME9j?=
 =?utf-8?B?SEVPSjJYdXJKZEUxb0k5ZHNKNnRXbHh6ZDYxT2drZDFNMm9XMzR5Z2JLTUtW?=
 =?utf-8?B?NXlxUDNWbEoxcTZLa083Z2VubkRVbGhxSzJDbExGY1I5ei9nSkZ3RFZWajZG?=
 =?utf-8?B?NEtUTG9FRmpMYno5bFZSNGlKUkFNTWxZcXB1b3JZZXF5QWdOTldudDNBTFlX?=
 =?utf-8?B?bzZ6QmFBa0hPOWUwemVYZHh5WlkrdG9HWDNQTTVKVFNRVk1rUUJuSHlQT3pv?=
 =?utf-8?B?Y00rbnlrUUtZUjNaSXVBTFV0UHQyRy8rY2NtL0JDZm5BUlBnUWVjNWhXdUJv?=
 =?utf-8?B?YzFDRzlNS2ZGWFdqR2lXNkZaR2Vrais2ek96TWJrRktEdWF1dDE3Rkt6U2V5?=
 =?utf-8?B?SCtYdWpoY1FCbURSMXdaeWtIUVBEYThtcnpoMk5ncFZqNXE0K0N3UjRKWWFj?=
 =?utf-8?B?dHhmWElUaXFSZlBSUXhwMWVCdzVoSkNrbmlCbG52RGlUaFBrMkJTSVM3b2Zq?=
 =?utf-8?B?T0VvUjBZK0ZZaWp3YTBxZ1NwT2R6NlJNaUp1d2JwTEtCYk55YXhFT1ZOZlBt?=
 =?utf-8?B?ckRXWFdOb2l5eWlKTE94eTBVeElIZnQxTi9aSHlGankya29oL1p4ZnhsaHNM?=
 =?utf-8?B?V2lGekpVclFBaWR6b3llaWV2Kzl1QnhWY1V4R0dJa2JhYnpXcVFhQVJBLzdV?=
 =?utf-8?B?aTg2bGRoaXJTejdjRG81T25KVWZEenc4ME9YVjR4S1E1RU8zTzhWalJVUmpG?=
 =?utf-8?B?ZVpxTFJIZ2VYZC8xZTc1QVhUWnExTk8wWW8zUWQvN1cydkFzSkMxay9MQzQ5?=
 =?utf-8?B?dXFESmdBYVA1T1JYVmxhK1Q5UWM3TlhUZk5JMHFYNUwzS29HWjEwc0kvTU1P?=
 =?utf-8?B?UnE3V09lMlBHQ1lUYkhDMEp5bzJEbVFBRUZRbFl4UnFaOW81RGt3enphUy9D?=
 =?utf-8?B?U3dNSUNHWVB0dk9qaXE2K2ZXOFcwaFZOMkEzeXlzdDZub0pqZEZGMUtrVzFq?=
 =?utf-8?B?YUVDdFUwQUZ1UDl5WGwwR2l3WlJnUi9BNE02Zk1EZzZRMkNxZjBFb0ZEdS9a?=
 =?utf-8?B?Snp4bWRFM2J6a0UvV25uUzI5WU5GNC81aFJUZ3VIYUlNR0E3TGk4eHhRdFBv?=
 =?utf-8?B?NiszUkhVcmlZdEg4aURPTGRJR1oyR2Erc2dRZGZMd3JMUzkxUVJzbEd2RytJ?=
 =?utf-8?B?NVE9PQ==?=
Content-ID: <81EB370DAF8C1C43B2B87B07C9DE9E3E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fed47c-326e-4a76-0fa8-08de16492423
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 17:40:52.7761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8HUBQKkC3OHGOOCs2X+BT1QMONKzss+++o239tinYbsuCQDJ0PRmh4L9XQMn3Or/nPO1ShY20nzasLPqKeIXhS5k/ervWQCU8Ldojuy/WRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9519
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_104058_719683_27716686 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, 2025-10-28 at 09:37 +0800, Yan Zhao wrote:
> I checked my git snapshot of that branch, and I think it's because back to my
> checking time, branch tdx_1.5 was pointing to TDX_1.5.01, which did not include
> the code for version 1.

Ah, that explains it. I've been looking more at the code for this kind of info
too. I guess we should cross check the docs more.
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
