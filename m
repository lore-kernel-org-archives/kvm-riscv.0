Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA1C4451C
	for <kvm-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aksnk6ScIwYActXg34lsm4kxNIeXOOa20gFYdZbsLDY=; b=XRUp0eebQCXryq
	d/xA59QukSZwB51EnJr4gBHL9ImdrA/U2gB9Z1MCA+RlJBY7MzM27mZpdSsala7gPwz3iTz8/0lQT
	JepX8jZN5mUpFgyoalLFDfORb+3U9zVZ75cifENNdxthpFooxPAkFJ/2LI9O9iE1Cc59RVd5y2Np2
	IU4eGkxqzFY6bhJXtmPSl/V3eyVOwLp4AeSobXfYv4LXkEDrxHMSjvyKcNO3l/IfaWCishBdVcibg
	M45L4o9L3LMa6HFmw4HzSZ0S5OOc4U1Cg7oh7Lb1r4zG5YwSOOMB26lB2xYPGEFdlLMX1KvrVh8t1
	6F3809hAVyAZYkgg/ERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl75c-00000004Dud-20Gi;
	Sat, 18 Jul 2026 15:36:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl75a-00000004Dtt-01z1
	for kvm-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 15:36:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8486672f03cso8799640b3a.0
        for <kvm-riscv@lists.infradead.org>; Sat, 18 Jul 2026 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784388988; x=1784993788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vo3O4C85dd8u4rAF/3VjEGqMnG6FGHT5+qn329tDhDM=;
        b=a1TL25TF66jvyN0RriJm68j5/EGeuodwux1F0K5OMKi1HGzyNBwts+Snr0v+8L9Tk6
         CmOsp41+ZpaZJjhCmvbWao8T+qfO9tUWRPHGSl5IhSC9RJ5HvBzxGZ96m04M1kPD2PA5
         DfNIdP2KjfhFjHaFzSPMEnBKXqT4qNX9Zb1ers2yAAWrS842McE7tvvGtEkZ0g1nnQqx
         n5P35OBU1Lf9es9lruYkY09ojtk6v3pXZ6g9KnFSzhGSsusvZuqeSkT/Xz7FyeJMK3nT
         PIAJTtEx4UVo4SUbhJHKOGz3ya4M3xHsJ9v+b3i/B3v/zAHENANadcqY/exsq7QxoP/D
         ri6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784388988; x=1784993788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vo3O4C85dd8u4rAF/3VjEGqMnG6FGHT5+qn329tDhDM=;
        b=CJ8hiSo96qqA6ihQ6Bi/H+H4D6/gBAcBKTYBTOPvHv7eQCRTrcDfV5O6u1P4jBh34C
         KvhW+79dpvdadxSjfV67LbiZ/AXq3pmP889h3w2MwzSqIlYDX1SKW4EsED9bmiM1qpTQ
         Aw6DyqE9TZDGTFCIWENhbf93gts2ss7hlSun4Os8Dns1lbSwkY3EzAZCN7/Seym+cvig
         0uapDyFoOXH0chNqzWW8w21x2xfQNULl2SzBGPx4AqFbHQTy7OV/bZyJ/Z4xV54+XEHb
         ttKQkTePXYQ0ej7AaUDgWENFW5W/2E7x45xS0wT2uqnxCzapine/8zH7tOMbkiiKkM+z
         Pi7A==
X-Forwarded-Encrypted: i=1; AHgh+RrfpkyO+GRm47oMAOk7NYil1FsArVOktPnk82DW07OnH/yDqixcPVTs1Xd6qveGsR107+LI8NZKvBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeWrKpSVvahxeE7hrZ023o+XB2almXZcaMlJ1pyy7Gvc+2xB5J
	s9Nq7l830eUhfBt12xdqMYMMOE6Lduwv9zu23mi4VHj6VyAbuVLp4V0h
