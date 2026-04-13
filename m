Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3BEBFD03
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9KkkLN1Eltwx8ZfDyp8gfO8CmI3KXCGzTcZRhOVj5A=; b=SQ4ZSMPSEkc6aZ
	DF0y4cBKwuB496kc3vDL4JtGnBWS/SzmEznd4R9jR2u+FWN02UtMksiH0bp0KPZOn3zitJMyg3P9S
	ySIn37PWXyOKq63W2Gxfm+EC3JwsF+H19kXJcNk9zY1J7q2T7r+tQzhb0Bpt0vxQAmGtncResoTbH
	xM1LsB4DjZVnl0p+Pae9w4Hawgh8jNrEwkJ+pZc0PXbi+LdmocHB5T3C6DH+OAtZcR19aIXQWVsoV
	GRUd8p2SiUeE+sdVBC7tUjEWXcHS1Hi8+tXsLPruziHSOs1HcWqYmEDQru1LX/jrXPiyM2ibZ+zM0
	JLC2AAflQqASuVSzPmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBAx-0000000F6I2-2AFa;
	Mon, 13 Apr 2026 06:53:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBAu-0000000F6Hc-3vmu;
	Mon, 13 Apr 2026 06:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776063217; x=1807599217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Im/0i5m+PyZXKx1wQAky/Sl8xMd++8jGkmeNgnnxWXM=;
  b=JCY6eu39Qxywh/5rQf2yBBKEWhJfGdj6U4Wb/S8dW1POl5luMGNuZMDO
   R6LKvRP9HlNYk7MC/zZ/SPqrIUckve7+QyEr/f/W8S/mg+8fQh+374Dvc
   m0RD+F2EdwJi9MQVO4F3rJA/aYy96g932V7p9sC2XEDNGmkn5QTwfbxB5
   KaIntiw0o1cdpOJWD+P2t724wQ1/9E5WoQUHnY0Db1tW4D16VOWsNJZ3A
   Nf6qaNNH1qtNmHGxMgTxWFcnJJQoNEIONHAyBl0fw5CHfet5aOD+Vafzm
   UWi3VQA7MHApD14XCp/pV09koRxS++PMJu/SKAEff5qlJIpicmf8HOYDl
   g==;
