Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C72606A333
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2tKS5mD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JvCy4nm5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SNg01cNfXDmtpJEWZh1qbX/tNdQ/Rgca2/nEINVdW+Q=; b=b2tKS5mDq3OsdzYk7pDfgbS5WZ
	mfhw2t9OWknFyNTi0LgRiXTz4q++gPA/JpQTdnqhThz760D+6kr/ZO3B53y1gMG473hGGgU9j3PPJ
	Dux6kUZddrt3jFgHMlwa/VvbE8iGYnA4kw6lswmxgFU7xI8ouyFgL+nbDIWdAS4yEeD6uZITbwJx/
	J5tqjgLHggugq8zTNMD9Gzb7nJnqG2qHkF7pHwf6NKzw/7weoLdnFrY12882tgwpamumLgAiVjOev
	5R+tFdnLLR6tYPbb9LoHZvKsT1jQ5PYqTzbCj6H1s6JeU9uWMnsGmKvNy0fqhUfAJ932kUkt9g9Tr
	3QtHZfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhRG-00000004uXI-15TB;
	Tue, 27 Oct 2026 13:42:06 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhRD-00000004uWJ-3mmV;
	Tue, 27 Oct 2026 13:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOi2laIZQ5DqewfiCcD5txjCTuruggybvvwfOhc6eRgMyqoyyiNT+u/LnEIOXOZr0AUG3PAlFTBIWEd/n18um8JbQTeJ2lLADpUfw13RxPmIerKppBfzB++vAgaGw3ejZUNhCPE1jOA5clr9Yzv/DzgnsJVwXRWFVAluqKUX9UnUObe95Fw3cXge9SWMp8SWIvhoEVhN13D2tzL+oyLeksGqFZL/Lgwa71PjTkrRj79D3lA/l5kS3/XzhoaqwyuAc2j8uHVcSn0HP2AsFwgF0Y/4MdeHHrmxNrVnW6PCDOGprrFBHMfFs18OboJ0jBzPA9f2fT/JBTq137yfaH+UxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUhl+cnLRQCd7RlzeCHbPW9mEYxVxMDylydj6kx6JyI=;
 b=wLUwc5HGW2pvd45v4K7ihV7aPvKh9/GRVb/S9oOOi7Y35XLFcUXQjbKezXVnLmc7OMgNdZ2GJn0i1jJZbM7+r7JcGAS4Va2KZCHW/rO5lsD0DTW0o5MNeQxifR5+Mim/AZH5KXCw7pmBKCejZuMS9FO6n2r4xU586gSLGrAA8p4pTHHuhBhc5rRzEigQpebXkGgaGGXLc1no1C/CNW7DP3EnxGDWoj3Br/kqWLZLM5FoE5NUn5JDuMi4qqqRpCYedmtoNdztK9AkwI+wYyXRIhcTHT8/8Xexyd359MULSiL0+TGeDNpQwiR6Fpd/LaBIon33IYUgdCSL3uKSPveuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUhl+cnLRQCd7RlzeCHbPW9mEYxVxMDylydj6kx6JyI=;
 b=JvCy4nm5MC06/efQ0FnsByfCW+VLxTBxGxNRNIGPg9W4zn4lwLkiN4VDOQEWKX+otgCn+T9pIGRc7/HVzj6lDil9OZJqWzjb1ZfMvMMeR7oVdAJ8UIOQmbvtlKz2nyUP9dTL1FYzoN7WW6zThFj6RETBw/+qtObjlsboSO+zeZTpS4KAw+A/AbCmNpu6kHsQ8+aThkSP4TP9Bz6FFF/myD2dw36KlbvB0n9AkoN/XpQgOdc7xz57KIrCvQp0qR9a46GpXlspckpa4gPJmRgfJs+h4Hzk1sTdgnD8u7ikaT0zNfR0NiT/ENQKyntk1zgxkhOT0l1LUw+3F2T5AtjjDQ==
