Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46897CCF9E3
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/OBjh9f0NfH4bNPCfADjaDEBE/AyaysbMFv+OL9l/Q=; b=YAcE8Yi1Q/S5vf
	T/qBcsvwUJAVvOnnT12Do3l7xdnWl0/rm0NiMHE0E/c1x9vKgz0EimbsHqCVm87QIQG9LOwuTQfqU
	3WSiny1lAa1fjbqWMcowo8SJHsN/RiGg9tuS7oFd8QZYTxgjnSF6qLN7LebbfdeveVnez7bUBT0sC
	VOdqhXokoI6Ah7bm2HoZzaRVrpWlNqnuFfoy2scDXxU4lyIYCTrinCsiLa+JMWpR9RRaBeI3Iwlud
	JFckZMhQntGfXquzdvegbJdvVSjgNbs4P/EsiZHHQx6Co/f6+3OTRIi7ty3c6BsTqr0pAL5tr28DN
	Iuwounhvrv5I/CzATAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEblB-000000056qx-020J;
	Thu, 30 Oct 2025 23:08:49 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbl8-000000056qA-3vGD;
	Thu, 30 Oct 2025 23:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865728; x=1793401728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l3l9YUYtc6bF3vc/ccbholXOr8DU3FSgny/zLV3cRXQ=;
  b=oH21LDf1dQe8Wl5W83tTsh+TwK+Gc5RGY/qUbC7GsEniqGvSmpFsC5TL
   GppqKfasInnh+RCpcvvewBCwB4AfsTXc029o3znI7VEAlt3E6ESAiPXji
   5LXQoweQXmRz0fNW8dBFDGQJOi+bX4bSvEwZF7wKrcslROkFqfASYQKrs
   79hrldyzhVjJjAZ7R8z+M0MmPOfmJWrx0Ro1Uc5k+hTpR86DrJq8Jlf2A
   3GvNWU5sO/TJLjjO6UWa7/i3bhwO8ohyt6/zSSLV9nnOMoxTnbRIR2rJJ
   vwpz7ukxVcq8j6DYleXWlgwkO2nAosZwTFKnFjfnny9LaEPN8W6fL9/zf
   w==;
