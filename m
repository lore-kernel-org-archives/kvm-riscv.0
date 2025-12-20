Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BE7E6689E
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C9ktlnwWyTpGIUQf61rWcdgMSuFGS24qNWAQBZ2CMIQ=; b=BkCRS1KDgjTYCz
	NfUGxdtZt7e6IIBdMomaQObhVhlematBC4fqiQve6e+X/tJrs7q1QqguzHhi7+sLKh1RJn0otfVX5
	sThPO9FrjGzIj8L3ODkvEp3Y4smSvcD4ZhzBruPFCxlwiHS3NNxdwMCP/ZTwM9Bu4vw72d0rCcOPr
	uKpJFWu6CHA631hJ+7BhGywA+jvG3/c0gxJk7EIXrw6BAxAy1E0z5TbGnZdb1xUjlN9rXQk9qi/1i
	sE6NXgdQYTZ2XQbg3h6qeOs1UWjz/bPXZm2PSP+xkgJz5zaD8x6h6zvcD43UfkrqjcY5ANhnCVBdf
	aQ9uqUPjpQE1iAeooOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsxN-0000000BRyQ-3Qiz;
	Sat, 20 Dec 2025 09:08:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsxK-0000000BRxh-3QXV
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 09:08:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1776496b3a.1
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Dec 2025 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766221734; x=1766826534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=cQQMJuU9+CTvqJd5p5FGfv0hardk/gmzQMV+fd0P2cNqv1amNzKU9L0Rwv3oiwJYao
         zWM4SiU3hJ0B+qZYoY2dxfXTNQ5JfOGLwUXscVx84h/gQ6TL3t8JdQWoKIz3XS1XoUkM
         cLx6Wn8HooeW12jSWaKcSzC7PyjDxB5RpEIS3foYXNmjbfsFQN8Gol9CFYZDBr9Xq5DJ
         sqCfisi04kghpYz5XvjA9Q7ozVvF/9VyL56Acom8kTCJo1N1eCqgvuyr2gketDJbb5ip
         xVuqoR7p7xfI8SKSB/lN7gCqmoUWNP91A/875m8V6xpLzY68UXSnUxtfVpmvyUb/dd1B
         c9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221734; x=1766826534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=pcLQs+bB3jzH8t/STuznX0Y2VYIHGZEFDicSU0LWvhIKr3E3Hx2JhEPEuP6j+3z6Cp
         WnZFMrF/RluXS+PTFQC+sseVm6QXkjPvVsFafpINyjyshwQ+L3E6AMM/v92SW+USmiYh
         95NwBlJOucUpA3ASjVj9hRy2mSzL5YFqvSjvXJtWe3e+ZLHsS3Iwum9NQ7HvL+OvaDh1
         JYjGEMYyJM3MpwJCLX2JGTrBk33xjhPL8J9x2e6mx+nGz3wVIGqcEgK1ask3BTrAmbut
         7YTyaPndR6W/Aoat0D9eJ0SDo83InQg796/CRbwF/c4QlwuYEI3h9Y5gZzKnJ5JDX5Nw
         K8fw==
X-Forwarded-Encrypted: i=1; AJvYcCWi7Y9FJwu5R0COjGQ0C2/Q8e4tcEbobdzYZdLn3/VDTHPyDbb77K1jvAvVnWOZ3E1rSLQMk5OFTb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxMuMyDnKWqQUDaMWXW93pCBf+gX6dUgaZwzj9E731i74vEDLF
	7R0f8MzzVJiQNJzLJzzX9y/m4NAtKFFWANq5JngrFr7PBCnB+lPpqw/nLc0bvefIirE=
X-Gm-Gg: AY/fxX5sNMGVciCjjlIQPp6PgsrNh0IW3L9W2BgYPUyua/TPldTOxVhP4iZTaW/SYU5
	jPWwO8i4DUzEMerDlEHDfPNqc4GrJ/oe0jt/8QNjir5YEXlYAIDosEVlHQGKUDYe2Wm4nsYr2M3
	/E90XJYzgwpQ9ifUe3zsEV+peiIfIeY6H+F9/RHtZddogY1lOnEFX1IDizXYxXSDVyigtfE67BY
	EbcFg/VuYqeZiwLci/X4+snHrtVmKB2+kH8We6SGDAER7vl0jbYKkdC0fhnH9S52mShRftSAsQ+
	MdJU4yXpL4v3iCk+PdIXzVcLfWdzhs9OOG8+uT/Bf3T/OyoG567X6iGlvlPEofrsTKuTZloxrdH
	UybSWrnZKiaPBfl7BwWskrYUcmLSIaNtS4zg1u8SjvvvF8nKYHErJ319sDyFxtQ/xhP+lfiprMe
	xGVejAfpmwb/YP+mDgECYIYjLj85gdmfAgcdLGFdP4JiPIOEY4l7Gj
X-Google-Smtp-Source: AGHT+IF2jkxbF7mAn+s4RGO9FXrxMFZTWrnAnqrw89U2+BW6yKGvETNKZF8EMf2cRZHfSphIJaGSBg==
X-Received: by 2002:a05:6a00:330a:b0:7e8:43f5:bd46 with SMTP id d2e1a72fcca58-7ff67257bb3mr4181960b3a.50.1766221733916;
        Sat, 20 Dec 2025 01:08:53 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm4623647b3a.46.2025.12.20.01.08.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 01:08:53 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@linutronix.de
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2] irqchip/riscv-imsic: Adjust vs irq files num according to MMIO resources
Date: Sat, 20 Dec 2025 17:08:44 +0800
Message-ID: <20251220090844.46441-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010854_847036_91B7A294 
X-CRM114-Status: GOOD (  13.63  )
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

During initialization, kernel maps the MMIO resources of IMSIC, which is
parsed from ACPI or DTS and may not strictly contains all guest
interrupt files. Page fault happens when KVM wrongly allocates an
unmapped guest interrupt file and writes it.

Thus, during initialization, we calculate the number of available guest
interrupt files according to MMIO resources and constrain the number of
guest interrupt files that can be allocated by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 7 ++++++-
 include/linux/irqchip/riscv-imsic.h     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..cac3c2b51d724 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    gc->nr_guest_files);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..1e982ce024a47 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -794,7 +794,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
-	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
+	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
 	struct imsic_global_config *global;
 	struct imsic_local_config *local;
 	void __iomem **mmios_va = NULL;
@@ -888,6 +888,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
+	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -928,6 +929,10 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = global->nr_guest_files > nr_guest_files ? nr_guest_files :
+					 global->nr_guest_files;
+
 		nr_handlers++;
 	}
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 7494952c55187..43aed52385008 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -69,6 +69,9 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
+	/* Number of guest interrupt files per core */
+	u32					nr_guest_files;
+
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
