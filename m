Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C3EB7EA0
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Fh/K7WpdMc3LDJqxHPrIjMq5w307ZW73TMANpsNhVE=; b=dDIjSfhIhKUyGt
	WzZvZX+NE3b057PHvoTpMOX9pa3bZ/PbCJmOgYtpXEz76wwj2gbFiF6By8Q1Xz1CtgjRh2WFbPTCN
	BREOCWD8nuesVlHARo+PT7uHaJZIJYsJuL77LRNXl6lxmp3Awq3GzLmLqumkyXxmAjPr1ED6hPR7X
	1llAw16+NLwyqrdYMqigGoDGpyrYK5RS+A3SbYuYD3v1gGJoLwfb88ds8EXdKsd1NuwHtTeuOz0s/
	VbaeckC8NqCztnBAQk+l7i6H7rYBcEq35doTDbkyavwLkR5LHR4j6EgoUJiXU1pIhpOIrcQ/qrQMK
	haeAt2vtW4EihQupRRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHM-0000000GhF8-0ZUI;
	Wed, 04 Mar 2026 08:08:24 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHH-0000000Gh9K-3kZz;
	Wed, 04 Mar 2026 08:08:22 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1m6KdpumE5CQ--.5449S2;
	Wed, 04 Mar 2026 16:08:06 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix potential UAF in kvm_riscv_aia_imsic_has_attr()
Date: Wed,  4 Mar 2026 08:08:04 +0000
Message-Id: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHsm1m6KdpumE5CQ--.5449S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar18Cr4ftw4UKryUuFWDXFb_yoW8ZF45pF
	WrCF97CrW3Kw12grZFqwn7Xw4vqayjkw43GrW3Kw4I9rn8tr1IyFyI9rW09rWUJFWqvan2
	9r1UtayruF45Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjdOz3UU
	UUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgsQCWmnycp17wAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000820_324035_3A348CE3 
X-CRM114-Status: GOOD (  12.08  )
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

The KVM_DEV_RISCV_AIA_GRP_APLIC branch of aia_has_attr() was identified
to have a race condition with concurrent KVM_SET_DEVICE_ATTR ioctls,
leading to a use-after-free bug.

Upon analyzing the code, it was discovered that the
KVM_DEV_RISCV_AIA_GRP_IMSIC branch of aia_has_attr() suffers from the same
lack of synchronization. It invokes kvm_riscv_aia_imsic_has_attr() without
holding dev->kvm->lock.

While aia_has_attr() is running, a concurrent aia_set_attr() could call
aia_init() under the dev->kvm->lock. If aia_init() fails, it may trigger
kvm_riscv_vcpu_aia_imsic_cleanup(), which frees imsic_state. Without proper
locking, kvm_riscv_aia_imsic_has_attr() could attempt to access imsic_state
while it is being deallocated.

Although this specific path has not yet been reported by a fuzzer, it
is logically identical to the APLIC issue. Fix this by acquiring the
dev->kvm->lock before calling kvm_riscv_aia_imsic_has_attr(), ensuring
consistency with the locking pattern used for other AIA attribute groups.

Fixes: 5463091a51cf ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index fb901947aefe..9a45c85239fe 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -471,7 +471,10 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		mutex_unlock(&dev->kvm->lock);
 		break;
 	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
-		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
+		mutex_unlock(&dev->kvm->lock);
+		break;
 	}
 
 	return r;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
