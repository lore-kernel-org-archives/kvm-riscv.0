Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1616606A336
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qHHQD/89;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZhyB4lGs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JM1afYaO21yo2CXi9KpcCi+RocRGRWxlylTCvalCJo=; b=qHHQD/89kiiSJl
	FUVZu80iy7AuMmisehfYvLvdhkSGVnRA/luWGJ9UUXu2j6r/6YgyYPcckSYP6OxLG9gZo9ccKgWN3
	VhCMKJXnT4g7qXtcjwmqCEQGwFM63FzwlgA4hdn2sUdDj410SFb8TBD88oNL3Qq0Avh8CMqNGzbyi
	lTcjIY2BZbtci/rfgQGhOqShnF0fEAuNJw8JXjri9jo55ZPf7iLnbTWYwSFlGeIC/zcLYBltIGHBV
	KeI0MfSVwIylAjI+Tcr7h2o6+zqqOQUblo0vdY+R8M0MRBG9zqRY2ROJ2J4cK5L8S1YT3u8ITVqij
	Bz9Rx+XeyI297c7lFXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEGV-0000000APIA-1UgX;
	Tue, 20 Oct 2026 18:08:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEGS-0000000APFD-1Zum;
	Tue, 20 Oct 2026 18:08:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7I013460816;
	Tue, 20 Oct 2026 18:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=IQ4zvGekYPfMtSAaxWMF94dHFJYhHuletSbV+SMWGXM=; b=Zh
	yB4lGs9ZgoEMpI4FXDNdQZmrUXZeVeMEl6tVXgQvQMncOgClbr09ec1g0x4PWMoO
	hM8mjJRrE1UNKcZyMSgJqyFQ3biTe4NRHYUFKhz7wrOU90iYIogEbFsQhgVlpABA
	WACLX1EnQ5Dp4PtyNovt/+q7mLRFAczOpz5nf9yi8h5qEVPzseTbWzcPuv23ue7w
	br3avvS+ShCWNKKxciEyz5F/qe+pApv6bxRgLlA+4I0XnFEVbKwSVkVmt8tBUHTT
	Re0em8QE06QJD19zrq/vVjEYAkW7PLwNJ0yK9Xw2Xu+ZJ8g3RQ27ZgPZ5l4gaXBo
	j1Y8b4cQluTkqLTEoBTQ==
