Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70136CCF2E7
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oBYfwEhNzMZgWvG6tDKQc3JgzD9SlfKOAVIXvsrf4zM=; b=U2l9Zqcuybycfn
	NF1vqr7wHm+BSSC8Od6lY3aKzGmlp4iH8PyHN/VjsyYr+DHM44G8V/6akoT8J53c449TYu90pCvjZ
	kLDFSoSHY8KSe6DbYOvFBgYAUOFp1TuxWu+Yeyc9eEmRUDxuRsowBu2+kqqLIGPxXDiKb0bYSugQO
	Gykr8xq2kv/lemjyxCgRp4LEYu9p2Nm3g95dvKaPHPkOhH1qQmwcMWwPWUXszXrAmhtqRGJYdHKLS
	iN+rRa1908ewV4c/PvpLF+oFs5rhbJOQUsRkl0FoD5XUGSbKgrfkNnWKEMQJZlXUUK0XaKWL5wnY6
	ZkaAtaO+DJ7PUKrOe+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoa4-00000007llv-2L7h;
	Mon, 19 Oct 2026 14:43:16 +0000
Received: from out-192.mta0.migadu.com ([2001:41d0:1004:224b::c0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoa0-00000007lkU-3zn5
	for kvm-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 14:43:15 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yAzZlMG9yyqlRb+Q8VS1SI9X4mbkrMtuzvvRVXOI/o4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792420988; v=1; x=1793025788;
 b=EeixoLsvfxN2IB7iC71wEDZAumblq92s58yrMZAabJc4xB9TrQtdzYZY2sgfcr+N+/m1u69E
 2hO51OxinP6ERSSwp2Jh68Xn+FYmhg2JqrbjbghBkGHY6T+chXOsB2aWXu02XV09H//RM7UQhVD
 RMSniv3FlkB5SGNmWdeqFYfA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 609bfc4a7ea223cb;
	Mon, 19 Oct 2026 14:43:08 +0000
X-Mizu-Trace-ID: 609bfc4a7ea223cb
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com
Cc: kvm-riscv@lists.infradead.org,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH kvmtool] riscv: Place the FDT after the kernel's image_size
Date: Mon, 19 Oct 2026 16:43:04 +0200
Message-ID: <20261019144304.2678066-1-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_074313_149166_88EB92FC 
X-CRM114-Status: GOOD (  17.35  )
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

The FDT is placed relative to the end of the kernel image file, but a
kernel's memory footprint includes its BSS, which isn't in the file. When
the BSS is large enough, e.g. with lockdep enabled, the FDT lands inside
it and is wiped when the kernel clears BSS, leaving the guest hung with no
console output. Use the image_size from the Image header, as arm64 does.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/include/asm/image.h | 40 +++++++++++++++++++++++++++++++++++++++
 riscv/kvm.c               | 26 ++++++++++++++++++++++---
 2 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 riscv/include/asm/image.h

diff --git a/riscv/include/asm/image.h b/riscv/include/asm/image.h
new file mode 100644
index 000000000000..0deb74ddd9d4
--- /dev/null
+++ b/riscv/include/asm/image.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_IMAGE_H
+#define __ASM_IMAGE_H
+
+#define RISCV_IMAGE_MAGIC	"RISCV\0\0\0"
+#define RISCV_IMAGE_MAGIC2	"RSC\x05"
+
+/*
+ * struct riscv_image_header - riscv kernel image header
+ * See Documentation/arch/riscv/boot-image-header.rst for details
+ *
+ * @code0:		Executable code
+ * @code1:		Executable code
+ * @text_offset:	Image load offset (little endian)
+ * @image_size:		Effective Image size (little endian)
+ * @flags:		kernel flags (little endian)
+ * @version:		version
+ * @res1:		reserved
+ * @res2:		reserved
+ * @magic:		Magic number (RISC-V specific; deprecated)
+ * @magic2:		Magic number 2 (to match the ARM64 'magic' field pos)
+ * @res3:		reserved (will be used for PE COFF offset)
+ */
+
+struct riscv_image_header {
+	u32 code0;
+	u32 code1;
+	__le64 text_offset;
+	__le64 image_size;
+	__le64 flags;
+	u32 version;
+	u32 res1;
+	u64 res2;
+	u64 magic;
+	u32 magic2;
+	u32 res3;
+};
+
+#endif /* __ASM_IMAGE_H */
diff --git a/riscv/kvm.c b/riscv/kvm.c
index 1d494792de79..fc192af34435 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -4,9 +4,11 @@
 #include "kvm/virtio-console.h"
 #include "kvm/fdt.h"
 
+#include <linux/byteorder.h>
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include <linux/sizes.h>
+#include <asm/image.h>
 
 struct kvm_ext kvm_req_ext[] = {
 	{ DEFINE_KVM_EXT(KVM_CAP_ONE_REG) },
@@ -100,6 +102,22 @@ void kvm__arch_init(struct kvm *kvm)
 	riscv__irqchip_create(kvm);
 }
 
+/*
+ * The kernel's memory footprint, including BSS, is the image_size in the
+ * Image header, which may be larger than the file.
+ */
+static u64 kvm__arch_get_kernel_size(void *kernel, ssize_t file_size)
+{
+	struct riscv_image_header *hdr = kernel;
+
+	if ((size_t)file_size < sizeof(*hdr) ||
+	    (memcmp(&hdr->magic2, RISCV_IMAGE_MAGIC2, sizeof(hdr->magic2)) &&
+	     memcmp(&hdr->magic, RISCV_IMAGE_MAGIC, sizeof(hdr->magic))))
+		return file_size;
+
+	return max_t(u64, le64_to_cpu(hdr->image_size), file_size);
+}
+
 #define FDT_ALIGN	SZ_4M
 #define INITRD_ALIGN	8
 bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
@@ -108,6 +126,7 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	void *pos, *kernel_end, *limit;
 	unsigned long guest_addr, kernel_offset;
 	ssize_t file_size;
+	u64 kernel_size;
 
 	/*
 	 * Linux requires the initrd and dtb to be mapped inside lowmem,
@@ -132,9 +151,10 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 
 		die_perror("kernel read");
 	}
-	kernel_end = pos + file_size;
-	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
-		 kvm->arch.kern_guest_start, file_size);
+	kernel_size = kvm__arch_get_kernel_size(pos, file_size);
+	kernel_end = pos + kernel_size;
+	pr_debug("Loaded kernel to 0x%llx (%zd bytes, %llu in memory)",
+		 kvm->arch.kern_guest_start, file_size, kernel_size);
 
 	/* Place FDT just after kernel at FDT_ALIGN address */
 	pos = kernel_end + FDT_ALIGN;
-- 
2.56.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
