Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E1DCCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6nnIT81m/ZescW+pqVm/rGoERKVbTEA80euwCgtj+s=; b=dJi1IZkfiMh6Yd
	douXiIZFE1lfhiUvbZn63G3W8Cejaim3spLowtPh6ekS+Qz8veUpGwRbSdYxBVtblNlDbgzgnhRIv
	1onhb6feSa5kkLklvhQ+CbnEu40SyzGmMjH+e9/ovKMmQSW6054esQob/RS4A5z8FJzNlv3Cv6jCC
	UQE4DMRHxqdYPYwejGI6BaBqcvm27kUBXfhqUi+nhuFtgfrH+b3eAVZY3nR3BNm7+7ITQNR3cAMAA
	NoyRYBXIULlc8TY0q9QjVRgIA8iRzYQTNh5J/h94xzXE0VQZsuVir7EzVVqqPIKgcYRVckRTMzXDX
	3lVYLIYHzHVskuubAaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbho-000000056Hg-3HPs;
	Thu, 30 Oct 2025 23:05:21 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbhi-000000056Gy-1Dw2;
	Thu, 30 Oct 2025 23:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865514; x=1793401514;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l9jcbKNptkbKQP94GHVLuXmEHX8zJwISDGSL5Kdmt8w=;
  b=VCRQkhCpIYRqpWmiwIycDHB85jNu5ih/Chf73/VNMoMgHhOsFX5cWzfr
   7Egvc2VtzBEHEUlQV6gtk6hUhYUvPSBAriuarJ5mJ1hvQq+64vPYtimRX
   k0GSIZVK3BUdC+0AYf2xQj21W6sGpZw/32v37gq6YHklp67cYjRhqKyVq
   d0dP1TBqKf0z37BSSPwZ82hRrztm7+hm1+2b/OuAIs1lAO9vPaGNMlQzz
   pec3nNpNhFKw9q89AAokgE2jh7+z37Jlr5KWU0yQImxltLVd2rEujaTpH
   1SssycO2b0wUJ49CgDPuzRrIP0UWh+E6VvkC5dXQ4qQzOvWJssONDa9xz
   A==;