Received: from cy3pr08cu001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4r061-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 18:08:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYlapLQ/G9Wdg65pjNkF8E/hdJimwbCRWJ7xluEKp58GGAgjZ5A3YykfrESKvr08caayltWNulOxFeqj9gtRHMza54wVXNoXoQJ4r4rQDyITV2E4ayyvGSu+hkjMX1C7Od+9H6pSkPIV1QoTT6vzHbPqlC8MiMRHYlmH3Zb/GtBlKIMmUqs6z5JL1uIvsqV3dbBIkc8LwpInI+B5KiGwv43j3V1oR2tfShirpgqQ9TJdRq5yYcyz9PxT1Qu1YU9s9tsw+grYOmYdBMBMZWlrZvp3oBhpDnMO2EvzMl3BkATw83jo6GTzYRcGTrZvisteEosA3hQyfUfrNSQx1S14Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ4zvGekYPfMtSAaxWMF94dHFJYhHuletSbV+SMWGXM=;
 b=ig7gMriL2vn5dxJZbU1PMR49K6dTLt3KFYPKdefaQTJzO2WJLjPMsats7leRL4j2gLM9A5eYeyQADY2NQLdCbZ2hnaOnohQ41ad6t2ht7IcODa4F4y5auGMrYoJpkeKOVM4owoK/E+/NfVe7/HRAm0xTnoo8OcjKn3o6gso2jnwmnNqWYmci/EHmODfxzqf2B2GXBvhgKe628uUjY3rxOlKhJ35e6RJU4VIIR68lb/YRMvMN28l3PuQiC2hmJb06d7sUWrZJPv8fmWiEyJfIC8knFygBIPaet5Cbq86EFyQ/U5KRQZcjI3llJDfm4vy4ntZb8tMtmBzlYtE6Nf0sIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by DM8PR02MB8056.namprd02.prod.outlook.com (2603:10b6:8:19::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 18:08:11 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 18:08:10 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish
 Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Andy
 Chiu <tchiu@tenstorrent.com>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Thread-Topic: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Thread-Index: AQHdYL336iWG1dFFQUG+XpNkSDypqg==
Date: Tue, 20 Oct 2026 18:08:10 +0000
Message-ID: <DM9V74ODA23L.36WJYLIGDDVMG@qti.qualcomm.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
In-Reply-To: <20261007085126.222688-3-samuel.holland@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|DM8PR02MB8056:EE_
x-ms-office365-filtering-correlation-id: 8c28cf77-ff14-4c45-4c1e-08df2ed519c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: AdgNLFO9XHtAeOloG4ZXRLwGC11rS5g1mvnwLyIA0N59Y7Q8GeMeGpue4xxSlgCssKmpdB3J6J7DRsCYik7sFvSjO2LLZzsftI5g9ZS1BEI1zcMDZsNYZOO6KHZf54ZPcUNzL66cM92pWl2fXt7sQExpY2f+WDeMtqOR+NZ0S3ETrc0P7AppPtt3pWV1PV3TC0FapWqqUZYI6mmeYn4gyl1+XfA7Hmz1AUtDruK+i7OWMRnM6vQ28b7C0eRoBIND5RS/QfiOYyKh4SINZM2DNBl6JTidx11keG8efdHr7zNHBMogkXaV5LgNKqzVwNz7fM/ChzFHx6/fpr6jUVFbwaLWWDeGMIVCp7w/LMzwFRT0yZohxobKmdOT72MM+LixMSPQxbddP20bSD/PW9OBUhViCc2hn8O3FOX6C+26n7MUSEtffYnFQ74ZcTHFw2ZN6wZhdJcCqhYjHQ9+RsZAL1IfPPHAxt/FIXUznjBy4JEq824peBIYP5/Okh+O3E++MWR05BiPQp7dQAJJ50mSL3/IfN8BEeX5QFZJ9z3e/eYQx3rb9BNm4zA0OhWz4L+C1UPnIvZPlG32qD8kcYed4pP+9jJRT2veDKcqz3zMR1LRCmrH3LNPfitPJCAeBmpZD5NiSVoOZsZoTOb38kMYq8E1/gIbg4w0NHzKQv+YPVI1WTedClp2YMaRo5oHFeANRFEml4BmYpZyTQrubNaAXyF4cvYp1ppD+UHew/EDNSQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2o2bTE1STFKTkRlNmcvYjkwaWg1OFdMMHV0b244dk83SDluNWJEUnZXeHAz?=
 =?utf-8?B?dk1EREZXclRRL2Y2cW9pbWIwK1FQUExOb0VoTVRrSWw1UDJTeG9aYk9KQUxQ?=
 =?utf-8?B?M3NFdFpMZU03QXJzaHVwM2dBQnY0SDk2ZVh4aHV4MFpsb2JSYzBabXA1U082?=
 =?utf-8?B?dzQ5VVZ5WWJaaVZsaVZQeTlIWWRJb1AxQVFzT0xXRHlMTFArQlBMMEJxY0Vn?=
 =?utf-8?B?UWI0MWRTSGRFVnhEMWtoMW1lWXRPa3R2L0ZtYW4wbkJSelI3ZEc2c0thYlJY?=
 =?utf-8?B?QVI5U0pKL1dBVnI3b2NkdHNUd3RLYlVZMVBPSXpZNHZsOVN3K1kvQ21jWlJa?=
 =?utf-8?B?VUJFUEZwOXo0MXlUOUZzZnJEK0JNZFdONEZCbHBJNTIvU2xwbkRqSFMralJQ?=
 =?utf-8?B?MzdIRG9iZmoyeUNXNVJyaW9NbTVjQkg5VEpqRy9RMTVuQzhHT2pPdC8xcWlH?=
 =?utf-8?B?MUs4QUxzZVF5WnFqTkt6TElRdVVqbHIxTmJySDUrVjd4cFU0SnYvVmdwVDQz?=
 =?utf-8?B?UCthTUtMWC9uc1liaXpkemk5Uy9heG9xWTFMN0xQMGlZa3hDWUprVXZVOHdE?=
 =?utf-8?B?QnFNMk5IRVZHbU9PSzBHRnkrb2IyZ3N2SHA5c0tpNjZ4Z2RHdlpRcDIvTGlR?=
 =?utf-8?B?a3F6Q3BqZVpiOXhEbjJrdXNSYVoyQlo0eWd6Z0tobVdDSmhxbktNSHZMMnZL?=
 =?utf-8?B?Ujd0OGc0WVVXeGZBb0xETklQTThzY3d1VWFRL3hJeVNVWGRJeXVGNXU5VExV?=
 =?utf-8?B?Qko5amYycnhCM0hZRUhIMEJZT0p2YXBKbk9XdXlFcTJMaHdFR3JqWER0RGI2?=
 =?utf-8?B?RTlxcE4xNXhsTGhkU2ZFL2Qzem9hT1owQVIxVG85enZZR0ZuMzlFd1NyQjVU?=
 =?utf-8?B?dGg5Y1o3a09aSmU1UTZudUd0NkIvZFNGWnI1eHFaRjcxTTJuaG42NjBoYTNi?=
 =?utf-8?B?WXlYTnVhQ0VRRzNocUJWTHdwTkJPT1hqcXU0Z1ZpVWdJOWR1SjRVUWJzZS9u?=
 =?utf-8?B?bXRCMDRETDJNUUhZNGE4UjQ2R0dlQnR3Y1hlMHFXT3k1Nmg3c3d6Znp6N2cy?=
 =?utf-8?B?ejRmYjBsZTNKY0puN2Z3YVg2azRxYkprM2VSc2dqb1hwSUNLbmNhdHUralpm?=
 =?utf-8?B?ZVNWcUo3Tm5TT2FXQ0J3R2xIWGUvanVpdjJsTTF5UmxjeWMrTnUwREJIYnUv?=
 =?utf-8?B?QVNyUlozMEdyQ3pJMTIzaFJnRVFVMFNsMXRXUXIwV3lvRStZajlNcHU5MThQ?=
 =?utf-8?B?WitRQVNrNThxMWJHSXgzdWg0M1dqSklwMlhrbVN3TVArd1BMQ3QrNFVTaS9p?=
 =?utf-8?B?MEhabXhKL3p2dXh4M1R2S0o3MFlyWVhCUnI2OU50Y1orQkh2UlVpRmZaOCtR?=
 =?utf-8?B?cjhSUmNpeEJXQXJSUS80U08rN0UvampNM29xNVNjYkNoWWJKZjRVVXlvNHFn?=
 =?utf-8?B?OStVYWVqbHdPa3RHQnNnTmgrTVA1OXFaR3JtSmNLOVB0Q3ZDWHFsTEEreCsz?=
 =?utf-8?B?cXhnMjQ1V1RDK2ZvbnRPSnJhZWZnV2k0WDRtdlRrOVJvOGJJdU84bTNRYVJr?=
 =?utf-8?B?Y0JyWldoMUF0a2JaQXRjSlgxUFhSTDVVNkZTcUZZL1E3L3ZlMlN6SldpN1pK?=
 =?utf-8?B?c09Ra1RXUUNQQmJvSTBzZkx3dWV6UnhHTHdNR21LR0dZT0k3ZWJodUpxcURn?=
 =?utf-8?B?dG9IVUd2dFJtQm9uSnV2OUV6aUhmT2QwbStQRVJsOXRJNzQvNm1NYnRPQncr?=
 =?utf-8?B?MEVKekM5WDB1TEt6WCtrWUlDWk1KQXRxekFTanN1Zk9sTGY0RjVHWFJJSVlC?=
 =?utf-8?B?aXVBRmdCZS9wYjd6TEkxVzcrYUNhTWdkN2tpL2lMSHVpVFNFRlFySHEzRzRC?=
 =?utf-8?B?OHhibjdDSysxWS80MzlTRXRVcktMekFqWnUrOUIwWlV0aS9iVWFMMG1reWZH?=
 =?utf-8?B?LzB4T3kyQ3dsQ1Vabjk0bE9ZK0pkK2w5UEExZ2hhQmlhV1R5MEZQaC9rcW4w?=
 =?utf-8?B?THVCb2Z3VUpSS3Fyc2ZFdE05WDd3SDk0cTNJLzExNkRmSVU2YzRUVzBBSk1E?=
 =?utf-8?B?enlLRktRdjYrc0JEYTd0eFlvdUpvTEU2Rk9ybERkYU9kMG1ERFErU1ZZc2xU?=
 =?utf-8?B?b09IdzlJYzZIM1Jqd2gweXAzeDFCbFJ5S1Bsdno3dlBKaUlHaXlndTRBN2Za?=
 =?utf-8?B?M3J6OUhXQXhqTExlNm1ZNGRKbVRHZmxqQmk3Wjk2QXlldlRDTTFBV2tQOUFn?=
 =?utf-8?B?dkl5QWVVUFNrMXgvenRuRFpBQ3NJeW9KR2JPRTgrSW81ZFFsK2VLNUlUdUVw?=
 =?utf-8?B?dldxS0d6RVVSR0w5cXFXa2FQSVZ6NTBUSEp0TGU3ajlFa2lwRFg0SldxVllN?=
 =?utf-8?Q?0iSMKuoGdW/9zqk0=3D?=
Content-ID: <F63C12D342AF7B4F9E9F8268042C2F3D@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2PiRJrtPCD4dL2BOCMa0mva1JlotKj021+a6mBcrJ8AoGPHYgpMZjrXziE12wkEaNlzzN4vNx2weoNDJbZVWX91y042d/xpt1naVLfoysYF2um2v9FySGGIhIe9tHcaCrkB9j9uLxedU5bw75PHubWrUxSu3UVvyL09V0r+3nl7P4jxVuj3FW33guY/d7TWD3A6KS0cj7z/DAnbEx/P93P0lf/i+XEt/ijmmhDGyDQX+h1NR47Bu4qYq+xQE9MVr4QG1VwA4a2YaVz0J4RwZFafvFd7FxzBfL5vzSJWvKRntwy1n85K72DTZCDWeaYH6XZI5OOq3Pmo2xxHVzqJ+EQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xECgEU3MQO5kWlO8H8vhLvhmJ110Xismgh6/VD59RYSZCBpJJ07YcXTATDnGdtY2ggLQMq3efRGeQJ4saURhBrx1w8/l1yJEaFZEF7IvsqiBa6XCI5Xj67dZ+SqH+lpiZnm9Iej2LP99vTS39OxoIYlIPPzoKMJSncf4hlrUiI7nOHbKjMiSdKPLoh6yo5UFFqMWEiAmmUCnGxpIMVzCqUQID4IU4GLgUSKOqA/fD0SgoYlqvM2dVjAirGJKW3GU2F3IBZNgzjuKRXJsulO4bdJPQniwDKIRBnaklgi41R6gXNGLzFt6zPKITLKrs9oU8aImpi4funx7iTVoVHjnBMMadxk73o/ADuhvCR5za2P7url3hvChrVxrhCqe2RpnRCNhzazJP5/fnV7FINL2gBOx7+g+4BNBvGYRCw3OdD7HQngZ8M0lqMy3w/bdpqfyDbRdziGvx3Z7S7Ae+PalzaQdIXKs7eW7ULqZgDlsYAmYBbgShKZBdHtnKmBGdXBvoBvynDcxTfD7R+xalqW2+v8jE/dvY5crMfqX/mL7KO8+CWeoWAR3Wut0R4Vcyf9edK9B+9tiuCEErH+qG1LM+uuEyTU5YDocDXqlwFff1WGWoLp0xR+BJvWj94S86zHP
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c28cf77-ff14-4c45-4c1e-08df2ed519c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 18:08:10.4449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJtUhwYzM9o332z8aDuHpZEw8ZTCdzptbj3JEhgWfd5kICCzyNztjkkPWdzdLeiN7fYeYlSWDQu4WSBKLSvdTVxHzid3BbgmaB4ppfJ3M7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8056
X-Proofpoint-ORIG-GUID: h2vTrhPasIRVQDcDpwCskiOlEITujyqw
X-Proofpoint-GUID: h2vTrhPasIRVQDcDpwCskiOlEITujyqw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3MiBTYWx0ZWRfX4p0nUmWvAA1+
 qfqrohBS7TN55n6uSIhMiEn5y7dH/co65+u/NWcFtb9P/tdtQCU/GjywURFqFzSQGE8h7QtIpYw
 ryBpVqgdOSsX9D2oRVIY8aESQbLCYZ4=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7ae10 cx=c_pps
 a=DpTreEsoTQaklvYkDh6UiA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8
 a=U6HiO35bu0YROvQKatgA:9 a=QEXdDO2ut3YA:10 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3MiBTYWx0ZWRfX6ZwM4tY5iMN0
 e0gROTntMDcOSz3/EAtTK2xY82D38sQP9P5WHWnzYA2+RjFPBF9qgmu5ml6UmPNYt2Dh6BaB/06
 lV/mGDqEIeCurpr7BhdFJdWpVFfV9A0uwbvVYM1OXXa2l+gr0+twaGSB+Yb0O52a/h1ZHvIquTf
 XyGjfMTVU/SblseBjXlAOklGG5DyaXABZnskfh6hKrE0LkFu2B4VzS/e51iqktt9IbyaqoEKF+S
 NJ+73NC4ijNGQvaNcFiYW7SLKtwkEPY81ZymcArA0bNTisO1xjyv1B65E2pSRn+FosiYjpt+bcY
 W+lsefdlNeFCnDmf/XKjCice756rQNWYiaKlt/TZ24AWdVsGtawVJ09+nFr8x2hxF1q9wbqSKLx
 hd+AacnTG5LNwCDtX5lw6ho3cqj/hxyaJciqPJpP+mnizJXOJybFxXLpbuQanoBWZoJsN+GQtOk
 MrpNI6ozndzEYF2qUtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_110844_445253_EA7C33E1 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -0.9 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-10-07T01:51:17-07:00, Samuel Holland <samuel.holland@sifive.com>:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
>
> Since we believe it is safe to always allow vector usage, hide the prctl
> and sysctl behind a Kconfig option and mark them as deprecated, so they
> can be removed in the future. Note that significant userspace software
> like glibc already considers these controls explicitly unsupported.

KVM on QEMU breaks because of -EINVAL:

  static bool kvm_cpu_realize(CPUState *cs, Error **errp)
  { [...]
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
              error_setg_errno(errp, errno,
                               "Error in prctl PR_RISCV_V_SET_CONTROL");
              return false;
          }
      }

We could have somewhat softer deprecations by defining that the vector
prctls succeed when user intent matches the current state and deny any
change.

Or is RISC-V still bold enough to "fix" userspace and hope for the best?
(High chance of Linus.)

>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Would be nice to also update selftests and vector.rst.

Thanks.
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
