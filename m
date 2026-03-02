Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7401FD58E7E
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A7ZQ5JQo6LEQZe2MQkgfcSXPuTTYTq6hJ2JgUQkRrIY=; b=x7F687JY8vbpL3
	4YWH23VD3bXyDjiINoZCKaoy0tfyQaemZL0jNR4GyyD4DPjL3Jhyk5WAu7UcvOtZI6YKIrZJ4gfpS
	nIh/KHRm9IrgiOXAKe2Ilvra3b8RKBimljXnA97CN7BLK7gME1V0Ptkqy3itn8VMGGftSN5Wt23sJ
	Juo+hKVL4cFo36Iob15FTwSrpEf/DhqjXnz/BBlX7x3UIpfjN0YJj4GfvmezYjtSv4Bib0+l8KvJE
	JEAnWHywaZAhVBxpz+qrVR1v8lbff7suP6VMsYfD3kdIhg2tfTdzBYYnlR2PKC8N00cjxm9o0lMuw
	qYH9LdUNKRtYLUGKzrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz1w-0000000CY9c-00Tv;
	Mon, 02 Mar 2026 08:53:32 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz1r-0000000CY96-27zZ;
	Mon, 02 Mar 2026 08:53:30 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAB34276T6Vpe_AXCQ--.522S2;
	Mon, 02 Mar 2026 16:53:14 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
Date: Mon,  2 Mar 2026 08:53:12 +0000
Message-Id: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB34276T6Vpe_AXCQ--.522S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4fGF45WF4DGrWrGF1rJFb_yoW5Cry7pF
	WrGFyDA3y5Gwn7GrZIkw1kXr4I9r4YkF1rKr47urWI9rsxtrWIyr9a9ry2qr45AFW8J3sI
	qF4Yk3s5ur15JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnJPEDUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAUOCWmlOvpQgAAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_005328_020858_12E455F5 
X-CRM114-Status: UNSURE (   9.33  )
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

Fix this race by acquiring dev->kvm->lock in aia_has_attr() before
calling kvm_riscv_aia_aplic_has_attr(), consistent with the locking
pattern used in aia_get_attr() and aia_set_attr().

Fixes: 289a007b98b06d ("RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
V1 -> V2:
- Fixed the race by adding locking in aia_has_attr() instead of
  introducing a new validation function, as suggested by Anup Patel.
---
 arch/riscv/kvm/aia_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index b195a93add1ce..ef944d7097d29 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -466,7 +466,9 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		}
 		break;
 	case KVM_DEV_RISCV_AIA_GRP_APLIC:
+		mutex_lock(&dev->kvm->lock);
 		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
+		mutex_unlock(&dev->kvm->lock);
 	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
 		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
 	}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
