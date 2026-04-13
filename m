Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98667EBFD00
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXqsfOfVxgkNjLz18gQFFbBMELEc3cXe2HBIOFhUFHA=; b=Nx6AQ5lZ4JdMB4
	O04x5MbfOpFBKV5x2wuQPNW+FjBcWvIyJwNENA8lAe/jZ9arE70B/ARGolO+DpnLwIYum4o6TCNQC
	TwCluGgj1Z7jFliYgnf23lcgnjxE9jyYXLaDDymdhTMW3Kp3Hum69TIuaaVZPTPe//odiwYhSLYCG
	I7U6TBxUAxYReQFthhwL78WRZF6gmpeQg2rlR8II8rYzqmaSr8aAonc8f4C5VTHGV9Q4m6TG2NVez
	/gpSS1YavMkiBDDj4/dD73Wv68UOXcU9ROaCIo19OHsFGL1tDSKdSRz1H1RKPBb7+RXQCyNsW+rsM
	7Y+sqldKxvPGLo7cPfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB2r-0000000F5is-0U32;
	Mon, 13 Apr 2026 06:45:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB2o-0000000F5iB-3E27;
	Mon, 13 Apr 2026 06:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776062715; x=1807598715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7YEWKcBZjp5r4gmwEEI+zBRzuyoEr2PxZgMYJwr0QzA=;
  b=LsJheUygoy8mNIm9kW0mWEgHTWWRLN5shVIQGzQLIVPGc8yywp/4mQFA
   h2LWh5ZMt8JOYpEnmNzO8tBm6GX7hP7C+NsQwBxcl6xur0B7PVG2zrnVD
   GYhaG8DbSJBWFdUpsV+0nK0sXQogvMWjapM4ubxA9GDy+1vueksqmX16T
   1yZ+amG9uipOoNpIfGjwcCMiHiGXyX+z3GOJaRKzh6puPiAKSNeWZDymy
   3MtFkGCKsWESohNZuJQM2ys7NfE0wIQRMkxDg2qiko3NdpRavkLMQIUxC
   1wEjwAzjPN77V2rzjUTkJAUhVDkx9a5CQCIMeAwKIe34cvDbqpbJbhW3b
   A==;
X-CSE-ConnectionGUID: UIja/8ZlQ4WFDeFjnCLw7g==
X-CSE-MsgGUID: b5ldyHDsQFKr9aZmyJZ37g==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99633983"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="99633983"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:45:12 -0700
X-CSE-ConnectionGUID: fkFZBLXQRkm8NJd6u6t9zQ==
X-CSE-MsgGUID: RRS98VQmRr658bmIDumfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="231423560"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:45:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:45:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 23:45:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzH+fkAUM6JLrigvhihW8IOzo4WbVV97aUSD/DvJksm2OnNAhURb6hOten+tWW6rm2Zx040+a4zQx5JQGMDXlZ/NGRA+yzuPGvhyUNzGAoAioAYVQMk/AukwdPW0tYoc2tzr/vc/ibthFzmMzRwV08dM8BKUad1V0vo2AIZ6mQpJHlMMPScdEpxg/ao/merIi3cOr96PjJKl7yfHHMHGgmZ21Xt7PjjGFpY5HBZUW7E6xmHabfnntkZJCNEC9YT1yLtr63Iv6LDN0gDag8ckpYzSVVerquSWn1zbxHJgcIai2To9ya0VaFXpd9Q9E1OBbclJoI8LpAbVNUsgEntKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vw4SOTJY/7Pqne84FqIh2WozzIbCO5o+adB5nW8bbg=;
 b=Kw8nSnknjm/37Tlhvi9EWz0ATfJgNVSmZF2DY896a2Dxgg2p4FXx6SpuoZVwsKVuIJk4+VdQPb3CgfFXWClpJQ3yMMMJGjfStYgv6BkWuqHQott8JRVyy/rLni8U4BWDhy7j3HztD6kcvcX6Knl1mny2LKatdC8dUZEFXIRB4rizguj1HXPoPS305N50OCffWD0HJi1M54e1wYpo2OOPleg9hvg1yAaPMKoiGtgvkIX1qoYX/QwWNOtDVdYbhHutoiPLBdy2EP60/3wswiSgQ7gVCrpAcMJhT5TAD15yMlP4ctIcKIBnJ/6KSaUjOVJIuTxtdhhoDLt6u9UuLcAHYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 13 Apr
 2026 06:45:07 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 06:45:07 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "fangyu.yu@linux.alibaba.com" <fangyu.yu@linux.alibaba.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tjeznach@rivosinc.com" <tjeznach@rivosinc.com>,
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "vasant.hegde@amd.com" <vasant.hegde@amd.com>
CC: "guoren@kernel.org" <guoren@kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic page
 table
