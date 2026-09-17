Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A2C982CF
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kNeEkmLKAIbflfrknDMPUTspERkIaX6CmvS2xTiiNfY=; b=bgVqiNeiS9PRvt
	cHSW6CtzLzD8q9qsKNCuVRqk1Rg1DL1KCkFk99AmDygSaWOhhmBil7LCsLjw329L8goZ74Nbun1c3
	UlMWTa0bQiLymBQwvnaRSmhrf5NgEFN2V0PzWvmNR/Y3XZBgpHMknmc/PYkL9CEkSQUBacM84hOMO
	gSW9UL13mOKuduIvhSBuBKHLFVXse2PM1b6w1Zw6Y2BXxO9Xa4C99ZkujBkYxUwNyXIhMXSopXVHJ
	yQAOLeG2IWQBdtWJ+LoZK9UvDuKZzlCp9i6p97U1p5g59XtjpJplVaXoidSRv+bFffuOxZGdRE6Cd
	21mgSIMJXK0l0+QT4V4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B0S-0000000BGFt-3GRW;
	Thu, 17 Sep 2026 12:14:24 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B0P-0000000BGF7-1DOU;
	Thu, 17 Sep 2026 12:14:23 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDX7aCT2atq4JiDAA--.20140S2;
	Thu, 17 Sep 2026 20:14:12 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH] RISC-V: KVM: Replace imsic switch-case macros with range checks
Date: Thu, 17 Sep 2026 20:14:11 +0800
Message-Id: <20260917121411.2445-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDX7aCT2atq4JiDAA--.20140S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWkuF1UZF1fGFyUAw43ZFb_yoWxuF1Dp3
	4DWrWqkr1kA3Z7Xws8Gws8ZFy8Jrn8urn8Cr1fKa1fXryUA3Z5Wr1kZ393GFy7ur9rZ3Zx
	W3s7C3W5A34UGFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfU5oGQDUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQENE2qqxK88TQAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_051421_479828_69DC13B8 
X-CRM114-Status: UNSURE (   9.88  )
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

The imsic_eix_read/swap/write/set accessors use a family of macros
that expand into a switch with 128 cases covering the EIP and EIE
register windows. This mirrors the csr_read_num() idiom required where
a CSR number must be encoded as a csrr instruction immediate (e.g.
drivers/perf/riscv_pmu.c), but here the register number is merely
written to vsiselect as data, so the expansion solves no real
constraint. It costs ~90 lines of nested macros and trips ~30
checkpatch errors and warnings.

Since the generated cases form two contiguous windows, [IMSIC_EIP0,
IMSIC_EIP63] and [IMSIC_EIE0, IMSIC_EIE63], the same behavior is
expressed with a simple range check. Introduce imsic_eix_ireg_is_valid()
and use it in the four accessors, removing the macros along with the
~30 checkpatch errors and warnings they caused.

No functional change intended. Compile tested with riscv64-linux-gnu-gcc
and tested on QEMU (RISC-V virt, AIA).

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 arch/riscv/kvm/aia_imsic.c | 124 +++++--------------------------------
 1 file changed, 15 insertions(+), 109 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79..5b6927733 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -67,36 +67,17 @@ struct imsic {
 	__r;					\
 })
 
-#define imsic_read_switchcase(__ireg)			\
-	case __ireg:					\
-		return imsic_vs_csr_read(__ireg);
-#define imsic_read_switchcase_2(__ireg)			\
-	imsic_read_switchcase(__ireg + 0)		\
-	imsic_read_switchcase(__ireg + 1)
-#define imsic_read_switchcase_4(__ireg)			\
-	imsic_read_switchcase_2(__ireg + 0)		\
-	imsic_read_switchcase_2(__ireg + 2)
-#define imsic_read_switchcase_8(__ireg)			\
-	imsic_read_switchcase_4(__ireg + 0)		\
-	imsic_read_switchcase_4(__ireg + 4)
-#define imsic_read_switchcase_16(__ireg)		\
-	imsic_read_switchcase_8(__ireg + 0)		\
-	imsic_read_switchcase_8(__ireg + 8)
-#define imsic_read_switchcase_32(__ireg)		\
-	imsic_read_switchcase_16(__ireg + 0)		\
-	imsic_read_switchcase_16(__ireg + 16)
-#define imsic_read_switchcase_64(__ireg)		\
-	imsic_read_switchcase_32(__ireg + 0)		\
-	imsic_read_switchcase_32(__ireg + 32)
+static bool imsic_eix_ireg_is_valid(int ireg)
+{
+	return (ireg >= IMSIC_EIP0 && ireg <= IMSIC_EIP63) ||
+	       (ireg >= IMSIC_EIE0 && ireg <= IMSIC_EIE63);
+}
 
 static unsigned long imsic_eix_read(int ireg)
 {
-	switch (ireg) {
-	imsic_read_switchcase_64(IMSIC_EIP0)
-	imsic_read_switchcase_64(IMSIC_EIE0)
-	}
-
-	return 0;
+	if (!imsic_eix_ireg_is_valid(ireg))
+		return 0;
+	return imsic_vs_csr_read(ireg);
 }
 
 #define imsic_vs_csr_swap(__c, __v)		\
@@ -107,36 +88,11 @@ static unsigned long imsic_eix_read(int ireg)
 	__r;					\
 })
 