X-Gm-Gg: AfdE7cluml+N9epGKDdOVmur6xKA7csV/yyFiiHm0h4o8MA67y8CP9eB1I+FDXwaqA6
	IHTpfR/FmKXVwyXNtIScBr/OM9MkDP7BZrdcWOQLdDjuZTAOaxUg6Q7UtklSEqKe0ZhS8Vzh+Kq
	WQdG5HCSznKtmN9XfABaMc5P+aWg/YwK+rbbh6BHnjCSJcw/08AZt8x+dSVO3/mmeoWDe07AzTe
	phsee8Rns78H+SJUmHHHNDOdp3POO4ot4WQgSd7aDbPF1wGSKK89n57+P5nNx39dIuZxqEMciw0
	eiCkWV2/F09L7YiX7XRPS7lDKsrGNnJVYaGXoV8+CHWPjmvvjQAfFiepOO6bQXDEyPL+P+XJLCV
	ypHUuQlYt10CXnzas9HU3iYP27sCOxYfr1KyTnzrjCi9Ub6ozdo4VHto8zrh5Q5Ynl8QMBzIde+
	WJnKX2nDIGzkA=
X-Received: by 2002:a05:6300:2703:20b0:3c3:bb40:790 with SMTP id adf61e73a8af0-3c3bb4015femr4507067637.66.1784388988414;
        Sat, 18 Jul 2026 08:36:28 -0700 (PDT)
Received: from 2045L.localdomain ([36.112.122.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm2235615a12.0.2026.07.18.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 08:36:26 -0700 (PDT)
From: Guidong Han <2045gemini@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guidong Han <2045gemini@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix PMU event info array size overflow
Date: Sat, 18 Jul 2026 23:36:20 +0800
Message-ID: <20260718153620.829378-1-2045gemini@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_083630_041322_0B0551FD 
X-CRM114-Status: GOOD (  12.51  )
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

SBI PMU EVENT_GET_INFO stores guest-controlled
num_events * sizeof(*einfo) in an int. On RV64, num_events = 0x10000001
makes 0x100000010 truncate to 16. KVM then allocates one entry but loops
over the original num_events, causing out-of-bounds reads and writes. A
nested guest triggered:

BUG: KASAN: slab-out-of-bounds in kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
Read of size 4 at addr ff600000074d46b0 by task init/1
Call Trace:
[<ffffffff8006471c>] kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
[<ffffffff800690c0>] kvm_sbi_ext_pmu_handler+0xca/0x268
[<ffffffff8006779e>] kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
[<ffffffff8006008c>] kvm_riscv_vcpu_exit+0x48c/0x540
[<ffffffff8005ea0a>] kvm_arch_vcpu_ioctl_run+0x37e/0xc80
Allocated by task 1:
 __kmalloc_noprof+0x19e/0x4b0
 kvm_riscv_vcpu_pmu_event_info+0x72/0x142
 kvm_sbi_ext_pmu_handler+0xca/0x268
 kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
 kvm_riscv_vcpu_exit+0x48c/0x540
 kvm_arch_vcpu_ioctl_run+0x37e/0xc80
The buggy address is located 0 bytes to the right of
 allocated 16-byte region [ff600000074d46a0, ff600000074d46b0)

Store the shared-memory size in size_t and reject multiplication overflow.
Reject sizes beyond KMALLOC_MAX_SIZE to avoid triggering WARN_ON_ONCE_GFP()
for an impossible allocation order. Use an unsigned long loop index to
match num_events.

Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")
Cc: stable@vger.kernel.org
Signed-off-by: Guidong Han <2045gemini@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb24d..8b489fc3051f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -12,7 +12,9 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <linux/nospec.h>
+#include <linux/overflow.h>
 #include <linux/perf/riscv_pmu.h>
+#include <linux/slab.h>
 #include <asm/csr.h>
 #include <asm/kvm_isa.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -479,16 +481,21 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
 {
 	struct riscv_pmu_event_info *einfo = NULL;
-	int shmem_size = num_events * sizeof(*einfo);
+	size_t shmem_size;
 	gpa_t shmem;
 	u32 eidx, etype;
 	u64 econfig;
 	int ret;
 
-	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
+	if (flags != 0 || (saddr_low & (SZ_16 - 1)) || num_events == 0 ||
+	    check_mul_overflow(num_events, sizeof(*einfo), &shmem_size)) {
 		ret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
+	if (shmem_size > KMALLOC_MAX_SIZE) {
+		ret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	shmem = saddr_low;
 	if (saddr_high != 0) {
@@ -512,7 +519,7 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		goto free_mem;
 	}
 
-	for (int i = 0; i < num_events; i++) {
+	for (unsigned long i = 0; i < num_events; i++) {
 		eidx = einfo[i].event_idx;
 		etype = kvm_pmu_get_perf_event_type(eidx);
 		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
