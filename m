Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B1C71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWSBLLG1c0cFDcZ/pJj67FO5vebIbcAY99Fe701qAmI=; b=S/+jOeyeo4EEK7
	NuI2JclB0zMqliY6sCIRXE1pQAgqmlnbFfKWg3BbbE9fHFzCwwirH+Qngfzhz4lhkru+cXCe1hYwk
	w3zfZdhJD9Q63K53zeNNFQknvFQEXwPJkFNZ6sk/YNg2IiJhCJ7UwgDq08/6nW9RQoyRfH/xicqTn
	pvYtM1BrlmH+CwnsH6+AZEtxzD54Oc1umeUAWQUttMQ1OHdyhfMRmG6cw/knyR8w7x8izYjK48PZ0
	o5FSVfzQEy8xxu2hGke4vPB/K+x35qzf33GdHnK2DLR8waeiyK5O3WUvIy1MuHaIx1HkWUlNRoE/e
	SbhhtVB/lGF47Ej1zHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2kS-0000000GEmr-3LAy;
	Fri, 13 Jun 2025 11:39:04 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2kP-0000000GEkw-1TJD;
	Fri, 13 Jun 2025 11:39:02 +0000
Received: from zq-Legion-Y7000.smartont.net (unknown [180.110.114.155])
	by APP-03 (Coremail) with SMTP id rQCowADXJ1DPDUxowQ45Bg--.50528S2;
	Fri, 13 Jun 2025 19:38:55 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 2/2] KVM: riscv: selftests: Add common supported test cases
Date: Fri, 13 Jun 2025 19:30:13 +0800
Message-Id: <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749810735.git.zhouquan@iscas.ac.cn>
References: <cover.1749810735.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADXJ1DPDUxowQ45Bg--.50528S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4Uur1xXFy7Ww4fAFyrJFb_yoW5tr47p3
	W8Cryj9F1kCF47Jw1fGr1kZFWxK395Kr409Fy2gw4UuF1UJF4xJrsagay2kFnagw4Yvwnx
	Za43Gr429ayDtw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUl-erUUUUU=
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgoMBmhL72Jr2AAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_043901_772693_1B06EE1F 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Some common KVM test cases are supported on riscv now as following:

    access_tracking_perf_test
    demand_paging_test
    dirty_log_perf_test
    dirty_log_test
    guest_print_test
    kvm_binary_stats_test
    kvm_create_max_vcpus
    kvm_page_table_test
    memslot_modification_stress_test
    memslot_perf_test
    rseq_test
    set_memory_region_test

Add missing headers for tests and fix RISCV_FENCE redefinition
in `rseq-riscv.h` by using the existing macro from <asm/fence.h>.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 tools/testing/selftests/kvm/Makefile.kvm             | 12 ++++++++++++
 .../testing/selftests/kvm/include/riscv/processor.h  |  2 ++
 tools/testing/selftests/rseq/rseq-riscv.h            |  3 +--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 38b95998e1e6..565e191e99c8 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -197,6 +197,18 @@ TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
 TEST_GEN_PROGS_riscv += get-reg-list
 TEST_GEN_PROGS_riscv += steal_time
+TEST_GEN_PROGS_riscv += access_tracking_perf_test
+TEST_GEN_PROGS_riscv += demand_paging_test
+TEST_GEN_PROGS_riscv += dirty_log_perf_test
+TEST_GEN_PROGS_riscv += dirty_log_test
+TEST_GEN_PROGS_riscv += guest_print_test
+TEST_GEN_PROGS_riscv += kvm_binary_stats_test
+TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
+TEST_GEN_PROGS_riscv += kvm_page_table_test
+TEST_GEN_PROGS_riscv += memslot_modification_stress_test
+TEST_GEN_PROGS_riscv += memslot_perf_test
+TEST_GEN_PROGS_riscv += rseq_test
+TEST_GEN_PROGS_riscv += set_memory_region_test
 
 TEST_GEN_PROGS_loongarch += coalesced_io_test
 TEST_GEN_PROGS_loongarch += demand_paging_test
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 162f303d9daa..4cf5ae11760f 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -9,7 +9,9 @@
 
 #include <linux/stringify.h>
 #include <asm/csr.h>
+#include <asm/vdso/processor.h>
 #include "kvm_util.h"
+#include "ucall_common.h"
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
index 67d544aaa9a3..06c840e81c8b 100644
--- a/tools/testing/selftests/rseq/rseq-riscv.h
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -8,6 +8,7 @@
  * exception when executed in all modes.
  */
 #include <endian.h>
+#include <asm/fence.h>
 
 #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
 #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
@@ -24,8 +25,6 @@
 #define REG_L	__REG_SEL("ld ", "lw ")
 #define REG_S	__REG_SEL("sd ", "sw ")
 
-#define RISCV_FENCE(p, s) \
-	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
 #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
 #define rseq_smp_rmb()	RISCV_FENCE(r, r)
 #define rseq_smp_wmb()	RISCV_FENCE(w, w)
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
