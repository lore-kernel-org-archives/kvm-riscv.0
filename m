Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153B0CCF9E5
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27rN+4u6ObxGo1M/VmL0tJ87XpMxPl8JwrixTUcalro=; b=Ywj63Wbe/0dHFp
	TLa4MWFHf80iSJyIItTiux9ab12hmm7ZD4/WJOfxBV5wUrabZr4KeXc/brJ5NKbLtxmFlh+aAuEi3
	S6XmFhvW0Iyoltrjr7nHVvliLjJ5em2W0Capw+ZpTS2eSvnQIK8gOzxiY9Ab9KQ2Mtfu+2Gu9cJ4z
	ZKAsyl7xAJdH4z1tEYsncR2y2W8JSXvG280vYnmZ8taJm65lSGNgBUf4T4wh6cpy8KWPdDAJ8cCEh
	lugyrqGV1/4vdgUfrZTIGfvJU80rJFyazPc6l6LTYsipB48D5qLx1XvKfzbKCRp00Jv/maPetcyWf
	Rzwx10J9GnuHTBj6Fi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVGP-0000000Ep3q-2Sez;
	Mon, 27 Oct 2025 22:00:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVGL-0000000Ep2m-3jJL;
	Mon, 27 Oct 2025 22:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761602426; x=1793138426;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3uC/bmY8mj7vvZmMONdr+k3H56Avuh5WuYUlZ9JJfaQ=;
  b=M64yw6Hi/MypcrkhdPcTqpQHrAJCgqjGkB+a5w/X7j5gej8WAYZVhINa
   TsIIsNgPjk0GzmM9ycKIoGE22lcY0estwlBIvaYs4crWdzbak4kezblv/
   oKfeqT5GwkJ1BINhVu49Gv3zPvxAxyMMz+wBvueO2sYHPfGH/YplTK7Ez
   xvSQ0ZSWtg0SsXj4F9FpeyPCD1TH7eL5H9Gvq7L51OsoDgozNOTEx0LLc
   6GMf64ypCcG4kvmDaBiHwA0elm9Qp1C5XS++JOF1R6fWBD06v943m/9Op
   TU0xxIMaH81wMWX7JvefRnKYaR/ZVw4wfX28NC14BTr3N+cw2fuYJRIO0
   w==;
X-CSE-ConnectionGUID: gSjwkupQTyy5sor8fYcPVQ==
X-CSE-MsgGUID: 34H6w44pTxqeu4k8pBJ0/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89164055"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="89164055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:00:23 -0700
X-CSE-ConnectionGUID: Wbn1ClkrQlu1yPC15uQtRA==
X-CSE-MsgGUID: Jku94LviSaquzbZlhwogbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185923435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:00:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:00:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 15:00:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3T+55r6cVpK0BlWn2tOCDvowc6qhha3Qr1aRvY8IDGDIXmGAz2GDxvlYOrP1z7ukKs3vPIY+9HhqcytMyKZ5Rr5lfU48sheyaj55SpJA+Tx5n78O0AQ/jqEVCch2cYbjn/fEiSp1HEodM2ezmqe5tB+BJh8ldjFIZtXToPCmOFROh3V86DllXySkMK3T90IyQscfaLZIBv9O5fk3SmpxEakt1jI/ACSYVU6M+84O16vL79DX3oM2J8kXWE3bpL9Z4KlgXlIqby3dJP/AkNPCJAEgr2HwClhDXJ5wAVeHgLgNy9HoLABihgWw+LVZk7uZ7qrxKft1G9Uin5hgkkSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uC/bmY8mj7vvZmMONdr+k3H56Avuh5WuYUlZ9JJfaQ=;
 b=cJro/Uf1nlZP7GmepL36UoJm/dBbzQ8hYq8VA5DVLFkyEqyM6GD1Y+T0MB0yzptn9YP4laOsoYUTEnjhq/q1GgxwmImkwpqGH7rGQgKuCCTWY1W0KR8WkM49ZW2Y0K6ptqmtyHI08H/4UHg+t7OIy1nR04QO3icx0r3PwKMXTTOKC/urtuax3S/ufYuQOZVPqlQVWxk57SsXLnJrFlJ0z+X7RMJvH0Ba8/KmyKfPdIboh6Wi0biGZThEUhudhuBUeHBy42pMVDphqWq5LBFgIUihAyD0WMr87fIPLxIXrLkHbCXRXJyu2mcCjf6LufPBnB3Vs3F89PDIL/rKYgDrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 22:00:12 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 22:00:12 +0000
