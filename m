Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA494F513EE
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 03:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VcQ6MXoIpnoifPp63/OtdPzHneizkzqBa+G4m1XGRU=; b=LtV2HP8cgRMJ9azkPm61vZlsoQ
	g3FCxDdE1Qt6hiDhXR1kU4YLibM+WXxZpZF11D1DHF5HWrIEiOQr6QpeIa21hueFNUGGDvu6ajfzt
	Je1LoAJqoqCEmjufuTVm2Uh/oOg0ZUNk43S7Gs/z4Cyv9yitvFEeCo2c2WVzYE4rOuIRXV5z9KLV/
	pZPHqo4EgD8GFZE2SuYimAWMfMRaN+DQJhjurs+u5CLxebsh77aupB4kSpFKGGdSmKybx4PcaXWBp
	XroERWJIw7TlixsVc7V+2A63Y3Lh9YtIbB+HIT1dCrr1PmmgiQVxfDi3ltCXdE5MHFMZS6Q5BTx2M
	/PqBAvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLyF-00000002yYx-0UOS;
	Fri, 06 Mar 2026 03:35:23 +0000
Received: from mail-koreacentralazolkn19013086.outbound.protection.outlook.com ([52.103.74.86] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLyC-00000002yYB-1yid;
	Fri, 06 Mar 2026 03:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXABWCX3YFVZRlAZVt+2AVEI4oFxT9UiZSh2rxbWcscH0jwbR9waPaSQNPlVDOYLitKWwJQXcyNlC/15wIQZKbenguo4yJBNuLL6MpOZsr9Wwy5ZogzM2+bMl50vRaiK98jsIMQZUhhzHYRNmVvSVC795UNUVcm2nqwmCMb5lhwWHlXKevhUkBBB/1G7TQPzsKHgX+C9HnYjr7umKtl0R5Z4RRdk56z00FLgPzZe+CXj+W/vsPeQB3LldjuQHS86x4VTJR1mj7GJyV/L2TK+Lc+dJGUT/EriLU9jgGHsF4l539o+D4F5NRiqez2ecAoKheDLcgcoJWfJxwW/NnksiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN7XuoFcoeylCzv84+en1fJPBufZS2NPH7ky2tsE37k=;
 b=FiFrjybMEwnfSQ2xvH1cCAoZZGs6ytHCnHuBsWfPLVaXxoZj9c4XhAGZKZE44bB5+zu91V3FeFPV/dMEwuZpzOK0UPeu3wnH2s/oH4evi7rsofadL1EEFGe2snoRG/HH3IdCVhJAC51f5iHmj1h66zgXDXE8OaLJUq1I5Kk/cBtcu/vfKWI+psnr+yIsWRYJ2r9+H3QfPi3hTtTaGnr+HV//qtoHkhlv0RGujAPtLuyeUv4hvGr+sfUI3+hhsN9c6daln9OVKgSvw7K4NXPvwZheMDz2mJxr72AOMQqTe3uhpZv4+Ve6qErshfFPwyJaSwY5ooL13tQvpcH/lSZ0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN7XuoFcoeylCzv84+en1fJPBufZS2NPH7ky2tsE37k=;
 b=gDcEp4xalkES4RXD/YgrYYThHpPBQxqjXBWd7XcLBxNl8tye33YHtMPxfNfc+/liFwy/ATKWnd0fZxr82eFf0DND8aGCOe7/SrS01dr7+rnCGLuaAzeofNb3kfEmpVioMODrF7nn2+xaGd0NMC0oTiUiVVAkUKUjY5es+Hh1zFCz1BzGvMdOd4DbxDXWpluYi7A/9AAKr3xNXycgbGuegnUPY+po0wIKJ1nI4OcwZxar9wigiLEjQ/o/HEyj8cnfkOu+lLHqgO93cBwL+sy++6VqhSSmvnWaBOl6NybzAVWzJll2q4T7iQrVWY8egsDzYNl00Qbz9o6TEKMpdjmibw==
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com (2603:1096:101:2e9::7)
 by OS8PR04MB8181.apcprd04.prod.outlook.com (2603:1096:604:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:19:22 +0000
Received: from SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58]) by SE3PR04MB8922.apcprd04.prod.outlook.com
 ([fe80::3450:f139:5238:8f58%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 03:19:22 +0000
Message-ID: <SE3PR04MB8922523E41D9D89A046F59AFF37AA@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Fri, 6 Mar 2026 11:19:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] RISC-V: KVM: Fix lost write protection on huge
 pages during dirty logging
To: wang.yechao255@zte.com.cn, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304172601396IhMZyDqdV3dRmc2rVopfJ@zte.com.cn>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260304172601396IhMZyDqdV3dRmc2rVopfJ@zte.com.cn>
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To SE3PR04MB8922.apcprd04.prod.outlook.com
 (2603:1096:101:2e9::7)
X-Microsoft-Original-Message-ID: <e8bf8331-cedc-4561-9d2d-d295a85a6e57@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE3PR04MB8922:EE_|OS8PR04MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfac32f-dec7-4423-ccb5-08de7b2f23b7
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|19110799012|15080799012|7042599007|5072599009|6090799003|12121999013|461199028|8060799015|51005399006|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDYzY3l2RzFOSHVDVmY2MUdQalBJbWJhQ2NPMFljVE1PSXplZERNUGZoL3Zq?=
 =?utf-8?B?Z2hHVVBPaGVQVW16YndCMHE5QXZBSWhYMWJVRjBYeU1pUkltNHlZVDBKZzhK?=
 =?utf-8?B?aDhIWDg3bFZLRE1zQ001bmpjTU55bUxST0NYK24yNGZaZ3BNWWtwUkN2bmVk?=
 =?utf-8?B?OERyZkJtNUlZT1MyZHFxejJRYTJJN0IxUWU0TVV1SmhvTHMvMWNkWndmN0Fx?=
 =?utf-8?B?Vlo3QkdzTHIvV2UyTnhYSWNDdmtRUWNqcTVVWkk1OWdhaVlGeHJ3SHh1Tm1N?=
 =?utf-8?B?dGZ6QzVkTExSSTR4MEgrZUhJQkRDRTltQ0FJdU9pdlFGaFhRaHo0R3lPdCtp?=
 =?utf-8?B?TzU2SHVIdnRod2lmaVcyREcxOU5xZVFyTjlmL1hkOWNvYlBEb0Q0YUc5MDZV?=
 =?utf-8?B?S2ovOWQvTStCNmo2aDM1azJKYXd2ZVhKTlBabWltbU5kVkxnNHJQNVF5NlNa?=
 =?utf-8?B?cGJqNnl3b0EzRHBYSGNaVnEwWklrUzUyR1BYYVhSb1JBYVgrbG5qY0E1MFox?=
 =?utf-8?B?TlAvWDY1RkxKTXIxMWNYZFJWbGlyWUVmZElKaXZvL2RHZUxUblYwa0RVekdt?=
 =?utf-8?B?cFJOL3dxMUFrVnB3MG80bCtKWGhNSnU3dnU0VnRhckRkUkJVMTI5OVVmV0pi?=
 =?utf-8?B?MXlCaGdtUW9TU1NJSnVmM3VLNVFDME4wS0xmZ2FaQ2lDclA4TjNQVjl5THds?=
 =?utf-8?B?WHRxcHp3TVFJdmlMYlJvY3g2cGlyOU9mRDFKS2hKeW4wVmpVSzBzNHE4VVB0?=
 =?utf-8?B?MnA0MlVRV3NYS3Z5emdzbDhGWmJWRzQwWjZ3OU5Lczd5WmdtUVlaWG9zK2NJ?=
 =?utf-8?B?Tm1rRXY0Z25QeXhHMzNjK0E4bFBqY1Y1UDBqMVpBWmxwYnp4RXZHS01IbEE3?=
 =?utf-8?B?U0VoRWJicElOeFdHQ25BQUN2TzhiaDlpMFdWQkx6blFuOGlGTDZsRlM2Smoz?=
 =?utf-8?B?QmZGMTl2K1FsSU1LMFVsMlc1Mms5MTF6QkVJb2doWG5MOFhab1g0NldxVHAy?=
 =?utf-8?B?aXo3WkdFSWpZMVRvdXZpVnNqN2wxTEZUNHYvL2Foa2MxOGU3cnJmL2NuZ0x2?=
 =?utf-8?B?Q1ExeUQ2djZsY0pkOEFVbUpNTWlTTXp3YkQrbnlTVE1Bd0djNmFCZ3RZdGJa?=
 =?utf-8?B?cXNpQ2hJV1Z4M0xwTmRvUDZ5SjIyZEo0WlJqNlVxUWJVSDA5STFKRGNOQ0t3?=
 =?utf-8?B?SldZTkJ6KzNOcGFVb3dYRE0yS3NiNlp6NHgzOHl6TU9YWEJiVHplbXFQSjJo?=
 =?utf-8?B?OE1ONjIzWTJ4ZHZaa0RHaHhiWnVEU2c3bXVPZG9JQzNsZE1obCtkNzNmb0JT?=
 =?utf-8?B?UllQK0tKNTJlVUtkelRqY2ZmTGhDK2lsV283anY4bkowTW94d3FnQXNuQVZM?=
 =?utf-8?B?cm1aQTMzbXZiN2c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1YNGViR3dxaGk1djZ4T3orRTRJWlBRTUt6c3JMTGtsTk1mYk1iajhyOUEy?=
 =?utf-8?B?ZkN1cFJCa0N2TkhMdWJ4Yk81RDF6RThWTGx2bitrL0xaOXo5S1JuOU1MYjhv?=
 =?utf-8?B?V3plMDlkTUN4Y1U1eG9kTU1JVlpubHp3SjNGaHJ4TDgxRWxMOStqalRqeEFH?=
 =?utf-8?B?dmNyTnZPMUpUeGlBb3lvL3NxVm5HSGNGTEcwRU9sUlZtcU0zSXpSZGtIdHo4?=
 =?utf-8?B?Qy9hZTY5Ri85QndZRjBKK3V5eHZjY2Z5U0F3N1RPaEgxTUVYajZ4ZzNQVVRm?=
 =?utf-8?B?YlMrUXJEek4wWUtmQVBPZXozbERsYjJudnRtdTBtNC9vNU1EQkJ0NmVtNEZM?=
 =?utf-8?B?eVhlZWl2bnk1MDZ2ajJGOEpjcGs1UnVHK3kvRlZjZWVjaXJKL0lOYmNnNGdY?=
 =?utf-8?B?QUk2cUhKemdIL1F3cG9HeDFGbHZXeTg3WkhhNytsU3RQeEp4RGdiTWh4UWln?=
 =?utf-8?B?U2lRc1dhaFdIbGNHa080amdHazRpemg4TkQ1bGRueGtKN1gvMkw1dElYTVJS?=
 =?utf-8?B?UVNRRzAxMnY0SVFaaXpFeTg3dEliQUp0Z3MzaHhTWVNNcVZqZC9zaGpIdnB5?=
 =?utf-8?B?eVVLRzR3MVBRZ2ZzWnRmUU9RRDN2RlludFZ3NnlMQjhhTEQxSFF3ODJ1M29L?=
 =?utf-8?B?Q2ZrdlZaUGhuMS9yYWtsbU5hbGZhTFN6b1diUWtEVXY5dEphYWs2VDhQS2xU?=
 =?utf-8?B?WDZiNTZteG1SSXJHanhMSzFIbjBRbmZGWWQrQUdKeXM1OW1GbmZGMlBRUWNZ?=
 =?utf-8?B?NUFrK2o3eXl5Mm03RThHaDE0R1Y0aUlFN0UwREJzNnNKTjBDZW9CMzdPMEVM?=
 =?utf-8?B?NUFGT3Z4dlU5SkNLeWpEWDVlQUNKUllpSDJISDdveUdrc2dnUFFZZzFIK2dv?=
 =?utf-8?B?UW13SUx3ekdWSGliMTVRWisrdHlhR0xTWGVXQlg5T01VZ0NiMW5kaFNJRDBX?=
 =?utf-8?B?Z1B2NWNYNXREWmsrZ2hZUFRiZXozVmk4Wm9yelgyTGtEcVUvWU8zYnN0Nncz?=
 =?utf-8?B?U1Y2WGg5Wkhzd1RONVV6UTlVTFZMUGp4Z1JGWS9Rc1QraFVvTnRheGNISXd1?=
 =?utf-8?B?bGJFQ0xBTG9uN3F1K1FndUNyaXJRc1psc2tjMFI3ZUpyR1ZLd2p2K3NnTEUw?=
 =?utf-8?B?dGFZbmorM1BPQk1DaklubldRNnh0TzhUTjd1TGZtK1RJMEtITTlCSFZUck84?=
 =?utf-8?B?OEJIOUNOTmNnd1dmMHFtU2g1VkJINkwybzhtTmhoRHRQb2Q3QWx0YS81czNT?=
 =?utf-8?B?MThodGF0VTZqT09MbG1XYkFmNnlEK2Nuc0poZlNRTkM5OHpTZExMQXE5N3dC?=
 =?utf-8?B?c3NzdWJ5Qzh5WUc5STRFWTRkUXBndXBDYnN2aFhGYUtBUjlzTEdIejdpZkd2?=
 =?utf-8?B?OGszNHhxV0VGQXplbGlQdnlmbGdiUy9ONmRIckNZMWp6QWg5Wjlxd3hUbk5l?=
 =?utf-8?B?YXBNY1Ntd0FlYUJ3elVrNk96Y3NpME9LeTcxNUU1OG1BVmM3cUk3V2hzMWFw?=
 =?utf-8?B?bVpSei9JczJKS2xvZ0g4d1dzY1h5T2F5dThSaWRVc0tXZHJQd0FscEFZS1Mw?=
 =?utf-8?B?T2MrejZJUGlRVWIxVW10TitFMHdYWUVYYzVmMTVwVDdpbVEvNU5BSHdNTC9p?=
 =?utf-8?B?YmlwRklaNlJ6Wk1qZWVwZXl2VytrRWhUMUx5ZDdEZi9VR2xLV1pPSWFscElq?=
 =?utf-8?B?SHk3Smhrc0hQWlZsSFlLVmx0YkloVXYzeGhrYW91RGdaV2FsTUhVYzZDSmFS?=
 =?utf-8?B?YU0rTEp1Qm9sUkFhWFVwWVhDU01MRUZnN3owaDhNVnVuMjlHOHBZN3dQelhw?=
 =?utf-8?B?YjRERXB6SzJ4TzBUcWhFT2V0bWNxTUgxVHpLZFpCMHhYVjg2NWJReENWSXpi?=
 =?utf-8?Q?4cbOQFyNmqp02?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfac32f-dec7-4423-ccb5-08de7b2f23b7
X-MS-Exchange-CrossTenant-AuthSource: SE3PR04MB8922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:19:22.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR04MB8181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_193520_511967_96B9BCB1 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDMvNC8yMDI2IDU6MjYgUE0sIHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24gd3JvdGU6Cj4g
RnJvbTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4KPiBXaGVuIGVu
YWJsaW5nIGRpcnR5IGxvZyBpbiBzbWFsbCBjaHVua3MgKGUuZy4sIFFFTVUgZGVmYXVsdCBjaHVu
awo+IHNpemUgb2YgMjU2SyksIHRoZSBjaHVuayBzaXplIGlzIGFsd2F5cyBzbWFsbGVyIHRoYW4g
dGhlIHBhZ2Ugc2l6ZQo+IG9mIGh1Z2UgcGFnZXMgKDFHIG9yIDJNKSB1c2VkIGluIHRoZSBnc3Rh
Z2UgcGFnZSB0YWJsZXMuIFRoaXMgY2F1c2VkCj4gdGhlIHdyaXRlIHByb3RlY3Rpb24gdG8gYmUg
aW5jb3JyZWN0bHkgc2tpcHBlZCBmb3IgaHVnZSBQVEVzIGJlY2F1c2UKPiB0aGUgY29uZGl0aW9u
IGAoZW5kIC0gYWRkcikgPj0gcGFnZV9zaXplYCB3YXMgbm90IHNhdGlzZmllZC4KPgo+IFJlbW92
ZSB0aGUgc2l6ZSBjaGVjayBpbiBga3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZSgpYCB0byBlbnN1
cmUgaHVnZQo+IFBURXMgYXJlIGFsd2F5cyB3cml0ZS1wcm90ZWN0ZWQgcmVnYXJkbGVzcyBvZiB0
aGUgY2h1bmsgc2l6ZS4gQWRkaXRpb25hbGx5LAo+IGV4cGxpY2l0bHkgYWxpZ24gdGhlIGFkZHJl
c3MgZG93biB0byB0aGUgcGFnZSBzaXplIGJlZm9yZSBpbnZva2luZwo+IGBrdm1fcmlzY3ZfZ3N0
YWdlX29wX3B0ZSgpYCB0byBndWFyYW50ZWUgdGhhdCB0aGUgYWRkcmVzcyBwYXNzZWQgdG8gdGhl
Cj4gb3BlcmF0aW9uIGZ1bmN0aW9uIGlzIHBhZ2UtYWxpZ25lZC4KPgo+IFRoaXMgZml4ZXMgdGhl
IGlzc3VlIHdoZXJlIGRpcnR5IHBhZ2VzIG1pZ2h0IG5vdCBiZSB0cmFja2VkIGNvcnJlY3RseQo+
IHdoZW4gdXNpbmcgaHVnZSBwYWdlcy4KV291bGQgaXQgYmUgYmV0dGVyIHRvIGFkZCBhIGRlc2Ny
aXB0aW9uIG9mIHdoaWNoIHNwZWNpZmljIGNvbW1pdCBpcyAKZml4ZWTCoCBsaWtlwqDCoCJGaXhl
czogPGlkPi4uLiIgPwoKT3RoZXJ3aXNlLApSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5s
aXVAaG90bWFpbC5jb20+CgpUaGFua3MsCk51dHR5Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNo
YW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2t2bS9n
c3RhZ2UuYyB8IDcgKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBi
L2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggYjY3ZDYwZDcyMmMyLi5kMjAwMWQ1MDgw
NDYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0zMDQsMTAgKzMwNCw5IEBAIHZvaWQga3ZtX3Jpc2N2X2dz
dGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFfdCBzdGFydCwgZ3Bh
X3QgZW5kCj4gICAJCWlmICghZm91bmRfbGVhZikKPiAgIAkJCWdvdG8gbmV4dDsKPgo+IC0JCWlm
ICghKGFkZHIgJiAocGFnZV9zaXplIC0gMSkpICYmICgoZW5kIC0gYWRkcikgPj0gcGFnZV9zaXpl
KSkKPiAtCQkJa3ZtX3Jpc2N2X2dzdGFnZV9vcF9wdGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+IC0J
CQkJCQlwdGVwX2xldmVsLCBHU1RBR0VfT1BfV1ApOwo+IC0KPiArCQlhZGRyID0gQUxJR05fRE9X
TihhZGRyLCBwYWdlX3NpemUpOwo+ICsJCWt2bV9yaXNjdl9nc3RhZ2Vfb3BfcHRlKGdzdGFnZSwg
YWRkciwgcHRlcCwKPiArCQkJCQlwdGVwX2xldmVsLCBHU1RBR0VfT1BfV1ApOwo+ICAgbmV4dDoK
PiAgIAkJYWRkciArPSBwYWdlX3NpemU7Cj4gICAJfQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
