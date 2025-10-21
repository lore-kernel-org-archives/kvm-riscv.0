Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCD8CCD1A2
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPYA65HpLp8UI0dZcNUgIRyd2A3/+km3T/YaoniCZxg=; b=S66TswtTUQn4Ir
	zuEcbvHxO0Ab71A3AcxPxYwPfHU1mQWy0r9ery+4UN5V2z4CLPJXc41y6AFn62leeszbyF3CV51PR
	oru/PDeydWOjHeyqafdfcoHdfvuNdyfmg1fI7wvnYIrzRisZ5xbglVhyg4YX90HpyLTDbvzlp/e66
	z/fLEXGyw056yyhm2A3LStqotTSvWxEM4qqFNf+ZWUzI8jU8wF8Rpl2qIJzYZHOzuKyYYgC2GDg/t
	U4MqS5S40+qPXEFm01iTnzYcj5XMk7Dub1eYpl8JEH1RbLbduRyQfRgd/ZWSbv9EPdyVNu/CckITM
	hd0IUoM0Fcr6vrWpTuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzza-0000000FL3P-10G7;
	Tue, 21 Oct 2025 00:12:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzzY-0000000FL2d-2un8;
	Tue, 21 Oct 2025 00:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
	From:Sender:Reply-To:Content-Description;
	bh=71Bp+aYiP3F6vlD7WPThegKIsaVCrmjpADsIQ+g6B9Y=; b=Ihp514PD2t204xczTdBXFiOEi8
	3VsFj9pwNTfHQYj4XHserg60fV2a0vBt2jmf9ox682O6rLoQABzFTu1qiC6TTvZqSY5BAadKwXjJG
	Ssi619z6lrrrmg8YJLNW3vTv8OkfwPmdGfGG4a/LUYUNyk5CuPdcIlhiU15k17iLRJiZw3esN37Uy
	rahDRTyCc6P3jScLPmwbbTRDQJimFGD5PJfv7RURMJR8F+rK5F3e9jbuZNmmwQft+O5gzLsvD/vzE
	FJbbk7+zqSlHVe+TwOgpO46QshLznTXYx24BftU8ewi0DBaU8iQ+aKdmGJYx7g6oQNuwQHvA+Tm9T
	kKr00JxA==;
Received: from mgamail.intel.com ([198.175.65.16])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAzzT-00000006OBg-2z5C;
	Tue, 21 Oct 2025 00:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761005561; x=1792541561;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=71Bp+aYiP3F6vlD7WPThegKIsaVCrmjpADsIQ+g6B9Y=;
  b=ZqptGubDhns24LmthIhhmx6rEWEg1WyOevy/E+AxmImkD6jGH4Rv5+O9
   OHbnl1OmV4AQwmresJXguhLZz9x3paHXl37jsChBrPMDgKNH0Rre3PR+g
   13JtZCEC9FgJuoUf1dno9i1Bbhmna2KvHF+OmE8HlCmhE7lZqsM5h5Y97
   QMxggvp20k0M7oiMPIlnDPyNhb3QGoFA63gTnknwPuTvmkduhlEF/SjRB
   6M/9mmUJaPPLSpf9tac4THfYywp8MwSxsu7tStrnecasJwO4JkThBTT5I
   Wpa82wNkiDo3/ix+qYKW1m7osXOqRFVYaPDCxTd9sgE6eVhFhpxIo6waY
   Q==;