From: "Huang, Kai" <kai.huang@intel.com>
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
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "x86@kernel.org"
	<x86@kernel.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>
Subject: Re: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Topic: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Index: AQHcPv2s4f9aAwTczkmNiyIyrEI16LTRHoWAgAVQ6wCAACyqgA==
Date: Mon, 27 Oct 2025 22:00:12 +0000
Message-ID: <741581fad70e5dbfb83c025b8ec481b935aae432.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-21-seanjc@google.com>
	 <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
	 <aP_F6tmzomRtdbpU@google.com>
In-Reply-To: <aP_F6tmzomRtdbpU@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6085:EE_
x-ms-office365-filtering-correlation-id: 5a557aa9-7b4d-409e-737f-08de15a43414
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TitXL3VvaHJuQ0hKVTVDMUFQSTVqUjhucVlFeTA4R3MydUFYZHc0OHdTb0Qw?=
 =?utf-8?B?aUFOWXVDRkY1TUxDYmtpZ210RGdSWTliRWVMODBMc3pjL3JjcVRzVlhjcVAv?=
 =?utf-8?B?a1ppalZaS1VjazFoa3N4Y1ZwL2g3bDY4RkZTZXYwSUwyUTQxcG9wNmVuc1VR?=
 =?utf-8?B?VzhjU29OaEtnMFFXVkZRMkJnV29rMzFySExjcm0yUWppWmEzcW10Zk1ldkxI?=
 =?utf-8?B?dUpEdSsvbkVjTkNnb1pQU2RmMVdaNmwzQzhHTHZJbjhiQVE5RllXd1E3NHA1?=
 =?utf-8?B?RFFCMFgweHlpR3NLSW44Mzl3cVBXTm5mcWpqV2liUzB2MWdnRFBrN2NqcVJs?=
 =?utf-8?B?aE1uZHZ0eWhhK1JuSlA2OE5wOWpsbDdLdE1wdVh4cDZTTjBpRUE2RmpnSDhI?=
 =?utf-8?B?ODNKN2JIbDNyM3ZvVmYxQ2J1U0lhVkcvY3YrVXgxTU95TXY1S05MeERHaCtO?=
 =?utf-8?B?Z0lZMVZZcVhMTEUwLzBqeG93cmIrUGtZOElkYXJIdHc0RTk5dXZOSG1NU0Fx?=
 =?utf-8?B?enpkNitFb0dOUmFBUWZEa1dPNVJSV2Z4U2xHODYrTUIxZkRnWE5lQzJEWnpj?=
 =?utf-8?B?QVN5ZFRiOHpkSDJGMFZqL29DdHZmK2w2S3kwdVl0akxUbUJaZWdSclFPbjIz?=
 =?utf-8?B?RkN2YkV0cE5QTmJLZnREQTVxUHBwRGdNbnJqdXZuK3V3dE52T1F0WWpBb1U3?=
 =?utf-8?B?eDBhS01yUUoxdVpPZFBQbVVGc2NNcGM5NWdlcWNkb1hmMG5mWjBLdURRVmNE?=
 =?utf-8?B?Sk9NMnJQais3Mm4vUGV2enM3SFg5UjduL3kycnBSYVYxdDZIV3dmejh6LzJv?=
 =?utf-8?B?cHk1bGtYVEIvcEphdjJlVHRIOFZyVU9OVnl6RW5JR1dPcVFMWCtrRmQ5Vi9O?=
 =?utf-8?B?RGhPdDRwbkNvRjNLb0ZVUlBUaEMvWThJUkpQQzd1MzJ6Zi9ZcjU1eUptekho?=
 =?utf-8?B?SEtzUjBxSENWdTVGVEZCRGtJM3VYbHZEUkxqZGZpY3d5OFREaCt6TjkvdGls?=
 =?utf-8?B?ZnRjSGdjc2t6eVdzcEV6SWtPSzI4aXA3RHlIYUpLT09VNElrS3V2Ty9EQ2xY?=
 =?utf-8?B?TUtBOUM0NkFycUJGT09zeFRkdnBIdlRnTnNHRFhFMmRTdmc1dmdEVy9ncFlq?=
 =?utf-8?B?cG1JeDFnWUQ0YzY5M1VtSEIrYVcvQytJeURLS0s3WW5mV3ZJem5qMjRLMGs2?=
 =?utf-8?B?ZStSUDJZSzliSm5Rb2V5bkpUY0FVOU5xTTJqT2szbGd5VjNlSXV1MzdEQVRU?=
 =?utf-8?B?UnQzK3ZTZzQzSUpkVUZ2RlJNTEJVUnMvYlhMQVBiMTlvM2JzbS9GWFViNlVZ?=
 =?utf-8?B?VjFjVmNUTHQxbzRva3V3NzljSnpBSnIzS2ZSbW5xNTVWRXdXQ2VtL1hkc2RF?=
 =?utf-8?B?S09UYVNlRDkrTmZDOFc4K3hQeUdQdUt4Ymg0blliM2MyM29HS0l6VzVLMnFn?=
 =?utf-8?B?UEJ1ZmZaMGt2aHBDdktOTjNlbkVFR2xDUkpoblRRUXUwaEgvUSt1OG13Ui9O?=
 =?utf-8?B?aXJibndOalZGU0xrNWZqZThUY3dsbDhYK1U0YjZrMm1aTmF0UDNRa1R5cStk?=
 =?utf-8?B?NU5MNmdydkQvVkM2cUNURWxpcWtWeGRXaWxCZ2xSVFRIb1ErbGhrN2EyazQz?=
 =?utf-8?B?SG4zZmJIVk5RTjY1Z1YrV0YwWERjWWlieVFpVDAwWkdjYTN3V1dsWTNXNCtB?=
 =?utf-8?B?UTRLOFNUaE4xQmdXdHJnWWl0MTh2RUorYjVaMHhWb2gvZ3FmYlMrN2FvL1g1?=
 =?utf-8?B?aWxvN2VOYTdDV0tPTkl2eTdRYUo5RTlMR1FLdUoxOGNzQnVwT2hsZlBNc3Va?=
 =?utf-8?B?TU5KNm5DUU50bllmUjVWTzltckoxd2hjVkZJWERyWnJIL2FZcGdVekpISitH?=
 =?utf-8?B?b1I0L0h2Y2RTNnZxbE9jSmFBc1pXR2ltVlUyYXR0QXYveWR6M0JmaTY3V2Nj?=
 =?utf-8?B?cWp4SkozUitNWmhVVmlZUGt6bFZIWFFUamdHWmxNNnNIUVlvQXRSQ1RkdVd5?=
 =?utf-8?B?NUNpdFRWN1lWZnM4ZjhuWGlKQWFPOUhmZnJvYlBXVytScWcyWDQ1QUZWSXFU?=
 =?utf-8?Q?21LNMM?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d29XeTUzUHlQUm5UVmNFa0FDb1B2bjRrNVl6dTZKc1pXSVV6QytIYnFuYWdy?=
 =?utf-8?B?TkpHRk5tOFVPMnVwOUJCd0RDRWlnWHptN0szOW5HY3JiTmZKdzZSQ2ZNUXJX?=
 =?utf-8?B?SzJLSG82WEJrVElVQmgranh6WG85bEVzTGltWE1EK2tjdFpETUhHMnltVUY5?=
 =?utf-8?B?NWRQaGtWTExjRkhoZzloODcydEVYTi9mSDBPaVVnSUZPdVBQYjJpUytSVWZi?=
 =?utf-8?B?cHNSbkxoRGNvUDd1RkVWUFNYUjdCMUVxMmlJc2EzNVVyY3dOcG5sb3FDbDlq?=
 =?utf-8?B?a2VaNllYT0FKc3NEUWgzUHkvT2pWRU81Si9pZ0JGbXV4WlRWWHF5UTFTNkNS?=
 =?utf-8?B?RzY1aFlSM2hKMVFDSFFKNjNpbTRGcnpBcHQ2bmNzQlUyM1BOQjhHUEVrbFR0?=
 =?utf-8?B?SmNjZC9aRUFra3JkTHlYd0tIVjM3YTVobWlPSWpoY1hiMnFKZ2paSElCS2dx?=
 =?utf-8?B?MUJRdnZLalB2KzZ5UGdRNDZ0Y1EzV050WmxqY1M2OFRhQm1uYVoyUEZBTEpy?=
 =?utf-8?B?YmhRWm1lSDZoNk9ZZFhSKzNNSUc1bzg0aWhTNHZUcmg3ZnRISGwvZ2tIYTJY?=
 =?utf-8?B?bE16OHh2Ym1kUHBROWpzZHZsOVBLaU9xVG8vWEJzZDJCKzllaGxCT1g2SXJC?=
 =?utf-8?B?bk5tN1ZPZ1hSb1draytCQ2QvYktZS2tNbGJzd2Q3K1A2UGlFSlNadzZqbGhk?=
 =?utf-8?B?cmF5WktCZ045RG10bG15RW9WaEZLKzVpOW0yK0wrUFQ5aEtjK3JKOG1jblBl?=
 =?utf-8?B?NU1Fd1lPTXppaVErenpET0RxY0dHc24zL2dvWmxFVGZDVDZNblZDU21CM0h1?=
 =?utf-8?B?ck5zNHROVWJ4WlRDOUxHQWQwY013K0dyZXFpT285VzVac0tiNC9XQjJMVlVH?=
 =?utf-8?B?b2VCN281UmpPa0tobGo4TGxQMlBUVUU5K0V0MDdwMlRlaVhlcVBQR0FxTjdl?=
 =?utf-8?B?dzVCMU1TREFVQW40aXFQUUttZjdpZ2cxdkVOakpoZytRZlZqRjl5dzRINXJV?=
 =?utf-8?B?M01SZzczbWlhcUhGUGY3aHZiNHJGTlZnbUphcXl5OWNySUZncGp4RnB3Nzda?=
 =?utf-8?B?cjgzMGlJdE1aaG9VUGcvSXdQMDNMWCsyRFR6bG51MEViWlN2Ulc2V3lrM2Jo?=
 =?utf-8?B?TG0vTFpZU2p6bEFEWHdTeU81UzFTY1Y3aUR1blZqOXJUU011bENYYlhEeDRP?=
 =?utf-8?B?ckdpTWxzSXQ1R2FIcytPSFhOMkVMQXRxY1R5WVUvM25ta3ZHL3orREJHamIz?=
 =?utf-8?B?bmZNL3dJOWhNaGkrRGlWVHZZZ2FtcXNESHBuR3ltT1VubUl1aXQ0SC9nVU1K?=
 =?utf-8?B?ek5KNkM4bzlPNHlTNWZPYXltWEJjVGNLV0J3QjBSek1PWmc4a2ZvOHFFbWhW?=
 =?utf-8?B?aGtISktkQm1rRnZOdXkwNTFPOTlEWlpkY29sL3RYR3crYTM5V0Q5R1NXYXJ4?=
 =?utf-8?B?MW9yYUlzL0I5eEdIVjB3OEpXVDBjM0k2T0xBU1BkVDBUbG1XaUtxUEFHdms1?=
 =?utf-8?B?RDd3MXZ5cmRaMWNoSDhETlhCem5iTXMrMjRHb1loZ085bnVZYW96WmNpQjkr?=
 =?utf-8?B?NVpxRjV5VncyNGUycXRST3ZWdnBXTy9HTVlIY1JRbXVidUNQb0dvYlRmcGt2?=
 =?utf-8?B?dGppRytsQ2s3aEhUQTJobWg1dTlMVFJrZHhVYlVjeWd1ZmxzZFZXN2xPM3B1?=
 =?utf-8?B?elFCNE1FUVpkc3FwT3VSUEFHaG9Ia0xpWFkxWVcyeXpUek9wNWR0RURDa1Bu?=
 =?utf-8?B?MU1OZ0xqZWRHeG85bWgxcHRrajRKYThCTHE0alNoajFNUGNOOGNrTmRtNERQ?=
 =?utf-8?B?L1M2RnJyUnV4QU1FaXRadEkweHlsNkJWRmw1V0hhU3h5bXdkbE40Q0wvVWR0?=
 =?utf-8?B?SnpOUDJkaWVlMTNEeXNIRlF4OWxzak9sY1pSZ1hoY2pUMHR1ZnJGYnBURElI?=
 =?utf-8?B?ZVZFOGxhSjhHeVdqcitkT0M1T2tiSTRVZ2g4bmxBQVhpS0R6Q2xRK1FnYlBS?=
 =?utf-8?B?SDhHRXlDQzhFNlluR0VXS1F4VUNnNEFLMitBWHllK3d4aU5JNTNDNzNYd3V6?=
 =?utf-8?B?Lyt1cWYraFlaQndZOWVGcVdCTnEzVmFRQndobEQ4WFZWL0k0SWg4OUlUSDhv?=
 =?utf-8?Q?wyisifJcIlwE7EB1++UN3z9Cj?=
