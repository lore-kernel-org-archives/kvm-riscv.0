Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB37CA0FFD
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM4daje6RHSM2lOyf82O4KaMz6M8gol1HFZFPXvJ2QM=; b=RkY3XJRdVKW3/s5ZH6UNBedUo6
	dgaYkpN2md5+uVOn+j6TEmoQap68MXpw8u1iXAyeR6i+tUJjPraVmUjyPt0qADzk8PjVHVUFrfRe1
	hEK6CLFBGo+I0cip9nDzbZQZHrLyKxRBtkAyDUskYdEEkFPRjDJ446kMkVJg5DwNeLR8okokLDxdD
	D1Cl9a8QsCbZ22rH5S081zxowjT2ew4IUqCfksjZlirVysGco7/W+SdIX53rlc0/hMj2v7B9ECedq
	1DzrRpSFBN1L2MsZq5VL0JSbbSScSwYGVIAqaJuHMQ3FfzRjpCMV9KXfMe7SJQBzCiVey/ZMnreLh
	R/+S+efQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Z7-0000000Bhgx-2MpU;
	Mon, 01 Sep 2025 09:11:05 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Br-0000000Bd5n-0O5u;
	Mon, 01 Sep 2025 08:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl/lHf3oj6nSmXGUsDDU5bILXO5h6+Z9q/g+Lc0vEnfvFhIrml3YEF8DZGbykq7Ix6qIjvEDuWeiCl2ZTYBrZHwBL03KNbenhf5H8vkCg3Uztb4ThyD9HCUngYV4gTd0QuvujttRZbNjqnY8utPYkcwQtrGzbpz1MuCQtZAxnG5n50H08MmM1WE6wtxyO/WnslaVYTiwdCfuHGyVlVm7aaiXk6Z3E/xiOfiMCOzJfhjXdq/3J6Zk6qBXOATfAuUfclHmhwjqszOooZS7/pi7qDJ4iTHhfwVBFKqvUNmZZqM2xzNOtyU+9kPO7kjhgVRpv5au6tGXD7kQrJXz8W4AQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT/uLmHHtZaIE90Bmf/rsbmam/lrLb72KVCnBDUu1aY=;
 b=MYKLHJbCV58eJiUlyQmQexQfBnp74hiyXeZ/7TFJeAaAvUx/3RhAxB77a0aZrVwKKQHWQjAshpTBHU9O6/KwI9AiiJlpbC0CG4EpkbKTVk149By/bMQdfY1xoFNDrzMIyk5d60q6SWSSnYG0Ro+zLR8QTPBmYQpI4kSgvXnlpi/8puyQ2P0gVbDbXuAlmCF+cyoeDs1dbBXu93Uw1Z6zUjTxpiTxfd7UspcOvyaFoA3S6HlnOKV0iprHdgI8TyDIEMGrBg2qEYdLmJ2TgEw7ToJ0vhA+PBCkD29Q0McZC7ckukAjRESyq6QgiHIc0Pr/Ak282Z7i6jDzoXyb5bzLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT/uLmHHtZaIE90Bmf/rsbmam/lrLb72KVCnBDUu1aY=;
 b=fob8bwE89QPHAAypPC3nZtAIVe6yp+/vDIKZUrwI85DovTKlRLGhkv9s/6JWQxAhXqgk45s0+B+oDKMC/U88vkhaeqe73oZ8zXazRwXcLHDcGBFEaBU+Be9543Pj5AbuvVtPzw1OW0hewDL9YNuPBQIRyV3qFVnNxQoB0eLLzOsIJFqAh4WnkU/5pun0Y7M7g1q1wor/T7HU7OvBSO8ikN6s6uwptk0dmJHwBk9M5oF4U95pqQsCK/WP+Dv0m4hbcZl5Aliqo4UqPglj4KvoOvwHM8q+0R7xnZinX58xG4/Wq7xjCykyaDD+i9ee08R5sxFuRPS13SeHjzZiOua7aQ==
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com (2603:1096:408::966)
 by KL1PR02MB6682.apcprd02.prod.outlook.com (2603:1096:820:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Mon, 1 Sep
 2025 08:46:49 +0000
Received: from TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da]) by TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 ([fe80::209a:b4cd:540:c5da%6]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 08:46:49 +0000
Message-ID: <TY1PPFCDFFFA68A8153B498CB93E0D6B3ADF307A@TY1PPFCDFFFA68A.apcprd02.prod.outlook.com>
Date: Mon, 1 Sep 2025 16:46:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: riscv: add Zilsd and Zclsd extension
 descriptions
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, anup@brainfault.org,
 pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com,
 cleger@rivosinc.com, charlie@rivosinc.com, cuiyunhui@bytedance.com,
 samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com,
 inochiama@gmail.com, yongxuan.wang@sifive.com, ajones@ventanamicro.com,
 parri.andrea@gmail.com, mikisabate@gmail.com, yikming2222@gmail.com,
 thomas.weissschuh@linutronix.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250826162939.1494021-2-pincheng.plct@isrc.iscas.ac.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20250826162939.1494021-2-pincheng.plct@isrc.iscas.ac.cn>
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
 (2603:1096:408::966)
X-Microsoft-Original-Message-ID: <e7c0e227-b2d5-4585-b7b9-7b8a77cd8bcf@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFCDFFFA68A:EE_|KL1PR02MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 39459f96-b5a0-40d8-c08d-08dde9341671
X-MS-Exchange-SLBlob-MailProps: ZILSnhm0P3lt+CQaDQ/GFiS22dDR1p20ds3kLBrwSYT9PafwGmoPIVvpv9+94H/vPOkaFMFh42zwYBHdpibLIUdxqtyYFCdN6C6YkY2cvP7M92DHi0jCSZvkCzGhtY/2URQeXeMa75RLX9tCPX7zLjvKmX6TvsFGnVbgewH/FDuVwTBdxRMO54gabYkagfKjNnJPz8+MT9R3saS6/oqGV14679ZxjoUn37iCwnuoymVBREo3F/XuckSRg1GZQm57t9BPLOSStU6QVcHe1QmKW4KIUtUXfBLjBer0tH4aXlB0C+gIpgvx7tep0VY+mWpT8OWqswHWTZD/fWfkPo4HV/ufmzn5+sjXDU0G241TAUT++7v+o/g9qm9cPsUVU+7TXMlutYuDdS4GhK3R+vFaC1KGwXNpajZeMftqw6gS7ubrMnFPoYbHzKDdqBKww8VFFucuI+bClO1TEWalCI1QckMhr5OqOCvNKIG4EuVM94IpxHjuh7Jf6wBip9Bua/x01DtygNMI/SHyogsaogWb+3274sS0yOx7igfEq0FPhAJGVJDudoU3AEVzodR11WGkFnoOiX8ud8xGB//KTT2wlDUkMQ3AaKoShB5jBz6DxGthf1B5JyQMXi/xawPC2eFJ9yDLMnJZgB/5Qw+YPQ7X3GWissNoRQFjGa1U2j4vQQwVjQRwsUfWCa85QowgG+yo86Fx+37EnH1/5IokW1s6ZjDgc2gUxP0AtA09xznloHxlH5y2tw+1amqv3Y53N60QpaLdDJqKxYUKCRiyTWRLH5bNRL0Ij+Kd
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|19110799012|6090799003|461199028|5072599009|8060799015|15080799012|36102599003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3hDYUNKL2hyR3lXSDMzOEdoalBBU2d5d1ZwWnNkL21GT2doY3pmdURyekxT?=
 =?utf-8?B?Zm92SWlwTDVFSDhNYkFIbFpVRXBCYU0zVXp1VlBzSDdxK3A3YmJQTTd0clJv?=
 =?utf-8?B?bEMyMnpRcTRQb1ZCVzlNNTNoUEZmMGpXVkpIdUlWSFl5UW5LaU93S3JxcUJT?=
 =?utf-8?B?QWc0L1pWZE1SQU45b0NpeDdLdHB4UUN0K2tLMFNwdVlHbFFGeENwUnpncXF4?=
 =?utf-8?B?K1JzbkE5MU5tUFEydzJ3VkJzQ0dEbm9SUGc5aHZiSFEwR2NRV0JGWlU5Vk05?=
 =?utf-8?B?L2p2NHM2SkJwY0V1M2VXditrMHJKV282akZPekMzQ0dlNDkwb1ZUTzZMYWo2?=
 =?utf-8?B?aEY5Y0Z2TVNpVjdoOHczSGtwSzhLcVdiZHRJeUw1M1B6V0J3eXVwYVFaN0lx?=
 =?utf-8?B?ejdxTEp1SHF6WElnRktITytjNkpXbjFYYnpOQWhEdkpyaVN0K1ZHQnlvTzJy?=
 =?utf-8?B?UmhwcTVUT05PTmNiU3lHeFZBU1c1WVlkQllJMldLLzdJOFMwR2ovb1NpaEFu?=
 =?utf-8?B?QWpXa09HZlVVT0N3amdWRFRENmQyVDdhZkxmV1djODBnTEFrTVpJWCtnMUpL?=
 =?utf-8?B?WUFhd0ZENVdBRlR0Y0JXR0cvYUZmL3ZNTmc3Mm40cUpNbU44dWtGdWdtMity?=
 =?utf-8?B?dTVnc282cFZlaWRramxKb2x0U2g4bmpWdEs0VGVDNmR4c1ZxN1pqd0VJT3RQ?=
 =?utf-8?B?d0dsWXczT3RMNE4rQU1FMHdZVE91UkRZU1lPRlFycmhNN0xLSi9vNVBwMzB3?=
 =?utf-8?B?cUNIdXlnMjBZc3pBSTdxaERPZFh1b1o1Z01LeCtLNWd0VWc3SUJQeDdCMFNK?=
 =?utf-8?B?aXptY251b245NEVtSFNjTk1RbzdyUks5Mnl6Y24xT0ZraFd1a1JNM3FhbmhR?=
 =?utf-8?B?emkxSUEvVkJUbmNpYUcvdG5jbUo2STdwS2k5bmxWdkVEREtWby9FS0w5RGoz?=
 =?utf-8?B?NDY1R0hJVGFSU0pUK1ZPdkY4NlBMRXhZU1hYM2xNSGRVdjRxcGdCZE0wWlVq?=
 =?utf-8?B?WDhkM29HYkNiMzZYaXhJK3hsbzlqQVBPTXI3OVAxcmJOVVFUZW5aNStYbTZK?=
 =?utf-8?B?Q1dTSTZlYThsSzZHYm1CZndpT2huMll1NWRwdHBramFoMHE5NFVGRVgrL1ds?=
 =?utf-8?B?MGg2d3ZhcUpWUlJwb1JJUSs5WXhzVjU1Ty9aSFI5RFBZVnJ6RzFCbEYxdDZW?=
 =?utf-8?B?QmdaOGltKzFRdExMald1RXBQVy9Qd1crY2FpWnMrREk4cnp5bDBvZkxyR0Ru?=
 =?utf-8?B?anpuUWFUKzdjYnlQTGV5Lzh4U3dMaWdEUEhJbWhNVUdJUkFUN0d6WWQwa1Nh?=
 =?utf-8?B?cmJlSlNtaXJPSXhWaHZidmRJUHMwejVrWkhrSFlpdVVad1hrTkVRRytvTUVW?=
 =?utf-8?B?alQ4aW1taWZiS0loMnBVdFJIM3JWL0ROUXNvOVlBK0dSaVlka0wwdmVHcTRF?=
 =?utf-8?B?RjkxSUhCWmFmTlAyR2Z3a3lGVHJaemNnN3VWdkVOaG0rdTFNb20xQ2d1OEZp?=
 =?utf-8?B?K1ZTenU5UC94ZGpQeFh2bzYvOCtiWnFKMDZmY3lxcFZRRVJxdUdvWUJsMGRi?=
 =?utf-8?B?Vlh3NzZvUlU1Z0tZOEdwWG9CWFhJRk8zamVGSkNoYjZPbTNMWDUwZFdMeFNi?=
 =?utf-8?B?cVRINWxMK0owUmsxUkZNc0dFODhvVVE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNCVTR3aEYwZHRIbGtsd2xObXJkMWh5bmQ0QVZ6YWl2UkhEZU9EYWhSRFJv?=
 =?utf-8?B?M0NoNVhjVWhzL3ZhSzB4Y0k1UUNreDNKTC9VdTFDclpmeUlzWFBNM28wc0NV?=
 =?utf-8?B?dTRqOWRFOGxML2lFcTJTY2dqKzFQMS8wdE95R3R5aVJZMnA0V2d6UFF3SlUr?=
 =?utf-8?B?N250ZThNaHpmTGxQZEJDaHFSb0thK2JMNkh4azd4UzVEYTJLcEZPSFA4S3pS?=
 =?utf-8?B?bUIyZ09kcUNtb3N6bnJwd2M2MEg2bGFBQmN6WjJBd2dWdElGOFA1dGdWai9X?=
 =?utf-8?B?TEtCN2lmV3RDWW14UnNyQ0MxTzZ5QjJ5dmRQMzhUMmxVcEhldGJPa0o4emlP?=
 =?utf-8?B?bkQ4enU1SlQ5SUxrZkp5NEtZV1hVU3pLOG1WbGtrY1JSckpXcm1weXJyRzNt?=
 =?utf-8?B?OXhUVWVDWk5OeEN0blpKMGJaMmhPMkd6akpUQ1hKM2x5RmFzWkFKNUE4S1R0?=
 =?utf-8?B?KzV6WGdFRkFTRUlQZllGODhNa0k3WjlHL1V0TlJIOGhyYm4yQS9sNXZWNUdl?=
 =?utf-8?B?QUNTVTcyOWRqd0ttZlFvU2YrNEhOZ3V5bUdtNGpjNDlVMGxrV3lWVENMWDJZ?=
 =?utf-8?B?Vk91azhmRHZheElwUDRSRFBMRlVyRGtkVHM4VzJVZmNXMEowWVFDYUpka1Ra?=
 =?utf-8?B?czU4YkVwTkZXaG5ha2FhNE1RWEsxSE9sZWZ1bFg0NDlPN2RFSjZudHg4Nm9L?=
 =?utf-8?B?ZU5PbmZ2VzBYRkRHaEpZb1JYa1p6bWtyOHk3TkdYZThrVFV4SGt3TDlZR2Jh?=
 =?utf-8?B?Zy9xYXNTSlYwbnoyM280MHVaT2ptMGhlYW9GYkRtZldxcCt4UU9iTXREbVBi?=
 =?utf-8?B?UDJEQXc0MitMQUcxWHlkVmlSTlJ5K1NaRmhtSmVURlNOY1RuKzJNQndPQlN2?=
 =?utf-8?B?SnM5RVh0clVYT3gvNXZ2L2Nxc3BRK01rZWp1cy9RVTVPZjBaNEQ3UUtGUXhL?=
 =?utf-8?B?RTFmQU85L2VNWGNXdmFLZW9rclZHSkFwQlJiQS9VN2I5SGt2Ny9TQWFLOHZ4?=
 =?utf-8?B?QU1OdkJzN0xaKzdNd3JNb2JLTjlYajJIcDEvK1lWb2t2KzFVR1VLdTVaWXRQ?=
 =?utf-8?B?NEg4MUdFaDdmS0w3TEoxUzlxVDRuWlhYMVdZQmM3Qm5EMFlheWFCMzdTS0Fv?=
 =?utf-8?B?WE8vaGhLVWYzZ01sSk5OM0pGL09HY0hDcFpWcG9tZXpnWlozU29TQ1hNZGFw?=
 =?utf-8?B?L2NibHRqOSt5YXY4Z0Z6VVRGbjN5am13WDNzdmZyd2pLNmtkblRzeHV0Q01x?=
 =?utf-8?B?NWNTbEtEaHlkY0pWbEdjTGlBT1dmTGNIcTFVbk5xNGhERDFqMThXMThSU0ls?=
 =?utf-8?B?dFk3cUpDU3MxRG9NWS9vdVpnYVl6QUFlRFhGRTFqM0ljL1Y1a0xEMjNJTmdq?=
 =?utf-8?B?NDV6eWwzQnVQMWFzT1ZQMndaVnFneW91K1d4T1B4QXRIU3pXZzBHVG16WFNM?=
 =?utf-8?B?b0RSQUNwQXVVcTBiUnBIMXpSKzFtMWVYZXVrYytDODJUMVIwYTVqcVhQUkZw?=
 =?utf-8?B?YUtEdk04cjNmSFNqaDEwZzMzN1hrbVl1Wkd0alcvMkJVSTc3V1RWY2dtWDlT?=
 =?utf-8?B?TWoyNm1CZU9mcU1IT2U5UXlYRTEyM25Kd2Vxai9DaDd3REFibDJycStZejN0?=
 =?utf-8?Q?esbUx7C2/yNRcKr/cd4J1zsTx0wPtYLcLK00gpFc73qE=3D?=
X-OriginatorOrg: sct-15-20-8534-15-msonline-outlook-c9a3c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 39459f96-b5a0-40d8-c08d-08dde9341671
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFCDFFFA68A.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:46:48.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_014703_138127_26C6BD94 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 8/27/2025 12:29 AM, Pincheng Wang wrote:
> Add descriptions for the Zilsd (Load/Store pair instructions) and
> Zclsd (Compressed Load/Store pair instructions) ISA extensions
> which were ratified in commit f88abf1 ("Integrating load/store
> pair for RV32 with the main manual") of the riscv-isa-manual.
>
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> ---
>   .../devicetree/bindings/riscv/extensions.yaml | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