-#define imsic_swap_switchcase(__ireg, __v)		\
-	case __ireg:					\
-		return imsic_vs_csr_swap(__ireg, __v);
-#define imsic_swap_switchcase_2(__ireg, __v)		\
-	imsic_swap_switchcase(__ireg + 0, __v)		\
-	imsic_swap_switchcase(__ireg + 1, __v)
-#define imsic_swap_switchcase_4(__ireg, __v)		\
-	imsic_swap_switchcase_2(__ireg + 0, __v)	\
-	imsic_swap_switchcase_2(__ireg + 2, __v)
-#define imsic_swap_switchcase_8(__ireg, __v)		\
-	imsic_swap_switchcase_4(__ireg + 0, __v)	\
-	imsic_swap_switchcase_4(__ireg + 4, __v)
-#define imsic_swap_switchcase_16(__ireg, __v)		\
-	imsic_swap_switchcase_8(__ireg + 0, __v)	\
-	imsic_swap_switchcase_8(__ireg + 8, __v)
-#define imsic_swap_switchcase_32(__ireg, __v)		\
-	imsic_swap_switchcase_16(__ireg + 0, __v)	\
-	imsic_swap_switchcase_16(__ireg + 16, __v)
-#define imsic_swap_switchcase_64(__ireg, __v)		\
-	imsic_swap_switchcase_32(__ireg + 0, __v)	\
-	imsic_swap_switchcase_32(__ireg + 32, __v)
-
 static unsigned long imsic_eix_swap(int ireg, unsigned long val)
 {
-	switch (ireg) {
-	imsic_swap_switchcase_64(IMSIC_EIP0, val)
-	imsic_swap_switchcase_64(IMSIC_EIE0, val)
-	}
-
-	return 0;
+	if (!imsic_eix_ireg_is_valid(ireg))
+		return 0;
+	return imsic_vs_csr_swap(ireg, val);
 }
 
 #define imsic_vs_csr_write(__c, __v)		\
@@ -145,35 +101,10 @@ do {						\
 	csr_write(CSR_VSIREG, __v);		\
 } while (0)
 
-#define imsic_write_switchcase(__ireg, __v)		\
-	case __ireg:					\
-		imsic_vs_csr_write(__ireg, __v);	\
-		break;
-#define imsic_write_switchcase_2(__ireg, __v)		\
-	imsic_write_switchcase(__ireg + 0, __v)		\
-	imsic_write_switchcase(__ireg + 1, __v)
-#define imsic_write_switchcase_4(__ireg, __v)		\
-	imsic_write_switchcase_2(__ireg + 0, __v)	\
-	imsic_write_switchcase_2(__ireg + 2, __v)
-#define imsic_write_switchcase_8(__ireg, __v)		\
-	imsic_write_switchcase_4(__ireg + 0, __v)	\
-	imsic_write_switchcase_4(__ireg + 4, __v)
-#define imsic_write_switchcase_16(__ireg, __v)		\
-	imsic_write_switchcase_8(__ireg + 0, __v)	\
-	imsic_write_switchcase_8(__ireg + 8, __v)
-#define imsic_write_switchcase_32(__ireg, __v)		\
-	imsic_write_switchcase_16(__ireg + 0, __v)	\
-	imsic_write_switchcase_16(__ireg + 16, __v)
-#define imsic_write_switchcase_64(__ireg, __v)		\
-	imsic_write_switchcase_32(__ireg + 0, __v)	\
-	imsic_write_switchcase_32(__ireg + 32, __v)
-
 static void imsic_eix_write(int ireg, unsigned long val)
 {
-	switch (ireg) {
-	imsic_write_switchcase_64(IMSIC_EIP0, val)
-	imsic_write_switchcase_64(IMSIC_EIE0, val)
-	}
+	if (imsic_eix_ireg_is_valid(ireg))
+		imsic_vs_csr_write(ireg, val);
 }
 
 #define imsic_vs_csr_set(__c, __v)		\
@@ -182,35 +113,10 @@ do {						\
 	csr_set(CSR_VSIREG, __v);		\
 } while (0)
 
-#define imsic_set_switchcase(__ireg, __v)		\
-	case __ireg:					\
-		imsic_vs_csr_set(__ireg, __v);		\
-		break;
-#define imsic_set_switchcase_2(__ireg, __v)		\
-	imsic_set_switchcase(__ireg + 0, __v)		\
-	imsic_set_switchcase(__ireg + 1, __v)
-#define imsic_set_switchcase_4(__ireg, __v)		\
-	imsic_set_switchcase_2(__ireg + 0, __v)		\
-	imsic_set_switchcase_2(__ireg + 2, __v)
-#define imsic_set_switchcase_8(__ireg, __v)		\
-	imsic_set_switchcase_4(__ireg + 0, __v)		\
-	imsic_set_switchcase_4(__ireg + 4, __v)
-#define imsic_set_switchcase_16(__ireg, __v)		\
-	imsic_set_switchcase_8(__ireg + 0, __v)		\
-	imsic_set_switchcase_8(__ireg + 8, __v)
-#define imsic_set_switchcase_32(__ireg, __v)		\
-	imsic_set_switchcase_16(__ireg + 0, __v)	\
-	imsic_set_switchcase_16(__ireg + 16, __v)
-#define imsic_set_switchcase_64(__ireg, __v)		\
-	imsic_set_switchcase_32(__ireg + 0, __v)	\
-	imsic_set_switchcase_32(__ireg + 32, __v)
-
 static void imsic_eix_set(int ireg, unsigned long val)
 {
-	switch (ireg) {
-	imsic_set_switchcase_64(IMSIC_EIP0, val)
-	imsic_set_switchcase_64(IMSIC_EIE0, val)
-	}
+	if (imsic_eix_ireg_is_valid(ireg))
+		imsic_vs_csr_set(ireg, val);
 }
 
 static unsigned long imsic_mrif_atomic_rmw(struct imsic_mrif *mrif,
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