X-CSE-ConnectionGUID: eYWLwNBNRLyNIG7OQ2EcoQ==
X-CSE-MsgGUID: TSE16F0aSiCqCfKeowa8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76876306"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76876306"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:53:36 -0700
X-CSE-ConnectionGUID: v9jO3FAOTCKZhYj9/Say0A==
X-CSE-MsgGUID: 2E9omG1YQUChkjbpEGxkxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="229577518"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:53:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:53:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 23:53:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/VJwczqqub6OzzCwuVXsBwPgCilJf5j1T7xAfUUdoQHHXoH3Tl3WJyxMIScoe3pjgFhBEw3fUK2D2MVRRYz66+grZLmXIEUFg0aOxrnc76Ld0akC8HxuMtiUNKGg3g963vaDti/wlL+2ANQj2Yl10+Lh/5AxOX+duF3AYcPDCHQNdjHv8Dt5DDC9QgXyEPdCNvCuZZNaNVrTyhyUDUvCUAyfepuKl0DBMOpi7mdnMmIJEB2M7FK/LZ3zcJyVwz4XWlPSuzSCO2OP3sCfCxMFxbtbdeKJC3VgFGCQt22/a/o+c72kFlAywYzScIuxQ8eUl1nzAbxlDv65sFoTB13qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOXOUeSgNBRvOLnNaYvj/tbEop+5bA7Iyi2dIMFC6Tw=;
 b=YH7jdqs9j82lNo5LiLFNYI60DE8t8rf+AsHErRUCifOhPiZNqhMoP85CSBXQqOVlKSZj3rHH+/enUltrtdlWE9YLBKrqEctNtrpXe1Rh8ABjEYa0sRuVriPVNIuqNtoTHn7wPabTf1jPsB2z8wo6+jYjXQJH1srRKAJxJYHDQQ0IGTxaYp/0bHqXvrjCAhugh0lRhWhhNSbL0bsEr7hzxhqTrQsiei38eFe5Ki8TenCknPoAIoDfFRNNk4hRE9jOzPpDdeotqllnOQzdyHbJMW2r+8o08VCbNAPXh17vEyhbiTObP/AoO+6B1Z5cseafvK+8eEbR5bMd6pWXxXdAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 06:53:31 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 06:53:31 +0000
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
Subject: RE: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
Thread-Topic: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
Thread-Index: AQHcyVoToXmo96CSqkCNLZuQIEsNtLXckD5g
Date: Mon, 13 Apr 2026 06:53:31 +0000
Message-ID: <BN9PR11MB52766502D575970096482F428C242@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB6665:EE_
x-ms-office365-filtering-correlation-id: 9bbe56a1-028f-49e7-d402-08de99295fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|921020|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: P/wfsJmoVJABmWLAYoar+lxnda5IGZy8MsdG6A5POWF6wJPrY4boxFkpbdgpx0sLax0dJQ8jKemMntP2We/j0xCHMyg8En/tRgqF7yYoXSC9tG9IywU0t2t4TBJv+mOdNNZ4zCKTWG9thBunGFRXFOuZTFXYqGUeHsuvKeC3tL0w2trB/c0+KRPnwGYSlxnNngoMlAchtRBzJZQGLeGYQa+/KguzVlatiZ2Zyrw39o78Bqt7n7fW26jpUdSJdBK0PfwvkslrpXschgV20hO5QlFWarZR9T9PBJyxt7OHG7L7j82XYGqi73IN1dbeUVpUvjD4aRwVL8L3Psm0ZF4fZT9XHZk02lTmuNJV96U/Qfdt+Cdb62isp2c76VBwF5eMjuvKeA4EPAAIiPlS5Sbovcqcm6HdQwHjZ8gTnrHsmS5rZkxMRo7fB7VyvAXhV0WeX/kuNnSnSDW0xePqHHgHAw7RV0gpqe4J3gGpzwhpFZsN/+Jc/wJTp3IgHUMjVd2BwWnnwXvUKi15hgS2uakuei78Rod9+814Q0L53hS+fhbVcVf8GKZ7cowZ81wKSpgk4Sy2wZBHT07oMVzcKZaSsAcJscPnR9EQ+9lPxZczc2LZh473Zcr41dvnXZymuYAvH/8+/OFiTT/EWcyhNcfc9Kl7hvwZHvqmpkVRxpBmIkm0sA6LG0lffZBF8+x1LeFLyeQDQnHx0KW28mQ/5mWqqjj9Mocq3S4Fv8lAhcTLvnGup1CpsFOuGwuoInLZR5XJQ6Cak2dGhodgXDIlsHt6Ex96g5MayefwB7ttcu1sZ5vh5kS2Y4WnOtLvOlojaeef
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6HrRRS2Cg0GxqaV4e1sAj4YXuNUZfxM2yaT7/XZ6h/M3Sd1Q7BYATvV9z8Ek?=
 =?us-ascii?Q?2QoB+h8AbFN0LbYpfBwEne1/KcNVy/+ODIRQk5Elq+TJ0lzKhc/h5UzzPSkc?=
 =?us-ascii?Q?5f3fb26aJjsTpeJv16PTOy2C8IMMJhn9Ya0S4U7zwlOKwOlO3Eu2HG+HOePt?=
 =?us-ascii?Q?xhn3T1dpVxP0VPBBTNFyYlCztqFTW9QfkNEqdF9gVgidNdxy01j4QO8vbXCn?=
 =?us-ascii?Q?k6flS1vT8IcSUWhS7jV9awAMX/7PphWfK1kgq1GjYZcylqQ+QErayYWuhFzO?=
 =?us-ascii?Q?KXJxnupyHSykUj+hV1sggeZekOp6d3LsKtdacIgHJk3URF4BYfirfWaJi99H?=
 =?us-ascii?Q?ZhIvDGUSKezMD8lzeq7wYJ0Bj7o0EcN1lT16fbYJvNRWnrLxqgYnWeYeXnhK?=
 =?us-ascii?Q?Pqu3kfQXfvcRxjw0zSSZXuMX96idUyRVImQp64VialX9bTcRvrZalICQZRHk?=
 =?us-ascii?Q?e4vhwV1vNbOHcnhkvWcnHAGN/8MrJFouLmkK2IpxU0rfNoFuB5wz9rY7KkXW?=
 =?us-ascii?Q?UTbCe4ZqvsOjbf0cAd8sbw4bXnus/3/fLYYjqAQeRY2JweJ0GUO+VTEyKht+?=
 =?us-ascii?Q?t+7K4DS4589qH9WRt9C9xG/XSXNFvkV/Z7e4LLDte+Iz7bLOflQ/OKh5S3qq?=
 =?us-ascii?Q?ORB8J9QtqMSEHuOd6Lwx8uvicBiwV8vuXgbAqi5sqSBaX3JugfTLXPAVJpjh?=
 =?us-ascii?Q?6ggpTlYQT3gsR6YjQxKTzvG2vpCjn7C9MdLJBhzOx8ZYH6Xd38jhCAJAfqdd?=
 =?us-ascii?Q?/PQXWRI1g0oP7bP34npFMPUQ82JN90TIge8ci2IRaPaEbjX2oQn6fv/+poRT?=
 =?us-ascii?Q?w6pRAJihOo53cxi2/+0s7bj9KPhv3vbm0bCPxbfamALLjvAt3s4XhOgkZghg?=
 =?us-ascii?Q?2gN9Gw0dzWLBWf/7/WJ5/T/7LdIeqvgjJ/7btgrSPlQpCpLNw/ecbNMe/bwz?=
 =?us-ascii?Q?djr57Y9dNkqNvid2M0CEwz0FtTppH61e68UWQCbh/wxex1Tnv48mZwwWgkan?=
 =?us-ascii?Q?Wfk4AR+vc3w6Ac+6QbSD0pgPp75JgPb4sacqu5ew+aU9W6zna+4Xlpnfvjg0?=
 =?us-ascii?Q?KYPv0n/dCIikndibdgcPJtCcmYveIDTEYoI8WucfU/12uYjlJCFtenxqOBve?=
 =?us-ascii?Q?o95ojMQoV8ow5lATGCwpQPTrDklRZYfeUkOSAf114JkwsGAK8LZ9zKYBe0jY?=
 =?us-ascii?Q?xJfYB4CUZ38vH5+tYp02Q70GwpHWo8fagiTFl7DT8aL5+AXE+fBC99oN6p/V?=
 =?us-ascii?Q?lts27RJ8q2oXdbU2kZlUE+CQ04KZDyE1wBJp/NB6pKYRnOkdIIfOuJ6aCut4?=
 =?us-ascii?Q?U3zlGYYKm/MCgseH01J8hH8eN+x6j/nGRLwc43ZKbG7PEHShEKI96zWR168a?=
 =?us-ascii?Q?6RRfxDb9Xc+fiNUcedpM2IQ60S4mnnetMWz4C2v/Wkm3BOztEtGjwhONPWxX?=
 =?us-ascii?Q?wXs2i3Jd7ppvIbyUoPVINq06+aYKbnJiSWrIhST1kZoRAsVMUnBH1HE/LSdU?=
 =?us-ascii?Q?FUeS3l2cv2BzMm1XQD+GGR/+NODou/e0bk/MRKkFLbUqGYYdPQVcltjDzEjq?=
 =?us-ascii?Q?DJm5K/D2znYvG4XFwbXyQLidgRkE7mOdKoEQnbupxJJTpjv+oV5NN/1PJaxn?=
 =?us-ascii?Q?mCH+LWjQJDSLZJjcWKbFpOx/YmDalJMH2SDHI2PUFa3xx9IU/gD0hnTE0Ak9?=
 =?us-ascii?Q?H4Oa6nnVgZVxRsbXv8xkhlXTW7a7hKz1FcKmUXtojTHub+Vj?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J+Iq5YJKdOxhGTB2KS2kim1hHW5cVySFlhy+LYhALh25AcQYW3V1z6Tpok+qxr1tV+U34eq8uEBxjAOGa85SgSdMnAgw+VvQh020Jl2wbrwBCVbq9wr9VUrAONmQd06vI+cufnO66U8cgl4tGPccr0HjN88snkQ/6Jg4USc1Aakg/EtnH2dh6S3Hw0K57DJIDwRRiQ44EofC8091mS6YUF9fr3xlQv2rnN9LVHhJEeeWKJgiirjIvKPZZPWLqBuy0RP6yTlUAVkElX+ZaDV3lqI/iM2rpfZIC6ieBlpkLoIShpOaQ9KarL1THMbiCYUCjxM7yVh2BB+QzZNsrtmTjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbe56a1-028f-49e7-d402-08de99295fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 06:53:31.1563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3tkb1PLfonGk4J3YvRT/o/ESTY4enfz5iGH1qS3DlL1gDZFbX6iLvUutF8QnGzatV8Wrgdn+yyPdMt91+7OdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_235337_026905_DB11DA35 