X-CSE-ConnectionGUID: tabwQrynRbyMx9xq3gXzKg==
X-CSE-MsgGUID: P1zEYFgYSbyvi2gKL3H/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81436105"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="81436105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:08:47 -0700
X-CSE-ConnectionGUID: vbF17fZaQrKdd88tjCP+xg==
X-CSE-MsgGUID: 6+fWtB12R2CItRFLOA41eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="209649318"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:08:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:08:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:08:21 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3pm5wpjFekRvEvcyntDs/hRdqKuPHVmt8/PsImuyADUkYGKn4BzyZFXoh2vDPpH1CN17b6+YUEjwDNls1gvWwhCPMOE+JrDPP8Ob93M2zvnv44pXLHjw/hnSRSuCW/0WTx2yWSwAc2jIezXYKryVxQuLbuGAqRBrLrJ8a1Ym12rkxxAzhqvSJRKMKtHqdrcwfqztfJf7odtg8oF5bFAfI8IQQ7DSFLpkQW2pVv7EF7uN4psTYrCK2b3ibtXup/9hgsIcLf33JpQ6lLNn00HOFy5tUPED3h6v3NsuDqlxvJxVl60nz3ApviJDD7usbYFjZimNJAPnQMLhmLzzD0uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3l9YUYtc6bF3vc/ccbholXOr8DU3FSgny/zLV3cRXQ=;
 b=dxusvpBTTCBcbgWiU5pVYEXh7PS8/duXacqCfMNfJLCfJ4q13vQ4d2tcPglD/8ZiNAg17mCwtqePIygHvUrnAlP4kv6ucKEiUl/wgxv3HdJscOkogqPKz/fPsTYycXjy9xgwL3g5lYwN0WdNFyi7LQJxMMECh49vDidb24OGMZiiH+ZJWENpE9sWVSt7pGkfi7nqyi2hRwcWGIGzqOVR/wlfttIU7HpX5So8BkoUs2gErW1cGO6XG2LnYkRa/15J+CpUNghZa8zM1DTrv1GfmPYTOLiHvYVqpiR988z2+fYZzmvcGAlMXAc1s64yzfsrHh9+a5GQjGA2dm5T+RNZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:08:18 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:08:17 +0000
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
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Topic: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Index: AQHcSdlYf3tncJbEZEOzmGQKtjRSS7TbUHAA
Date: Thu, 30 Oct 2025 23:08:17 +0000
Message-ID: <403176431c931bdb4c7909565ed7b25eaaa80b10.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-27-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-27-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS0PR11MB7484:EE_
x-ms-office365-filtering-correlation-id: ce0c648d-f741-413a-e199-08de18093623
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?UVNCU1F5dXh0ZFdXZXJNdDQyV2pSd1E0MDlqaEQySG85MDNnV3Q1d3RjdDY2?=
 =?utf-8?B?NlkwUGVscW12REE1TllKdS91c2NhYWk0WkJyU053WHVIWmdKOGZHaEdYMVZV?=
 =?utf-8?B?SGFkSVJvQUxYWEpnZnBaUGpLL0VLZHVkUzYvMXl0Y2dOVTJNL3RablFkVUFH?=
 =?utf-8?B?NkQ5MDBZTmJZWkZPV2hqL04xQnRrU2ZQUXdKSFEzYkVueHJabTBJZDdrR3J6?=
 =?utf-8?B?SWsxbHBkeEFnOTBaTVhReDVkVlg4d29jNHpYc1dNRFJoUFRPT0tYREFyVDFZ?=
 =?utf-8?B?OFRSTGRYQlZCbldvZFRHbmx5MW9MU1dKcWNyWEFuUWdhNFdsSEo3cEhkdm9I?=
 =?utf-8?B?UGFZdDk4b3dpZDQ1eEoybmNyQTNlaWRRbk9xZTVaQmszeWhOTVJ6dS9iZ2Yv?=
 =?utf-8?B?ZFFRQ1d4bHZJdDY1eEo0ZldkNnVhVEdtMWUyV2gwZEIzdXdxRFY3T0dxZklO?=
 =?utf-8?B?ZEhxM20ybjN5MXRaZE9zdFNyL2tRQVZkMUdpT2kvUFJ3ZnhFczRVRVl4YTNH?=
 =?utf-8?B?Z0RZcTBPblpJcExsaVVGcDRCWmVHQWdvMGVVclJkVWFISC9rV05qMTI2VVpz?=
 =?utf-8?B?bkdjWFNiUjZqbDY0ZFplT2JLazlaaHo2SzNlU203dEpwbWxHR1hDS3NSd2dp?=
 =?utf-8?B?MlNUUkwyQmc4WUVMOGRQZXB0R0c2bWlrYW5QUUZIY2VaZDJ6TUU3ZWsybzBm?=
 =?utf-8?B?RS96eS84VDQ2M3ZocFV1bXl1NWEzWTY3MFhrNEhDM2lpdGZxdDlGem5lNlJq?=
 =?utf-8?B?a2p4RlNPbDNvQmJEZys2WVRqVE5UNTdjeEJjdjg4UmgxVXZmQXBRUnpqY2Qz?=
 =?utf-8?B?MGVUVjRnTTY1NEpxbGJUTXRCQ1JaOXVPY1h0bnZ5bHgxNjRQY2s4ckxrNFBX?=
 =?utf-8?B?dDhNVWpuUVllWVlwMmVLbkNJZFJRaURQSG5uQ2FHZ1FSbTlzYmM0ODljZzFr?=
 =?utf-8?B?MmtuS0J5dmE1U0oxZGhWRFliMFp5WENBKzR5WWNCSUZuZG5PWjVhck9rSjF3?=
 =?utf-8?B?SERzMGQ2MXNYdktGTGhYdnp5V3VFTkxGOVZHdmh2c1ExbnB1bk1pL1VIYzBq?=
 =?utf-8?B?TU1BY2haclptVTFlMGpuZ2NjZkU4SjNvYnJEYzFCU3pwRzgzY1U3OElyYWt5?=
 =?utf-8?B?SjRucFdYS3JmOGdoR3BSM1daZDlxbzZhZTdLWE9hMEdtZTlDTkhuMlpyOEpw?=
 =?utf-8?B?UzlpMG40UGFzR3MzNUZlNndxQXhZSFNNTmJVbmJlclN6YUtZNUFjU1NMMDdP?=
 =?utf-8?B?QWxFUTBFaG04M2lNZnlFV0FBbjNKOTN5WXNMNWxCWWppbUpmdm80cWdSb3lp?=
 =?utf-8?B?OVVZcFZKUFZvSWk0S3dlWitiMlllVmhGQ2Z5c0pMSzlKeitnNTNVandoc0ZQ?=
 =?utf-8?B?MFNKOENOOW5EeTNPUVg2eCtLQWU2ekRLdHFyVE5HVkN4UzRXaFo0aG10dWM5?=
 =?utf-8?B?cncyeE9iVXhjRjRzUnB6UWFpRFc2WWJxVktVZU5xYmdacDNCK010YlhTa0ZE?=
 =?utf-8?B?bWQva2tiTVVweG5ocFp1UVJxdEZ5UEhMZEp3WnNjdC9aRGxUdUZ5UG9ERE5X?=
 =?utf-8?B?THFYZnc2ZXQ3akpVRk4wSDM4YzkrTndvT1M1L2pKcGdTLzdNTkhrV2hrZ1pZ?=
 =?utf-8?B?UGlvdWRVS2NCUkxlMVFmTmk5M29RdldDUXlOdDhGK0ZRZnJNMDU5MnMvQVEz?=
 =?utf-8?B?azBwQVJNNS8ycTl1WXgrcnhXSTB0b2lpRU5FTENZZVUwY3JVMThBWE9Ra2w5?=
 =?utf-8?B?Qm5kazVmRFp2L0NOTndGV08vSklobnVBM3ZZNWVQK0tVM1U1MXZUVHU2dFJO?=
 =?utf-8?B?QTJtZ3MxRWdCUy9ETWJyaERhVlNYa3p5SzRTdTlkYkVreEgybll1R0hXZkhM?=
 =?utf-8?B?eXdBMzMvVEdIY1NZNC91UVRpckpzZGNtNTJ4TXNSWjZRakFsRXBTNDdzelc0?=
 =?utf-8?B?UUNWVG1USmljNlVBbnJSdktxaGJ0QUxueVp2NWhIU211aFFiTDF6SWFWVnNM?=
 =?utf-8?B?QnhOMyt1RWZ6bXMwOHpvRS9ncy9ZTVBneFhqMSswSVAwRWhIbXV1SG9aTExm?=
 =?utf-8?B?MjB3QXhJTFNBdmIrSktWNUkvcThwellBeGJKMW1hUmhqYW1FbndhOHlWWDI5?=
 =?utf-8?Q?Uxlw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0huOFJJaGplOFh0MWpYOFJxNEoyWXdBdlpycmtqUDdmNkRKMURBRldCYkpU?=
 =?utf-8?B?Z2pVZUcxdXBUMEhKVkw5ZTA5R1MxZThJUUozRHBVTzkvZEhuYTBMWE13SDVG?=
 =?utf-8?B?cnl5dDRMQkNTVjZzN3JBS1lWMjQ0L3phVXZOcGFJdmNZZVBxLzdzb3Vqci9D?=
 =?utf-8?B?WTVLOE9ST28veG1Dd3pYWHhiYXp0Qld6b1psUDRjZ1R6eW9BRnJHYkRaNkdZ?=
 =?utf-8?B?T1ZPZURNMjNYUDMwRUozOE41aUtXdGZMRXpYbG91UkwrOWIrcHI0ZlpHdWx3?=
 =?utf-8?B?a3M4OFM3Z3RRdmwzQkIrNVRSYUR3clYyclR1RkNOWDA5OXEwaklFekFVUGJm?=
 =?utf-8?B?MWFuMUFJMWZqZXAxQVlnUU1Tam9GcVJDMkJ1TXFYQUNrNzVqdGlET3pPRER4?=
 =?utf-8?B?NG9rZmk3anpiYk5BTkljeVczaXRLbnBVTHJ5dmw1VStFNXpKeHpWOXIzSUxn?=
 =?utf-8?B?WFliVGM4c1dqd1FRWW5KblJ1SXNRTzkzRWVoUndLYUVhRDVjRFNnVUlWZW1u?=
 =?utf-8?B?RTBrSDVFU21tTDZXK0JqR1dlaGx4K1p3RmsyRmJlc29pOStNSXFOYjBFRmU0?=
 =?utf-8?B?ZjFUWkJVb2FzMHpOQ1hmZk9SRnYzOUZFREwyMUJHNERrbHFkNy95azROSjlI?=
 =?utf-8?B?emYvK1FNeFFuVzNmWUw5dTdubEFlVGNWV1ZVSTNEV2hwak83YSttSC9zOStT?=
 =?utf-8?B?RC9JQXBucUljWndFTEVKcXN4d1hwS0NYNHZ3N0VYaWhSRUJDTmF6NmtraDRa?=
 =?utf-8?B?dWJKWjRmanJOM1VBcWJ3SlBOTXhTMVNvMEN1bTUyMUV3LzZOM0IyRnZveWxk?=
 =?utf-8?B?YVp0SVpFWSszQ29HdGdMSithQjYzSFRPZzBMdHU2RnMrcGVhTkFTamQ1UnRS?=
 =?utf-8?B?dTFOVlpUQldHcUJvanp2SEpSSGJBblRHYWJhalc3cVlJZjhCcHdCRWFCcjd4?=
 =?utf-8?B?U0wxSGdJMVdpek9tenlkUkpFNUMzWVJ6cjJDMVJxVzRkU3dYVCtBUytNTy9V?=
 =?utf-8?B?TUE4RDJaTEl6ZnBPWmRabW5LUE56TmJUeXo0NnEvTUxHWkFrQVVNQkxFZHdl?=
 =?utf-8?B?Ky9BSy9WNE9aQXl4eFZUV0s1NE9sLzZYZGJOM3hLdGFUSTFCZkgyN0lXSjhK?=
 =?utf-8?B?QVdjY1lVbzVqRithNGlLTFE1K3RJNnVuRVI5WnJhUnZZQ1BJemZZMC8yUDhN?=
 =?utf-8?B?dk9LVGtnZlNEVWFNc3BJTlVaYzRYbWdmZkVFV01neEdPR20xRisvU3VOeHM0?=
 =?utf-8?B?SFRXSWw0QkYwVDVWazFFYUorU0JURXkwOVg0VXhLc1hlMU1CNGVuejY0WW1W?=
 =?utf-8?B?bmNZWXEybWF5ai9waUNWbUYwUk1xakFScGNCc2RhRjB1N3VVT1B2dGFqdGk4?=
 =?utf-8?B?Zkd2K042UmNxUGswYUg2ZUtQc2pBYTRvSmM0TXBoK2dCcFNXZTBybENkQXg0?=
 =?utf-8?B?UWl3VlpZWkREc2x1NzFPdThUN3ppRWpHQXdVSXcwTFplWERQZEVvKzNLSmI1?=
 =?utf-8?B?a0QzYzhjODZqSzVCbjNaZHpiS0JYdzZnaml0WGNuMFZqV21vY1NIdytpOXFh?=
 =?utf-8?B?MDhJRHpBYlVDVnFkNUlGMlF0em9ROFlWamRIRGRrOGsvZGFmNDdBb1hoT2VE?=
 =?utf-8?B?bFd0WW1UaTlGWGJxZ2hSaGVhc0F5cFBwQ0hORVUzVDA4YXNCWU1KckNRK2xy?=
 =?utf-8?B?Uk55Z1VIQ2t2Y1RxTFkzU3JLMjU5WDNGMUV6L2FIRjk4WnVrQkwraUt6U21m?=
 =?utf-8?B?Tzh4WEplM0hZMEFDWDFwMHduU09GQTR4amxTNGpJOVpjVkFqa2ZtSklqMExW?=
 =?utf-8?B?elpKdkEvM29oWk1rUGdFZlRsSEZOSDFJWEJWckFvc1RvTERnbUowNFNnZmdh?=
 =?utf-8?B?TFNhdkxZK0QyUkZyVFFmNEZ4dmVFamVmRmVGWVVFZE9VUCtJSTl4VXlLZUJo?=
 =?utf-8?B?RXVreEVnYmFWZXZlRzJyZ1M1VVJCVWpuOUJkL1oyWTdldEZsRy9Kc0tVdmc5?=
 =?utf-8?B?UFNpY0M5TzJaRlFJN1JIRkVkNmhNb0dPREtFOTRlWU50ZUFhaFZ3dTQwWkI4?=
 =?utf-8?B?Rm9YY3dNVy96Y0Y3RmNGREVIdVFQZkdDUi9wTlJDMDZpME4rN0E3RXlGZnIv?=
 =?utf-8?Q?RzQdM97zWVlepJzuDmgdGt6fZ?=
