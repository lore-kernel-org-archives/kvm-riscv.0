Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B5FC9EC3
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 02:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjr4bgFmkX0rXJUofJ+Q8fwjkfVU//YOGeu+wCMwhw8=; b=hDfEO0AqyXZUcp
	7ySmiDax7x+LKlvnjTwf8tPm9zeXRXqqTKNFpAqOkvVc7A+2rh04noRQfvRFYgFvZCNYoU6LEUNnk
	ydR2NaYlHEGW2RHXMSZZWXQD/7ow5MOp8Im3U9Tn+8NuWBe8l//loT90E2peKBZWgfypZlseJgo5U
	9kmaU4hoAVfYGr0b+DE3GdP5UjRxefg6QhdyItE4ws6rB0FRq5k9EW6V4YhgCxWMVE1LRU9dbhFrY
	CDxsFyXw0GHvj3LFofES3XFPigo5T73rWRcqteVMpNfaC/hR5FNpJTUotUbke79n5E+V/yqwd4KcG
	o2hBXczUt8EgggdeiohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyhWF-00000004oil-3bMj;
	Sat, 07 Mar 2026 02:35:55 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyhWA-00000004ohy-2rzd;
	Sat, 07 Mar 2026 02:35:53 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowABH1Qj5jqtptETJCQ--.6811S2;
	Sat, 07 Mar 2026 10:35:37 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH 1/2] RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read()
Date: Sat,  7 Mar 2026 02:35:37 +0000
Message-Id: <20260307023537.3686946-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7cv4cq43l33fvpbikecjecfulomzurfmlbjk45u6amvdmnmrhu@7padusm25g5l>
References: <7cv4cq43l33fvpbikecjecfulomzurfmlbjk45u6amvdmnmrhu@7padusm25g5l>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABH1Qj5jqtptETJCQ--.6811S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyfCw13ArWfKr1DAF43KFg_yoWrGryUpa
	y8JayYyr1fKFnrtFy3ArnFgr1UJan3Zay8Jry7Gryjyr45JryfXrsFgF9FyayDCFZ5Ww13
	uw1Iga1ruF4UAaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXo7tUU
	UUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRATCWmrbvc4AQAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_183551_093168_E4724A2F 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Andrew,

Thanks for the review and the suggestions.

I agree with your feedback. In v2, I will merge the fixes for both
pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single commit and remove
the pr_warn, simply returning -EINVAL instead.

I have two questions regarding the next version:

1. Regarding other pr_warns in PMU emulation code:
You mentioned that other pr_warns in the code might need auditing. Should
I address those in this patchset (e.g., converting them to pr_warn_once
or removing them), or is it better to keep this series focused strictly
on the out-of-bounds fix and handle the logging cleanup in a separate
patchset later?

2. Selftests update:
I noticed that applying this fix causes a regression in
selftests/kvm/sbi_pmu_test. The test_pmu_basic_sanity function currently
attempts to read a firmware counter without configuring it via
SBI_EXT_PMU_COUNTER_CFG_MATCH first.

Previously, this triggered the out-of-bounds access (likely reading
garbage), but with this fix, the kernel correctly returns
SBI_ERR_INVALID_PARAM, causing the test to fail.

To fix this, I plan to include a second patch in v2 that updates the
selftest to properly configure the counter before reading. Here is my
draft for the fix. Does this approach look reasonable to you?

Thanks,
Jiakai

---
 .../testing/selftests/kvm/include/riscv/sbi.h | 28 +++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        |  9 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
index 046b432ae896..8c172422f386 100644
--- a/tools/testing/selftests/kvm/include/riscv/sbi.h
+++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
@@ -97,6 +97,34 @@ enum sbi_pmu_hw_generic_events_t {
 	SBI_PMU_HW_GENERAL_MAX,
 };
 
+enum sbi_pmu_fw_generic_events_t {
+	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
+	SBI_PMU_FW_MISALIGNED_STORE	= 1,
+	SBI_PMU_FW_ACCESS_LOAD		= 2,
+	SBI_PMU_FW_ACCESS_STORE		= 3,
+	SBI_PMU_FW_ILLEGAL_INSN		= 4,
+	SBI_PMU_FW_SET_TIMER		= 5,
+	SBI_PMU_FW_IPI_SENT		= 6,
+	SBI_PMU_FW_IPI_RCVD		= 7,
+	SBI_PMU_FW_FENCE_I_SENT		= 8,
+	SBI_PMU_FW_FENCE_I_RCVD		= 9,
+	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
+	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
+	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
+	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
+
+	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
+	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
+
+	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
+	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
+	SBI_PMU_FW_MAX,
+};
+
 /* SBI PMU counter types */
 enum sbi_pmu_ctr_type {
 	SBI_PMU_CTR_TYPE_HW = 0x0,
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 924a335d2262..0d6ba3563561 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -461,7 +461,14 @@ static void test_pmu_basic_sanity(void)
 			pmu_csr_read_num(ctrinfo.csr);
 			GUEST_ASSERT(illegal_handler_invoked);
 		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
-			read_fw_counter(i, ctrinfo);
+			/*
+			 * Try to configure with a common firmware event.
+			 * If configuration succeeds, verify we can read it.
+			 */
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+			        i, 1, 0, SBI_PMU_FW_ACCESS_LOAD, 0, 0);
+			if (ret.error == 0 && ret.value < RISCV_MAX_PMU_COUNTERS && BIT(ret.value) & counter_mask_available)
+				read_fw_counter(i, ctrinfo);
 		}
 	}
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