X-CSE-ConnectionGUID: P9HRUUmLQsSf0oDNeuwQsQ==
X-CSE-MsgGUID: F0/Sp0IlSam4xE6+9xkwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63277840"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63277840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:50 -0700
X-CSE-ConnectionGUID: vbTXl+muTpGf7/M4o9jGxQ==
X-CSE-MsgGUID: TrOfesraRAi0xzRaMCkZxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="184230845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:10:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXuteEPCxQT2xSSWbG5FyADflQVPfHmgVICaE2MuuGj9biQx8QzY11Mo5FJB3p9fHiispESEdhVLtjINLZu+Y/7P+c9VzxlUycKQT/iGojpEKhD39Tepmva5IuyFUXRyd2xCDDklykDmbFJoiF2DIDl9TRJTgJtZM919vs8jPeFDLJrnNnq8SokQ2AshQN16KBXSsIslu920VhsJuVhmLSMknt/MIwLhTSXL9RZru3taV1UTWcA/pCgbliZ+QhsyTeRHnH/bmo6Z2qK+IuLvwuWA+kkWWMsE/BrSIciAxPd1GjxyJn4T2PxLS3IQdB1cj3AM7kQpD6n1Sz5z1a0VvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71Bp+aYiP3F6vlD7WPThegKIsaVCrmjpADsIQ+g6B9Y=;
 b=lnO/9w9tUwlVUQ1lzOo35poWPROfqGh6quYJ3U0pPW0Jwf9zLkU3e3yEJeP9VFtRXXiz3wZA8Vfivp2HGVG2HJ95T2yXb7onKaRoNKwsKzwYnZT4cUm7jqWVM4NKcXAz1TAWtDWVzND+vWNZsuyGUiHdfVKj2uiQQEm6MxHyp0tSZm/2uhJyV3utIDX0PAk4mix0xdbR1mHCwLCYYMHv9nWVcn2KTLqIwHurmjKW/9NflWOlsY+e6SmSPUlH7ZyhEpA9fh89WvtMxACuGw5H9FRByIB8IT1vF5qLPZxJB/UChd8ZLoTbZFasq2BA+bK2GAf49gy5QxGNo+cgxEwOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:10:45 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:10:45 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
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
	<linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan
 Y" <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira"
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"Annapurve, Vishal" <vannapurve@google.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
Thread-Topic: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
Thread-Index: AQHcPv2oe4BQYrwVZEuXjqKrwFdlAbTLwE0A
Date: Tue, 21 Oct 2025 00:10:45 +0000
Message-ID: <707a01ee36c28863bdc6a4444a5560e9a0b19597.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-15-seanjc@google.com>
In-Reply-To: <20251017003244.186495-15-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS7PR11MB7950:EE_
x-ms-office365-filtering-correlation-id: 1c286186-4690-45b1-e39a-08de103647cb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NC9PbUx6SWJHQnQ3Q3RDY29QdkVpYndQb3pXemxOdU1majV4ZkhJU0lINVh3?=
 =?utf-8?B?RDF5Q1YxOHhvOHRxMjFVTDVpTEV1czN0V1duclNuQzkwMFQ1YjBBY0xmcTVH?=
 =?utf-8?B?YkRYamlycmNUajRkL2FhYmFjKytJMk5YeG02WWtTOU9ocjRMb09lemptVzE1?=
 =?utf-8?B?NTYxSTJ0NmM3QVh3U3drRDJaS2VkeU9Ea1l1ZHZ6MHJUVW9YOEg0Nm1oSnA1?=
 =?utf-8?B?M2s4SG0wN2NHazRKMis0WWhUUFFBOEtvcnNHam45aURMQUZRMUUyMlYza2cr?=
 =?utf-8?B?b1BOallIM0Z4b2VCQ21TT2Y2L0xiMXl1TlNLYWdIQXhQenhFYlVRU2dZVFd6?=
 =?utf-8?B?QzlzT3RIKzdhYWtjN29RaDd2NzljN3l0VmwwZjAwdFNYdnl4UE5CTlVlWGYx?=
 =?utf-8?B?eXM0K1VIUytOZVhSV2hGWE9qS3dRaFo0aS9weU4wbVFqUTVtMUZENG92SjVs?=
 =?utf-8?B?UkJHcUhwVmhWRkxUbUt1bHFrNzk0dGVJSGxyc09xN1ZzRlUxbWFwc2JDckxT?=
 =?utf-8?B?ajRpMVZnYTdtdUhaQ0MxcnVXaXdORkhmcTVsSkhGcXprMk03SlR5Q1VxZmth?=
 =?utf-8?B?c1NvNGpJcHozN3dna0Joc21SZDNLKzB6aDdtcjF3b01TVlVDZGZ0VDdkbUo4?=
 =?utf-8?B?cC9lQ0FKWERlR3NXTm02RUl0aWdmOUlwSXFjK05ZbE9CYkNUcW1XNnRiZERF?=
 =?utf-8?B?RGV2Qy9zWjNwZmxkeWxSbGVHT0dNR2pEZ2VUNlphWmtlbXJqaGpkdkFJVTlo?=
 =?utf-8?B?OU1EQVZNMHB1ODl1NHJIYUpRSitPZFR1V2RIUTdmbTlvNTBtZFhHeW5peHNS?=
 =?utf-8?B?bVozc3hJZHNuMmJpVnFsSHZOZFNpOTVIMDAyVXZSb09vL2thSEdOV0x0eXVi?=
 =?utf-8?B?cnZMbGpuUyt0QmVFY0MxSGZvSERGS3ZDWHE3eks3Q0lySmhwekJjVU9DblR1?=
 =?utf-8?B?aDBzWFA0NGV1OWQ5Y3loZWlkTytkRUE0dFBaWE1ndnJkOTdZei94WGYrbWJj?=
 =?utf-8?B?bDZYQzFDR3RnMHMrOGJFTUR2Vk9YeXEzenZkY2wvTlZ2bHg1RkJCaldabEUy?=
 =?utf-8?B?NW5ycW9HWmVMOC8xRVJ3Q3RaYVMyQ0JJZ25PTi9QcTRvQnlmdzJteVhIYjha?=
 =?utf-8?B?bk5xOU4rUGJhN2pRNXRkVFl3UWdmbGMxVjV1eE9mMTJZRlZ2ZlZ3WHI4QmQ3?=
 =?utf-8?B?b05vL3l5K0dXbTRVTEpvMXc5NklxK285TnhPRjBjKzZ0bkE1Z3ZvOFBiamRy?=
 =?utf-8?B?OGdrT3h1WVEwQU1rcWR3d214WTVpeGk2SnAvdTVGSTY0MWx1NVdoampMUGQw?=
 =?utf-8?B?REEvQlc2OVFlTXpQYllKb1ZEVnhNNnp0MWVpWmVxUWhZcG9kS1lvMmpNeWlu?=
 =?utf-8?B?Y1B1YUpjTTE0ZjVWamhUQ29VMm5EVlh0NzZtU1V0SUVvbmgrdHc5aHFDNWlX?=
 =?utf-8?B?aHRRcDJKbUtDb05pUkg3K2pxeXRzd0NlWC9RY1ZOc1gzcGdRTVhRMXNpQmtO?=
 =?utf-8?B?VWRZUkRZa09pM3kyS3FyWHFTNjV4Vkw2SlBKaDJNSTVpVUY4eHVNUGU5S0Zn?=
 =?utf-8?B?VnlFODdySVo0amFJWVBYUS9Gc1dIUE9zTEN0aVl1anZrd1luc0w4YlFkaFNO?=
 =?utf-8?B?b0dMWCt1Sm1WK1FMcDloMDd6bjNiVXlXSjN5MjlHSFJQZ2tYUW5lZ1Z4cXor?=
 =?utf-8?B?eFEycTNKeVIzdDN2SnlqSHhkNjVOeVdOL01FTnR3REN6N1MrOFZTQ3RqREJl?=
 =?utf-8?B?T2dwSkpQaXhhRG4xL0xiVjNEWXVsaUhFQVN1eTk1a2tJTFg3MFJ5VHRlYkFn?=
 =?utf-8?B?WVNiT3phTGRrdEpRRkJIL0RVbnhyZ3paZEJMUStMMmUvV2xrUEVFVkV3aXB3?=
 =?utf-8?B?UjUwK0NhOTBENExuejNrVGlUVXJjc1dTMGE1b3I1d2h6WlZZNmpQZ004M2tF?=
 =?utf-8?B?UC9hZUJveFBpcHp1c3g1dWMxbElyelkvWnphN0Z2YTBHN1FBWnlZTEt4c0gv?=
 =?utf-8?B?VDVDdkRWTmN0N3dDSWgzTlVlSVFaRlNrRUNoUFpEdDFqbWp0MlNTb0dIVU9I?=
 =?utf-8?B?M2hwSjIzR1pUcTcrSDh6b3VFSWxmS1VobnYzZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGQ1dkExdklqMTl3RWpjSitHT2ErN1NkTHVjVlJkZGJjWVBtLzh3T0VhbnNw?=
 =?utf-8?B?QU0vb3RqSWRKZmwyQnRKTlUvNWhqWmV2dTNXYUhteGw2TFQ0WHZYV096akdL?=
 =?utf-8?B?VWtIQVEwVUljZzJYek41UklqcG1LbmhnbE9lNFhhUEJqUXJ3Y0IrMy9XQkRD?=
 =?utf-8?B?NFJaVTdmblA4UGtXM0w5eTkxWGRqV0JaQ01pUnFzRVRzRFg4OFJKeTJnNGlC?=
 =?utf-8?B?WHVjbHNWSW5NdDMra1BhV1F4MCtWamN3TTRaKzhBVHBxK0w5S2cyRlVLOGRj?=
 =?utf-8?B?UDN6UWpMSTVPMHlkUWNtRmUyVmtwNXBDM0xRSEFzUDZIV0pVeEV4bmppK0dS?=
 =?utf-8?B?Y3ZpR25MRE9FUWxWcTNyUVRsSjVPV1BZTTJJWm5ZUzA3alNzTTV1d1R1UXA0?=
 =?utf-8?B?K204THJPMU9KRTRCckpmV1pVbWllWFZ1Wm1ITjN5Qm9jS283SUR5ZkJBZ3JR?=
 =?utf-8?B?R2lJZlRYNWtRN0JsRGkrSGVieW5IeEcvbXB5N095cnRGOXhldGtQR3g4WFhY?=
 =?utf-8?B?RHQyN1hOZDZXQ3JpZ2RXMTdZZHFSWnVpcm4rZnNMRUwrSW5HbnJmRkxYN1Zk?=
 =?utf-8?B?RXRwam1aY0psa2ZXUXBIMkF3dHI4WnBMTWUrWTZlM1ltNFNiRUZ4dWtCQ3h3?=
 =?utf-8?B?V1lCaE9mK3JqL0l2OGQvY0Y1SFdIMDFPaFJkQlp3Ly9FdnI2SFc4WDRKZW5C?=
 =?utf-8?B?dmx0OWFqQmhxdkJjNEIxMERBdTZQOWJ5aUQvUHkzeU4ySlZ1cWZTNnpha2dn?=
 =?utf-8?B?eWNVOUxqaVZSTEZkMUk4cVNZenJTSnUxSnVVNWpOa2EvdzBISVlaRnBPNjZC?=
 =?utf-8?B?anNiREpaSTNGb28wQjgzRGcwRUdpWlhJSGl2cUdIUnBveG1sZ01mc3U4ajJY?=
 =?utf-8?B?Rzl2L3c2b2JWSCtjeXhQRURBaGoyTGtMaExFL2E0QmY0QVd5emtyL0oxMVMy?=
 =?utf-8?B?VUtYNXNhMndFb2NvUFlHU0JEQjdwL0lJcjRTZEpsOWF6cmJCME5JUUxIMGlZ?=
 =?utf-8?B?RU52R1pzZ1R5R2c1VFFURWwyd2orL01VTkpUMEk2ZitZQnBaOTZKelVCL09t?=
 =?utf-8?B?M3p2N3pkZGs5bUlhZUJsRk96dTYvZUVsRnhrdGxLRzhPUVNmdlh5dER2NmFG?=
 =?utf-8?B?YWFCUmg5YUUvdWF2Q1pqYTUwVGpHVzJlRTFHOXBJNlBrZS9YUlA1blBxbWw2?=
 =?utf-8?B?VkhlWTMyTklBdXlaVjBVall2NnN3NEM0UldEUjROVTlQd3RabGVadHcxYTk2?=
 =?utf-8?B?NExiNXVXR2JYdzhOZFl5eDVwT20vcURla2paUW9pM2EwRXRUdlc2U3BHTG05?=
 =?utf-8?B?dFZYb3Q2TzduQmd3UTlKV3ZHaWJTWWNEaUtMSy8zYW1lTUI4andtTFFLcnhk?=
 =?utf-8?B?NGpSWG53c1VwazhRU2V4VENiRXQ3d04zTFpMbGdpd3cyMEZTaHNUc1QzQWtj?=
 =?utf-8?B?ZWxhTHUzc1V1aE5VTGpUSWQrRkFndlEwR1RuQlJrRCtYL0pwNVAyV1ZPQ0o2?=
 =?utf-8?B?WWJQWGgwOVRvRmlTdEZPeWNaTjZEWmNISUFlUld6NWRVYzhISlVhelJSQVNm?=
 =?utf-8?B?VG15TFNQSytiQm4zY2hrVDg4dTFFTnRFWkYwRDk3YTBHViswNmpNZVlxT3p1?=
 =?utf-8?B?a29OSFFnRlh6SVg1cFlRTkprZzVEMkljV2t1QW1CdnRyOW1KcURhVU55eDRx?=
 =?utf-8?B?UXkxVnZHMHBqZUswQVoxK0ovbUxXeFJvVm8ybUttcXV5VnY2NFZHV3RsV0lE?=
 =?utf-8?B?YllhV1JHY1VhSU5LUVVjRGpTcXg0QVE5MjRRQWpidGZFbWM5QXpDUGl0eEZ3?=
 =?utf-8?B?LytTNHhXbTdnVmhadVNRMFQzMytUaVZyNVRZVjY5QzFyV2pxRm56Ym1VUWc4?=
 =?utf-8?B?TnBjbGxuSFVnd2V1Qm9COWVRL0V1R2RoMnpveU5pZFYyZFVTUktHRytpU2RG?=
 =?utf-8?B?UjExRGpQN1ZzanlkUzBzVUhVQmpzRXpHc3ZwS2FjR04xbDNJZmxMMkJzOVB2?=
 =?utf-8?B?NjU1VmVPVUFvYnpEWXBXVC96QkxaWUZ0Tjc4VXd6eFN3bUd3NVFReklmTVlh?=
 =?utf-8?B?OUtFeGlTZVk4bnBWM3FyK2FjRHJJMFYzUWp4T0RuZFdReTFRTFNZQzhkOUdR?=
 =?utf-8?B?MmNGTk1qVU1HWDlpNDkxQzZJaDg0U0ZDRnIxaDkvVkQvRXdocHV4K0xIWUJl?=
 =?utf-8?B?emc9PQ==?=