Content-ID: <A83B64EE8A12A943B852B5644D76A74B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c648d-f741-413a-e199-08de18093623
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:08:17.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxuooQ6RA1vlI+gFYM2Wp/DMlOXiwO2gb+nw4h8hc7Sjl5uXti+uhQCBBdksB5Zh0s60gOuMbKgzlhXwimhQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_160847_035622_BC3D280F 
X-CRM114-Status: GOOD (  13.53  )
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
> Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> servicing ioctls that (a) transition the TD to a new state, i.e. when
> doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> due to racing actions, e.g. if tdh_vp_create() contends with either
> tdh_mr_extend() or tdh_mr_finalize().
> 
> For all intents and purposes, the paths in question are fully serialized,
> i.e. there's no reason to try and allow anything remotely interesting to
> happen.  Smack 'em with a big hammer instead of trying to be "nice".
> 
> Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
> from interefering.  Use the recently-renamed kvm_arch_vcpu_unlocked_ioctl()
       ^
       interfering

> to service the vCPU-scoped ioctls to avoid a lock inversion problem, e.g.
> due to taking vcpu->mutex outside kvm->lock.
> 
> See also commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
> migration if vCPU creation is in-flight"), which fixed a similar bug with
> SEV intra-host migration where an in-flight vCPU creation could race with
> a VM-wide state transition.
> 
> Define a fancy new CLASS to handle the lock+check => unlock logic with
> guard()-like syntax:
> 
>         CLASS(tdx_vm_state_guard, guard)(kvm);
>         if (IS_ERR(guard))
>                 return PTR_ERR(guard);
> 
> to simplify juggling the many locks.
> 
> Note!  Take kvm->slots_lock *after* all vcpu->mutex locks, as per KVM's
> soon-to-be-documented lock ordering rules[1].
> 
> Link: https://lore.kernel.org/all/20251016235538.171962-1-seanjc@google.com [1]
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Closes: https://lore.kernel.org/all/aLFiPq1smdzN3Ary@yzhao56-desk.sh.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