Content-ID: <206B24455B9A574986EC76A18378A3E3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a557aa9-7b4d-409e-737f-08de15a43414
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 22:00:12.5487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvqUgkYA1f97kkdjsMmBF+x6XmiLVLF7TcE6GY4kT/XvGalpnapq0ZbBUccn3CmAQis4c8UiVbK/QohVNJ//zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_150026_009975_617A5B82 
X-CRM114-Status: GOOD (  17.29  )
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

On Mon, 2025-10-27 at 12:20 -0700, Sean Christopherson wrote:
> On Fri, Oct 24, 2025, Kai Huang wrote:
> > On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > > Add a macro to handle kicking vCPUs out of the guest and retrying
> > > SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
> > > SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> > > tease out which SEAMCALL is being made, but significantly reduces the
> > > amount of copy+paste code and makes it all but impossible to leave an
> > > elevated wait_for_sept_zap.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/vmx/tdx.c | 72 ++++++++++++++----------------------------
> > >  1 file changed, 23 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index f6782b0ffa98..2e2dab89c98f 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -294,25 +294,24 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
> > >  	vcpu->cpu = -1;
> > >  }
> > >  
> > > -static void tdx_no_vcpus_enter_start(struct kvm *kvm)
> > > -{
> > > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > > -
> > > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > > -
> > > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
> > > -
> > > -	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
> > > -}
> > > -
> > > -static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
> > > -{
> > > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > > -
> > > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > > -
> > > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
> > > -}
> > > +#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
> > > +({										\
> > > +	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
> > > +	u64 __err;								\
> > > +										\
> > > +	lockdep_assert_held_write(&kvm->mmu_lock);				\
> > > +										\
> > > +	__err = tdh_func(args);							\
> > > +	if (unlikely(tdx_operand_busy(__err))) {				\
> > > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
> > > +		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
> > > +										\
> > > +		__err = tdh_func(args);						\
> > > +										\
> > > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
> > > +	}									\
> > > +	__err;									\
> > > +})
> > 
> > The comment which says "the second retry should succeed" is lost, could we
> > add it to tdh_do_no_vcpus()?
> 
> +1, definitely needs a comment.
> 
> /*
>  * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
>  * retry (if necessary) after forcing vCPUs to exit and wait for the operation
>  * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
>  * held for write, i.e. are mutually exlusive with each other, but they aren't
>  * mutually exclusive with vCPUs running (because that would be overkill), and
>  * so can fail with "operand busy" if a vCPU acquires a required lock in the
>  * TDX-Module.

LGTM.  Nit: is it more clear to just say they can contend with TDX guest?

   All flows that ..., but they aren't mutually exclusive with vCPUs
   running, i.e., they can also contend with TDCALL from guest and fail with
   "operand busy".

>  *
>  * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
>  */
>  
> > Also, perhaps we can just TDX_BUG_ON() inside tdh_do_no_vcpus() when the
> > second call of tdh_func() fails?
> 
> Heh, this also caught my eye when typing up the comment.  Unfortunately, I don't
> think it's worth doing the TDX_BUG_ON() inside the macro as that would require
> plumbing in the UPPERCASE name, and doesn't work well with the variadic arguments,
> e.g. TRACK wants TDX_BUG_ON(), but REMOVE and BLOCK want TDX_BUG_ON_2().
> 
> Given that REMOVE and BLOCK need to check the return value, getting the TDX_BUG_ON()
> call into the macro wouldn't buy that much.

Agreed.  Seems it sounds nice in concept but not in practice. :-)
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