X-CSE-ConnectionGUID: kuMV7+heQX2q70WDmzMS9g==
X-CSE-MsgGUID: wCar/lMJSJGQjv3fTy0d7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74621539"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="74621539"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:05:14 -0700
X-CSE-ConnectionGUID: 2yVanCWsRfuneLAw3Lo2og==
X-CSE-MsgGUID: 8UTpHJN4Qs6/G4svSbXgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186820849"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:05:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:05:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:05:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIu74DfM+/jh+R3qdOEh+nBshIxQlbI1LDplbxCpDSKCjF2aIayayybR0bwK5Z/aTC+6+LPqSI57DXKa+Yg7OIfDvwuZBxAPb/uYKFCPo/PI67uEOX68i6lhjmUL7LJ6IYh6+pH7rsTGzKGRQws2YIMkbJa9i1tzb/4yF9HiTk9mzyOyDmNEVoXHHdv+76/c+tyr52xnhs7Jzz55N3flouXzVjGsnY/5bVuHPvUCM4KddS1DH8pEH/9ZcyrVxThrliE7223GESi/l48Q1SSOGBkvqaov67URktDprBj757oij5nVd2PB0xbZZ08qnN3a91IS5enEdLkNbyYEy9WnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9jcbKNptkbKQP94GHVLuXmEHX8zJwISDGSL5Kdmt8w=;
 b=KYNJERVbWjMGCKm0UOKDNJMDKjoblzgbXZUO5Z0HbGTn7ndQzGacqzs0dPD36dCm7c0jMEe55wDf5MGaUem+f1zumdLIKxp4I85GWgxExm0qKzAL5IkY5dVerHEqTD8eYbCfPIL2a0L5jqeg4aSVAPHh05WuLhNB9oHDnFv2k6Bpn4dYZtxxExM7Gu2zy8VJ/WiCiDAMJS51ljdGk14Icxx77IQKj4b8jsHejUsLtuzftoJo5GjimYpHMOj/xVJnxhf6p9qSDTNHb8/GVU0DOzL9Cyqms37B8GK427ZRXS0qfiigi0hEQKBhooXMSHgpTNXy0A4U+MYUb0jP+f5VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:05:09 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:05:09 +0000
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
Subject: Re: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Topic: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Index: AQHcSdlTkTnqexD3UE2AcR7BLgpXkbTbT4+A
Date: Thu, 30 Oct 2025 23:05:09 +0000
Message-ID: <d02eb1bbd62621655365aaf5b1f3765aaf1a9e7d.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-22-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-22-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW5PR11MB5860:EE_
x-ms-office365-filtering-correlation-id: 6048c516-3312-4af1-c646-08de1808c63e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eWhaZVNpUW1KUmg1L3RLd0xYTzRwUVlYNE9FanpIVzg0cGpUeE1hRWUzeStl?=
 =?utf-8?B?WjFrNmkrUC9hRXFHVTgwV0RhYnM5R3R6eTc3RjlTSHFkNDFOT3FMUWxXN0xS?=
 =?utf-8?B?cG83bGdrUnhCTWc5MUlndmZvcTdaTm5iOWw5SHdBSGVXK0g5a1lrYjdSNWJo?=
 =?utf-8?B?akRRaFNNTDg0enJSZGozcSt6WkpnSC8zNkk2OEhLblZFQXRCNkJWYy9EQy9m?=
 =?utf-8?B?TlZEN3dYSjBlUGQ0RTFTT1dVbm5aT2JnQTIrbStMajJhMW5hdGlmS2VLNGs0?=
 =?utf-8?B?eGtjY3ZER0VlRXNodlk3UXhmMFIrNzVacnI5NER1UHA5cHdrWU1VU0JNdnFM?=
 =?utf-8?B?N0VDMVo3UWhUMWpMVEpoOTh2ckszUXhNOGxGUkpUQVYzZnNTMW05WS8reVhT?=
 =?utf-8?B?S2hHNG1GVGp4dVZUS09rVW5Kd1FPenNPZGt1WlRwbFREYll5YTFhSnlZdmc2?=
 =?utf-8?B?V29Ybi9BcFVWVE45VE51OVhwTHMrZXhrcjVIMHk4clhlTHlpSEJ0UVg0bkpV?=
 =?utf-8?B?UjZEbWtjd3lwby9KUm9NMllMaUJrK1hldjhaNUF5MW1BbXhEc010ekpWL3R0?=
 =?utf-8?B?SlVHSDNZMjRPNUUzZG9wMEw4ZnN1L2g4anIwaDJqM3ZGbG9nZVF2cENVOEt1?=
 =?utf-8?B?REllRlc1OVFxazh3U0tVM0U3TFp1VUJWeUF1YjhiMk9IR0hJemNoUVo1Zjdi?=
 =?utf-8?B?K2NMbEtVV3JlR2NHQXFhVVpBeWtBSHcxZk8xWERtM2RoTTFsdDlSVVc0Qy9O?=
 =?utf-8?B?UFh0R1phaitoS21zTXMvTXpLY2xQMHNRS3RXZ0l3V2sySWJydzh5b2liM3Uw?=
 =?utf-8?B?Z2lHY1FyRUtoaklwcmFka0NiN3BtUTRaZXNsVk1hSkNiNk1sVWY2aEQ0cm5H?=
 =?utf-8?B?Z1BpdFIrZTVzN1IrUHc5OVVtQjI4S3N4THpzRnB6OVR5VTVadHJwRE5KeTgv?=
 =?utf-8?B?WlM5Kzk5aFBXcjRkNVU1allHNDh1V0JwSTJ3eGs2cUMvQk9YUHUrRTFXeFRK?=
 =?utf-8?B?OXhXU1JMN1ZHVEdHemtwUmhKYUlrZUFLR3IySzJZSkgyV0NZYTNzbW1RNG1x?=
 =?utf-8?B?MVQxaE0zcENyc081NFRsdWJaVW5BUHc4aXRTck9vNzA0T3VQSTJ5TFdZV0Fp?=
 =?utf-8?B?WVF0QWlZa1NLbjIwclViR3NmdWVXaWh1MC9IRGNPVFVjT2VadGVUbzJmZitB?=
 =?utf-8?B?VFp2a3lubXRmKzBQN1k3M3BSMGgrbFRmVWtXSUI2Rlh5RmRXL1NQOGVBS2Q4?=
 =?utf-8?B?aFlrbGkvcXZNQzJ2aUxjVmdqTDR4RVQ2b0xrY0NTMGR3QjF4c3M4RWhwU0FH?=
 =?utf-8?B?MWx5Yk1GWEFJenhubFpDcUZrS3RJUWJhVEkvRzF2K1BNcjVKODROMGI4Yjdq?=
 =?utf-8?B?ZUtHMlJSaDJuQ0YwdzNwU0NDUWh5d1Z5aFI3MERmeFRlQWNyMVQvSlBpdDJS?=
 =?utf-8?B?ZTRsY2hCRDU3RjBVejQvU3BzendUTTRma0dIVHVoWGdQNlkrdmQwOVUxaXFI?=
 =?utf-8?B?cmFpOGwrbldsOUhpMUFpUlhQcWhZYU5YYXo0S3hUUzlxWFZDeEV2RlEyYzl4?=
 =?utf-8?B?QUJocW5Ea2drTUZJb3JMWkVPc3k1czNSakQwak9oU2pqM09hbFRmTzJSRzc4?=
 =?utf-8?B?RVFsaUk2MTJJWmNzUG5hRURPM0N4MCtXSVVMUUpmR3UydWtxa0RhVzB5cVJL?=
 =?utf-8?B?a2lHM0FDOGMwcW5FcnpQMWR2RDRwdzlNQVlFVDhTWDVoUitlSE8ybHJ0Sjkx?=
 =?utf-8?B?QU04eFg3RS9OZXQ4cklvUFpPd1M5MXZ6S0JSWFF2RjFDNk1Fa2paa1A1NUFk?=
 =?utf-8?B?VHlwYlM4cUZlRmovc2JxWDM4b0tnU2Vod2g3VTRUMFVCMmJxMHFBaEtUWXdY?=
 =?utf-8?B?dU5jd0x3ZmY0V29EZG9TcTIzZEQxdWVCWW5RUDNlYWhud1lxUWxpaU1TMVZ3?=
 =?utf-8?B?M3lhMWZzTWVVb2d1OGVrbGFiTW10MXVRcmRiU0FCZEM1RDNBYklqQ2VWL0ND?=
 =?utf-8?B?SlMrN3loRHYvNjVwZEJnTnZqeGdDUVYwalo3NDJTZ3gvV0lDZWN4MTljbTg2?=
 =?utf-8?B?ejJzV3E2ZkNzLzhSZTcxWWRaS1RYZG5aZDJJQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDB0WXVnamZ3ME03YzVFdkdyVUYrYjQ4L0U0Z2doQ2pvMUcwQ3dJdDJseUpk?=
 =?utf-8?B?aXdWbnZMb0NySlRDTzBqcm83NDVULy82ZlV5cFlyNTRRb01OcjlrbGtFNHUy?=
 =?utf-8?B?aEwzK29nU3lrSkdBcHNLbGd4U0JXSjdYcUQyTU8rOWIvZ3kwNUZIRHRVMGJR?=
 =?utf-8?B?M1pKbVZKN3EvN2JVRW5WM2o2VVhyQTBKK0hyeFZObUZJNmJyZjFEc3ZlNzlw?=
 =?utf-8?B?eDR0VDJtTU9XcVkvYTNsQkNkaE5KU1VPdEdmbHNZVkh3bnFZV3RFczNORUJS?=
 =?utf-8?B?RFFycDFMTVdPcHUzQ0gwOXAzaER2dDc5TU42cjRZdlliTFdvcUVXT2pYdG1k?=
 =?utf-8?B?cGxZSnAvZFVsQkJ2NE5tcDVnVDFSMVdJSUpWZmRaZXdKUHhIRFB5TlY5OVdN?=
 =?utf-8?B?c1pmTjlES2dUTlpiVFJZdXQ2bFJhWnNKQ1JsSTA5bEtxaUNoYnFTTWxITndr?=
 =?utf-8?B?MTlZQjl6ODQvR1FSME0vRWQwZG5KQ2svNmtydlNQb1NIcStvbG1RQnRkV1Az?=
 =?utf-8?B?WmJUMU45eGxiWHVtRkRKWVpWZkZnaFBRdlJYYmhxTFhCeXBramFwdVdwbzVD?=
 =?utf-8?B?SzExOVY4Nm40dUg1VnJ2S2pjaVcxQXdacmxRU1IvbUhVZ2FsWjYwMGhHcFRQ?=
 =?utf-8?B?SUNjQi80NGpwNnJ5dFJmN1pndHJ3ZHNhSUlWdlpsVVM0ZWdaSUdUZWs0clhL?=
 =?utf-8?B?ZHJja3dPLzFwY2FXbU8reTRXMkhucVh4ekF6YTBlMWlVRGNMa0N5blVIbkJS?=
 =?utf-8?B?aUxwNm1rWmZKM1NnczhGbXMvSDB4bmdqK0dhS3FnT2ZKMU9URXQ5V3A1bW9Y?=
 =?utf-8?B?QmV6bXJwSW40RFJHTE5NSzRyUTFCYkVDbUlweGtUWHBVSUwrZ0dIZ2dqQkcx?=
 =?utf-8?B?bk9xbVZVQmpHckRzUGNWNk5ualVicTBRZ1IxRnJqcUhNaElhNy8rSExKaUhm?=
 =?utf-8?B?VGtXOHYwUzU0TEFlVWxBSFIrTVJQS245REhPaS9MMW1lM2t5SThJclAydjNC?=
 =?utf-8?B?WXV5TExUZk5ib1o4bTViRVhYSFVGd3ZGUFA5c2tCbGNLVVpaTmJTYmVXUnhI?=
 =?utf-8?B?d1FrWTVCSzhVZ096ekNmQ2xUaElBYVRaN3NFamxKaURIdWZRMFZuZm5Tejlj?=
 =?utf-8?B?Wmk4RWRNWGVNbVd4Z2ordExtVGVLaEFmSmpmMlBWaURJdkZGZmZvTkdvT0lR?=
 =?utf-8?B?SXB3SzdYN0Roanh0MlM4dXdkNXo5TW02QWlENDBOS2trT25LZzVNTEVMZkt1?=
 =?utf-8?B?amFNWEVmU2Mzck5BOHJpQnZlZTlEK09GTlJpQWJyVTZGTFhBMytVNEQ0N29I?=
 =?utf-8?B?bnFTUXlHWDlMYjZFRHdKbjVqZ3dCZFVpVUN5TnlubXBZcGRQRmllMlBVdVIr?=
 =?utf-8?B?VlhQWms3ZVNYa1J4by9UN0U4aUFScFZXL2luWWFZNnBjYzdWeXRrcVdxOHJX?=
 =?utf-8?B?RXFNWDhGeUMxUU9pVWRWVzhRNHhYQ0d6Z1FDK3lwYUNGM0NhbzNXQW16R1g0?=
 =?utf-8?B?MzU2L3JkQmtTTWVmUERFeExDWlRBOUVZWVNkRU02bk0yUXo4TDJQbWpRVGZ0?=
 =?utf-8?B?WXNSSXg5QlREY2pUTElhaDBWR0RHM0lzWVZiTnQ2TE1iZ2RuRkVnMEJpdnIz?=
 =?utf-8?B?K1VETXAvUEt2Z1g0OHYwZ040SjNQOEVoT3R2T0NZcnRub2E2U3Q1SUg1SW1P?=
 =?utf-8?B?R0czNkJ6dGg1cjN3K3NreG5nUXZNTi96RkhBQ0pxZEl0NHZweHRldmFuQktY?=
 =?utf-8?B?cFNOMmlTRFNmWlQwSHJIRW13L1drU0YyTndpVlIyKzg3TkwreFFoRndMMzZV?=
 =?utf-8?B?Z25sVm1vZEU0VE8zdmVWNFZKUSs4amk2cnRDb0pVY2ZTejl4TWRHVjkwNDhE?=
 =?utf-8?B?c3NWQldiMUxEMVJjU1M0WmF1amRISERqTzk1a3A4UnVwS1dyc3Q1ZTd3Q3lo?=
 =?utf-8?B?SlBYWkJYOFdtTGU3Ty9DczRiSnFTY3E1cUNFT0M4dmRLRnVBc2dmaXlDVExV?=
 =?utf-8?B?dnphSndHUlRYK1RVNjU5Q3RST0RxVE9BRGF0QW5QdHdRK2xPRFN3L0MzYlI3?=
 =?utf-8?B?YUcveWl0MVdiMmRKM0NOcGp4aFJxNmZwNzhqcERzcFZwRkNjbU03aXU0bE1k?=
 =?utf-8?Q?UNAfxwlZOF/sN5zfbc9hYryPF?=
Content-ID: <E68038A3BAD2364C80D9FD879E2F3D4B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6048c516-3312-4af1-c646-08de1808c63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:05:09.7624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3zeJ0iiRUPgSSlmshag/7l++tKPt867co3m8CsddgtKCtlI2JOF3AtG0E/pdIc/sp2jxt9IUIav9pbOP96edA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_160517_743479_FB2251E6 
X-CRM114-Status: GOOD (  10.07  )
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
> Add a macro to handle kicking vCPUs out of the guest and retrying
> SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
	       ^
Nit: maybe TDX_OPERAND_BUSY to be more accurate, but feel free to ignore.

> SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> tease out which SEAMCALL is being made, but significantly reduces the
> amount of copy+paste code and makes it all but impossible to leave an
> elevated wait_for_sept_zap.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
