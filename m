Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AFDCCF9E3
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/YhBSxdb1QxEbXpVpEUUmaYrNd/LL43Y3wsE6nvQGo=; b=XbaBfFK9xTXD9q
	InaoZhrATTD4cfBDYvijdQ1c8KWcY0lFyWTnSykEDX086yRxjVd1WKlmwgW99r3MOOZbIu45SG29w
	bwDwvSElGigMnX3Ueem8NsghYL0xhpYxTCkpi1XdSllv3fR+3647bR9QcdbUuL74Ajf+CpHzG3JVD
	1/NAouLVmqnLiX7cUamVyY17uVzyizb5uFXLjp9rE2St5lAbKFtmGtSV+9kIzmyv8kvzekR7uCP0s
	LmU4PoM7utD5WnyDQJT06hUbXE+pK1yvvAUTCQbjh6X4ho5uhHR6lhKEW8ShXlTBCceEjhkJCk2Eb
	F7i2VnSryt0I1oIyOxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEboz-000000057Ur-3U5u;
	Thu, 30 Oct 2025 23:12:45 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbov-000000057TY-473T;
	Thu, 30 Oct 2025 23:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865961; x=1793401961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m3xHz3l8nq2UfFYHbMeGhr99gJIJqVsOm03VF016Q4U=;
  b=gyTd3+4cjazP4NLUo3jBN0+ms/gtPYyKFQD++b8wpTLs0sYMYE5yWZbU
   aTo2a/AvVHD6YztjQ2U6PwbXnnAcb+TSg1dSD0VgH3Z8ybd8CtOFaHn9F
   lZRUWlcw2zkMaTieTbRklyZtdkja1zGd7YWi62wPakpazw5ykMistwoP9
   +GcEDp776aMctokp37iLSO57UcSC09a31g1O3oF9s8LOD4xca33TVEwFp
   pSn5crIkvobt9SgREHBJGtJIj0yeGEXo4+9DD+2kmHG9mzZGTe7ZKYx5P
   gNYYATKOoDmTGNkJ+tGuRfThIkzyDmYXzd9qB7MG+9fKE704lOhmV02Z5
   g==;
X-CSE-ConnectionGUID: 1bKi5VecShWJaMAYilRxtA==
X-CSE-MsgGUID: AXuf/TVzQHGa3BJ+IBPtHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75370419"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="75370419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:12:41 -0700
X-CSE-ConnectionGUID: Jn5pLCahRNOMzmUKXJx/Gg==
X-CSE-MsgGUID: yl9eBvsrT4ahxEZrLrtsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="216737215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:12:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:12:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:12:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHNLpGWtlN8MljtSn+UJ/INNXobDJCJG8aQg9Yaw79SZyUTMUfzENjYuHYnpZ7hGfbzD1sT6S+U/ImkgKo0tgPkhpVnzmwVuLVvtc7SCniYFKhjxqloGWmLASrqXb9usrTRvYlmpB3M/B3lcDy405JOTYPlsROP7p35PL4lVYFDfsEpYXgZU70q8/kUKsbuH8eSeZX6niY//mU1JOE+DwzjeEMRKllq/Jxp/8KuAXmsam3OaYbWJ9Lp4FbLf1oANA99Va/iR7sNDRui0213gicYd/hBgUwujDRPqpIeJA3If6DpZTri3FZsAEGLzqoVSnVdOEx+PG/eX9OoRtVHlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3xHz3l8nq2UfFYHbMeGhr99gJIJqVsOm03VF016Q4U=;
 b=eSkGhqo3aLOf6VSavtXdU8+Vx7TulO6L9sYWZlDblJjB9RIP8lIHGw13MOnq0ZPj1017/M/oHs4WnUegowIF/Ez7YKX+zpNExzC8tl4pNvleFRk6kKgM4Z1sJCck9pHgFMEQvkF91IZGN8h3utI8trARg2u6KHnB9Qn3QLVPV4KXwaupwG+Dxr0ClHqBN6ir//6toeKRavFfC1JGf49i+3Uuq/c/SCGy6uFQlHZmTyjQTVPNyFxTbVUMZbmTA2C5Qfkpk0TsJXAH4aplx1DvdImrLJH9t7XKwoWcCYWiIPjJPaqrkBamjIjXTnxumBndl8aI5oqP1Fx+YejTZD0f6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 23:12:36 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:12:36 +0000
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
Subject: Re: [PATCH v4 28/28] KVM: TDX: Fix list_add corruption during
 vcpu_load()
