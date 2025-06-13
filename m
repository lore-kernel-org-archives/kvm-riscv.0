Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEFCC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQH+dl9wHUc42nN6ckCVDpKNi0Z1o6sBOtelWYteTNs=; b=08VxBWOa2KDjwk
	x+ORRB90CEtfAHZjG2t33UVAXCjjNp1fQDURO/yxJOk59XMZS3Lepo7d2vxkNsWUrL2mdVxK+zfVG
	8UDIS1pfK20hCe8fczDnbuy+m7hhi07llU7NiPTJU9HDIgAVwZyu7y3NTxMntLQz94k3jMHj3pKgS
	P0vMzE+iHcUu73hnJS9WYVM8W+d3Y7XtlIODEFUH5Z6WCIdAVynumXwZPn8Iw3QWpFMGooyvsQtKz
	QTL+KiMod1gksMCRDGD9T1C4gRgot0+nQcQmIUhdTs96G8qzPKuecLSUuy0syXa8MdQAtsUXiwMnx
	F3ctl1G8ZJhqsQ3j0Ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2kH-0000000GEhe-3fOf;
	Fri, 13 Jun 2025 11:38:53 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2kE-0000000GEgV-41oj;
	Fri, 13 Jun 2025 11:38:52 +0000
Received: from zq-Legion-Y7000.smartont.net (unknown [180.110.114.155])
	by APP-03 (Coremail) with SMTP id rQCowADXJ1DFDUxoRw05Bg--.50527S2;
	Fri, 13 Jun 2025 19:38:45 +0800 (CST)
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
Subject: [PATCH 1/2] RISC-V: KVM: Enable ring-based dirty memory tracking
Date: Fri, 13 Jun 2025 19:29:57 +0800
Message-Id: <20e116efb1f7aff211dd8e3cf8990c5521ed5f34.1749810735.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749810735.git.zhouquan@iscas.ac.cn>
References: <cover.1749810735.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADXJ1DFDUxoRw05Bg--.50527S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1fGryUurWUWw4UXFy8uFg_yoW5tw4rpF
	s3CrZava1rGF4fG34SyrWkur4UWrZ3Kr43XrWUZFyrGr1YyFWkArsYg348JryUJFy8Xa4I
	kF1FgFyY9Fs0qwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUl-erU
	UUUU=
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgsMBmhL72JrwwAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_043851_366218_7CF1A779 
X-CRM114-Status: GOOD (  13.99  )
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

Enable ring-based dirty memory tracking on riscv:

- Enable CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL as riscv is weakly
  ordered.
- Set KVM_DIRTY_LOG_PAGE_OFFSET for the ring buffer's physical page
  offset.
- Add a check to kvm_vcpu_kvm_riscv_check_vcpu_requests for checking
  whether the dirty ring is soft full.

To handle vCPU requests that cause exits to userspace, modified the
`kvm_riscv_check_vcpu_requests` to return a value (currently only
returns 0 or 1).

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 Documentation/virt/kvm/api.rst    |  2 +-
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/vcpu.c             | 18 ++++++++++++++++--
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1bd2d42e6424..5de0fbfe2fc0 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8316,7 +8316,7 @@ core crystal clock frequency, if a non-zero CPUID 0x15 is exposed to the guest.
 7.36 KVM_CAP_DIRTY_LOG_RING/KVM_CAP_DIRTY_LOG_RING_ACQ_REL
 ----------------------------------------------------------
 
-:Architectures: x86, arm64
+:Architectures: x86, arm64, riscv
 :Type: vm
 :Parameters: args[0] - size of the dirty log ring
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5f59fd226cc5..ef27d4289da1 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -18,6 +18,7 @@
 #define __KVM_HAVE_IRQ_LINE
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
 #define KVM_INTERRUPT_SET	-1U
 #define KVM_INTERRUPT_UNSET	-2U
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 704c2899197e..5a62091b0809 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -25,6 +25,7 @@ config KVM
 	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select HAVE_KVM_READONLY_MEM
+	select HAVE_KVM_DIRTY_RING_ACQ_REL
 	select KVM_COMMON
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e0a01af426ff..0502125efb30 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -690,7 +690,14 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
+/**
+ * check_vcpu_requests - check and handle pending vCPU requests
+ * @vcpu:	the VCPU pointer
+ *
+ * Return: 1 if we should enter the guest
+ *	    0 if we should exit to userspace
+ */
+static int kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 {
 	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 
@@ -735,7 +742,12 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
 			kvm_riscv_vcpu_record_steal_time(vcpu);
+
+		if (kvm_dirty_ring_check_request(vcpu))
+			return 0;
 	}
+
+	return 1;
 }
 
 static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
@@ -917,7 +929,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_riscv_gstage_vmid_update(vcpu);
 
-		kvm_riscv_check_vcpu_requests(vcpu);
+		ret = kvm_riscv_check_vcpu_requests(vcpu);
+		if (ret <= 0)
+			continue;
 
 		preempt_disable();
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
