Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5103CCD1AB
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWIG7nsIUZx4M6pqtS2n751Tbj1CqHHj0T+MzRZErN8=; b=oAk7Bj+O1vhznb
	vmNyWlh3gljx3hsiY4ibth5A7WKYRVpjkj8fcQtdJj9BQW/5r2YEYKlnHy16+F+mFc3OpxoVAolyf
	V0x3F9ZJUJIy0k646pd4RJ8wUipGX4VcJ7HdX+cTO0FStenixhkfCuGJf/fXlMig2DYhGFAN8PWbo
	nMHNOhI4w4IbOlvyluCFD9BfKtLUbgasvF3VyIBNpPCc058PY8HvVVa1jjYWZNjYOSHyl4wUnE8ap
	1sUkEk5wrT7tgf3QSR3VOkJ3zprAqYrJ3H6oNNTYZ5LNYDr4DIiAuZ7Oj2drjXSzmQTP+0oyNyDtk
	S9RZYicvcpiDS5OtPmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEU3-00000008w24-2fmv;
	Fri, 24 Oct 2025 09:53:19 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEU1-00000008w0v-37z8;
	Fri, 24 Oct 2025 09:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761299597; x=1792835597;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sDOxdNVCA4ax+0WufAF4qEIbsRs/qWM+v24TzuiUAaU=;
  b=W+XvddagNQ5KxN70j1toH3yD8awbit79fptwGC5mprPxIbr0mOhiH1Al
   5RgJdCArDAaeVZeT8kqbMMpnCMP0f7iW8lBzCd3Tv4l/wuBS3K5OWYI2N
   IvnGr5lebo63w/2bjSfDpntgA0Y9SRE6TiPE4XcnceRFyku+Y9yenASKQ
   zuv3wyVl7VgqynYWB0xrQnJpXZ74vvtLzJZTEh732VV46yk8hPU5wQKNA
   H7IQkdAp5K8Ze74anNGp4PSkYJDWEhRzj7j3kIQieMrKAv38wvpkTtVIL
   8syf0Q2+nuNxASW0hIWpnvZQZrl0cSiXZBbovFWth7QiyJ0Y45D0rIL6r
   A==;
X-CSE-ConnectionGUID: cHiORoYmSMiJ3qYkryLl4A==
X-CSE-MsgGUID: xv1aUTWPTAqOVS6dqkurtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521913"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63521913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:53:15 -0700
X-CSE-ConnectionGUID: VE6GGdlTShO1FMJLnm0wlA==
X-CSE-MsgGUID: ztgl0c7rSi679VfUVATFsw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:53:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 02:53:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 02:53:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 02:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv0jcad1VAY5hKohLr7JygFYr2HQnJ4NZ84jK5aQY69rhM5FhAU1RBJGp0RgEZaOIusLaFSDOMd0jtPuOKnL+xnYF9cUOem1H2Gc4HBzrEew3MH9JMSTNKUaYc/uPunRCIlajIc9nZ9CNowadsQv05/TmRDwgiSlJuXpN3GCyBQHfA9x4lxMniDQTCYr7x/lLhHO2dlR6QaLITNqtnb1hb7mwtvZXquz97K8CFlj5F/FdJQDA8N2SGu+ilZJ+CMgpF9n05V3q0C8Ihb9C88O4VmtW9a0JeZUqmTL0zMnk7weeYC+LTo62faqgty1UZsOHkl0b//s+zehfHPbEx20Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDOxdNVCA4ax+0WufAF4qEIbsRs/qWM+v24TzuiUAaU=;
 b=UwtlgAypmo8NKR+Kizb9T+4fiY8xzmmXrRgi7EkfzClJXLKVPPh0zGaNi/YVJGFmLQMrRBX3oPyaHkEV45U4+P1o/KpMlUepRpupwdnfxoKOwmSXLOb9kNbbbXD/Xce589uaMkw216TBomClU7RtYY8z6Rd4Ke9tvY148ovu1u04ABTXI5tGKZ43oJsl3Uy7+5fvmbL0e2xiQabUQCZ3rEqP3P3Zl021ZiDe0KxSuhC8j8FCvl20EpA8dVIWBWyLDSZ8pVs0/OBK7kbS+AKcCtN8bALeXiWynMSuwlJ6iYAhKv7UGaMvE0+nCdyXEl8Pm9XulBzj5O/iQS4QkpU1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:53:11 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:53:11 +0000
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
Subject: Re: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into
 tdx_sept_remove_private_spte()
Thread-Topic: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into
 tdx_sept_remove_private_spte()