Thread-Topic: [PATCH v4 28/28] KVM: TDX: Fix list_add corruption during
 vcpu_load()
Thread-Index: AQHcSdleRzkP0OXN20eyTuNk4tyh6rTbUaMA
Date: Thu, 30 Oct 2025 23:12:36 +0000
Message-ID: <941fbea17cd11f927007b9a805de66a3e984f08f.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-29-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-29-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB7842:EE_
x-ms-office365-filtering-correlation-id: 7991bac5-2ebe-4605-2fdc-08de1809d067
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MTF2VXloWnpyU2dsak5BU2FlbUdOR3ZWTWZJTVJHNG5PeUJDVm9qd3drMEZZ?=
 =?utf-8?B?TFZuZXVmdXZKVEs1a2kzNHdCWUVqNE8xdzMydDZMeXd4eFBGQmE1Zk5vMTE2?=
 =?utf-8?B?MDZtdlpCTlRyUU9PRlJ6d3daYnhyTUtOUWdmWFRNNEh3RE5KM3htUlFORzhm?=
 =?utf-8?B?blg3UzBBOFJCMGc2TXpGMFEwZkdVa2RBcUI4STNQRng3U25IZGNRNk96cFdM?=
 =?utf-8?B?bitRaDhoa3B6T0lKeUpJdUQ5bmY1dXEzOE9PbzFjWVNNT2FBbGh4Z1hFRGlK?=
 =?utf-8?B?MWNsOXE3aHRHYmFtaWFjOTQwdFFEck5FM2Q4M0syNWUxeUFaZU5IR0duR1pD?=
 =?utf-8?B?cXFoN0pPekV1c2V3N3gxcmZraytMVktyTDArT0J4VnR1SUdVajBTZjYyNkh0?=
 =?utf-8?B?RVFVYlZQUG9vMXZQL1FjQ2dxZnVPQjBuRFo0ZWhzVU5aSVl2M1gxTTFRWmY1?=
 =?utf-8?B?Q2paYmhGNVJweW53b1RJblRNWm94a2I5MTlwakNPWGRWZHN2YUordjA3WjVP?=
 =?utf-8?B?aldBTUlHMEZOMXVMUlpqZ0RNaXpOQzMvVTFReC9Qa3M3WFpYTmtqbWJXWnJV?=
 =?utf-8?B?cUttSW1taFJpVzNpbG4rVFhZZE9PdlVBbjUzM05pUURGUW0zTTlzeGk2STJH?=
 =?utf-8?B?alI5SUVVMjFFVXhqQTJvazg4TEFHRW9WSUhNMjJkM05Lbkd6TEc5NVRCdEtS?=
 =?utf-8?B?dmRvbmVkRGJnKytnaXFmSUpZTlNtdDI5N0dEaEwzTE9NRE5MVk9tNkdDSXp4?=
 =?utf-8?B?V3RmL25WMVhER1pnM3c4M3B0UzEzcmhmRE8yU3VjTVFUWFVnM2owOTdhQmkr?=
 =?utf-8?B?RDVwYlFKYzFmVXdJQmJ3cXhja0MzODk4UXVSbUltYjJSc2Nzb01EbGxCcTEz?=
 =?utf-8?B?NFRHbWVaM2Iza0FBY1p6OUN6aUMwOGo2L3pLRFRFMFVLNXMybXpobGxoMkhj?=
 =?utf-8?B?UUlpNDgvdFVEa2ZaNGhGcldNbHZ5K1AxblplWUxaMGMxMWRvK0pJdkp2UUQx?=
 =?utf-8?B?ZXlHV0tKN1NCL05taWc3Q25WTnRIMkRMUElVRUNwRzNYQ1hMN3Zxc25xMDF3?=
 =?utf-8?B?VTNFNkdzMFFIclRHUU5RTVRsQ0hTK2Q5b3VJMnZJZ25GWlRZc2x2dXNoUllv?=
 =?utf-8?B?NEtrRDhyOEFUMXpXMTJCZ3BJZVZtTm9mWWFtaklTYWNwVWhWanlPRkYvaUdR?=
 =?utf-8?B?NllZS0hnQXZOdTV3TDJXK2dONlo1eHdWWlVaRE1LbVh5eXhTMjZISWdNbFdM?=
 =?utf-8?B?b3RXUDVZZURxUHVrajVMNG16S0dOdklkQ09OaG5acTZuS1JMR2JjaC83Z1pG?=
 =?utf-8?B?OG1EWmdFYTNscFluSFFpSFREajhEUmxGN3pMdFR6V1UxaFBsQ1NBZzBxakRN?=
 =?utf-8?B?VVQ0MkVwM29SMzQ0NTEwRWdEaVdlVGZQbkhhVUVsdnR1SmJkUEZHbXVkd2w5?=
 =?utf-8?B?T2g2VXFKRFJLU3VoOUQ0QVlKNzNNYkZmVzNoQ0FDdDZoK29iZktjU205U0tH?=
 =?utf-8?B?cXAya2o0R211bHQ4ODdObTNFK0gvb09yT25tS0pqdFVEeXc5b2NqWmZqSmt2?=
 =?utf-8?B?UE5BMnRlNG95M2FXVVM5NjJkQW1JYW85U2RuTUNQSkZ1ajZCMjhaRjNvb1Vr?=
 =?utf-8?B?OEQ2eXNEVW1GMk9RSTRwOUZiMWZ2TXZWTE9pNUh5TDdZYVl6ZStLMHQ1S2Zo?=
 =?utf-8?B?SlVnamNkL2FQS1E3UlFveTFjb0NOQkFtM1l1a1FTTGY3RmNrMllqNCsrLzdp?=
 =?utf-8?B?aHhkZ1FUTVpycENwdzhPQitmQXE2enZpc3IweXJtWGNTdEJucnJ3dHRFR2Ja?=
 =?utf-8?B?T1paUStwdTVGMXA4K1BnQUpFc1dkbEZpb3FpR09xQVU0OW5MUUR4SnAzR0N0?=
 =?utf-8?B?NGhkUXNmWW94MjRRcHdSRzZlNTJuZXQ0QWloMk9hTk1PNEZXell3S1hWNGtv?=
 =?utf-8?B?d25Cb0RHSlQ4VFo1ZW1KQlp0bThVU1JkRXNjOU1ZYmdEMWpSdng5Y3Blc3VD?=
 =?utf-8?B?a0JmZDBncEtWc0gxY2M3Zk1jK2h5aTFHK1dDWm51N05NMXZ6czNXRE9IWnBG?=
 =?utf-8?B?MEtKUWFLS3YwVmthR3BHenhhZ1dHS2tXRVJYUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlVKeDMrM2NkUnhGOGMrTWdwZlprcE43RW1mcFgrNmE3VXpZSlg2cW5iVE5F?=
 =?utf-8?B?MzZXZU0rc2FsQTJqeld1WW5DYnRzdFh3N3F5SzJKU1VNcVVwWGJXY0xZbnlI?=
 =?utf-8?B?NkNidXVTRHZmcmk4NW9UT2xGN0hQQlVFZjRMU2svdGhHTFE5cENyS1NYTWQ0?=
 =?utf-8?B?QUpLOHU1dk55TTc2Nm9Rb1d1Q014eTNqRVJ5VkY5eW1RazJtcmR1ZHlwWlJs?=
 =?utf-8?B?VXpjWlFaWXdoQ3VMeFhWNjUzemowYzBnVGM4WGJURFlmTzhkREFIVnVad1dX?=
 =?utf-8?B?bHY4VmVwalpKeUthRG1HZ1JNWmJ4dlAzbXBNQ2o3cG1Pb0NPU09qNWJBalpR?=
 =?utf-8?B?WmwyNHo3T3ZnUDVXR2hhV0R5N0E3U3ExVGpaeEQ3VHpaR2trc1cxWEUzbG9x?=
 =?utf-8?B?WVhQb3RPSlhGcXQwRTlQYlcxQlhoUEtoeVhPZjF2WWY4cWpEcHNuS1JqdmZv?=
 =?utf-8?B?MEUzQVVkc1ZmQVk4bWJrQm14ZDcwUlhoZXhGZEgrMnJ5aFlBT0tJRzhOdHlR?=
 =?utf-8?B?T2p5aElDMHE0WE04OHFYcmZwaXNXdC9KN0tsUTNpakN0TWd4OUY1cEh2MGZ2?=
 =?utf-8?B?TU1RNlpLK2RWczdwVDBSL21hQVBkd3VCaDNwY3NiWldRcU91cWMzRHpSc3lP?=
 =?utf-8?B?ckhMR3A4MXVhV2d5b3dtaDRFY3NaeXpWU0grSTZkYjhveDF3SWtpMkMvNnh0?=
 =?utf-8?B?Z3Fielh3bitvSDI0SkJCSEtmZkVBenhGMHhCWVVvdWQxTlJXV2E0YUUwZE9l?=
 =?utf-8?B?TnJFaXhrakR2WFdEMnNvcTdOQlRwblYxajZMeHNVVXJsak1RSHRZbENiN05m?=
 =?utf-8?B?ZUp0SkJiV0N6eWErV2p2cGJjM25TYVVBUWNhRlFsRW1ZQnFZTnNHS2hqV2lW?=
 =?utf-8?B?enRwelpFK3ZHWE1KN245Vm1uOG9vS3dzYkl5d2RQb2N5MFBQLzhyakR3YUdr?=
 =?utf-8?B?VnZ0aU42VHVTZFdjOSs1dXo2aW5uUFN5Rzd3Y0lwU1dEM0RaRTRTVnJTL1F4?=
 =?utf-8?B?NEZTTjBKRlVyQjJZNDJwQVNJOUZ2dXZLZUlwaWkwNHV6Ulo1b2d0NFovUGx0?=
 =?utf-8?B?aHQrZ2JIbnp3VVJaRlJFYkVaMjR1UTN5SnJNd05nczNwVGNVbFNiTmcyRE5r?=
 =?utf-8?B?elBBdzI1U2k0d296ZzFmMVZHcTlrYXJCNFM4cnhFeC9CcWVPTmEvU2FpYWl0?=
 =?utf-8?B?NlZlaGJUckRUcWRjQUgxby9xUGlJekFGakE4alRTRFFqZHJTYXZvWEFtbDhZ?=
 =?utf-8?B?R0U5NTErREtKSzZvOTAxU1BDdm1DTkNuWlN1UzhTODNjckpCb0lNRjEyWS9J?=
 =?utf-8?B?Q1RjTXdpVFdGSXdIb3Jlb04rb29ocVRhQ3VybTY5VUk1Q2IrMGpMMTIyeXZ2?=
 =?utf-8?B?aFBocjB4dWh3VWRyZEEzRFpQS1U1ZFhvUXhDUmY3MytoeGY1Ull4bVFpSTBn?=
 =?utf-8?B?NjVBTm42WktlWmh2cGFSM1ZyOXVJUnZFbnhhOThtaFF6TjBhL2FiR2dWNmVa?=
 =?utf-8?B?dVl0cmlkeGVhaTBJYmxDWE5OZjdRNlkyS0ZoSDd6MTI0N0VPWStKSDFMeXNK?=
 =?utf-8?B?R1poYitVTlBQZ21ZVE1QWmtFbWRqMEJIdDdscE8rcXQxWlBtMWZYeTd3V2Fh?=
 =?utf-8?B?NVlCMUFwcWtiWGRQREREVDdHY3VZRXpKTHlNSUUrSUJsMDNnd3hhalpzSDk3?=
 =?utf-8?B?ZkdwMFowclpmNUlwTnpCeE5jdjhNc1J0bzNoSUJ5eEZCWnhMOHI0aXl0dVdw?=
 =?utf-8?B?VFpGS1crTndmS0pRWG0zYUg3YnE0U1krWFozQTZNRTZYZkhySnJkeTNVQVU4?=
 =?utf-8?B?REg1Mitnd3pmeUd0bHlZYzc4ZEEzOU5UQUFmV3FHdENwVWpMajZDTHVFMWlR?=
 =?utf-8?B?eXZ1blUrWkIyZ1VTczdFRitocE4vbmV3bVdxbVJmbXg2elZZYTlYSytyaGFC?=
 =?utf-8?B?dTcyUVlFOEU1Wi9WRjZXWUtDN2RvVnU3b1FxVGNNcXN4Q216TVhPZlkrWXdL?=
 =?utf-8?B?c1Bra004T1BzMmxwNXZEOXcvdmZuVXNHbzVZNzN0d2FHUzBVRkZ0RGwvT0Y2?=
 =?utf-8?B?L2NUL2xrQ1FYSkxzTnFsS3hHWnlkQ3pBdzR1ZU1kQ2wycDlmZjd4MzZVK1VE?=
 =?utf-8?Q?DMTkNdN7rt3RUM6HoQuEizfxN?=