Received: from OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 (2603:1096:604:290::7) by SEZPR01MB4600.apcprd01.prod.exchangelabs.com
 (2603:1096:101:93::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 13:41:51 +0000
Received: from OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 ([fe80::708b:59ed:4ad6:b84c]) by OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 ([fe80::708b:59ed:4ad6:b84c%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 13:41:51 +0000
From: slack up <yxcnew@outlook.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xiaochun Yu <yxcnew@outlook.com>
Subject: [RFC PATCH 1/3] riscv: vector: Add a guest owner invalidation hook
Date: Tue, 27 Oct 2026 13:13:07 +0000
X-Mailer: git-send-email 2.43.0
In-Reply-To: <OSQPR01MB63265385597FE472C4209353C2602@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
References: <OSQPR01MB63265385597FE472C4209353C2602@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-ClientProxiedBy: SEWP216CA0142.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::10) To OSQPR01MB6326.apcprd01.prod.exchangelabs.com
 (2603:1096:604:290::7)
Message-ID: <OSQPR01MB6326C7FC1D0778FA203C4CC4C2602@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSQPR01MB6326:EE_|SEZPR01MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa4bc9e-eb82-4e52-bfbb-08df34300e62
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|5072599009|12121999013|8060799015|19110799012|23021999003|24021099003|51005399006|41001999006|25010399006|260925184616899003|440099028|3412199025|12091999003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nTdm+VuyzSEln+cGYiRTBrA1aze5RdSN0u34hzm48BQF6de0It1TS4xXVpSq?=
 =?us-ascii?Q?hOsAp0fnkZQ1PRbpkY1Q5/ppryPGdVEx41vLnvm/rN+VAQJpM3G5sIMM36NP?=
 =?us-ascii?Q?PVGJHbE8CpqS+pNiSEbDsnXdYQ1Rv/LHUc6/+yyFwom3M9V+sNAZBkHY2J7T?=
 =?us-ascii?Q?8PALkmyjdxmAWpMRLpYBH7d0CfR+eqNwWP057c+C9S82dzTfuUIv2+tJlJMe?=
 =?us-ascii?Q?rU66ZqhWNBNSIGSZhihmflAE30+dKnh5HiNNRJ9XMHXD10JtUemdW1NrQxBJ?=
 =?us-ascii?Q?LkRVRFi3Ku//8L6VYz2BRIoguvMqy1hZV2d9lBjtgar5DxMSqbOvUrRdvjbO?=
 =?us-ascii?Q?uKP7hufLfCnxrSjelaXNbd/noodx1aCoO/gr1To83Tixg/rVtujX4td4WCGe?=
 =?us-ascii?Q?ysFsE28/Jo5jTvaa5owTlR25zaDKzKrJvFoy8IewIERdcaBcMkXhMaxGnX8u?=
 =?us-ascii?Q?TcOH0WMW877y/dsYYcn58CtSoJP6z559nWCpSrUMR5hhF0kzSbfNdDRyLk+K?=
 =?us-ascii?Q?fCZ48nqUsfDu32zm4bttjA8ZEeao72TwG74nC16Lcm7fqxCVHW0O910ltqCS?=
 =?us-ascii?Q?+L8t85KqqAkjvyPXdnATGLwWwDz0rOJKeXM6ApevbgRTARF+APzk9yj0FU9e?=
 =?us-ascii?Q?ARMJC+cOaatgi+pekzpCcisaU+RDFPZOzdpq5nVrfdd0HdR+jYFthEEMspUU?=
 =?us-ascii?Q?VcANr2ufasY+1UHFkoYreB45G78BZpqvfo17lNNSE4TYnFdjWKnEk/J5WzPH?=
 =?us-ascii?Q?2qmHuic4dEleKCe+Kowc56+lRPeryYFrCZ/SfV/StQPh8+nuDy9s/AjSDUrM?=
 =?us-ascii?Q?RLP8FVNPM/9mfZN0jikN6WXRBD71kFvYAMvDzAlt83ZraAJU5DUWfAaYor9u?=
 =?us-ascii?Q?S0Thox31UqMb0s+L9d+5+EnJsvGxxfyo1NI7gBIfHCyfQeNIzd3ygIsSbKrG?=
 =?us-ascii?Q?lSPTTYG4jVtZ7NW7vlKVULslEddSvJYpTaeA1kZzlOmSTIgazubJp2VvIW4/?=
 =?us-ascii?Q?0N7Mkd6ZMGw6+JxU3Uuxg/LZ45mQ9n+mZnWaGFbRbRpghTMs085oo1GF7Dby?=
 =?us-ascii?Q?WYggStif?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19gizsnHONICMD/69hcknCanyEXXh2quP94bbNEV0EkIS0u4Y0Ris1Q6IPJJ?=
 =?us-ascii?Q?Wvnd1qOHEKzPzHyP9ovRgk9jXh2lSBwokrgDF7gx6e/aDEn16LOlfMGGbW9p?=
 =?us-ascii?Q?QcaSswvAXxPADh9q3kM712luadCHLjz3TquRGCEqX6lF0kE5XY7saq0HS9sn?=
 =?us-ascii?Q?r9yqShCXI186mH6iJ+JysIwYuC9SAMmutLXcdJ8rJEqIfSpLD7Wii/P3BTQ1?=
 =?us-ascii?Q?qP3PC1VoM6aO9OeOlgjPOeGUX8a/h/NdpHZn18Pw3BlhNMR307/QG0Rema+H?=
 =?us-ascii?Q?XcJUQkGUZRAhzRjJNYqd6PQ7Nw3sV5m8NQintlRdBn7vX5HmqRTOAo3ireDC?=
 =?us-ascii?Q?tUBV0leNpCYS621BKnSba9d8C2Na+XvSJ/QbF4YBEve9Uhf/g5cVisieqGfY?=
 =?us-ascii?Q?rsyuROHremD3XaBiG+8gIuItxWYQ7FV1UHgx9RpHBfQxDp/ZOcZoZ+PqVzI+?=
 =?us-ascii?Q?HvSRCG12cpZUKIqEe8qj45E5yBsbmTcB8Peg/BqYVmm5vRatHAKoNP/dIlaH?=
 =?us-ascii?Q?MCUbn18gnssLZ3i6olI7inQWJn+mlRQW/nSqlgSpl42Zh5BiKhDHWCjRyA79?=
 =?us-ascii?Q?jE4llU6Dcoq4tYcBU6355NyNrLLqUdsVun/JVCPZVWxOq0FINSaCPLk19IDp?=
 =?us-ascii?Q?jQjTBvjOcu6IQ2xNbAX1XtXqZn4N4T8jPdfXLmLaNa6W8Kej7NSUD4KFTNdP?=
 =?us-ascii?Q?FZ5TPSYeG3EuhRBgXjs29Ue6ozFIsehTsYx+ANzAtbs3meKUvSpYFia7ON+C?=
 =?us-ascii?Q?/4+fqvAV+DtH6IcgyG5z5vQmYp7QwHq3T+8mF0lsd0+p4yGPdsGc8xAGt89v?=
 =?us-ascii?Q?0tEMT84qKVT6mZ99RCpvAtsRqYRI8HU0Howf62gAO0E1qLTONLhmkh7n4OiC?=
 =?us-ascii?Q?KdtQhQwOg5NjI+mlT+L4VNFolcl2d6kv4gpgUKM9noiCl4Va9cDmsY1kDeH/?=
 =?us-ascii?Q?F9a3eJAEBUlAC2xIBHuSUxoN/zjmeFZkv9qmizwikkrCJR8vnYdCHzN9gJEu?=
 =?us-ascii?Q?Gh9JuEGRzlVs8FMRFNlLQLM3pnpsUmoPhB4pYVdvvWKzluasFRcnxFT97FDt?=
 =?us-ascii?Q?QUxn1d9F1PG9MjoIFeoDVdoXso7KxXEtgRwuCOHndxcW7VFMiPd9mRWc4PhU?=
 =?us-ascii?Q?vMPaL/NjKF8g/5fYXMe1SU1bV/X0DFM0zSGPlW7RhRxMYjq/0D+/oc/cf2Dj?=
 =?us-ascii?Q?EqBMxAbU8aqpbz/GaZWCfoyvDbcJXI9ezQiBlOT0m89p8mhS/HMMTfBJ38/P?=
 =?us-ascii?Q?oKD4pA7rgm5lfUWNv5vauhmIcGFiEnCRoJP7cvEK9Dr/MVhacICcCmyy/4Zq?=
 =?us-ascii?Q?L6tDnkQ8vRK6RGyazu55uQB8QBIal3ghdJeDEDfLOyQOuCbofwzyYmvPdA6O?=
 =?us-ascii?Q?/+eyq3SH/aHklqMvvWEzQOcLKSg5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa4bc9e-eb82-4e52-bfbb-08df34300e62
X-MS-Exchange-CrossTenant-AuthSource: OSQPR01MB6326.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 13:41:51.5862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064203_967733_3104FE4D 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xiaochun Yu <yxcnew@outlook.com>

KVM can avoid restoring a guest Vector register file when it remains
resident on the same hart, but only if every generic Vector user
invalidates that ownership before touching the registers.

Add a single RCU-protected invalidation callback and guard its call sites
with a static key. Hook task save, restore and discard, kernel Vector
entry, and the resume path for preemptible kernel Vector contexts. With
no registered consumer, the static key leaves the generic paths disabled.

This patch only establishes the invalidation boundary; it does not change
KVM behavior.

Development note: OpenAI Codex assisted with source analysis,
implementation drafting, test orchestration and changelog preparation.

Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>
---
 arch/riscv/include/asm/vector.h        | 31 +++++++++++++++++++++
 arch/riscv/kernel/kernel_mode_vector.c | 38 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 1f8dcae3af51..967dd70f4ea4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -9,8 +9,17 @@
 #include <linux/types.h>
 #include <uapi/asm-generic/errno.h>
 
+enum riscv_v_invalidate_reason {
+	RISCV_V_INVALIDATE_TASK_SAVE,
+	RISCV_V_INVALIDATE_TASK_RESTORE,
+	RISCV_V_INVALIDATE_TASK_DISCARD,
+	RISCV_V_INVALIDATE_KERNEL_VECTOR,
+	RISCV_V_INVALIDATE_CPU_STATE,
+};
+
 #ifdef CONFIG_RISCV_ISA_V
 
+#include <linux/jump_label.h>
 #include <linux/stringify.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
@@ -52,6 +61,17 @@ void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
 void __init update_regset_vector_info(unsigned long size);
+DECLARE_STATIC_KEY_FALSE(riscv_v_owner_invalidate_key);
+void __riscv_v_owner_invalidate(enum riscv_v_invalidate_reason reason);
+void kvm_riscv_register_vctx_invalidate(void (*func)(enum riscv_v_invalidate_reason reason));
+void kvm_riscv_unregister_vctx_invalidate(void);
+
+static __always_inline void
+riscv_v_owner_invalidate(enum riscv_v_invalidate_reason reason)
+{
+	if (static_branch_unlikely(&riscv_v_owner_invalidate_key))
+		__riscv_v_owner_invalidate(reason);
+}
 
 static inline u32 riscv_v_flags(void)
 {
@@ -303,6 +323,7 @@ static inline void __riscv_v_vstate_discard(void)
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_owner_invalidate(RISCV_V_INVALIDATE_TASK_DISCARD);
 		__riscv_v_vstate_discard();
 		__riscv_v_vstate_dirty(regs);
 	}
@@ -312,6 +333,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
+		riscv_v_owner_invalidate(RISCV_V_INVALIDATE_TASK_SAVE);
 		__riscv_v_vstate_save(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -321,6 +343,7 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_owner_invalidate(RISCV_V_INVALIDATE_TASK_RESTORE);
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -393,6 +416,13 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	}
 
 	if (riscv_preempt_v_started(next)) {
+		/*
+		 * A preemptible kernel Vector user can be scheduled back after a
+		 * vCPU published a guest owner on this hart.  Drop that owner before
+		 * the kernel context resumes or restores and overwrites the register
+		 * file.
+		 */
+		riscv_v_owner_invalidate(RISCV_V_INVALIDATE_KERNEL_VECTOR);
 		if (next->thread.riscv_v_flags & RISCV_PREEMPT_V_IN_SCHEDULE) {
 			next->thread.riscv_v_flags &= ~RISCV_PREEMPT_V_IN_SCHEDULE;
 			riscv_v_enable();
@@ -423,6 +453,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vstate_discard(regs)		do {} while (0)
 #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
 #define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
+#define riscv_v_owner_invalidate(reason)	((void)(reason))
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 77e98b504485..9e87bdf02028 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -22,6 +22,13 @@
 
 static void (* __rcu kvm_flush_vector_ctx_callback)(void);
 
+/*
+ * KVM may leave a guest Vector register file resident on a hart.  Keep the
+ * generic Vector paths unchanged until KVM registers the invalidation hook.
+ */
+static void (* __rcu kvm_invalidate_vector_ctx_callback)(enum riscv_v_invalidate_reason reason);
+DEFINE_STATIC_KEY_FALSE(riscv_v_owner_invalidate_key);
+
 void kvm_riscv_register_vctx_callback(void (*func)(void))
 {
 	if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
@@ -38,6 +45,35 @@ void kvm_riscv_unregister_vctx_callback(void)
 }
 EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_callback);
 
+void kvm_riscv_register_vctx_invalidate(void (*func)(enum riscv_v_invalidate_reason reason))
+{
+	if (WARN_ON_ONCE(rcu_access_pointer(kvm_invalidate_vector_ctx_callback)))
+		return;
+
+	rcu_assign_pointer(kvm_invalidate_vector_ctx_callback, func);
+	static_branch_enable(&riscv_v_owner_invalidate_key);
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_invalidate);
+
+void kvm_riscv_unregister_vctx_invalidate(void)
+{
+	static_branch_disable(&riscv_v_owner_invalidate_key);
+	rcu_assign_pointer(kvm_invalidate_vector_ctx_callback, NULL);
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_invalidate);
+
+void __riscv_v_owner_invalidate(enum riscv_v_invalidate_reason reason)
+{
+	void (*invalidate_callback)(enum riscv_v_invalidate_reason reason);
+
+	rcu_read_lock();
+	invalidate_callback = rcu_dereference(kvm_invalidate_vector_ctx_callback);
+	if (invalidate_callback)
+		invalidate_callback(reason);
+	rcu_read_unlock();
+}
+
 
 static inline void riscv_v_start(u32 flags)
 {
@@ -106,6 +142,8 @@ static void __riscv_flush_vector_context(void)
 {
 	void (*vcpu_flush_v_callback)(void);
 
+	riscv_v_owner_invalidate(RISCV_V_INVALIDATE_KERNEL_VECTOR);
+
 	if (riscv_v_flags() & RISCV_V_VCPU_CTX) {
 		rcu_read_lock();
 		vcpu_flush_v_callback = rcu_dereference(kvm_flush_vector_ctx_callback);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
