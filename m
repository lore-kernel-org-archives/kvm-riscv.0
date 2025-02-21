Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9163C021B5
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg84MHdohAuTELNOyKhcuVKD4IpkHw4UGv+mba0sb2E=; b=MKwzMsyY6ShVjr
	yRM2S/LP89slpRt1hjV3j+2k6m1t05/RUZ42YgilP77JUMHpXgt0gE6ksrcrcenwlyfghgcAftbns
	GUttig8OriZILwaHfWj70pfEWf9ZrWlcreRJhUwJA1CnZbc1ILBHibdlgIYIqPIu3ojg1MbN/CtaQ
	z6JeCTgh3le5zdkXGv70jWmifc+6c7UrOwNx+Gq1O5mcJK9jMmBoi8mQOLDqmhCboQu4ST9mtYKTv
	yDebEI8txQsxBvBlAbfaoR80pUEfGvKFAcU0NYuJV+XCH2ncsx9SdOKmglT/3ATMRVl+IgdWlVPI5
	COv00pkswh5Z4bnUkdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNp-000000063my-1rDR;
	Fri, 21 Feb 2025 15:56:09 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNn-000000063kF-1C4k
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:56:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvNjtTtoiJG2HIZk+kDy8zYebCf5StBPW4vMXCk5QB8=;
	b=fBPb57lvxFEIRu4rD+wl7vsoCIBn5Nnl2V6KS4BZwvGdKhdpDod8BapbWA60g3E5s/jHfD
	MERF0CzBClEEVx/TgBGd9c9196OosQNGBVsLjEMhT9ExVLVgI/EISs3QZnN7Nw9Si0HKwV
	Q4xjevrSa2JO5z6VeVAYOaeMnPp9HYA=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 09/10] riscv: sbi: susp: Check upper bits of sleep_type are ignored
Date: Fri, 21 Feb 2025 16:55:43 +0100
Message-ID: <20250221155533.123418-21-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075607_459466_56022F50 
X-CRM114-Status: GOOD (  11.99  )
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

When an SBI function parameter has a specific bit width which is
less than that of a long, then the upper bits should be ignored
by the SBI implementation. I.e. since sleep_type is a uint32_t,
then on rv64 both 0 and 0x1_0000_0000 are valid and mean suspend
to ram.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index e5f6e1c72ae6..1d9d1871a28b 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -67,7 +67,7 @@ static struct sbiret sbi_hart_suspend_raw(unsigned long suspend_type, unsigned l
 	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
 }
 
-static struct sbiret sbi_system_suspend(uint32_t sleep_type, unsigned long resume_addr, unsigned long opaque)
+static struct sbiret sbi_system_suspend_raw(unsigned long sleep_type, unsigned long resume_addr, unsigned long opaque)
 {
 	return sbi_ecall(SBI_EXT_SUSP, 0, sleep_type, resume_addr, opaque, 0, 0, 0);
 }
@@ -1367,6 +1367,19 @@ static bool susp_type_prep(unsigned long ctx[], struct susp_params *params)
 	return true;
 }
 
+#if __riscv_xlen != 32
+static bool susp_type_prep2(unsigned long ctx[], struct susp_params *params)
+{
+	bool r;
+
+	r = susp_basic_prep(ctx, params);
+	assert(r);
+	params->sleep_type = BIT(32);
+
+	return true;
+}
+#endif
+
 static bool susp_badaddr_prep(unsigned long ctx[], struct susp_params *params)
 {
 	phys_addr_t badaddr;
@@ -1432,6 +1445,7 @@ static void check_susp(void)
 #define SUSP_FIRST_TESTNUM 1
 		SUSP_BASIC = SUSP_FIRST_TESTNUM,
 		SUSP_TYPE,
+		SUSP_TYPE2,
 		SUSP_BAD_ADDR,
 		SUSP_ONE_ONLINE,
 		NR_SUSP_TESTS,
@@ -1441,10 +1455,13 @@ static void check_susp(void)
 		bool (*prep)(unsigned long ctx[], struct susp_params *params);
 		void (*check)(unsigned long ctx[], struct susp_params *params);
 	} susp_tests[] = {
-		[SUSP_BASIC]		= { "basic",		susp_basic_prep,	susp_basic_check,	},
-		[SUSP_TYPE]		= { "sleep_type",	susp_type_prep,					},
-		[SUSP_BAD_ADDR]		= { "bad addr",		susp_badaddr_prep,				},
-		[SUSP_ONE_ONLINE]	= { "one cpu online",	susp_one_prep,					},
+		[SUSP_BASIC]		= { "basic",			susp_basic_prep,	susp_basic_check,	},
+		[SUSP_TYPE]		= { "sleep_type",		susp_type_prep,					},
+#if __riscv_xlen != 32
+		[SUSP_TYPE2]		= { "sleep_type upper bits",	susp_type_prep2,	susp_basic_check	},
+#endif
+		[SUSP_BAD_ADDR]		= { "bad addr",			susp_badaddr_prep,				},
+		[SUSP_ONE_ONLINE]	= { "one cpu online",		susp_one_prep,					},
 	};
 	struct susp_params params;
 	struct sbiret ret;
@@ -1466,6 +1483,9 @@ static void check_susp(void)
 	report(ret.error == SBI_ERR_NOT_SUPPORTED, "funcid != 0 not supported");
 
 	for (i = SUSP_FIRST_TESTNUM; i < NR_SUSP_TESTS; i++) {
+		if (!susp_tests[i].name)
+			continue;
+
 		report_prefix_push(susp_tests[i].name);
 
 		ctx[SBI_SUSP_TESTNUM_IDX] = i;
@@ -1480,7 +1500,7 @@ static void check_susp(void)
 		}
 
 		if ((testnum = setjmp(sbi_susp_jmp)) == 0) {
-			ret = sbi_system_suspend(params.sleep_type, params.resume_addr, params.opaque);
+			ret = sbi_system_suspend_raw(params.sleep_type, params.resume_addr, params.opaque);
 
 			local_irq_enable();
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