Thread-Topic: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic
 page table
Thread-Index: AQHcyVoUCC1YmRUO5USYpadYHb2w6bXcjzZw
Date: Mon, 13 Apr 2026 06:45:07 +0000
Message-ID: <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA4PR11MB8889:EE_
x-ms-office365-filtering-correlation-id: fa60d10e-2cf3-4043-6c17-08de99283369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: VPMpE4ZTkBya8/11/WFT7zMEFW29XaCJ+E+4I6A1NeTpC3Y1FofFF+KgZ6KJjVycoxkTY4MeWU9cOoZlAXKFPYRCCvP6aw4KF0jAAeW4Jw22Cwkie1DifdtiBV6ZT1BVuQ2ol+VTw8stvZbTIeKobx2PaqK+wMCmPpxpZQJ2dtgDLfJ7Sgy2nTHJaENavUSUWqygWRB0kbVvyDRxSCLfQfuoCHEpTFWw6EuidYgnnRyXJXM6nu3F8IzAq+jeuNB/DVG5e7e4VXKUeUl4udc5xXqAATUN/YOfkjCYyt5OCK3P41ZR2W1KBHLccvk1sAOF+4QWOUe5WCg1zUepr31nsQ27HQuMFjzm/GDwshQiNsoqf+Ks6ktlIcfCfCKpY/n5i1kuW9ygEmHPzuk4sTNMjss82X/FMR86DLpbsbMsCCqhfhubxyjV7t8B9bCNE4K0S3M9J1RIPu9noEfUodVl9HkTYtYTu8Liu/ITPfXT1DKViaR+mTuooRrKOhvmzLxR5lmJdzeCJ+jVu8dix3caaNxfLO88APtt/0qADJxeYm8pu4tjRgAVff/dsM/SswCCxG41MRtYvhleyVmra4Nk0Yg+1B197WUkR3qLihOSqi8WucJ40JqlB3/KfXzOJ/6fA9nM9+1KDrQ8CsURA5jeFbrv+ANFT1VCoHNZpjiuTZpjv4glfoJIXZ1iZRfiaQEL4cDoXz2jWPlNfkrvTDBQKNR3EeC6ZsKqxyAycG5nsk7mt/dRUaB07H+fdeOaii7jfcVqrvFG1Sii68G3KDSmKUQ55ntz+rJMQK/kNrlXTC8u0majxGO06rFffg6Oj3f+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kfk79omzYg74c20AceGBdiaY3hdxVjiw7I+6eGMUz0oVuTDpM+zNDIrYPKBP?=
 =?us-ascii?Q?gL+IkPJpH30u0gipFocyLfspPCa9R3LqfTDOJUObnmP7tJ8ZVgcpiIC9FbB5?=
 =?us-ascii?Q?ryaNDqSlhhtGm5TwQkqx4jQLGZcJaCrkmDAoio1ofT2hB9/Zsq07Tax3nXxn?=
 =?us-ascii?Q?PFp0WBxsuWMbI4rfWfB/rqcs/7TK+QoNd57MN4PagnbTQmuXhEq55DM76WTo?=
 =?us-ascii?Q?T/z2lC9+Fcz5ZZE+cOpFXt+WLSUleP101wFKcaHwoeuydPEIKf1zTLJdI7CA?=
 =?us-ascii?Q?wWqPATQauocKp7pBhvNk5xaSmJMu5Y7/fu4Sp4rAjmN33mKrfucaa7s7Wb8G?=
 =?us-ascii?Q?jgB2xlJ7xFTcxM1OR/LmTUf7wH8++ZYArDIf1bKgJbcCUCLKM6upyTGUPn3o?=
 =?us-ascii?Q?Wp7woXP/a2FoLSd16x3ptv2Y+ScrdQ7Z3ZhZShx/KZjzXDTGKCgg7mXgo7r4?=
 =?us-ascii?Q?fe6PJQeuHXP4ts8IgUL9dxkMSUyiNa9OHK8HihElgzQHw8CeJc1noztPR/EC?=
 =?us-ascii?Q?2tikyR9g5y0CDwi/+uvT8TmLBCeClphEYe8hkGOWwr3zhKbjZDr3G4TAuIcC?=
 =?us-ascii?Q?p7L+H8OjUIOtTJShXr+mCN2ubYPE4B+9CuQdalj17VSGw10nCh1HF9DrhXzN?=
 =?us-ascii?Q?S60wGMq2qc0bSqzvafN0H1E6XzN1terYkf3Kezz/WEfYg9PgV86oniPYUzRG?=
 =?us-ascii?Q?K4FKhUAkzTS4xkVyVqWUeucKKOgF7V5Wi+EZT9PzMgoQwT9TKpNMil3zf/PW?=
 =?us-ascii?Q?+upWsHy91L3bMtgTXO1BYjnryYOUHO1aEDS/fgIeor2yCke/uqdTGl2N+Xns?=
 =?us-ascii?Q?xSEphfksJDt4XDfw6d5vkKi5RF+iETzbgsRo4Ev3D+yKAzJtKNcVtQOLRKoT?=
 =?us-ascii?Q?vO9c6pI6fq/Y09U6TTC/fzEyLw1579q0l9oUGxAZxo3zMJZQnFrBok+Wq7rR?=
 =?us-ascii?Q?FzuurYiSYTCVOOD7bClwpwJU5UbRTGACassi2cgzfFRQz/cPtIiaCvqp/KSl?=
 =?us-ascii?Q?EBtTmx5ZmZrzdpQC3R2lOi08Zd7uO40g8VeT2pPj1/yTnlcOBZoVywngVnVo?=
 =?us-ascii?Q?EEHViUy0Bw7gsR1Ht4Ie/LlFPBPtXQmTq0wmhzU2Hfx96L6a0LvuK8bY9tHO?=
 =?us-ascii?Q?CyfksWeUQwZVlGPUP2Uox6VZZBEF8UD9EcPuLFRGddja72MouOJhlzFFjYTd?=
 =?us-ascii?Q?upBcJm3IxLG0L3fEqSw2Hs2vtiS8IYCQy7EaNRT10RMBmOqtx5jdpoYOeuWz?=
 =?us-ascii?Q?J58/+iqNL2I1IuxQXqG52z55z3zQZ5FO+zOI5gPCtWHyCbRfZsla3CUYyKC3?=
 =?us-ascii?Q?8fKCt+G4snYCP5HtBt4lmO01ZClBfKXCx/wBdBuTaRRsh2PLwXNu7VChzfnj?=
 =?us-ascii?Q?NyZYVRkgKCUnbRqQqFDB7hzTsG09GdPAw3yhXpvZi71xPSsnuIJtdok7RlcE?=
 =?us-ascii?Q?0yH78zpBKI9ODUA125nm2479cE9hmywVIfCeh7L5hz2d96w9pzI4MmuGjDhO?=
 =?us-ascii?Q?89jcR2tT88Rx5GXSvsdu6+fWXxoBV2YbKESdAQEjUdUpM7WmCx3tREukN2lm?=
 =?us-ascii?Q?2N/Ldm+ZFqNx3vAX41p2GovCR+eeUYNAl8yY/R+zZa3PQVRcUxRo5l0nUXgZ?=
 =?us-ascii?Q?fMVOBay4O2f1Ut6DFGW0TibXIqpdLAn7Q9RPgvrBRl+hpv5g/vq1bXeYbiSU?=
 =?us-ascii?Q?eBpuwkmelXTCN06ikFpWD41QAiIIaZc2jsbH2yoEoSb1mNj9?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lRqwP+cwIYL8VU07VxZ5SY9yI9GihOEc/nxi7eKprVXQg5Ss22SJJ9Mpl2ztUCgYDXjqmaCI5gl3tRvL4V4DRe749Ab9c6f7bYw14OrsLiQNFnoB+0DJ+LpaQ45yTUC1RIVbH5EJTksL0reVknEgQTFjWLWj9MXSdgP2/OJOjr/PS15m3naxXJq2px67xb9EMDGLRI0YHmxDiQRlyPzkbJnvm1u3bYnVZZ91LUhHinvq9RbuZjv6KOfawO0z6lJ2E0VQajjVjcomMxRsiBLXhItsNoV/W6k0v93L+qQ6nVjWBLDVjuoXLMwnaQX2wP6+fiB+/LVzblklQHEDtM8Nfw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa60d10e-2cf3-4043-6c17-08de99283369
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 06:45:07.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYzppeargjBtduT0psnoPj8rHwdEgHo73Id17bGsnY+RBCqxs84wHg8PIrAtpm27Udfm/esMar/c3X473nNHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_234514_860395_49A166ED 
X-CRM114-Status: UNSURE (   9.07  )
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

> From: fangyu.yu@linux.alibaba.com <fangyu.yu@linux.alibaba.com>
> Sent: Saturday, April 11, 2026 10:22 AM
> 
> diff --git a/include/linux/generic_pt/common.h
> b/include/linux/generic_pt/common.h
> index fc5d0b5edadc..dfadf8a5752a 100644
> --- a/include/linux/generic_pt/common.h
> +++ b/include/linux/generic_pt/common.h
> @@ -188,6 +188,7 @@ enum {
>  	 * Support the 64k contiguous page size following the Svnapot
> extension.
>  	 */
>  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
> +	PT_FEAT_RISCV_SVPBMT,
> 

nit - every feature has a comment.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
