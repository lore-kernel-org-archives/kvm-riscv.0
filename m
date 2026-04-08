Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED725FD5F78
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsueZXu4Qh9Fa307HFlP46yq6vW6Wasrs9OIsr6Hkq8=; b=HG0JbAaNBjNqyt
	u9eTGKdVjd2cP4rFflaEKAmrzi2eIcS18rpX8sXuJSLEDcZpsJqSoir04VWVCNc5OKt6Cndkcdw0n
	p6eN+pQuyRAVE+3qMjS81SxfqVGhRIz9PVst+qeSHzWzqsuDz7WRRlYoNbBNJvF8y79FhPeVnwKdF
	ZGwRvGzwb+IPkoOdYCHzgmC6H/M0RTV13+bzK7/qDhP4qowe8GJJnZGnBCMn8NeQ8bfxzo7nDdS2p
	BkoqdmIn76T0Anl7jO7Nj0HEbjx1+yGBYjkIXgHQdtgJ3bHtTJ+HgfmaOWxE+nFxR3FDo5SWFsC5c
	3DN9a7LOvYnHbvFUQB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoP-00000008ElI-2vwE;
	Wed, 08 Apr 2026 04:46:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoJ-00000008Ebf-2oJa;
	Wed, 08 Apr 2026 04:46:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44BA64458D;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20BA8C4AF0D;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623597;
	bh=4rkKpzRM+iL5DW5d8i7Gb0QM1Gb7i6+CJUfrUspb9+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uzWNLKSzAhTi6Ahozxerl0eEUN3LUv14i2hXo/oJKxgiu93fCYWgyKGoKHHpfUjYg
	 6+f9rrsfMXoIWtA9LcPvO5uS6ell428FdMsIMCKtr1vBlx0UpnYFK78dGSSKJCx4uM
	 XCCeAGJWuDIB9/kBbpZaeLzBQRO7Wqn+3L/+kFs6TtO98AAHFrXQtZpgteIZdNe0FB
	 RzHc1VoXFPGrrLBmaWETOA3WlVPtyCktYP0KvJfItFi8EQBeEXqaVpez3QhEcPzuSm
	 k6ToGtaZ008xJeE7gEWqXMRJ+MHJbvjPt5aMsEEVXmcBWvmQkwWH6v6g96WaT3Nqis
	 ZCRySpJBLuIJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A759FD5F70;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:57 -0700
Subject: [PATCH 09/16] KVM: device: Add test device
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-9-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
In-Reply-To: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=6974;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=QpJ6SQoj8mJo2Tpd9rSMLwb1t2gleejCSJHykRZEP+I=;
 b=sr9oHdB3A54IHLnUQGX+jJlAhUeQ5WQiaw2xeIbsaTgW0FoX2Vbpbh03BeExP8+HGrVRt+yPb
 6VhKUiq1d0yCDJ7D5vyyF0R9KYF4kgpVc2wDQJy++zH4H8y2TWkNwg0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214639_781244_B18FC103 
