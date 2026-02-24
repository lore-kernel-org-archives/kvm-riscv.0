Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C157E9B250
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqs5JqqM3VO3FDSgo9u+45PLseX+jA3e+Zv0FtTPRao=; b=kpo0EL/xCr6aXW
	Rl/QcIcSysG50VR6uRUXAg9cqfTwRkz+EMQScsYQZmpk8WIiReHyFAi5l+/Y7Ttu8yzg6RPinXXJp
	sBWRulPtJAvb1iPy/yZdrWrKX4yiq351yB+efPSdfch09xVLELsaNtS0YyYb1fdbYgRswtouCjnsU
	LjQ3M4FjKTBDR6OB2jwXUABgNJtle/PJZTu/i3P3YHnWWaXRZSKYSnCrNC3yqCAFKHdNBT3LTEKNM
	RKDx0VZWpLc7qN2hI/bqQN+HJ5JKpYeT4MzpwU2RIo1zREjNrPn28vQBjNT+AW7bR9wq8iuDJaDz5
	1YwLNQ4icqjr4YvyaulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupuV-00000001skC-2lQY;
	Tue, 24 Feb 2026 10:44:59 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupuR-00000001sh5-14Xa;
	Tue, 24 Feb 2026 10:44:58 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXrA8XgZ1pbTsKCQ--.27963S2;
	Tue, 24 Feb 2026 18:44:40 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
Date: Tue, 24 Feb 2026 10:44:38 +0000
Message-Id: <20260224104438.57727-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXrA8XgZ1pbTsKCQ--.27963S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4fGF45WF4DGrWrGF1rJFb_yoWruFyfpr
	WUGryDAr45trn7Gr4a9wn7Ww4a9r4q9F15KrWUWrWI9r43trWft3s29w1jqF15AFyrZasI
	vr4UK3s3Wa15AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjEoGDUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgwICWmdZOtWnQAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_024455_675368_1122F106 
X-CRM114-Status: GOOD (  15.27  )
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

Fuzzer reports a KASAN use-after-free bug triggered by a race
between KVM_HAS_DEVICE_ATTR and KVM_SET_DEVICE_ATTR ioctls on the AIA
device. The root cause is that aia_has_attr() invokes
kvm_riscv_aia_aplic_has_attr() without holding dev->kvm->lock, while
a concurrent aia_set_attr() may call aia_init() under that lock. When
aia_init() fails after kvm_riscv_aia_aplic_init() has succeeded, it
calls kvm_riscv_aia_aplic_cleanup() in its fail_cleanup_imsics path,
which frees both aplic_state and aplic_state->irqs. The concurrent
has_attr path can then dereference the freed aplic->irqs in
aplic_read_pending():
	irqd = &aplic->irqs[irq];   /* UAF here */

KASAN report:
 BUG: KASAN: slab-use-after-free in aplic_read_pending
             arch/riscv/kvm/aia_aplic.c:119 [inline]
 BUG: KASAN: slab-use-after-free in aplic_read_pending_word
             arch/riscv/kvm/aia_aplic.c:351 [inline]
 BUG: KASAN: slab-use-after-free in aplic_mmio_read_offset
             arch/riscv/kvm/aia_aplic.c:406
 Read of size 8 at addr ff600000ba965d58 by task 9498
 Call Trace:
  aplic_read_pending arch/riscv/kvm/aia_aplic.c:119 [inline]
  aplic_read_pending_word arch/riscv/kvm/aia_aplic.c:351 [inline]
  aplic_mmio_read_offset arch/riscv/kvm/aia_aplic.c:406
  kvm_riscv_aia_aplic_has_attr arch/riscv/kvm/aia_aplic.c:566
  aia_has_attr arch/riscv/kvm/aia_device.c:469
 allocated by task 9473:
  kvm_riscv_aia_aplic_init arch/riscv/kvm/aia_aplic.c:583
  aia_init arch/riscv/kvm/aia_device.c:248 [inline]
  aia_set_attr arch/riscv/kvm/aia_device.c:334
 freed by task 9473:
  kvm_riscv_aia_aplic_cleanup arch/riscv/kvm/aia_aplic.c:644
  aia_init arch/riscv/kvm/aia_device.c:292 [inline]
  aia_set_attr arch/riscv/kvm/aia_device.c:334

The patch replaces the actual MMIO read in kvm_riscv_aia_aplic_has_attr()
with a new aplic_mmio_has_offset() that only validates whether the given
offset falls within a known APLIC region, without touching any
dynamically allocated state. This is consistent with the KVM API
documentation for KVM_HAS_DEVICE_ATTR:
  "Tests whether a device supports a particular attribute. A successful
   return indicates the attribute is implemented. It does not necessarily
   indicate that the attribute can be read or written in the device's
   current state."
The upper bounds of each region are taken directly from the
RISC-V AIA specification, so the check is independent of the runtime
values of nr_irqs and nr_words.

This patch both fixes the use-after-free and makes the has_attr
implementation semantically correct.

Fixes: 289a007b98b06d ("RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/aia_aplic.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index f59d1c0c8c43a..5e7a1055b2de6 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -527,6 +527,31 @@ static struct kvm_io_device_ops aplic_iodoev_ops = {
 	.write = aplic_mmio_write,
 };
 
+static int aplic_mmio_has_offset(struct kvm *kvm, gpa_t off)
+{
+	if ((off & 0x3) != 0)
+		return -EOPNOTSUPP;
+
+	if ((off == APLIC_DOMAINCFG) ||
+		(off >= APLIC_SOURCECFG_BASE && off < (APLIC_SOURCECFG_BASE + 1023 * 4)) ||
+		(off >= APLIC_SETIP_BASE && off < (APLIC_SETIP_BASE + 32 * 4)) ||
+		(off == APLIC_SETIPNUM) ||
+		(off >= APLIC_CLRIP_BASE && off < (APLIC_CLRIP_BASE + 32 * 4)) ||
+		(off == APLIC_CLRIPNUM) ||
+		(off >= APLIC_SETIE_BASE && off < (APLIC_SETIE_BASE + 32 * 4)) ||
+		(off == APLIC_SETIENUM) ||
+		(off >= APLIC_CLRIE_BASE && off < (APLIC_CLRIE_BASE + 32 * 4)) ||
+		(off == APLIC_CLRIENUM) ||
+		(off == APLIC_SETIPNUM_LE) ||
+		(off == APLIC_SETIPNUM_BE) ||
+		(off == APLIC_GENMSI) ||
+		(off >= APLIC_TARGET_BASE && off < (APLIC_TARGET_BASE + 1203 * 4))
+	)
+		return 0;
+	else
+		return -ENODEV;
+}
+
 int kvm_riscv_aia_aplic_set_attr(struct kvm *kvm, unsigned long type, u32 v)
 {
 	int rc;
@@ -558,12 +583,11 @@ int kvm_riscv_aia_aplic_get_attr(struct kvm *kvm, unsigned long type, u32 *v)
 int kvm_riscv_aia_aplic_has_attr(struct kvm *kvm, unsigned long type)
 {
 	int rc;
-	u32 val;
 
 	if (!kvm->arch.aia.aplic_state)
 		return -ENODEV;
 
-	rc = aplic_mmio_read_offset(kvm, type, &val);
+	rc = aplic_mmio_has_offset(kvm, type);
 	if (rc)
 		return rc;
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