Content-ID: <F11C5BAB9726014C8C43743FB330910B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c286186-4690-45b1-e39a-08de103647cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 00:10:45.1520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HR9uxH6FRd++JqPuTNZeRnSrcTjfYDXNtVqezWCAmIPRgcVpmkz0oobRLrrfahEI+vmUpRVeaP/IDm0p/FBRruoUr4Xn8o2IA0NAThytF1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_011241_467054_49F0B7FD 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBXQVJOIGFuZCB0ZXJtaW5hdGUgdGhlIFZNIGlmIFRESF9NUl9FWFRFTkQgZmFpbHMs
IGFzIGV4dGVuZGluZyB0aGUNCj4gbWVhc3VyZW1lbnQgc2hvdWxkIGZhaWwgaWYgYW5kIG9ubHkg
aWYgdGhlcmUgaXMgYSBLVk0gYnVnLCBvciBpZiB0aGUgUy1FUFQNCj4gbWFwcGluZyBpcyBpbnZh
bGlkLCBhbmQgaXQgc2hvdWxkIGJlIGltcG9zc2libGUgZm9yIHRoZSBTLUVQVCBtYXBwaW5ncyB0
bw0KPiBiZSByZW1vdmVkIGJldHdlZW4ga3ZtX3RkcF9tbXVfbWFwX3ByaXZhdGVfcGZuKCkgYW5k
IHRkaF9tcl9leHRlbmQoKS4NCj4gDQo+IEhvbGRpbmcgc2xvdHNfbG9jayBwcmV2ZW50cyB6YXBz
IGR1ZSB0byBtZW1zbG90IHVwZGF0ZXMsDQo+IGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKCkgcHJl
dmVudHMgemFwcyBkdWUgdG8gZ3Vlc3RfbWVtZmQgUFVOQ0hfSE9MRSwNCj4gYW5kIGFsbCB1c2Fn
ZSBvZiBrdm1femFwX2dmbl9yYW5nZSgpIGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIFMtRVBU
DQo+IGVudHJpZXMgdGhhdCBjYW4gYmUgdXNlZCBmb3IgdGhlIGluaXRpYWwgaW1hZ2UuwqAgVGhl
IGNhbGwgZnJvbSBzZXYuYyBpcw0KPiBvYnZpb3VzbHkgbXV0dWFsbHkgZXhjbHVzaXZlLCBURFgg
ZGlzYWxsb3dzIEtWTV9YODZfUVVJUktfSUdOT1JFX0dVRVNUX1BBVA0KPiBzbyBzYW1lIGdvZXMg
Zm9yIGt2bV9ub25jb2hlcmVudF9kbWFfYXNzaWdubWVudF9zdGFydF9vcl9zdG9wLCBhbmQgd2hp
bGUNCj4gX19rdm1fc2V0X29yX2NsZWFyX2FwaWN2X2luaGliaXQoKSBjYW4gbGlrZWx5IGJlIHRy
aXBwZWQgd2hpbGUgYnVpbGRpbmcgdGhlDQo+IGltYWdlLCB0aGUgQVBJQyBwYWdlIGhhcyBpdHMg
b3duIG5vbi1ndWVzdF9tZW1mZCBtZW1zbG90IGFuZCBzbyBjYW4ndCBiZQ0KPiB1c2VkIGZvciB0
aGUgaW5pdGlhbCBpbWFnZSwgd2hpY2ggbWVhbnMgdGhhdCB0b28gaXMgbXV0dWFsbHkgZXhjbHVz
aXZlLg0KPiANCj4gT3Bwb3J0dW5pc3RpY2FsbHkgc3dpdGNoIHRvICJnb3RvIiB0byBqdW1wIGFy
b3VuZCB0aGUgbWVhc3VyZW1lbnQgY29kZSwNCj4gcGFydGx5IHRvIG1ha2UgaXQgY2xlYXIgdGhh
dCBLVk0gbmVlZHMgdG8gYmFpbCBlbnRpcmVseSBpZiBleHRlbmRpbmcgdGhlDQo+IG1lYXN1cmVt
ZW50IGZhaWxzLCBwYXJ0bHkgaW4gYW50aWNpcGF0aW9uIG9mIHJld29ya2luZyBob3cgYW5kIHdo
ZW4NCj4gVERIX01FTV9QQUdFX0FERCBpcyBkb25lLg0KPiANCj4gRml4ZXM6IGQ3ODlmYTZlZmFj
OSAoIktWTTogVERYOiBIYW5kbGUgdkNQVSBkaXNzb2NpYXRpb24iKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KPiAtLS0NCg0KUGVyIHRoZSBkaXNj
dXNzaW9uIGluIHYyLCBzaG91bGRuJ3QgaXQgZ28gYWZ0ZXIgcGF0Y2ggMjQgJ0tWTTogVERYOiBH
dWFyZCBWTQ0Kc3RhdGUgdHJhbnNpdGlvbnMgd2l0aCAiYWxsIiB0aGUgbG9ja3MnPyBPdGhlcndp
c2UgaXQgaW50cm9kdWNlcyBhIEtWTV9CVUdfT04oKQ0KdGhhdCBjYW4gYmUgdHJpZ2dlcmVkIGZy
b20gdXNlcnNwYWNlLiBub3QgYSBodWdlIGRlYWwgdGhvdWdoLg0KLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