X-CRM114-Status: GOOD (  21.50  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

Create a KVM test device to help verify mmio reads and write emulation.
This is a simple device that will store the data in a buffer on writes
and echo back that stored data on a read.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 include/uapi/linux/kvm.h |  2 +
 lib/Kconfig.debug        |  6 +++
 virt/kvm/Kconfig.debug   | 16 ++++++++
 virt/kvm/Makefile.kvm    |  1 +
 virt/kvm/kvm_main.c      |  8 ++++
 virt/kvm/mmio_test.c     | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
 virt/kvm/mmio_test.h     | 18 +++++++++
 7 files changed, 146 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index dddb781b0507..9e2918614246 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1209,6 +1209,8 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_LOONGARCH_EIOINTC	KVM_DEV_TYPE_LOONGARCH_EIOINTC
 	KVM_DEV_TYPE_LOONGARCH_PCHPIC,
 #define KVM_DEV_TYPE_LOONGARCH_PCHPIC	KVM_DEV_TYPE_LOONGARCH_PCHPIC
+	KVM_DEV_TYPE_TEST,
+#define KVM_DEV_TYPE_TEST	KVM_DEV_TYPE_TEST
 
 	KVM_DEV_TYPE_MAX,
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939fda79..7a4a23d1fc9e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -717,6 +717,12 @@ source "net/Kconfig.debug"
 
 endmenu # "Networking Debugging"
 
+menu "KVM Debugging"
+
+source "virt/kvm/Kconfig.debug"
+
+endmenu # "KVM Debugging"
+
 menu "Memory Debugging"
 
 source "mm/Kconfig.debug"
diff --git a/virt/kvm/Kconfig.debug b/virt/kvm/Kconfig.debug
new file mode 100644
index 000000000000..d24709f5bcbf
--- /dev/null
+++ b/virt/kvm/Kconfig.debug
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config KVM_MMIO_TEST
+       bool "Enable kvm mmio testing"
+       depends on KVM
+       depends on KVM_MMIO
+       default n
+       help
+         Enable testing for kvm mmio. This is a test-only mmio device that
+         stores writes in a buffer and returns the buffered data on a read.
+         
+         This is useful for testing the kvm mmio emulation code. Enabling
+         this does not run any tests, just builds in the support for the test
+         device into the kernel.
+
+         If unsure, say N.
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index d047d4cf58c9..bd4da8c23923 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -8,6 +8,7 @@ KVM ?= ../../../virt/kvm
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
 kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
 kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
+kvm-$(CONFIG_KVM_MMIO_TEST) += $(KVM)/mmio_test.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5fcd401a5897..a0b143e71560 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -59,6 +59,7 @@
 #include "async_pf.h"
 #include "kvm_mm.h"
 #include "vfio.h"
+#include "mmio_test.h"
 
 #include <trace/events/ipi.h>
 
@@ -6528,6 +6529,10 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (WARN_ON_ONCE(r))
 		goto err_vfio;
 
+	r = kvm_mmio_test_ops_init();
+	if (WARN_ON_ONCE(r))
+		goto err_mmio_test;
+
 	r = kvm_gmem_init(module);
 	if (r)
 		goto err_gmem;
@@ -6555,6 +6560,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 err_gmem:
 	kvm_vfio_ops_exit();
 err_vfio:
+	kvm_mmio_test_ops_exit();
+err_mmio_test:
 	kvm_async_pf_deinit();
 err_async_pf:
 	kvm_irqfd_exit();
@@ -6585,6 +6592,7 @@ void kvm_exit(void)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
 	kvm_gmem_exit();
+	kvm_mmio_test_ops_exit();
 	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	kvm_irqfd_exit();
diff --git a/virt/kvm/mmio_test.c b/virt/kvm/mmio_test.c
new file mode 100644
index 000000000000..fa84c2b4c5fc
--- /dev/null
+++ b/virt/kvm/mmio_test.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mmio_test.c - Kernel module side for testing the KVM riscv mmio functionality.
+ */
+
+#include <linux/kvm_host.h>
+
+#include <kvm/iodev.h>
+#include "mmio_test.h"
+
+struct mmio_test {
+	struct kvm *kvm;
+	struct kvm_io_device dev;
+	unsigned long start;
+	unsigned long size;
+	char cache[16];
+};
+
+static struct mmio_test *kvm_to_mmio_test_dev(const struct kvm_io_device *dev)
+{
+	return container_of(dev, struct mmio_test, dev);
+}
+
+static int mmio_read(struct kvm_vcpu *vcpu, struct kvm_io_device *dev,
+		     gpa_t addr, int len, void *val)
+{
+	struct mmio_test *mmio_test = kvm_to_mmio_test_dev(dev);
+
+	if ((addr - mmio_test->start) >= mmio_test->size)
+		return -1;
+
+	/* Write back cached value */
+	memcpy(val, &mmio_test->cache[(addr - mmio_test->start)], len);
+	return 0;
+}
+
+static int mmio_write(struct kvm_vcpu *vcpu, struct kvm_io_device *dev,
+		      gpa_t addr, int len, const void *val)
+{
+	struct mmio_test *mmio_test = kvm_to_mmio_test_dev(dev);
+
+	if ((addr - mmio_test->start) >= mmio_test->size)
+		return -1;
+
+	/* Cache value */
+	memcpy(&mmio_test->cache[(addr - mmio_test->start)], val, len);
+	return 0;
+}
+
+static const struct kvm_io_device_ops mmio_ops = {
+	.read = mmio_read,
+	.write = mmio_write,
+};
+
+static int mmio_test_create(struct kvm_device *dev, u32 type)
+{
+	struct mmio_test *mmio_test;
+
+	mmio_test = kzalloc(sizeof(*mmio_test), GFP_KERNEL);
+	if (!mmio_test)
+		return -ENOMEM;
+
+	mmio_test->start = 0x20000000;
+	mmio_test->size = 0x16;
+
+	dev->private = mmio_test;
+
+	kvm_iodevice_init(&mmio_test->dev, &mmio_ops);
+	kvm_io_bus_register_dev(dev->kvm, KVM_MMIO_BUS, mmio_test->start,
+				mmio_test->size, &mmio_test->dev);
+
+	return 0;
+}
+
+static void mmio_test_release(struct kvm_device *dev)
+{
+	kfree(dev->private);
+}
+
+struct kvm_device_ops kvm_riscv_mmio_test_device_ops = {
+	.name = "kvm-riscv-mmio_test",
+	.create = mmio_test_create,
+	.release = mmio_test_release,
+};
+
+int kvm_mmio_test_ops_init(void)
+{
+	return kvm_register_device_ops(&kvm_riscv_mmio_test_device_ops,
+					KVM_DEV_TYPE_TEST);
+}
+
+void kvm_mmio_test_ops_exit(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_TEST);
+}
diff --git a/virt/kvm/mmio_test.h b/virt/kvm/mmio_test.h
new file mode 100644
index 000000000000..49a6e900eec9
--- /dev/null
+++ b/virt/kvm/mmio_test.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_MMIO_TEST_H
+#define __KVM_MMIO_TEST_H
+
+#ifdef CONFIG_KVM_MMIO_TEST
+int kvm_mmio_test_ops_init(void);
+void kvm_mmio_test_ops_exit(void);
+#else
+static inline int kvm_mmio_test_ops_init(void)
+{
+	return 0;
+}
+static inline void kvm_mmio_test_ops_exit(void)
+{
+}
+#endif
+
+#endif

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