Thread-Index: AQHcPv2oAefPIfagQEmrupWdYZHUjbTRGgaA
Date: Fri, 24 Oct 2025 09:53:11 +0000
Message-ID: <e8aa7d53dcfe4725e4b90065e0f794f900a066c5.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-17-seanjc@google.com>
In-Reply-To: <20251017003244.186495-17-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: e6607797-ad57-40fb-8f36-08de12e324ca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?UW9XV0owbGdlK0d5UVJON3dYVS8zdy9wME8yc1N0UmlzR0dRNmNPZ3pMTmZo?=
 =?utf-8?B?ekFYdXFydlNPM0dsc2Y4QzNRUkY3aVBTbklGbW9ac2lBZkQyWVZhU2VDK0NC?=
 =?utf-8?B?QUJBS3ZRMnFWaitzV05pZCtJcUQzdnBWUVppQmxITzlhTlRacUZmdTdaT3Ba?=
 =?utf-8?B?N1FDVHJTWmtyOUc2anVtUWlmU1REaHk0dG9MVzl0eCs4MmkzR0xidWFWd0k4?=
 =?utf-8?B?MDFQSnZyUkVNVlE0bnNwMTFDRmxBWUE0QUpScjREa0NRSkNlNitrY2FGTjQy?=
 =?utf-8?B?dW5KSlJtMUVWU0JiV1hKYnIvV1hIOFRDSVpJTFJBT0l1TzRaeE1xK3dCMmQ0?=
 =?utf-8?B?enlNMTJNSkcybzZvQ2dEYWhxTUFWcGdRbWZtQmRmdzJtYlZZWHF5SkhNMHEy?=
 =?utf-8?B?UkxzSWlUUWRMTkcwVUtrcDF3dFpIcUpvN0grQ2xPSjd5OU1rbmZpVjJDc2pX?=
 =?utf-8?B?V1FNVUprVSt6emxVa0pnSTA1NEo4RTVGWWwzMm11OFJxaU83MDFCVkN6ZDQz?=
 =?utf-8?B?N3dGdFM2MFVlNEtvVDEwYTJLRm9wSlZDZU04ZmRyK0l0enZoUG1BU3YvTGo4?=
 =?utf-8?B?WkVvYVZSZGNKd0x3VFoxU2tWWmJ2c0xjN2lyK1pZK1Q4cFRCNlFWbytYVDdI?=
 =?utf-8?B?RFY1VTZwc1NWaWhHNTJGc1ZJVUpnMUlmOXFsQ3JxUCszY3hnUEs4V0MvTE9s?=
 =?utf-8?B?TTVVNlVRZkMvZEdhaDlNYXVGMm9oSUp1TG8zYWZMejFMam5tcG41UVh2SDdK?=
 =?utf-8?B?eXpacVNuQktiV0FWc3AwZmtXVGREdGUrR0RaZCtKRW0rTDBjTGpTZEpvVllY?=
 =?utf-8?B?WWMrcGg3ek1HZ0c0YWFycmJXenhpcE43M3FTRGNqMjg4T2RjWnhaZWx6SWtD?=
 =?utf-8?B?c1ZkaXc1YnpGTFIwOHNhKzNVaEsxZ2VkejcxU2JqV1F5ZDAvRDRmOEZweGNa?=
 =?utf-8?B?OHZzVURYNXozTnJZNlBjbE5qdzRKdy9HT05NbjRRSUdobWlNNUVManMzU2lV?=
 =?utf-8?B?MGlvMnBkVGxIc2VaSXFqemk5TFphVGczZnk1bHczZ0Y5N2g3M2w4TW1LL3Zy?=
 =?utf-8?B?d0h5RDhERUZYSjVncTc2NHkwdFZyT0swVE1kN25mbTlFaDJVL0xkN2FGdHYx?=
 =?utf-8?B?NHNSbU9vUG9iTkFNbEFsdll2YzlVYVRrdmJWY0ptSUN2OE5kd3hFOFhSMVhD?=
 =?utf-8?B?ejRyU1B0NXpuUmFmTjVlVVJ6V0FHNjZUNTBSb25oYjVmZGwrRDhSNHcvS0FL?=
 =?utf-8?B?MmhHRUJpa1lPWU5rZFRaUjE3dTQ2ZThraTdtQWZRenRuanlHcnBkMkJaWkRu?=
 =?utf-8?B?NlRWbGFMQ2VFR2poZHVLbEZFR3dXMHh3bS93b0ptWHlTNFEwdlhlWUgyNDc3?=
 =?utf-8?B?TlMwakd1RjMwNlpHQkpXZWdjeXQ1WU1nK1YyTGhibjBITkpjeUJnN1A2ODJh?=
 =?utf-8?B?VG9NWkJ1VW84Z3VNMkc5OWE4VzVyYUNQUjFkcmdmWlhoOTlkNmM4Mm9RRkhx?=
 =?utf-8?B?WnI4Zk5VT2FHVEt5MHhnL1hxNGRxYTdOc3hFT2J6MHF0dE92S0tCUThTVUVi?=
 =?utf-8?B?Q1ZCamM2U1BtbEgwQkNDd3h0UnVKT2RxeDNRYzVYS3RRSzhtREoxekNNNWVp?=
 =?utf-8?B?d24rK2E3RXJmUUQ1eHhCRmFjTEQ5N2I1eW5mZVgvVkg1Tk9hTmEwRlYySlpq?=
 =?utf-8?B?T3Nodk5uMG04ZXhRTTZtTW5zaER6b2QvczVSQXMyVFdNK1NzNmFNOGVkVExL?=
 =?utf-8?B?RVcyZ3JvendvNnhHQms2RGdCZVVrNExUWkpLSUlNNnNuQ1BMYWlMRjV2cFFF?=
 =?utf-8?B?aldBSnhhSlFLZ0QrUUc0OTdaYjRGNlNyNGFpMzRSa3hMOEphTTVFdFNuT2Vt?=
 =?utf-8?B?Rmx1bURSVTMzb0JXQXB4SnZDZ29XRjRlUkQxaWVsNHd2Z1BhRm81TDVyUCty?=
 =?utf-8?B?ZTBqclBqRk5GRE1tTERNOEZMOGpKc21TaDBmZjRaWnFwU2VkWkZ3bTIzQk8w?=
 =?utf-8?B?VGxCdTFTLzBsdEtNUXZ3QzlIcU45L0dwbXZ2bkkyL0FEQU96SWdFeDZVOXlK?=
 =?utf-8?B?cFFLc05nTjJjcGpjb3cxa2FSQ3ovTU1DNHdrZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1I3dVRhZzZ0ZXRpSXdIbENibEh3VGZvYUxiM2gwaENwVDBrZkVIOVlTNlU4?=
 =?utf-8?B?OHpCMk0wTC81Y1l1czJDWmhGa0gwaGZTQVhSbjYzQTh4ZnhOa0Jqa1BxYVJI?=
 =?utf-8?B?T0JtZmdpSGFEcWNVZy9aL1NucUxDcFdmS3hmeVh3MEI3OW5qQXFoejl0N2VS?=
 =?utf-8?B?a0RGSG5Ea0RJeGVIZnd2aDVQN3J3Qzg5a0pIL3A1VG5zZ3lzVlpadndvSCtj?=
 =?utf-8?B?VWtnWUFKWXFtTkdhNmtoMWsrZEtqRmpGSHgvaFIya2YwVVFML1M5ZmFQWWFn?=
 =?utf-8?B?TVhOeUhyaEpYdEliUm1NK1BDN0V1UWlHQW15YUl3TTlFb3JJdkhmNktBSnNT?=
 =?utf-8?B?MURVUGM2bDdqajBia05XV1prdjFwUzVmWis0TEtGM1YxRGIvWjk1K0dHN2ZK?=
 =?utf-8?B?OUpOTU42V25lOFZ2YXVPd1FTSk5paVRhaGZwMDZNbklSVWZKUTdFUkRXU0sz?=
 =?utf-8?B?WkY5N0wwdnFnVWFLSGVqSHdZaE9yOHBVSFU1UEc3dlZjekxaWURwZE9NZXJr?=
 =?utf-8?B?UXZlclhON3JFRzY1VUltQmJQTkllRGR2OFMvNTRkNnoyamFoU2VHUzkyMTFn?=
 =?utf-8?B?bmNPODM2VWQyZ1BLM1FaU2FLYlNFVDNxekhiQ0M5cER2dG16MU9aRERwOEJU?=
 =?utf-8?B?UjhRaDNvUkVHRWdZNlVXWnJSUFpaVmQ3bHR0K0M3dG94YjlDbjQrMEFzU1Rq?=
 =?utf-8?B?Y25kNlNHdnV4V3U1eWZWZzYyU09tMWFSaEJDVFdJVVozMTJBSkZGTVhVRDI0?=
 =?utf-8?B?L1F5VUd0WjlGWU9sYnE2aldodHFrOEJRMmVQU3NlOVZwQlZFaGk3SFF2ZEsw?=
 =?utf-8?B?WmxWdVIrMkJtdGNpb2pXVURXbFZTaHhtYW9ReGwvYU5ST2RySnN6d2VBY1RX?=
 =?utf-8?B?UTU5SWp4eTlLWE41enNzQU9NYnRrSHkrelBobnpZK21JZDNiaWNaLzE1ZDVE?=
 =?utf-8?B?TkFMcHpTSW9LV1hoNTV2ZWlFRkFORWMvc2ZWaVhqMFY3TXcyMVRxSVBDZlVp?=
 =?utf-8?B?eWJBNW04c21NcGN3SzNrZ3dQOFZQajRQVjBVZk1xY0JtV3pUbUhlNUxoVzls?=
 =?utf-8?B?VG9hbUk0MnpDZjg3eUgwZmxGbU5tWFZSY0Z1UGhTT01jRkhXMldOL1FhdTdw?=
 =?utf-8?B?b2Y3RXovNEJTbElGb0t6QXd2UkhUb0FHTUVCZ21WanJaenFjc1RaQmxUY2R1?=
 =?utf-8?B?alRNK01pdFJCek5BWFEzTTQxejdxbXhvYkpoM3N3ZXBzdWw1c2NMckgvRVhE?=
 =?utf-8?B?R1ZEUkM4MC9BVk5XUTFnRy9ESVRBRng1THpnb1V2UnMzVmlscW83VDJiL2ZL?=
 =?utf-8?B?QXljbllsV0RPbkwwWVRJcTdXUnFDVHFTSDVqUG54ZmZKOGNaQTJvdG4zclJC?=
 =?utf-8?B?WXNFSGJ6aEVUVkk3MGw3K2YybFRxTjBJcG9lMTkyc0JMSE9CbzZVY2JVUldv?=
 =?utf-8?B?QXJKMjhQZUNIUGwvdWJYT3AySW9HQ00reXgrREMxNEZZTDVibXk1U3g4OVIx?=
 =?utf-8?B?Z1NRby9LVlFrenpBdk9PaXdYVjZ0QllQRnVYejZSbVBxM09LS3NJS0FFbU0y?=
 =?utf-8?B?T1FxKzlyVVZ2Y3Nud0F5NlIyV0FXbXVKc053Q2hLRFVpandFY3hOODV3T0xR?=
 =?utf-8?B?b2xuVEdEdWd0TUJjTFQ5dnJVQit6cEF1eTRlbGdBdzJkbkh4TC9hK1hTUFVQ?=
 =?utf-8?B?K2JQemZHckdlRkQ2SUZ2L2UxMmZtUHZYNktMZUJ6SWxpMWZvSzVvOWRBWFht?=
 =?utf-8?B?Q1JSaDVxTE94a0JlZ1IwRHltNE9YNGNPeE5BLzJZRkxqeGpEREo4K3oyT1ox?=
 =?utf-8?B?N3FTZ1pmUlAvb0dKRE1HcS82amMreTFBMWZlUVlPNHdxNlJNbHNIb1lpZXF3?=
 =?utf-8?B?WmJNSFZ5S2tTeXQ4bjRrVFM3N0YzQndGdGxxb2owdVVkYmN5akhyd2NSc1NR?=
 =?utf-8?B?V2E4aTNGNXlJZWdONTB4RTZkT0N5MzlkWDg0RnAyWVpIN001KzYzYTJmY3li?=
 =?utf-8?B?QkhTb1A4cWdsOC9uM2l5b0pjRThiM0x6NHJlTm5vRkZ1Yjgrak11enZjL083?=
 =?utf-8?B?Sm1OSTBwcmpaQVpxRGIzSFhKQWdaN2ljV0k1M096aGlFSHd1Ymg0eHNTWXcy?=
 =?utf-8?B?eFRVckJHS0pUT09IYjdlQXhBYWlvZzZFMjkwYjQrU0xPdVdmTkFzajlZcHgw?=
 =?utf-8?B?L0E9PQ==?=
Content-ID: <716827902B76C94E9FDB5C94A201101A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6607797-ad57-40fb-8f36-08de12e324ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 09:53:11.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQ10OIImYxMVniCViK8JTbZtITRQObngmAs/Jq/p2/ZggFTijeSuwdPFfk/nvPM8WgxJ1QyatYv5cFtj7BLk0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_025317_821798_C4C05CC9 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
> of using a one-off helper now that the nr_premapped tracking is gone.
> 
> Opportunistically drop the WARN on hugepages, which was dead code (see the
> KVM_BUG_ON() in tdx_sept_remove_private_spte()).
> 
> No functional change intended.
> 
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