X-CRM114-Status: GOOD (  15.17  )
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
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When the RISC-V IOMMU page table format support Svpbmt, PBMT provides
> a way to tag mappings with page-based memory types. Encode memory type
> via PBMT in RISC-V IOMMU PTEs:
> 
>   - IOMMU_MMIO   -> PBMT=IO
>   - !IOMMU_CACHE -> PBMT=NC

In concept IOMMU_CACHE is cleared when IOMMU_MMIO is set. From the
code PBMT=IO in this case.

So strictly speaking the 2nd line should be:

  - !IOMMU_MMIO && !IOMMU_CACHE -> PBMT=NC

??

>   - otherwise    -> PBMT=Normal (PBMT=0)
> 
> Clear the PBMT field before applying the selected encoding, and only
> touch PBMT when PT_FEAT_RISCV_SVPBMT is advertised.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/generic_pt/fmt/riscv.h
> b/drivers/iommu/generic_pt/fmt/riscv.h
> index a7fef6266a36..02051bb3c6e5 100644
> --- a/drivers/iommu/generic_pt/fmt/riscv.h
> +++ b/drivers/iommu/generic_pt/fmt/riscv.h
> @@ -58,6 +58,8 @@ enum {
>  	RISCVPT_G = BIT(5),
>  	RISCVPT_A = BIT(6),
>  	RISCVPT_D = BIT(7),
> +	RISCVPT_NC = BIT(61),
> +	RISCVPT_IO = BIT(62),
>  	RISCVPT_RSW = GENMASK(9, 8),
>  	RISCVPT_PPN32 = GENMASK(31, 10),

sort by bit positions

> 
> @@ -237,6 +239,13 @@ static inline int riscvpt_iommu_set_prot(struct
> pt_common *common,
>  		pte |= RISCVPT_R;
>  	if (!(iommu_prot & IOMMU_NOEXEC))
>  		pte |= RISCVPT_X;
> +	if (common->features & BIT(PT_FEAT_RISCV_SVPBMT)) {
> +		pte &= ~RISCVPT_PBMT;

this is unnecessary due to the earlier assignment:

	pte = RISCVPT_A | RISCVPT_U;

> +		if (iommu_prot & IOMMU_MMIO)
> +			pte |= RISCVPT_IO;
> +		else if (!(iommu_prot & IOMMU_CACHE))
> +			pte |= RISCVPT_NC;
> +	}
> 
>  	/* Caller must specify a supported combination of flags */
>  	if (unlikely((pte & (RISCVPT_X | RISCVPT_W | RISCVPT_R)) == 0))
> --
> 2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