Content-ID: <46CAA98A80C2B449981EE4FF69BB308F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7991bac5-2ebe-4605-2fdc-08de1809d067
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:12:36.3341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTmsqrvJINg4+Z4HAz15a7sg0Su0UFng+GcbTQ7k60I8NRY9rjA+SmAjbWqbLV0GERAlRm8aHiStQ4xf+Xszlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_161242_040731_2B58DB5C 
X-CRM114-Status: GOOD (  11.89  )
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
> From: Yan Zhao <yan.y.zhao@intel.com>
> 
> During vCPU creation, a vCPU may be destroyed immediately after
> kvm_arch_vcpu_create() (e.g., due to vCPU id confiliction). However, the
> vcpu_load() inside kvm_arch_vcpu_create() may have associate the vCPU to
> pCPU via "list_add(&tdx->cpu_list, &per_cpu(associated_tdvcpus, cpu))"
> before invoking tdx_vcpu_free().
> 
> Though there's no need to invoke tdh_vp_flush() on the vCPU, failing to
> dissociate the vCPU from pCPU (i.e., "list_del(&to_tdx(vcpu)->cpu_list)")
> will cause list corruption of the per-pCPU list associated_tdvcpus.
> 
> Then, a later list_add() during vcpu_load() would detect list corruption
> and print calltrace as shown below.
> 
> Dissociate a vCPU from its associated pCPU in tdx_vcpu_free() for the vCPUs
> destroyed immediately after creation which must be in
> VCPU_TD_STATE_UNINITIALIZED state.
> 
> kernel BUG at lib/list_debug.c:29!
> Oops: invalid opcode: 0000 [#2] SMP NOPTI
> RIP: 0010:__list_add_valid_or_report+0x82/0xd0
> 
> Call Trace:
>  <TASK>
>  tdx_vcpu_load+0xa8/0x120
>  vt_vcpu_load+0x25/0x30
>  kvm_arch_vcpu_load+0x81/0x300
>  vcpu_load+0x55/0x90
>  kvm_arch_vcpu_create+0x24f/0x330
>  kvm_vm_ioctl_create_vcpu+0x1b1/0x53
>  kvm_vm_ioctl+0xc2/0xa60
>   __x64_sys_ioctl+0x9a/0xf0
>  x64_sys_call+0x10ee/0x20d0
>  do_syscall_64+0xc3/0x470
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
